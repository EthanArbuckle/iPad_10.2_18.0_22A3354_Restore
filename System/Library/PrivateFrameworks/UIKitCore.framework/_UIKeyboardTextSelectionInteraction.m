@implementation _UIKeyboardTextSelectionInteraction

- (void)_configureTwoFingerPanGestureRecognizer:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  if (v4 == 1)
    v5 = 2;
  else
    v5 = 18;
  _setGestureKeyboardFlag(v7, v5);
  objc_msgSend(v7, "addTarget:action:", self, sel_panningGesture_);
  objc_msgSend(v7, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v7, "setMinimumNumberOfTouches:", 2);
  objc_msgSend(v7, "setMaximumNumberOfTouches:", 2);
  objc_msgSend(v7, "setAllowableMovement:", 16.0);
  objc_msgSend(v7, "_setFailsPastHysteresisWithoutMinTouches:", 1);
  objc_msgSend(v7, "setAllowedFlickDirections:", 15);
  objc_msgSend(v7, "setMaximumFlickDuration:", 0.16);
  objc_msgSend(v7, "setMinimumFlickDistance:", 5.0);
  objc_msgSend(v7, "setResponsivenessDelay:", 0.13);
  if (v4 == 1)
  {
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowableSeparation");
    objc_msgSend(v7, "_setAllowableSeparation:");

    objc_msgSend(v7, "setMinimumPressDuration:", 1.0);
    objc_msgSend(v7, "_setAllowableTouchTimeSeparation:", 0.06);
    objc_msgSend(v7, "_setRequiresImmediateMultipleTouches:", 1);
  }
  else
  {
    objc_msgSend(v7, "_setAllowableTouchTimeSeparation:", 0.5);
    objc_msgSend(v7, "setMinimumPressDuration:", 1.0);
  }

}

- (void)_configureTwoFingerTapGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  _setGestureKeyboardFlag(v5, 2);
  objc_msgSend(v5, "addTarget:action:", self, sel_twoFingerTap_);
  objc_msgSend(v5, "setAllowableMovement:", 60.0);
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allowableSeparation");
    objc_msgSend(v5, "_setAllowableSeparation:");

  }
  objc_msgSend(v5, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v5, "setNumberOfTouchesRequired:", 2);
  objc_msgSend(v5, "_setAllowableTouchTimeSeparation:", 0.06);
  objc_msgSend(v5, "setMaximumTapDuration:", 0.13);

}

- (_UIKeyboardTextSelectionInteraction)initWithView:(id)a3 owner:(id)a4 forTypes:(int64_t)a5
{
  char v5;
  id v8;
  id v9;
  _UIKeyboardTextSelectionInteraction *v10;
  _UIKeyboardTextSelectionInteraction *v11;
  _UIPanOrFlickGestureRecognizer *v12;
  _UITextSelectionForceGesture *v13;
  uint64_t GestureKeyboardFlag;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  UITextTapRecognizer *v19;
  _UIPanOrFlickGestureRecognizer *v20;
  void *v21;
  objc_super v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  v10 = -[UITextInteraction init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    -[_UIKeyboardTextSelectionInteraction registerOwner:](v10, "registerOwner:", v9);
    if ((v5 & 8) != 0)
    {
      v12 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
      -[UIGestureRecognizer setName:](v12, "setName:", CFSTR("com.apple.UIKit.textSpacePress"));
      -[_UIKeyboardTextSelectionInteraction _configureLongPressRecognizer:](v11, "_configureLongPressRecognizer:", v12);
      -[UITextInteraction addGestureRecognizer:withName:](v11, "addGestureRecognizer:withName:", v12, CFSTR("_UIKeyboardTextSelectionGestureLongPress"));
      if ((v5 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      v12 = 0;
      if ((v5 & 1) == 0)
        goto LABEL_16;
    }
    v13 = objc_alloc_init(_UITextSelectionForceGesture);
    -[_UIKeyboardTextSelectionInteraction _configureOneFingerForcePressRecognizer:](v11, "_configureOneFingerForcePressRecognizer:", v13);
    if (_isViewKeyboardLayoutPresent(v8))
    {
      GestureKeyboardFlag = _getGestureKeyboardFlag(v13);
      _setGestureKeyboardFlag(v13, GestureKeyboardFlag | 0x10);
    }
    -[_UITextSelectionForceGesture setShouldFailWithoutForce:](v13, "setShouldFailWithoutForce:", -[_UIKeyboardTextSelectionGestureController oneFingerForcePressShouldFailWithoutForce](v11->_owner, "oneFingerForcePressShouldFailWithoutForce"));
    if (-[_UITextSelectionForceGesture shouldFailWithoutForce](v13, "shouldFailWithoutForce"))
    {
      -[UITextInteraction recognizerForName:](v11, "recognizerForName:", 0x1E17788A0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "requireGestureRecognizerToFail:", v13);

    }
    -[UIGestureRecognizer setAllowedTouchTypes:](v13, "setAllowedTouchTypes:", &unk_1E1A94310);
    -[UIGestureRecognizer setCancelsTouchesInView:](v13, "setCancelsTouchesInView:", -[_UIKeyboardTextSelectionGestureController oneFingerForcePressShouldCancelTouchesInView](v11->_owner, "oneFingerForcePressShouldCancelTouchesInView"));
    -[UITextInteraction addGestureRecognizer:withName:](v11, "addGestureRecognizer:withName:", v13, CFSTR("_UIKeyboardTextSelectionGestureForcePress"));
    if (_AXSForceTouchEnabled())
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_supportsForceTouch");

      if (v18)
        -[UIGestureRecognizer requireGestureRecognizerToFail:](v12, "requireGestureRecognizerToFail:", v13);
    }

LABEL_16:
    if ((v5 & 2) != 0)
    {
      v19 = objc_alloc_init(UITextTapRecognizer);
      -[_UIKeyboardTextSelectionInteraction _configureTwoFingerTapGestureRecognizer:](v11, "_configureTwoFingerTapGestureRecognizer:", v19);
      -[UITextInteraction addGestureRecognizer:withName:](v11, "addGestureRecognizer:withName:", v19, CFSTR("_UIKeyboardTextSelectionGestureTwoFingerTap"));

      if ((v5 & 4) == 0)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else if ((v5 & 4) == 0)
    {
      goto LABEL_23;
    }
    v20 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
    -[UIGestureRecognizer setName:](v20, "setName:", CFSTR("com.apple.UIKit.textPanOrFlick"));
    -[_UIKeyboardTextSelectionInteraction _configureTwoFingerPanGestureRecognizer:](v11, "_configureTwoFingerPanGestureRecognizer:", v20);
    if (_isViewKeyboardLayoutPresent(v8))
      -[UIPanGestureRecognizer _setHysteresis:](v20, "_setHysteresis:", 30.0);
    -[_UIKeyboardTextSelectionInteraction owner](v11, "owner");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "enableEnclosingScrollViewNestedPinching");

    -[UITextInteraction addGestureRecognizer:withName:](v11, "addGestureRecognizer:withName:", v20, CFSTR("_UIKeyboardTextSelectionGestureTwoFingerPan"));
    goto LABEL_23;
  }
LABEL_24:

  return v11;
}

- (void)registerOwner:(id)a3
{
  _UIKeyboardTextSelectionGestureController **p_owner;
  id v6;
  _UIKeyboardTextSelectionGestureController *v7;
  void *v8;
  id deallocToken;
  _QWORD v10[5];

  p_owner = &self->_owner;
  objc_storeStrong((id *)&self->_owner, a3);
  v6 = a3;
  v7 = *p_owner;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___UIKeyboardTextSelectionInteraction_registerOwner___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v10[4] = self;
  -[_UIKeyboardTextSelectionGestureController addDeallocationHandler:](v7, "addDeallocationHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  deallocToken = self->_deallocToken;
  self->_deallocToken = v8;

}

- (id)owner
{
  return self->_owner;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKeyboardTextSelectionInteraction detach](self, "detach");
  -[_UIKeyboardTextSelectionInteraction removeTemporaryGesture](self, "removeTemporaryGesture");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  -[_UIKeyboardTextSelectionInteraction dealloc](&v3, sel_dealloc);
}

- (void)removeTemporaryGesture
{
  _UITouchesObservingGestureRecognizer *addedTouchRecognizer;
  void *v4;
  _UITouchesObservingGestureRecognizer *v5;
  _UIPanOrFlickGestureRecognizer *activePress;
  void *v7;
  _UIPanOrFlickGestureRecognizer *v8;

  addedTouchRecognizer = self->_addedTouchRecognizer;
  if (addedTouchRecognizer)
  {
    -[UIGestureRecognizer view](addedTouchRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_addedTouchRecognizer);

    v5 = self->_addedTouchRecognizer;
    self->_addedTouchRecognizer = 0;

  }
  activePress = self->_activePress;
  if (activePress)
  {
    -[UIGestureRecognizer view](activePress, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", self->_activePress);

    v8 = self->_activePress;
    self->_activePress = 0;

  }
  -[_UIKeyboardTextSelectionInteraction _cancelTouchPadTimer](self, "_cancelTouchPadTimer");
}

- (void)detach
{
  _UIKeyboardTextSelectionGestureController *owner;

  -[_UIKeyboardTextSelectionGestureController removeDeallocationHandler:](self->_owner, "removeDeallocationHandler:", self->_deallocToken);
  owner = self->_owner;
  self->_owner = 0;

  -[_UIKeyboardTextSelectionInteraction _clearHiding](self, "_clearHiding");
}

- (void)_clearHiding
{
  NSMapTable *weakMap;

  -[NSMapTable removeAllObjects](self->_weakMap, "removeAllObjects");
  weakMap = self->_weakMap;
  self->_weakMap = 0;

}

- (void)_cancelTouchPadTimer
{
  NSTimer *touchPadTimer;

  -[NSTimer invalidate](self->_touchPadTimer, "invalidate");
  touchPadTimer = self->_touchPadTimer;
  self->_touchPadTimer = 0;

}

- (void)_configureLongPressRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  _setGestureKeyboardFlag(v4, 100);
  objc_msgSend(v4, "addTarget:action:", self, sel_panningGesture_);
  objc_msgSend(v4, "setLongPressOnly:", 1);
  objc_msgSend(v4, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v4, "setMinimumNumberOfTouches:", 1);
  objc_msgSend(v4, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(v4, "setAllowableMovement:", 16.0);
  objc_msgSend(v4, "_setFailsPastHysteresisWithoutMinTouches:", 1);
  objc_msgSend(v4, "setAllowedFlickDirections:", 0);
  objc_msgSend(v4, "setMinimumPressDuration:", 0.375);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRemoteGestureState, 0);
  objc_storeStrong((id *)&self->_activePress, 0);
  objc_storeStrong(&self->_touchPadTimerCompletion, 0);
  objc_storeStrong((id *)&self->_touchPadTimer, 0);
  objc_storeStrong((id *)&self->_addedTouchRecognizer, 0);
  objc_storeStrong(&self->_deallocToken, 0);
  objc_storeStrong((id *)&self->_weakMap, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

- (void)hideRecogniser:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  NSMapTable *weakMap;
  NSMapTable *v10;
  NSMapTable *v11;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  weakMap = self->_weakMap;
  if (!weakMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_weakMap;
    self->_weakMap = v10;

    weakMap = self->_weakMap;
  }
  -[NSMapTable setObject:forKey:](weakMap, "setObject:forKey:", v7, v8);
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  -[UITextInteraction gestureMap](&v13, sel_gestureMap);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v8);

  objc_setAssociatedObject(v7, a2, self, (void *)0x301);
}

- (void)hideInsideRecogniser:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  -[UITextInteraction gestureMap](&v17, sel_gestureMap);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v5, "objectForKey:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Didn't find gesture %@ in cluster %@"), v4, self, (_QWORD)v13);
  v12 = 0;
LABEL_12:
  -[_UIKeyboardTextSelectionInteraction hideRecogniser:forKey:](self, "hideRecogniser:forKey:", v4, v12);

}

- (id)gestures
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  -[UITextInteraction gestureMap](&v8, sel_gestureMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_weakMap)
  {
    v5 = (id)objc_msgSend(v3, "mutableCopy");
    -[NSMapTable dictionaryRepresentation](self->_weakMap, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (void)attachToExistingRecogniser:(id)a3 owner:(id)a4 forType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "registerOwner:", v8);
    switch(a5)
    {
      case 4:
        objc_msgSend(v10, "_configureTwoFingerPanGestureRecognizer:", v11);
        break;
      case 2:
        objc_msgSend(v10, "_configureTwoFingerTapGestureRecognizer:", v11);
        break;
      case 1:
        objc_msgSend(v10, "_configureOneFingerForcePressRecognizer:", v11);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unknown type %li"), a5);
        break;
    }
    objc_msgSend(v10, "addGestureRecognizer:withName:", v11, CFSTR("owner"));
    objc_msgSend(v10, "hideInsideRecogniser:", v11);
  }

}

- (void)_configureOneFingerForcePressRecognizer:(id)a3
{
  _UILinearForceLevelClassifier *v4;
  id v5;

  v5 = a3;
  _setGestureKeyboardFlag(v5, 1);
  v4 = objc_alloc_init(_UILinearForceLevelClassifier);
  objc_msgSend(v5, "_setForceLevelClassifier:", v4);

  objc_msgSend(v5, "setRequiredPreviewForceState:", 2);
  objc_msgSend(v5, "addTarget:action:", self, sel_oneFingerForcePan_);
  -[UIGestureRecognizer _addForceTarget:action:]((uint64_t)v5, self, sel_oneFingerForcePress_);
  -[_UIKeyboardTextSelectionGestureController oneFingerForcePressMinimumDuration](self->_owner, "oneFingerForcePressMinimumDuration");
  objc_msgSend(v5, "setMinimumPressDuration:");
  -[_UIKeyboardTextSelectionGestureController oneFingerForcePressAllowableMovement](self->_owner, "oneFingerForcePressAllowableMovement");
  objc_msgSend(v5, "setAllowableMovement:");

}

- (void)_configureLongPressAddedTouchRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  _setGestureKeyboardFlag(v4, 8);
  objc_msgSend(v4, "addTarget:action:", self, sel_panningGestureAddedTouch_);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 isViewKeyboardLayoutPresent;
  void *v11;
  int v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  v5 = -[UITextInteraction gestureRecognizerShouldBegin:](&v15, sel_gestureRecognizerShouldBegin_, v4);
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v9);

    if (isViewKeyboardLayoutPresent)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "transitionInProgress") & 1) != 0)
      {
LABEL_15:
        LOBYTE(v5) = 0;
        goto LABEL_17;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v11);
      v12 = objc_msgSend(v8, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1);

      if (!v12)
        goto LABEL_15;
    }
    if ((_getGestureKeyboardFlag(v4) & 0x40) != 0 && !IsGestureWithinSpecialRegion(v4)
      || (_getGestureKeyboardFlag(v4) & 8) != 0 && !objc_msgSend(v6, "isPanning"))
    {
      goto LABEL_15;
    }
    if ((_getGestureKeyboardFlag(v4) & 2) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v8, "shouldAllowTwoFingerSelectionGestureOnView:", v13);

    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
LABEL_17:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 isViewKeyboardLayoutPresent;
  uint64_t v12;
  char v13;
  char isKindOfClass;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  BOOL v34;

  v6 = a3;
  v7 = a4;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v10);

  if (!isViewKeyboardLayoutPresent)
    goto LABEL_26;
  v12 = objc_msgSend(v6, "requiredPreviewForceState");
  v13 = objc_opt_respondsToSelector();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v12 && (v13 & 1) != 0 && (isKindOfClass & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "timestamp");
      v16 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "systemUptime");
      v16 = v18;

    }
    objc_msgSend(v9, "timestampOfLastTouchesEnded");
    if (v19 + 0.5 >= v16)
      goto LABEL_22;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_26;
  v20 = v12 != 0;
  v21 = v7 ? v7 : v6;
  objc_msgSend(v6, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "locationInView:", v22);
  v24 = v23;
  v26 = v25;

  if (!objc_msgSend(v9, "shouldAllowSelectionGestures:atPoint:toBegin:", v20, v7 == 0, v24, v26))
  {
LABEL_22:
    v34 = 0;
  }
  else
  {
    if ((_getGestureKeyboardFlag(v6) & 0x10) == 0)
      goto LABEL_21;
LABEL_26:
    v27 = v7 ? v7 : v6;
    objc_msgSend(v6, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "locationInView:", v28);
    v30 = v29;
    v32 = v31;

    objc_msgSend(v6, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = IsTouchPointWithinSpecialRegion(v33, v30, v32);

    if (!(_DWORD)v28)
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 1;
      objc_msgSend(v6, "setShouldFailWithoutForce:", 1);
    }
    else
    {
LABEL_21:
      v34 = 1;
    }
  }

  return v34;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char GestureKeyboardFlag;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;

  v6 = a3;
  v7 = a4;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textSelectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    GestureKeyboardFlag = _getGestureKeyboardFlag(v6);
    if (GestureKeyboardFlag & 2 | _getGestureKeyboardFlag(v6) & 1)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textInputView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "_scroller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "panGestureRecognizer");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v18 == v7;

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
    v19 = _getGestureKeyboardFlag(v6);
    v13 = ((_getGestureKeyboardFlag(v7) ^ ~v19) & 0xC) == 0 || v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)gestureRecognizerShouldBeginResponse:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_UIKeyboardTextSelectionInteraction gestureRecognizerShouldBegin:](self, "gestureRecognizerShouldBegin:"))
    -[_UIKeyboardTextSelectionInteraction panningGesture:](self, "panningGesture:", v4);

}

- (double)additionalPressDurationForTypingCadence:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = 0.0;
  if ((_getGestureKeyboardFlag(v4) & 4) != 0)
  {
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemUptime");
      v10 = v9;

      objc_msgSend(v7, "timestampOfLastTouchesEnded");
      v12 = v11;
      objc_msgSend(v4, "minimumPressDuration");
      if (v12 + v13 >= v10)
        v5 = 0.4;
      else
        v5 = 0.0;
    }

  }
  return v5;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v4, "isPanning")
    && (_getGestureKeyboardFlag(v11) & 2) != 0
    && (objc_msgSend(v4, "isSpacePan") & 1) == 0)
  {
    objc_msgSend(v4, "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    -[_UIKeyboardTextSelectionInteraction _didEndIndirectSelectionGesture:](self, "_didEndIndirectSelectionGesture:", v6);
    if (objc_msgSend(v4, "didFloatCursor"))
      objc_msgSend(v5, "endFloatingCursor");
    objc_msgSend(v4, "setIsLongPressing:", 0);
    objc_msgSend(v4, "setIsPanning:", 0);
    objc_msgSend(v4, "setIsSpacePan:", 0);
    objc_msgSend(v4, "setDidFloatCursor:", 0);
    objc_msgSend(v4, "activeGestures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

    objc_msgSend(v5, "resetCursorPosition");
  }
  if (objc_msgSend(v4, "panGestureState") && (_getGestureKeyboardFlag(v11) & 1) != 0)
  {
    objc_msgSend(v4, "selectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (objc_msgSend(v4, "panGestureState") >= 1)
      -[_UIKeyboardTextSelectionInteraction oneFingerForcePan:](self, "oneFingerForcePan:", v9);
    objc_msgSend(v4, "setPanGestureState:", 0);
    objc_msgSend(v4, "setPreviousForcePressCount:", 0);
    objc_msgSend(v4, "setDidFloatCursor:", 0);
    objc_msgSend(v4, "activeGestures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v9);

    objc_msgSend(v8, "resetCursorPosition");
  }

}

- (id)selectionController
{
  void *v2;
  void *v3;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_didEndIndirectSelectionGesture:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _getViewKeyboardLayout(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEndIndirectSelectionGesture");

  -[_UIKeyboardTextSelectionInteraction removeTemporaryGesture](self, "removeTemporaryGesture");
}

- (CGPoint)acceleratedTranslation:(CGPoint)a3 velocity:(CGPoint)a4 isActive:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner", a3.x, a3.y, a4.x, a4.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UICubicPolyTangent keyboardTrackpadCurve](_UICubicPolyTangent, "keyboardTrackpadCurve");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPanTranslation");
  v11 = x - v10;
  objc_msgSend(v8, "lastPanTranslation");
  v13 = y - v12;
  v14 = 0.0;
  if (v5)
  {
    objc_msgSend(v9, "piecewiseCubicAcceleratedSpeed:", sqrt(v11 * v11 + v13 * v13));
    v14 = v15;
  }
  objc_msgSend(v8, "accumulatedAcceleration");
  v17 = v11 * v14 + v16;
  v19 = v13 * v14 + v18;
  objc_msgSend(v8, "setAccumulatedAcceleration:", v17, v19);

  v20 = x + v17;
  v21 = y + v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (BOOL)forceTouchGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "requiredPreviewForceState"))
    goto LABEL_7;
  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v11 = v10;

    objc_msgSend(v6, "timestampOfLastTouchesEnded");
    v13 = v12 + 0.4;
    objc_msgSend(v4, "minimumPressDuration");
    if (v13 + v14 >= v11)
    {
      v16 = 0;
      goto LABEL_8;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v15);
    v16 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1);

  }
  else
  {
LABEL_7:
    v16 = 1;
  }
LABEL_8:

  return v16;
}

- (CGPoint)boundedTranslation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cursorLocationBase");
    objc_msgSend(v7, "boundedDeltaForTranslation:cursorLocationBase:", x, y, v8, v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v6, "accumulatedBounding");
    if (v14 <= 0.0)
    {
      v16 = v11;
      if (v11 < v14 || (v16 = v14, v11 <= 0.0))
      {
LABEL_9:
        if (v15 <= 0.0)
        {
          v17 = v13;
          if (v13 < v15)
            goto LABEL_16;
          v17 = v15;
          if (v13 <= 0.0)
            goto LABEL_16;
        }
        else
        {
          v17 = v13;
          if (v13 > v15)
            goto LABEL_16;
          v17 = v15;
          if (v13 >= 0.0)
            goto LABEL_16;
        }
        v17 = v13 + v15;
LABEL_16:
        objc_msgSend(v6, "setAccumulatedBounding:", v16, v17);
        x = x + v16;
        y = y + v17;

        goto LABEL_17;
      }
    }
    else
    {
      v16 = v11;
      if (v11 > v14)
        goto LABEL_9;
      v16 = v14;
      if (v11 >= 0.0)
        goto LABEL_9;
    }
    v16 = v11 + v14;
    goto LABEL_9;
  }
LABEL_17:
  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)_willBeginIndirectSelectionGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _getViewKeyboardLayout(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UITextInteraction recognizerForName:](self, "recognizerForName:", CFSTR("_UIKeyboardTextSelectionGestureLongPress"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v10)
    {

    }
    else
    {
      -[UITextInteraction recognizerForName:](self, "recognizerForName:", CFSTR("_UIKeyboardTextSelectionGestureForcePress"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v10)
      {
LABEL_7:
        objc_msgSend(v5, "willBeginIndirectSelectionGesture");
        goto LABEL_8;
      }
    }
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedbackBehaviour");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionToState:ended:", CFSTR("preview"), 1);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_prepareForGesture
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackBehaviour");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(v5, "feedbackBehaviour");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateWithCompletionBlock:", 0);

  }
}

- (void)_tidyUpGesture
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackBehaviour");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  if (v3)
  {
    objc_msgSend(v5, "feedbackBehaviour");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivate");

  }
}

- (BOOL)isPlacedCarefully
{
  void *v2;
  void *v3;
  char v4;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weightedPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlacedCarefully");

  return v4;
}

- (void)indirectCursorPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5
{
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[9];

  y = a4.y;
  x = a4.x;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "taskQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke;
  v13[3] = &unk_1E16D89D8;
  v13[4] = self;
  v13[5] = a3;
  *(CGFloat *)&v13[6] = x;
  *(CGFloat *)&v13[7] = y;
  v13[8] = a5;
  objc_msgSend(v12, "addTask:", v13);

}

- (void)indirectBlockPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[8];

  y = a4.y;
  x = a4.x;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke;
  v11[3] = &unk_1E16D6940;
  v11[4] = self;
  v11[5] = a3;
  *(CGFloat *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  objc_msgSend(v10, "addTask:", v11);

}

- (void)beginIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "caretRectForCursorPosition");
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v11 = v10;
    v13 = v12;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginFloatingCursorAtPoint:", v11, v13);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "previousRepeatedGranularity");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93___UIKeyboardTextSelectionInteraction_beginIndirectBlockPanWithTranslation_executionContext___block_invoke;
    v19[3] = &unk_1E16BAF98;
    v19[4] = self;
    objc_msgSend(v7, "childWithContinuation:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectTextWithGranularity:atPoint:executionContext:", v17, v18, v11, v13);

  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

- (void)updateIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v15 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v9 = v8;
    v11 = v10;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "panGestureState") == 5)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectTextWithGranularity:atPoint:executionContext:", objc_msgSend(v13, "previousRepeatedGranularity"), v15, v9, v11);
    }
    else
    {
      if (objc_msgSend(v13, "panGestureState") != 6 && objc_msgSend(v13, "panGestureState"))
        goto LABEL_9;
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v13, "previousRepeatedGranularity"), v15, v9, v11);
    }

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v15, "returnExecutionToParent");
LABEL_10:

}

- (void)endIndirectBlockPanWithExecutionContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endFloatingCursor");

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSelection");

  objc_msgSend(v6, "returnExecutionToParent");
}

- (void)beginTwoFingerCursorPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  y = a3.y;
  x = a3.x;
  v27 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasCaretSelection");

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "caretRectForCursorPosition");
    else
      objc_msgSend(v10, "caretRectForFirstSelectedPosition");
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = v15;

    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:", v16, v17, v18, v19);
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v21 = v20;
    v23 = v22;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "beginFloatingCursorAtPoint:", v21, v23);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginSelection");

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "selectPositionAtPoint:executionContext:", v27, v21, v23);

  }
  else
  {
    objc_msgSend(v27, "returnExecutionToParent");
  }

}

- (void)beginTwoFingerPanWithTranslation:(CGPoint)a3 isShiftKeyBeingHeld:(BOOL)a4 executionContext:(id)a5
{
  _BOOL4 v5;
  double y;
  double x;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v55 = a5;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasCaretSelection");

  if (!v10 || v5)
  {
    v20 = fabs(x);
    v21 = fabs(y);
    v22 = 2;
    if (x < 0.0)
      v22 = 3;
    v23 = 5;
    if (y < 0.0)
      v23 = 4;
    if (v20 >= v21)
      v24 = v22;
    else
      v24 = v23;
    switch(v24)
    {
      case 2:
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "caretRectForRightmostSelectedPosition");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v24 = 3;
        break;
      case 3:
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "caretRectForLeftmostSelectedPosition");
        v27 = v35;
        v29 = v36;
        v31 = v37;
        v33 = v38;

        v24 = 2;
        break;
      case 4:
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "caretRectForFirstSelectedPosition");
        v27 = v40;
        v29 = v41;
        v31 = v42;
        v33 = v43;

        v24 = 5;
        break;
      case 5:
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "caretRectForLastSelectedPosition");
        v27 = v45;
        v29 = v46;
        v31 = v47;
        v33 = v48;

        v24 = 4;
        break;
      default:
        v27 = *MEMORY[0x1E0C9D628];
        v29 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v31 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v33 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        break;
    }
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:", v27, v29, v31, v33);
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v50 = v49;
    v52 = v51;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "beginFloatingCursorAtPoint:", v50, v52);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "beginSelectionWithBaseAtSelectionBoundaryInDirection:initialExtentPoint:executionContext:", v24, v55, v50, v52);
      goto LABEL_20;
    }
LABEL_21:
    objc_msgSend(v55, "returnExecutionToParent");
    goto LABEL_22;
  }
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "caretRectForCursorPosition");
  -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

  -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
  v13 = v12;
  v15 = v14;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginFloatingCursorAtPoint:", v13, v15);

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginSelection");

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_21;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectPositionAtPoint:executionContext:", v55, v13, v15);
LABEL_20:

LABEL_22:
}

- (void)updateTwoFingerPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v17 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v9 = v8;
    v11 = v10;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasCaretSelection");

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
      objc_msgSend(v15, "selectPositionAtPoint:executionContext:", v17, v9, v11);
    else
      objc_msgSend(v15, "updateSelectionWithExtentPoint:executionContext:", v17, v9, v11);

  }
  else
  {
    objc_msgSend(v17, "returnExecutionToParent");
  }

}

- (void)endTwoFingerPanWithExecutionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endFloatingCursor");

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSelection");

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDidFloatCursor:", 0);

  objc_msgSend(v7, "returnExecutionToParent");
}

- (void)handleTwoFingerFlickInDirection:(int64_t)a3 executionContext:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  int64_t v19;
  BOOL v20;

  v6 = a4;
  v7 = a3 & 0xFFFFFFFFFFFFFFFELL;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasCaretSelection");

  if (v9)
  {
    v10 = v7 == 2;
    if (v7 == 2)
      v11 = 4;
    else
      v11 = 3;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88___UIKeyboardTextSelectionInteraction_handleTwoFingerFlickInDirection_executionContext___block_invoke;
    v16[3] = &unk_1E16D8A00;
    v16[4] = self;
    v20 = v10;
    v17 = v6;
    v18 = v11;
    v19 = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v16, 0, 0.15, 0.0);

  }
  else
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v7 == 2)
        objc_msgSend(v13, "updateSelectionWithExtentAtBoundary:inDirection:executionContext:", 4, a3, v6);
      else
        objc_msgSend(v13, "updateImmediateSelectionWithExtentAtBoundary:inDirection:executionContext:", 3, a3, v6);

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollSelectionToVisible");

    }
    else
    {
      objc_msgSend(v6, "returnExecutionToParent");
    }
  }

}

- (int64_t)layoutDirectionFromFlickDirection:(unint64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = 3;
  v4 = 5;
  if ((a3 & 4) == 0)
    v4 = 2;
  if ((a3 & 2) == 0)
    v3 = v4;
  if ((a3 & 1) != 0)
    return 4;
  else
    return v3;
}

- (void)beginCursorManipulationFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  id v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "didFloatCursor") & 1) == 0)
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    if (CGRectIsNull(v12))
    {
      v8 = *MEMORY[0x1E0C9D538];
      v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else
    {
      v8 = x + width * 0.5;
      v9 = y + height * 0.5;
    }
    objc_msgSend(v11, "setCursorLocationBase:", v8, v9);
    objc_msgSend(v11, "setDidFloatCursor:", 1);
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "willBeginFloatingCursor:", 1);

  }
}

- (CGPoint)cursorLocationForTranslation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cursorLocationBase");
  v7 = v6;
  v9 = v8;

  if (fabs(x) != INFINITY && fabs(y) != INFINITY)
  {
    v9 = y + v9;
    v7 = x + v7;
  }
  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_cancelLongForcePressTimer
{
  void *v2;
  id v3;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "longForcePressAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(v3, "setLongForcePressAction:", 0);
}

- (void)clearKeyboardTouchesForGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _getViewKeyboardLayout(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "touchesForTap");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_getGestureKeyboardFlag(v4) & 2) == 0)
      {
        v8 = 0;
LABEL_8:
        -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "taskQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke;
        v13[3] = &unk_1E16BB0D8;
        v14 = v6;
        v15 = v8;
        v12 = v8;
        objc_msgSend(v11, "addTask:", v13);

        goto LABEL_9;
      }
      -[UIPanGestureRecognizer _activeTouches]((id *)v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_granularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  double v15;
  double v16;
  BOOL v17;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "taskQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke;
  v13[3] = &unk_1E16D8A28;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "addTask:", v13);

}

- (void)disableEnclosingScrollViewScrolling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scroller");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v10;
    if (v10)
    {
      objc_msgSend(v10, "panGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEnabled"))
      {
        objc_msgSend(v9, "setEnabled:", 0);
        objc_msgSend(v9, "setEnabled:", 1);
      }

      v8 = v10;
    }

  }
}

- (void)longPressGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 touchCount:(unint64_t)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[9];

  y = a4.y;
  x = a4.x;
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    goto LABEL_3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forwardingInputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 8, a3, 0, a5, x, y);
  }
  else
  {
LABEL_3:
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "taskQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke;
    v16[3] = &unk_1E16D89D8;
    v16[4] = self;
    v16[5] = a3;
    *(double *)&v16[6] = x;
    *(double *)&v16[7] = y;
    v16[8] = a5;
    objc_msgSend(v15, "addTask:", v16);

  }
}

- (void)beginLongPressWithTranslation:(CGPoint)a3 touchCount:(unint64_t)a4 executionContext:(id)a5
{
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  y = a3.y;
  x = a3.x;
  v24 = a5;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = fabs(x);
    v11 = fabs(y);
    v12 = 2;
    if (x < 0.0)
      v12 = 3;
    v13 = 5;
    if (y < 0.0)
      v13 = 4;
    if (v10 >= v11)
      v14 = v12;
    else
      v14 = v13;
    if ((unint64_t)(v14 - 2) <= 3)
      v14 = qword_186681798[v14 - 2];
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "caretRectForCursorPosition");
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v17 = v16;
    v19 = v18;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginFloatingCursorAtPoint:", v17, v19);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a4 == 1)
    {
      objc_msgSend(v21, "beginSelection");

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateSelectionWithExtentPoint:executionContext:", v24, v17, v19);

    }
    else
    {
      objc_msgSend(v21, "beginSelectionWithBaseAtSelectionBoundaryInDirection:initialExtentPoint:executionContext:", v14, v24, v17, v19);

    }
  }
  else
  {
    objc_msgSend(v24, "returnExecutionToParent");
  }

}

- (void)updateLongPressWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v14 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    v9 = v8;
    v11 = v10;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateSelectionWithExtentPoint:executionContext:", v14, v9, v11);

  }
  else
  {
    objc_msgSend(v14, "returnExecutionToParent");
  }

}

- (void)finishLongPressWithExecutionContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endFloatingCursor");

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSelection");

  objc_msgSend(v6, "returnExecutionToParent");
}

- (void)forwardIndirectGestureWithType:(int64_t)a3 state:(int64_t)a4 translation:(CGPoint)a5 flickDirection:(unint64_t)a6 touchCount:(unint64_t)a7
{
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  _UIKeyboardIndirectTextSelectionGestureState *v16;
  void *v17;
  id v18;

  y = a5.y;
  x = a5.x;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputSystemSourceSession");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "textOperations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(_UIKeyboardIndirectTextSelectionGestureState);
    -[_UIKeyboardIndirectTextSelectionGestureState setType:](v16, "setType:", a3);
    -[_UIKeyboardIndirectTextSelectionGestureState setState:](v16, "setState:", a4);
    -[_UIKeyboardIndirectTextSelectionGestureState setTranslation:](v16, "setTranslation:", x, y);
    -[_UIKeyboardIndirectTextSelectionGestureState setFlickDirection:](v16, "setFlickDirection:", a6);
    -[_UIKeyboardIndirectTextSelectionGestureState setTouchCount:](v16, "setTouchCount:", a7);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardIndirectTextSelectionGestureState setIsShiftKeyBeingHeld:](v16, "setIsShiftKeyBeingHeld:", objc_msgSend(v17, "isShiftKeyBeingHeld"));

    objc_msgSend(v15, "setCustomInfoType:", 0x1E1750260);
    objc_msgSend(v15, "setCustomInfo:", v16);
    objc_msgSend(v18, "flushOperations");

  }
}

- (void)handleRemoteIndirectGestureWithState:(id)a3
{
  _UIKeyboardIndirectTextSelectionGestureState *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _UIKeyboardIndirectTextSelectionGestureState *previousRemoteGestureState;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = (_UIKeyboardIndirectTextSelectionGestureState *)a3;
  if (-[_UIKeyboardIndirectTextSelectionGestureState type](v4, "type") == 2)
  {
    -[_UIKeyboardTextSelectionInteraction twoFingerTap:](self, "twoFingerTap:", 0);
  }
  else
  {
    -[_UIKeyboardIndirectTextSelectionGestureState translation](v4, "translation");
    -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:");
    v6 = v5;
    v8 = v7;
    if (-[_UIKeyboardIndirectTextSelectionGestureState type](v4, "type") == 4)
    {
      if (-[_UIKeyboardIndirectTextSelectionGestureState state](v4, "state") == 1)
      {
        v9 = *MEMORY[0x1E0C9D538];
        v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAccumulatedBounding:", v9, v10);

        -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 2, v9, v10);
      }
      -[_UIKeyboardTextSelectionInteraction indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:](self, "indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:", -[_UIKeyboardIndirectTextSelectionGestureState state](v4, "state"), -[_UIKeyboardIndirectTextSelectionGestureState flickDirection](v4, "flickDirection"), -[_UIKeyboardIndirectTextSelectionGestureState isShiftKeyBeingHeld](v4, "isShiftKeyBeingHeld"), v6, v8);
    }
    else if (-[_UIKeyboardIndirectTextSelectionGestureState type](v4, "type") == 8)
    {
      if (-[_UIKeyboardIndirectTextSelectionGestureState type](self->_previousRemoteGestureState, "type") == 4
        && -[_UIKeyboardIndirectTextSelectionGestureState state](self->_previousRemoteGestureState, "state") == 2
        && -[_UIKeyboardIndirectTextSelectionGestureState state](v4, "state") == 2)
      {
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "restartSelection");

      }
      -[_UIKeyboardTextSelectionInteraction longPressGestureWithState:withTranslation:touchCount:](self, "longPressGestureWithState:withTranslation:touchCount:", -[_UIKeyboardIndirectTextSelectionGestureState state](v4, "state"), -[_UIKeyboardIndirectTextSelectionGestureState touchCount](v4, "touchCount"), v6, v8);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Unknown gesture type", buf, 2u);
      }

    }
    else
    {
      v13 = handleRemoteIndirectGestureWithState____s_category;
      if (!handleRemoteIndirectGestureWithState____s_category)
      {
        v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&handleRemoteIndirectGestureWithState____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Unknown gesture type", v19, 2u);
      }
    }
    if (-[_UIKeyboardIndirectTextSelectionGestureState state](v4, "state") >= 3)
    {
      -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDidFloatCursor:", 0);

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resetCursorPosition");

    }
  }
  previousRemoteGestureState = self->_previousRemoteGestureState;
  self->_previousRemoteGestureState = v4;

}

- (void)indirectPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5 isShiftKeyBeingHeld:(BOOL)a6
{
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[9];
  BOOL v19;

  y = a4.y;
  x = a4.x;
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    goto LABEL_3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegateManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forwardingInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 4, a3, a5, 0, x, y);
  }
  else
  {
LABEL_3:
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "taskQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke;
    v18[3] = &unk_1E16D8A78;
    v18[4] = self;
    v18[5] = a3;
    *(double *)&v18[6] = x;
    *(double *)&v18[7] = y;
    v19 = a6;
    v18[8] = a5;
    objc_msgSend(v17, "addTask:", v18);

  }
}

- (void)_beginLongForcePressTimerForGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIDelayedAction *v7;
  id v8;

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "longForcePressAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "longForcePressAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

  }
  v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__longForcePressDetected_, v4, 0.2);

  objc_msgSend(v8, "setLongForcePressAction:", v7);
}

- (void)_longForcePressDetected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousForcePressCount:", objc_msgSend(v5, "previousForcePressCount") - 1);
  -[_UIKeyboardTextSelectionInteraction _cancelLongForcePressTimer](self, "_cancelLongForcePressTimer");
  -[_UIKeyboardTextSelectionInteraction oneFingerForcePress:](self, "oneFingerForcePress:", v4);

}

- (void)_logTapCounts:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("tapLogValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("isOnKeyboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIKeyboardUsageTracking keyboardGestureTwoFingerTap:withTapCount:](_UIKeyboardUsageTracking, "keyboardGestureTwoFingerTap:withTapCount:", objc_msgSend(v7, "BOOLValue"), v6);
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tapLogTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  objc_msgSend(v9, "setTapLogTimer:", 0);
}

- (void)oneFingerForcePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  long double v8;
  double v9;
  long double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  _BOOL8 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD v57[5];
  id v58;
  long double v59;
  long double v60;
  _QWORD v61[5];
  id v62;
  id v63;
  long double v64;
  long double v65;

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_translationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longForcePressAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = hypot(v8, v10);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allowableForceMovement");
    v16 = v15;

    if (v13 > v16)
      -[_UIKeyboardTextSelectionInteraction _cancelLongForcePressTimer](self, "_cancelLongForcePressTimer");
  }
  v17 = objc_msgSend(v4, "state");
  v18 = MEMORY[0x1E0C809B0];
  if (v17 == 1)
  {
    v19 = *MEMORY[0x1E0C9D538];
    v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v11, "setAccumulatedAcceleration:", *MEMORY[0x1E0C9D538], v20);
    objc_msgSend(v11, "setAccumulatedBounding:", v19, v20);
    objc_msgSend(v11, "setLastPanTranslation:", (double)v8, (double)v10);
    objc_msgSend(v11, "weightedPoint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clearHistory");

    objc_msgSend(v11, "weightedPoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addPoint:", (double)v8, (double)v10);

    objc_msgSend(v4, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePan:", _isViewKeyboardLayoutPresent(v23));

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v18;
    v61[1] = 3221225472;
    v61[2] = __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke;
    v61[3] = &unk_1E16B9488;
    v61[4] = self;
    v64 = v8;
    v65 = v10;
    v62 = v11;
    v63 = v4;
    objc_msgSend(v24, "logBlock:domain:", v61, CFSTR("com.apple.keyboard.UIKit"));

    -[_UIKeyboardTextSelectionInteraction _prepareForGesture](self, "_prepareForGesture");
  }
  if (objc_msgSend(v4, "state") >= 2)
  {
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shouldUseAcceleration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textInputView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v29);
      v31 = v30;
      v33 = v32;

      if (objc_msgSend(v11, "panGestureState"))
      {
        v34 = v4;
        v35 = objc_msgSend(v34, "state") != 3 && objc_msgSend(v34, "state") != 4 && objc_msgSend(v34, "state") != 5;

      }
      else
      {
        v35 = 0;
      }
      -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", v35, (double)v8, (double)v10, v31, v33);
      v37 = v36;
      v39 = v38;
      objc_msgSend(v11, "setLastPanTranslation:", (double)v8, (double)v10);
      v10 = v39;
      v8 = v37;
    }
    objc_msgSend(v11, "weightedPoint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addPoint:", (double)v8, (double)v10);

    v41 = v4;
    if (objc_msgSend(v41, "state") == 3 || objc_msgSend(v41, "state") == 4)
    {

    }
    else
    {
      v45 = objc_msgSend(v41, "state");

      if (v45 != 5)
      {
LABEL_22:
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", (double)v8, (double)v10);
        v8 = v46;
        v10 = v47;
        goto LABEL_23;
      }
    }
    if (-[_UIKeyboardTextSelectionInteraction isPlacedCarefully](self, "isPlacedCarefully"))
    {
      objc_msgSend(v11, "weightedPoint");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "weightedPoint");
      v8 = v43;
      v10 = v44;

    }
    goto LABEL_22;
  }
LABEL_23:
  if (objc_msgSend(v11, "panGestureState") == 1)
  {
    v48 = v4;
    if (objc_msgSend(v48, "state") == 3 || objc_msgSend(v48, "state") == 4)
    {

    }
    else
    {
      v54 = objc_msgSend(v48, "state");

      if (v54 != 5)
      {
        -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 2, 0, (double)v8, (double)v10);
        goto LABEL_34;
      }
    }
    objc_msgSend(v11, "setDidFloatCursor:", 0);
    -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", objc_msgSend(v48, "state"), 0, (double)v8, (double)v10);
    goto LABEL_33;
  }
  if (objc_msgSend(v11, "panGestureState") == 6)
  {
    v49 = v4;
    if (objc_msgSend(v49, "state") == 3 || objc_msgSend(v49, "state") == 4)
    {

    }
    else
    {
      v55 = objc_msgSend(v49, "state");

      if (v55 != 5)
      {
        -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 2, (double)v8, (double)v10);
        goto LABEL_34;
      }
    }
    objc_msgSend(v11, "setDidFloatCursor:", 0);
    -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", objc_msgSend(v49, "state"), (double)v8, (double)v10);
LABEL_33:
    objc_msgSend(v11, "setPanGestureState:", 0);
  }
LABEL_34:
  v56 = v4;
  if (objc_msgSend(v56, "state") == 3 || objc_msgSend(v56, "state") == 4)
  {

  }
  else
  {
    v53 = objc_msgSend(v56, "state");

    if (v53 != 5)
      goto LABEL_38;
  }
  objc_msgSend(v11, "setDidFloatCursor:", 0);
  objc_msgSend(v11, "setPreviousForcePressCount:", 0);
  objc_msgSend(v11, "setPanGestureState:", 0);
  -[_UIKeyboardTextSelectionInteraction _didEndIndirectSelectionGesture:](self, "_didEndIndirectSelectionGesture:", v56);
  objc_msgSend(v11, "activeGestures");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "removeObject:", v56);

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "resetCursorPosition");

  -[_UIKeyboardTextSelectionInteraction _tidyUpGesture](self, "_tidyUpGesture");
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v18;
  v57[1] = 3221225472;
  v57[2] = __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke_2;
  v57[3] = &unk_1E16D8AA0;
  v57[4] = self;
  v59 = v8;
  v60 = v10;
  v58 = v56;
  objc_msgSend(v52, "logBlock:domain:", v57, CFSTR("com.apple.keyboard.UIKit"));

LABEL_38:
}

- (void)twoFingerTap:(id)a3
{
  id v4;
  void *v5;
  double Current;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 isViewKeyboardLayoutPresent;
  void *v23;
  void *v24;
  void *v25;
  UIDelayedAction *v26;
  UIDelayedAction *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  int v32;
  _QWORD v33[4];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v5, "twoFingerTapTimestamp");
  v8 = v7;
  -[_UIKeyboardTextSelectionInteraction clearKeyboardTouchesForGesture:](self, "clearKeyboardTouchesForGesture:", v4);
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    v9 = objc_msgSend(v4, "state");
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 2, v9, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  else
  {
    -[_UIKeyboardTextSelectionInteraction _granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 0, Current - v8, 0.667);
  }
  objc_msgSend(v5, "setTwoFingerTapTimestamp:", Current);
  objc_msgSend(v5, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v5, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTwoFingerTapTimestamp:", Current);

  }
  objc_msgSend(v5, "tapLogTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v5, "tapLogTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKey:", CFSTR("tapLogValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v17 + 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v18, CFSTR("tapLogValue"));

    objc_msgSend(v5, "tapLogTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "touch");

    if (v17 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke_2;
      v29[3] = &unk_1E16D8AF0;
      v30 = v5;
      v31 = v4;
      v32 = v17 + 1;
      objc_msgSend(v20, "logBlock:domain:", v29, CFSTR("com.apple.keyboard.UIKit"));

    }
  }
  else
  {
    objc_msgSend(v4, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v21);

    v38[0] = &unk_1E1A991F8;
    v37[0] = CFSTR("tapLogValue");
    v37[1] = CFSTR("isOnKeyboard");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isViewKeyboardLayoutPresent);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    v26 = [UIDelayedAction alloc];
    v27 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v26, "initWithTarget:action:userInfo:delay:mode:", self, sel__logTapCounts_, v25, *MEMORY[0x1E0C99748], 0.667);
    objc_msgSend(v5, "setTapLogTimer:", v27);

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke;
    v33[3] = &unk_1E16D8AC8;
    v34 = v5;
    v36 = isViewKeyboardLayoutPresent;
    v35 = v4;
    objc_msgSend(v28, "logBlock:domain:", v33, CFSTR("com.apple.keyboard.UIKit"));

  }
}

- (void)panningGestureAddedTouch:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPanning");

    if (v5)
    {
      -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHadAddedTouch:", 1);

    }
  }
  else if (objc_msgSend(v9, "state") == 3)
  {
    -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPanning");

    if ((v8 & 1) == 0)
    {
      if (self->_touchPadTimerCompletion)
      {
        -[_UIKeyboardTextSelectionInteraction _cancelTouchPadTimer](self, "_cancelTouchPadTimer");
        (*((void (**)(void))self->_touchPadTimerCompletion + 2))();
      }
    }
  }

}

- (void)panningGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double Current;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 isViewKeyboardLayoutPresent;
  _UIKeyboardTextSelectionTouchesObservingGestureRecognizer *v34;
  _UITouchesObservingGestureRecognizer *addedTouchRecognizer;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  _BOOL4 v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  int v66;
  int v67;
  void *v68;
  int v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  char GestureKeyboardFlag;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  _BOOL4 v82;
  id *v83;
  id v84;
  void *v85;
  int v86;
  id *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  _QWORD *touchPadTimerCompletion;
  _QWORD *v95;
  void (**v96)(_QWORD);
  void *v97;
  double v98;
  uint64_t v99;
  double v100;
  _UIPanOrFlickGestureRecognizer *v101;
  _UIPanOrFlickGestureRecognizer *activePress;
  _UIPanOrFlickGestureRecognizer *v103;
  uint64_t v104;
  void *v105;
  id *v106;
  _QWORD v107[5];
  id v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  double v113;
  double v114;
  _QWORD v115[4];
  id v116;
  id v117;
  double v118;
  double v119;

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "state");
  if ((_getGestureKeyboardFlag(v4) & 2) == 0)
    goto LABEL_12;
  if ((objc_msgSend(v5, "suppressTwoFingerPan") & 1) == 0 && v7 <= 1)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scroller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isZooming"))
      objc_msgSend(v5, "setSuppressTwoFingerPan:", 1);

  }
  if (!objc_msgSend(v5, "suppressTwoFingerPan"))
  {
LABEL_12:
    -[_UIKeyboardTextSelectionInteraction _cancelTouchPadTimer](self, "_cancelTouchPadTimer");
    Current = CFAbsoluteTimeGetCurrent();
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textInputView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v15);
    v17 = v16;
    v19 = v18;

    v20 = (id *)&OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
    if ((objc_msgSend(v5, "isPanning") & 1) != 0
      || v7 > 1
      || (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v4, "view"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "locationInView:", v21),
          v22 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 0, 1),
          v21,
          !v22))
    {
      if (objc_msgSend(v5, "isPanning"))
      {
        +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "shouldUseAcceleration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "BOOLValue");

        if (v42)
        {
          -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "textInputView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "velocityInView:", v44);
          v46 = v45;
          v48 = v47;

          v49 = v4;
          v50 = objc_msgSend(v49, "state") == 3 || objc_msgSend(v49, "state") == 4 || objc_msgSend(v49, "state") == 5;

          -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", !v50, v17, v19, v46, v48);
          v53 = v52;
          v55 = v54;
          objc_msgSend(v5, "setLastPanTranslation:", v17, v19);
          v19 = v55;
          v17 = v53;
        }
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", v17, v19);
        v17 = v56;
        v19 = v57;
        objc_msgSend(v5, "weightedPoint");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addPoint:", v17, v19);

        v59 = v4;
        if (objc_msgSend(v59, "state") == 3 || objc_msgSend(v59, "state") == 4)
        {

        }
        else
        {
          v63 = objc_msgSend(v59, "state");

          if (v63 != 5)
            goto LABEL_53;
        }
        if (-[_UIKeyboardTextSelectionInteraction isPlacedCarefully](self, "isPlacedCarefully"))
        {
          objc_msgSend(v5, "weightedPoint");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "weightedPoint");
          v17 = v61;
          v19 = v62;

        }
      }
      else if (self->_touchPadTimerCompletion)
      {
        -[_UIKeyboardTextSelectionInteraction _clearTouchPadCallback](self, "_clearTouchPadCallback");
      }
    }
    else
    {
      objc_msgSend(v5, "activeGestures");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v4);

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textInputView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0C9D538];
      v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v4, "setTranslation:inView:", v25, *MEMORY[0x1E0C9D538], v27);

      objc_msgSend(v5, "setLastPanTranslation:", v26, v27);
      v28 = -1.0;
      if (v17 < 0.0)
        v29 = -1.0;
      else
        v29 = v17;
      if (v17 <= 0.0)
        v17 = v29;
      else
        v17 = 1.0;
      if (v19 >= 0.0)
        v28 = v19;
      if (v19 <= 0.0)
        v19 = v28;
      else
        v19 = 1.0;
      objc_msgSend(v5, "setIsPanning:", 1, 1.0, v28, v29);
      objc_msgSend(v5, "setIsSpacePan:", ((unint64_t)_getGestureKeyboardFlag(v4) >> 2) & 1);
      objc_msgSend(v5, "setSpacePanDistance:", 0.0);
      objc_msgSend(v5, "setHadAddedTouch:", 0);
      objc_msgSend(v5, "setIsLongPressing:", 0);
      objc_msgSend(v5, "setLastPanTranslation:", v17, v19);
      objc_msgSend(v5, "setAccumulatedAcceleration:", v26, v27);
      objc_msgSend(v5, "setAccumulatedBounding:", v26, v27);
      -[_UIKeyboardTextSelectionInteraction clearKeyboardTouchesForGesture:](self, "clearKeyboardTouchesForGesture:", v4);
      -[_UIKeyboardTextSelectionInteraction _willBeginIndirectSelectionGesture:](self, "_willBeginIndirectSelectionGesture:", v4);
      -[_UIKeyboardTextSelectionInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
      -[_UIKeyboardTextSelectionInteraction _prepareForGesture](self, "_prepareForGesture");
      objc_msgSend(v5, "weightedPoint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "clearHistory");

      objc_msgSend(v5, "weightedPoint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addPoint:", v17, v19);

      if ((_getGestureKeyboardFlag(v4) & 4) != 0)
      {
        objc_msgSend(v4, "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v32);

        if (isViewKeyboardLayoutPresent && !self->_addedTouchRecognizer)
        {
          v34 = objc_alloc_init(_UIKeyboardTextSelectionTouchesObservingGestureRecognizer);
          addedTouchRecognizer = self->_addedTouchRecognizer;
          self->_addedTouchRecognizer = &v34->super;

          -[_UIKeyboardTextSelectionInteraction _configureLongPressAddedTouchRecognizer:](self, "_configureLongPressAddedTouchRecognizer:", self->_addedTouchRecognizer);
          +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addGestureRecognizer:", self->_addedTouchRecognizer);

        }
      }
      if ((_getGestureKeyboardFlag(v4) & 0x20) != 0 && !self->_touchPadTimerCompletion)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isShiftKeyBeingHeld");

        if ((v38 & 1) == 0)
          -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 2, v26, v27);
      }
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke;
      v115[3] = &unk_1E16D8AA0;
      v116 = v5;
      v117 = v4;
      v118 = v17;
      v119 = v19;
      objc_msgSend(v39, "logBlock:domain:", v115, CFSTR("com.apple.keyboard.UIKit"));

    }
LABEL_53:
    if (objc_msgSend(v5, "isSpacePan"))
    {
      v64 = sqrt(v19 * v19 + v17 * v17);
      objc_msgSend(v5, "spacePanDistance");
      if (v64 > v65)
        objc_msgSend(v5, "setSpacePanDistance:", v64);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v66 = objc_msgSend(v6, "hasMarkedText");
    else
      v66 = 0;
    if (!objc_msgSend(v5, "isPanning"))
      goto LABEL_67;
    if ((_getGestureKeyboardFlag(v4) & 2) != 0)
    {
      if ((objc_msgSend(v4, "didLongPress") & 1) != 0)
      {
        v67 = 1;
        goto LABEL_66;
      }
    }
    else if ((_getGestureKeyboardFlag(v4) & 4) == 0)
    {
      v67 = 0;
      goto LABEL_66;
    }
    v67 = objc_msgSend(v5, "hadAddedTouch");
LABEL_66:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isShiftKeyBeingHeld");

    if ((((v69 | v67) ^ 1 | v66) & 1) == 0)
    {
      if (objc_msgSend(v5, "hadAddedTouch"))
      {
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "restartSelection");

      }
      if ((objc_msgSend(v5, "isLongPressing") & 1) == 0)
      {
        objc_msgSend(v5, "setIsLongPressing:", 1);
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "switchToRangedSelection");

      }
      if ((_getGestureKeyboardFlag(v4) & 4) != 0)
        v75 = 1;
      else
        v75 = 2;
      -[_UIKeyboardTextSelectionInteraction longPressGestureWithState:withTranslation:touchCount:](self, "longPressGestureWithState:withTranslation:touchCount:", v7, v75, v17, v19);
      goto LABEL_81;
    }
LABEL_67:
    if (!objc_msgSend(v5, "isPanning"))
      goto LABEL_81;
    objc_msgSend(v5, "twoFingerTapTimestamp");
    if (Current - v70 > 0.667)
    {
      +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "allowExtendingSelections");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v72, "BOOLValue"))
      {

      }
      else
      {
        GestureKeyboardFlag = _getGestureKeyboardFlag(v4);

        if ((GestureKeyboardFlag & 0x10) != 0)
        {
          -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", objc_msgSend(v4, "state"), objc_msgSend(v4, "recognizedFlickDirection"), v17, v19);
LABEL_81:
          v80 = v4;
          if (objc_msgSend(v80, "state") == 3 || objc_msgSend(v80, "state") == 4)
          {

          }
          else
          {
            v99 = objc_msgSend(v80, "state");

            if (v99 != 5)
              goto LABEL_109;
          }
          if (objc_msgSend(v5, "isPanning"))
          {
            objc_msgSend(v80, "view");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = _isViewKeyboardLayoutPresent(v81);

            v83 = (id *)MEMORY[0x1E0DBE978];
            if (!v82)
              v83 = (id *)MEMORY[0x1E0DBE970];
            v84 = *v83;
            objc_msgSend(v6, "textSelectionController");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "hasRangedSelection");
            v87 = (id *)MEMORY[0x1E0DBE960];
            if (!v86)
              v87 = (id *)MEMORY[0x1E0DBE968];
            v88 = *v87;

            TIStatisticsGetKeyForGesture();
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            TIStatisticScalarIncrement();

            objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v110[0] = MEMORY[0x1E0C809B0];
            v110[1] = 3221225472;
            v110[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_2;
            v110[3] = &unk_1E16D8AA0;
            v111 = v5;
            v91 = v80;

            v112 = v91;
            v113 = v17;
            v114 = v19;
            objc_msgSend(v90, "logBlock:domain:", v110, CFSTR("com.apple.keyboard.UIKit"));

          }
          objc_msgSend(v5, "setDidFloatCursor:", 0);
          objc_msgSend(v5, "setIsLongPressing:", 0);
          objc_msgSend(v5, "setIsPanning:", 0);
          objc_msgSend(v5, "setIsSpacePan:", 0);
          objc_msgSend(v5, "activeGestures");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "removeObject:", v80);

          -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "resetCursorPosition");

          -[_UIKeyboardTextSelectionInteraction _tidyUpGesture](self, "_tidyUpGesture");
          touchPadTimerCompletion = self->_touchPadTimerCompletion;
          v95 = touchPadTimerCompletion;
          if (!touchPadTimerCompletion)
          {
            v107[1] = 3221225472;
            v107[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_3;
            v107[3] = &unk_1E16B47A8;
            v95 = v107;
            v107[4] = self;
            v106 = &v108;
            v107[0] = MEMORY[0x1E0C809B0];
            v108 = v5;
            v20 = &v109;
            v109 = v80;
          }
          v96 = (void (**)(_QWORD))_Block_copy(v95);
          if ((_getGestureKeyboardFlag(v80) & 4) != 0)
          {
            objc_msgSend(v80, "view");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "locationInView:", v97);
            objc_msgSend(v80, "velocityInView:", v97);
            objc_msgSend(v97, "bounds");
            if (!-[_UIKeyboardTextSelectionInteraction isPlacedCarefully](self, "isPlacedCarefully")
              && (self->_touchPadTimerCompletion || (objc_msgSend(v5, "spacePanDistance"), v100 > 16.0))
              || (objc_msgSend(v5, "spacePanDistance"), v98 < 16.0) && IsGestureWithinSpecialRegion(v80))
            {
              if (!self->_activePress)
              {
                v101 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
                activePress = self->_activePress;
                self->_activePress = v101;

                -[_UIKeyboardTextSelectionInteraction _configureLongPressRecognizer:](self, "_configureLongPressRecognizer:", self->_activePress);
                v103 = self->_activePress;
                v104 = _getGestureKeyboardFlag(v103);
                _setGestureKeyboardFlag(v103, v104 & 0xFFFFFFFFFFFFFFBFLL);
                -[UIPanGestureRecognizer setDelegate:](self->_activePress, "setDelegate:", self);
                -[_UIPanOrFlickGestureRecognizer setMinimumPressDuration:](self->_activePress, "setMinimumPressDuration:", 0.0);
                +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIView _addGestureRecognizer:atEnd:]((uint64_t)v105, self->_activePress, 0);

              }
              -[_UIKeyboardTextSelectionInteraction _startTouchPadTimerWithCompletion:](self, "_startTouchPadTimerWithCompletion:", v96);

              v96 = 0;
            }

          }
          if (v96)
            v96[2](v96);

          if (!touchPadTimerCompletion)
          {

          }
          goto LABEL_109;
        }
      }
    }
    v77 = objc_msgSend(v4, "state");
    v78 = objc_msgSend(v4, "recognizedFlickDirection");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionInteraction indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:](self, "indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:", v77, v78, objc_msgSend(v79, "isShiftKeyBeingHeld"), v17, v19);

    goto LABEL_81;
  }
  v11 = v4;
  if (objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 4)
  {

  }
  else
  {
    v51 = objc_msgSend(v11, "state");

    if (v51 != 5)
      goto LABEL_109;
  }
  objc_msgSend(v5, "setDidFloatCursor:", 0);
  objc_msgSend(v5, "setSuppressTwoFingerPan:", 0);
  objc_msgSend(v5, "activeGestures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v11);

LABEL_109:
}

- (void)_startTouchPadTimerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id touchPadTimerCompletion;
  NSTimer *v7;
  NSTimer *touchPadTimer;
  _QWORD v9[5];

  v4 = a3;
  -[_UIKeyboardTextSelectionInteraction _cancelTouchPadTimer](self, "_cancelTouchPadTimer");
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    touchPadTimerCompletion = self->_touchPadTimerCompletion;
    self->_touchPadTimerCompletion = v5;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73___UIKeyboardTextSelectionInteraction__startTouchPadTimerWithCompletion___block_invoke;
    v9[3] = &unk_1E16C4358;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 0.5);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    touchPadTimer = self->_touchPadTimer;
    self->_touchPadTimer = v7;

  }
}

- (void)_clearTouchPadCallback
{
  id touchPadTimerCompletion;

  touchPadTimerCompletion = self->_touchPadTimerCompletion;
  self->_touchPadTimerCompletion = 0;

}

- (void)oneFingerForcePress:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  long double v12;
  double v13;
  long double v14;
  double v15;
  int v16;
  unint64_t v17;
  _BOOL4 v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  BOOL v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  void *v33;
  void *v34;
  int v35;
  _QWORD *v36;
  _BOOL8 v37;
  void *v38;
  _BOOL8 isViewKeyboardLayoutPresent;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double Current;
  double v54;
  double v55;
  void *v56;
  void *v57;
  char v58;
  double v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD v71[5];
  id v72;
  _QWORD *v73;
  double v74;
  double v75;

  v70 = a3;
  -[_UIKeyboardTextSelectionInteraction owner](self, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "view");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_73;
  v6 = (void *)v5;
  objc_msgSend(v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textSelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_73;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "velocityInView:", v10);
  v12 = v11;
  v14 = v13;

  v15 = hypot(v12, v14);
  v16 = 1;
  if (objc_msgSend(v4, "panGestureState") && v15 > 65.0)
    v16 = objc_msgSend(v70, "touchEclipsesVelocity");
  if (!v70)
  {
    objc_msgSend(v4, "previousForcePressCount");
LABEL_12:
    v18 = 0;
    if (!v16)
      goto LABEL_9;
    goto LABEL_13;
  }
  v17 = v70[18];
  if (v17 <= (int)objc_msgSend(v4, "previousForcePressCount"))
    goto LABEL_12;
  v18 = v70[18] == 1;
  if (!v16)
  {
LABEL_9:
    -[_UIKeyboardTextSelectionInteraction _cancelLongForcePressTimer](self, "_cancelLongForcePressTimer");
LABEL_10:
    v19 = 1;
    goto LABEL_18;
  }
LABEL_13:
  if (objc_msgSend(v4, "panGestureState") <= 0
    && !-[_UIKeyboardTextSelectionInteraction forceTouchGestureRecognizerShouldBegin:](self, "forceTouchGestureRecognizerShouldBegin:", v70))
  {
    if (v18)
    {
      -[_UIKeyboardTextSelectionInteraction _beginLongForcePressTimerForGesture:](self, "_beginLongForcePressTimerForGesture:", v70);
      objc_msgSend(v70, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v38);
      if (v70)
        v40 = v70[18];
      else
        v40 = 0;
      +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:withPressCount:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePress:withPressCount:", isViewKeyboardLayoutPresent, v40);

    }
    goto LABEL_10;
  }
  if (!v18)
    -[_UIKeyboardTextSelectionInteraction _cancelLongForcePressTimer](self, "_cancelLongForcePressTimer");
  v19 = 0;
LABEL_18:
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textInputView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_translationInView:", v21);
  v23 = v22;
  v25 = v24;

  v26 = objc_msgSend(v70, "state") == 1 || v18;
  if (v26 == 1)
  {
    v27 = *MEMORY[0x1E0C9D538];
    v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v4, "setAccumulatedAcceleration:", *MEMORY[0x1E0C9D538], v28);
    objc_msgSend(v4, "setAccumulatedBounding:", v27, v28);
    objc_msgSend(v4, "setLastPanTranslation:", v23, v25);
    -[_UIKeyboardTextSelectionInteraction _prepareForGesture](self, "_prepareForGesture");
  }
  v29 = objc_msgSend(v70, "currentPreviewForceState") < 1;
  v30 = v70;
  if (v29)
    goto LABEL_70;
  v31 = v70 ? v70[18] : 0;
  v32 = v31 <= (int)objc_msgSend(v4, "previousForcePressCount") ? 1 : v19;
  v30 = v70;
  if ((v32 & 1) != 0)
    goto LABEL_70;
  if (objc_msgSend(v70, "state") >= 2)
  {
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shouldUseAcceleration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    if (v35)
    {
      if (objc_msgSend(v4, "panGestureState"))
      {
        v36 = v70;
        v37 = objc_msgSend(v36, "state") != 3 && objc_msgSend(v36, "state") != 4 && objc_msgSend(v36, "state") != 5;

      }
      else
      {
        v37 = 0;
      }
      -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", v37, v23, v25, (double)v12, (double)v14);
      v42 = v41;
      v44 = v43;
      objc_msgSend(v4, "setLastPanTranslation:", v23, v25);
      v25 = v44;
      v23 = v42;
    }
    objc_msgSend(v4, "weightedPoint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addPoint:", v23, v25);

    v46 = v70;
    if (objc_msgSend(v46, "state") == 3 || objc_msgSend(v46, "state") == 4)
    {

    }
    else
    {
      v50 = objc_msgSend(v46, "state");

      if (v50 != 5)
      {
LABEL_50:
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", v23, v25);
        v23 = v51;
        v25 = v52;
        goto LABEL_51;
      }
    }
    if (-[_UIKeyboardTextSelectionInteraction isPlacedCarefully](self, "isPlacedCarefully"))
    {
      objc_msgSend(v4, "weightedPoint");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "weightedPoint");
      v23 = v48;
      v25 = v49;

    }
    goto LABEL_50;
  }
LABEL_51:
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "lastPressTimestamp");
  v55 = v54;
  objc_msgSend(v4, "delegate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "hasMarkedText");

  }
  else
  {
    v58 = 0;
  }

  if (objc_msgSend(v4, "panGestureState") == 6)
  {
    v59 = Current - v55;
    if (Current - v55 <= 0.8)
    {
      -[_UIKeyboardTextSelectionInteraction _granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, v59);
    }
    else
    {
      objc_msgSend(v4, "setPanGestureState:", 0, v59);
      -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 3, v23, v25);
    }
  }
  if (objc_msgSend(v4, "panGestureState"))
  {
    if (objc_msgSend(v4, "panGestureState") == 1)
      v60 = v58;
    else
      v60 = 1;
    if ((v60 & 1) == 0)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "endSelection");

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "switchToRangedSelection");

      objc_msgSend(v4, "setPreviousRepeatedGranularity:", 1);
      objc_msgSend(v4, "setPanGestureState:", 6);
      -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 1, v23, v25);
    }
  }
  else
  {
    objc_msgSend(v4, "activeGestures");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "containsObject:", v70);

    if ((v64 & 1) == 0)
    {
      objc_msgSend(v4, "activeGestures");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v70);

    }
    if (v18)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "textInputView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x1E0C9D538];
      v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v70, "_setTranslation:inView:", v67, *MEMORY[0x1E0C9D538], v25);

      objc_msgSend(v4, "setLastPanTranslation:", v23, v25);
    }
    objc_msgSend(v4, "setPanGestureState:", 1);
    -[_UIKeyboardTextSelectionInteraction clearKeyboardTouchesForGesture:](self, "clearKeyboardTouchesForGesture:", v70);
    -[_UIKeyboardTextSelectionInteraction _willBeginIndirectSelectionGesture:](self, "_willBeginIndirectSelectionGesture:", v70);
    -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 0, v23, v25);
  }
  objc_msgSend(v4, "setLastPressTimestamp:", Current);
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __59___UIKeyboardTextSelectionInteraction_oneFingerForcePress___block_invoke;
  v71[3] = &unk_1E16B9488;
  v71[4] = self;
  v74 = v23;
  v75 = v25;
  v72 = v4;
  v73 = v70;
  objc_msgSend(v68, "logBlock:domain:", v71, CFSTR("com.apple.keyboard.UIKit"));

  v30 = v70;
LABEL_70:
  if (v30)
    v69 = *((unsigned int *)v30 + 36);
  else
    v69 = 0;
  objc_msgSend(v4, "setPreviousForcePressCount:", v69);
LABEL_73:

}

@end

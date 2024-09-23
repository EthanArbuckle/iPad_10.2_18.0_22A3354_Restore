@implementation _UIFocusEventRecognizer

- (_UIFocusEventRecognizer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 301, CFSTR("-init is not a valid initializer."));

  return 0;
}

- (_UIFocusEventRecognizer)initWithOwningView:(id)a3
{
  id v4;
  _UIFocusEventRecognizer *v5;
  _UIFocusEventRecognizer *v6;
  uint64_t v7;
  NSMapTable *gestureRecognizers;
  _UIFocusEffectsController *v9;
  _UIFocusEffectsController *motionEffectsController;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_UIFocusEventRecognizer;
  v5 = -[_UIFocusEventRecognizer init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningView, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    gestureRecognizers = v6->_gestureRecognizers;
    v6->_gestureRecognizers = (NSMapTable *)v7;

    v6->_enabled = 1;
    v9 = objc_alloc_init(_UIFocusEffectsController);
    motionEffectsController = v6->_motionEffectsController;
    v6->_motionEffectsController = v9;

    -[_UIFocusEffectsController setDisplayOffsetAccumulatorEnabled:](v6->_motionEffectsController, "setDisplayOffsetAccumulatorEnabled:", 1);
    objc_msgSend(v4, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceIdiom") == 2)
    {

    }
    else
    {
      objc_msgSend(v4, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if (v13 != 3)
      {
LABEL_16:
        -[_UIFocusEventRecognizer _updateGestureRecognizersForcingRemoval:](v6, "_updateGestureRecognizersForcingRemoval:", 0);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__focusSystemEnabledStateDidChange_, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel__focusBehaviorDidChange_, CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObserver:selector:name:object:", v6, sel__focusDidUpdate_, CFSTR("UIFocusDidUpdateNotification"), 0);

        goto LABEL_17;
      }
    }
    objc_msgSend(v4, "gestureRecognizers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v19, "_isGestureType:", 8) & 1) != 0
            || objc_msgSend(v19, "_isGestureType:", 12))
          {
            objc_msgSend(v4, "removeGestureRecognizer:", v19);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_UIFocusEventRecognizer reset](self, "reset");
  -[_UIFocusEventRecognizer _updateGestureRecognizersForcingRemoval:](self, "_updateGestureRecognizersForcingRemoval:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIFocusDidUpdateNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)_UIFocusEventRecognizer;
  -[_UIFocusEventRecognizer dealloc](&v6, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    -[_UIFocusEventRecognizer _updateGestureRecognizersForcingRemoval:](self, "_updateGestureRecognizersForcingRemoval:", !a3);
    self->_enabled = a3;
  }
}

- (void)reset
{
  -[_UIFocusEventRecognizer _resetMomentum](self, "_resetMomentum");
  -[_UIFocusEventRecognizer _resetJoystick](self, "_resetJoystick");
  -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
  -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
  -[_UIFocusEventRecognizer _cancelAllGestureRecognizers](self, "_cancelAllGestureRecognizers");
  -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
  self->_inputType = 0;
  *(_WORD *)&self->_flags &= ~0x80u;
}

- (void)setGesture:(id)a3 forName:(unint64_t)a4
{
  NSMapTable *gestureRecognizers;

  gestureRecognizers = self->_gestureRecognizers;
  if (a3)
    -[NSMapTable setObject:forKey:](gestureRecognizers, "setObject:forKey:", a3, a4);
  else
    -[NSMapTable removeObjectForKey:](gestureRecognizers, "removeObjectForKey:", a4);
}

- (id)gestureForName:(unint64_t)a3
{
  return -[NSMapTable objectForKey:](self->_gestureRecognizers, "objectForKey:", a3);
}

- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3 studyLogData:(id)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _UIFocusEnginePanGestureRecognizer *v11;
  const __CFString *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v18;
  uint64_t v19;
  _UIFocusEnableOnSelectGestureRecognizer *v20;
  const __CFString *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  int v27;
  uint64_t v28;
  _UIFocusSelectObserverGestureRecognizer *v29;
  const __CFString *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  int v36;
  uint64_t v37;
  UITapGestureRecognizer *v38;
  int v39;
  double v40;
  const __CFString *v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  int v47;
  uint64_t v48;
  _UIFocusEngineJoystickGestureRecognizer *v49;
  const __CFString *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  int v56;
  uint64_t v57;
  _UIFocusMovementTabulatorPressGestureRecognizer *v58;
  const __CFString *v59;
  char v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  int v65;
  uint64_t v66;
  _UIFocusMovementDirectionalPressGestureRecognizer *v67;
  const __CFString *v68;
  char v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  int v74;
  uint64_t v75;
  _UIRotaryGestureRecognizer *v76;
  const __CFString *v77;
  char v78;
  void *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  _BOOL4 v83;
  uint64_t v84;
  _UIFocusMovementDirectionalPressGestureRecognizer *v85;
  const __CFString *v86;
  char v87;
  void *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  int v92;
  uint64_t v93;
  _UIFocusLinearMovementDebugGestureRecognizer *v94;
  const __CFString *v95;
  char v96;
  void *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  id v101;

  v101 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_focusBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
    v9 = 0;
  else
    v9 = objc_msgSend(v7, "supportsIndirectPanningMovement");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (_UIFocusEnginePanGestureRecognizer *)v10;
  if (!v10 && v9)
  {
    v11 = -[UIPanGestureRecognizer initWithTarget:action:]([_UIFocusEnginePanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePanGesture_);
    -[UIGestureRecognizer setName:](v11, "setName:", CFSTR("com.apple.focus._UIFocusGesturePan"));
    -[UIPanGestureRecognizer setDelegate:](v11, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v11, 1);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v11, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v11, "setCancelsTouchesInView:", 0);
    -[UIPanGestureRecognizer _setHysteresis:](v11, "_setHysteresis:", 1.0);
    -[UIGestureRecognizer setAllowedTouchTypes:](v11, "setAllowedTouchTypes:", &unk_1E1A933E0);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v11);
    if (!v101 || !v11)
      goto LABEL_19;
    v12 = CFSTR("add");
    goto LABEL_15;
  }
  if (v10)
    v13 = v9;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v10);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 1);
    if (v101)
    {
      v12 = CFSTR("remove");
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v14, CFSTR("_UIFocusGesturePanAddress"));

      -[UIGestureRecognizer name](v11, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (const __CFString *)v15;
      else
        v17 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v17, CFSTR("_UIFocusGesturePanName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v12, CFSTR("_UIFocusGesturePanAction"));
    }
  }
LABEL_19:

  if (a3)
    v18 = 0;
  else
    v18 = objc_msgSend(v8, "shouldEnableFocusOnSelect");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 3);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (_UIFocusEnableOnSelectGestureRecognizer *)v19;
  if (!v19 && v18)
  {
    v20 = -[_UIFocusEnableOnSelectGestureRecognizer initWithTarget:action:]([_UIFocusEnableOnSelectGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleSelectGesture_);
    -[UIGestureRecognizer setName:](v20, "setName:", CFSTR("com.apple.focus._UIFocusGestureSelect"));
    -[UIGestureRecognizer setDelegate:](v20, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v20, 3);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v20);
    if (!v101 || !v20)
      goto LABEL_37;
    v21 = CFSTR("add");
    goto LABEL_33;
  }
  if (v19)
    v22 = v18;
  else
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v19);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 3);
    if (v101)
    {
      v21 = CFSTR("remove");
LABEL_33:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v23, CFSTR("_UIFocusGestureSelectAddress"));

      -[UIGestureRecognizer name](v20, "name");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (const __CFString *)v24;
      else
        v26 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v26, CFSTR("_UIFocusGestureSelectName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v21, CFSTR("_UIFocusGestureSelectAction"));
    }
  }
LABEL_37:

  if (a3)
    v27 = 0;
  else
    v27 = objc_msgSend(v8, "shouldSupressIndirectMovementOnSelect");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 4);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (_UIFocusSelectObserverGestureRecognizer *)v28;
  if (!v28 && v27)
  {
    v29 = -[_UIFocusSelectObserverGestureRecognizer initWithTarget:action:]([_UIFocusSelectObserverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleSelectObserverGesture_);
    -[UIGestureRecognizer setName:](v29, "setName:", CFSTR("com.apple.focus._UIFocusGestureSelectObserver"));
    -[UIGestureRecognizer setDelegate:](v29, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v29, 4);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v29);
    if (!v101 || !v29)
      goto LABEL_55;
    v30 = CFSTR("add");
    goto LABEL_51;
  }
  if (v28)
    v31 = v27;
  else
    v31 = 1;
  if ((v31 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v28);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 4);
    if (v101)
    {
      v30 = CFSTR("remove");
LABEL_51:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v32, CFSTR("_UIFocusGestureSelectObserverAddress"));

      -[UIGestureRecognizer name](v29, "name");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
        v35 = (const __CFString *)v33;
      else
        v35 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v35, CFSTR("_UIFocusGestureSelectObserverName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v30, CFSTR("_UIFocusGestureSelectObserverAction"));
    }
  }
LABEL_55:

  if (a3)
    v36 = 0;
  else
    v36 = objc_msgSend(v8, "shouldConvertIndirectTapsIntoArrowKeys");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 2);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (UITapGestureRecognizer *)v37;
  if (v37 || !v36)
  {
    if (v37)
      v42 = v36;
    else
      v42 = 1;
    if ((v42 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "removeGestureRecognizer:", v37);
      -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 2);
      if (v101)
      {
        v41 = CFSTR("remove");
        goto LABEL_71;
      }
    }
  }
  else
  {
    v38 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTapGesture_);
    -[UIGestureRecognizer setName:](v38, "setName:", CFSTR("com.apple.focus._UIFocusGestureTap"));
    -[UIGestureRecognizer setDelegate:](v38, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v38, 2);
    -[UITapGestureRecognizer setAllowedPressTypes:](v38, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v38, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v38, "setCancelsTouchesInView:", 0);
    v39 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusEngineTapAllowableMovement, (uint64_t)CFSTR("FocusEngineTapAllowableMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v40 = *(double *)&qword_1EDDA7FE0;
    if (v39)
      v40 = 150.0;
    -[UITapGestureRecognizer setAllowableMovement:](v38, "setAllowableMovement:", v40);
    -[UIGestureRecognizer setAllowedTouchTypes:](v38, "setAllowedTouchTypes:", &unk_1E1A933F8);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v38);
    if (v101 && v38)
    {
      v41 = CFSTR("add");
LABEL_71:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v43, CFSTR("_UIFocusGestureTapAddress"));

      -[UIGestureRecognizer name](v38, "name");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v44;
      if (v44)
        v46 = (const __CFString *)v44;
      else
        v46 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v46, CFSTR("_UIFocusGestureTapName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v41, CFSTR("_UIFocusGestureTapAction"));
    }
  }

  if (a3)
    v47 = 0;
  else
    v47 = objc_msgSend(v8, "supportsGameControllers");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 9);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (_UIFocusEngineJoystickGestureRecognizer *)v48;
  if (!v48 && v47)
  {
    v49 = -[_UIFocusEngineJoystickGestureRecognizer initWithTarget:action:]([_UIFocusEngineJoystickGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleJoystickGesture_);
    -[UIGestureRecognizer setName:](v49, "setName:", CFSTR("com.apple.focus._UIFocusGestureJoystick"));
    -[UIGestureRecognizer setDelegate:](v49, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v49, 9);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v49, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v49, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setAllowedTouchTypes:](v49, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v49);
    if (!v101 || !v49)
      goto LABEL_93;
    v50 = CFSTR("add");
    goto LABEL_89;
  }
  if (v48)
    v51 = v47;
  else
    v51 = 1;
  if ((v51 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v48);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 9);
    if (v101)
    {
      v50 = CFSTR("remove");
LABEL_89:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v52, CFSTR("_UIFocusGestureJoystickAddress"));

      -[UIGestureRecognizer name](v49, "name");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)v53;
      if (v53)
        v55 = (const __CFString *)v53;
      else
        v55 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v55, CFSTR("_UIFocusGestureJoystickName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v50, CFSTR("_UIFocusGestureJoystickAction"));
    }
  }
LABEL_93:

  if (a3)
    v56 = 0;
  else
    v56 = objc_msgSend(v8, "supportsTabKey");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 8);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (_UIFocusMovementTabulatorPressGestureRecognizer *)v57;
  if (!v57 && v56)
  {
    v58 = -[_UIFocusMovementPressGestureRecognizer initWithTarget:action:]([_UIFocusMovementTabulatorPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTabulatorGesture_);
    -[UIGestureRecognizer setName:](v58, "setName:", CFSTR("com.apple.focus._UIFocusGestureTabulator"));
    -[UIGestureRecognizer setDelegate:](v58, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v58, 8);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v58);
    if (!v101 || !v58)
      goto LABEL_111;
    v59 = CFSTR("add");
    goto LABEL_107;
  }
  if (v57)
    v60 = v56;
  else
    v60 = 1;
  if ((v60 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v57);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 8);
    if (v101)
    {
      v59 = CFSTR("remove");
LABEL_107:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v61, CFSTR("_UIFocusGestureTabulatorAddress"));

      -[UIGestureRecognizer name](v58, "name");
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v62;
      if (v62)
        v64 = (const __CFString *)v62;
      else
        v64 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v64, CFSTR("_UIFocusGestureTabulatorName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v59, CFSTR("_UIFocusGestureTabulatorAction"));
    }
  }
LABEL_111:

  if (a3)
    v65 = 0;
  else
    v65 = objc_msgSend(v8, "supportsArrowKeys");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 6);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (_UIFocusMovementDirectionalPressGestureRecognizer *)v66;
  if (!v66 && v65)
  {
    v67 = -[_UIFocusMovementPressGestureRecognizer initWithTarget:action:]([_UIFocusMovementDirectionalPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleArrowButtonGesture_);
    -[UIGestureRecognizer setName:](v67, "setName:", CFSTR("com.apple.focus._UIFocusGestureArrowButton"));
    -[UIGestureRecognizer setDelegate:](v67, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v67, 6);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v67);
    if (!v101 || !v67)
      goto LABEL_129;
    v68 = CFSTR("add");
    goto LABEL_125;
  }
  if (v66)
    v69 = v65;
  else
    v69 = 1;
  if ((v69 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v66);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 6);
    if (v101)
    {
      v68 = CFSTR("remove");
LABEL_125:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v67);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v70, CFSTR("_UIFocusGestureArrowButtonAddress"));

      -[UIGestureRecognizer name](v67, "name");
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)v71;
      if (v71)
        v73 = (const __CFString *)v71;
      else
        v73 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v73, CFSTR("_UIFocusGestureArrowButtonName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v68, CFSTR("_UIFocusGestureArrowButtonAction"));
    }
  }
LABEL_129:

  if (a3)
    v74 = 0;
  else
    v74 = objc_msgSend(v8, "supportsIndirectRotaryMovement");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
  v75 = objc_claimAutoreleasedReturnValue();
  v76 = (_UIRotaryGestureRecognizer *)v75;
  if (!v75 && v74)
  {
    v76 = -[_UIRotaryGestureRecognizer initWithTarget:action:]([_UIRotaryGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleRotaryGesture_);
    -[UIGestureRecognizer setName:](v76, "setName:", CFSTR("com.apple.focus._UIFocusGestureRotary"));
    -[_UIRotaryGestureRecognizer setDelegate:](v76, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v76, 5);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v76, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v76, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setAllowedTouchTypes:](v76, "setAllowedTouchTypes:", &unk_1E1A93410);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v76);
    if (!v101 || !v76)
      goto LABEL_147;
    v77 = CFSTR("add");
    goto LABEL_143;
  }
  if (v75)
    v78 = v74;
  else
    v78 = 1;
  if ((v78 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v75);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 5);
    if (v101)
    {
      v77 = CFSTR("remove");
LABEL_143:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v76);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v79, CFSTR("_UIFocusGestureRotaryAddress"));

      -[UIGestureRecognizer name](v76, "name");
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v80;
      if (v80)
        v82 = (const __CFString *)v80;
      else
        v82 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v82, CFSTR("_UIFocusGestureRotaryName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v77, CFSTR("_UIFocusGestureRotaryAction"));
    }
  }
LABEL_147:

  v83 = !a3 && objc_msgSend(v8, "pageButtonScrollingStyle") != 0;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 7);
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = (_UIFocusMovementDirectionalPressGestureRecognizer *)v84;
  if (!v84 && v83)
  {
    v85 = -[_UIFocusMovementPressGestureRecognizer initWithTarget:action:]([_UIFocusMovementDirectionalPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePageButtonGesture_);
    -[UIGestureRecognizer setName:](v85, "setName:", CFSTR("com.apple.focus._UIFocusGesturePageButton"));
    -[UIGestureRecognizer setDelegate:](v85, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v85, 7);
    -[UIGestureRecognizer setAllowedPressTypes:](v85, "setAllowedPressTypes:", &unk_1E1A93428);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v85);
    if (!v101 || !v85)
      goto LABEL_165;
    v86 = CFSTR("add");
    goto LABEL_161;
  }
  if (v84)
    v87 = v83;
  else
    v87 = 1;
  if ((v87 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v84);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 7);
    if (v101)
    {
      v86 = CFSTR("remove");
LABEL_161:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v85);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v88, CFSTR("_UIFocusGesturePageButtonAddress"));

      -[UIGestureRecognizer name](v85, "name");
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = (void *)v89;
      if (v89)
        v91 = (const __CFString *)v89;
      else
        v91 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v91, CFSTR("_UIFocusGesturePageButtonName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v86, CFSTR("_UIFocusGesturePageButtonAction"));
    }
  }
LABEL_165:

  if (a3)
    v92 = 0;
  else
    v92 = objc_msgSend(v8, "supportsLinearMovementDebugOverlay");
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 13);
  v93 = objc_claimAutoreleasedReturnValue();
  v94 = (_UIFocusLinearMovementDebugGestureRecognizer *)v93;
  if (!v93 && v92)
  {
    v94 = -[_UIFocusLinearMovementDebugGestureRecognizer initWithTarget:action:]([_UIFocusLinearMovementDebugGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleLinearDebugOverlayGesture_);
    -[UIGestureRecognizer setName:](v94, "setName:", CFSTR("com.apple.focus._UIFocusGestureDebugOverlay"));
    -[UIGestureRecognizer setDelegate:](v94, "setDelegate:", self);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", v94, 13);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v94);
    if (!v101 || !v94)
      goto LABEL_183;
    v95 = CFSTR("add");
    goto LABEL_179;
  }
  if (v93)
    v96 = v92;
  else
    v96 = 1;
  if ((v96 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", v93);
    -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", 0, 13);
    if (v101)
    {
      v95 = CFSTR("remove");
LABEL_179:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v94);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v97, CFSTR("_UIFocusGestureDebugOverlayAddress"));

      -[UIGestureRecognizer name](v94, "name");
      v98 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)v98;
      if (v98)
        v100 = (const __CFString *)v98;
      else
        v100 = &stru_1E16EDF20;
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("_UIFocusGestureDebugOverlayName"));

      objc_msgSend(v101, "setObject:forKeyedSubscript:", v95, CFSTR("_UIFocusGestureDebugOverlayAction"));
    }
  }
LABEL_183:

  -[_UIFocusEventRecognizer _updateRotaryIndicatorView](self, "_updateRotaryIndicatorView");
}

- (void)_updateRotaryIndicatorView
{
  UIView **p_owningView;
  id WeakRetained;
  int v5;
  int v6;
  _UIFocusRotaryIndicatorView *rotaryIndicatorView;
  void *v8;
  _UIFocusRotaryIndicatorView *v9;
  _UIFocusRotaryIndicatorView *v10;
  id v11;

  p_owningView = &self->_owningView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_focusBehavior");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_ShowRotaryIndicator, (uint64_t)CFSTR("B519_ShowRotaryIndicator"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1ECD762F4)
    v6 = v5;
  else
    v6 = 1;
  rotaryIndicatorView = self->_rotaryIndicatorView;
  if (!rotaryIndicatorView)
  {
    if (((objc_msgSend(v11, "supportsIndirectRotaryMovement") ^ 1 | v6) & 1) == 0)
    {
      v8 = objc_loadWeakRetained((id *)p_owningView);
      +[_UIFocusRotaryIndicatorView createRotaryIndicatorInView:](_UIFocusRotaryIndicatorView, "createRotaryIndicatorInView:", v8);
      v9 = (_UIFocusRotaryIndicatorView *)objc_claimAutoreleasedReturnValue();
      v10 = self->_rotaryIndicatorView;
      self->_rotaryIndicatorView = v9;

      goto LABEL_13;
    }
    rotaryIndicatorView = self->_rotaryIndicatorView;
    if (!rotaryIndicatorView)
      goto LABEL_14;
  }
  if ((v6 & 1) != 0)
  {
LABEL_8:
    -[UIView removeFromSuperview](rotaryIndicatorView, "removeFromSuperview");
    v8 = self->_rotaryIndicatorView;
    self->_rotaryIndicatorView = 0;
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_msgSend(v11, "supportsIndirectRotaryMovement") & 1) == 0)
  {
    rotaryIndicatorView = self->_rotaryIndicatorView;
    goto LABEL_8;
  }
LABEL_14:

}

- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3
{
  -[_UIFocusEventRecognizer _updateGestureRecognizersForcingRemoval:studyLogData:](self, "_updateGestureRecognizersForcingRemoval:studyLogData:", a3, 0);
}

- (void)_cancelAllGestureRecognizers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NSAllMapTableValues(self->_gestureRecognizers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "isEnabled");
        objc_msgSend(v7, "setEnabled:", 0);
        objc_msgSend(v7, "setEnabled:", v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (NSSet)gesturesForFailureRequirements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSAllMapTableValues(self->_gestureRecognizers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)_focusBehaviorDidChange:(id)a3
{
  -[_UIFocusEventRecognizer _updateGestureRecognizersForcingRemoval:](self, "_updateGestureRecognizersForcingRemoval:", 0);
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_isEnabled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(WeakRetained, "_focusSystem");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v5)
    {
      -[_UIFocusEventRecognizer _resetContinuousMovementState](self, "_resetContinuousMovementState");
      -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
      -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
      -[_UIFocusEventRecognizer _cancelAllGestureRecognizers](self, "_cancelAllGestureRecognizers");
    }
  }

}

- (id)_focusMovementSystem
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_focusMovementSystemForFocusEventRecognizer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "The focus system to use for processing focus movement cannot be nil. Delegate: %@", (uint8_t *)&v11, 0xCu);
        }

      }
      else
      {
        v8 = _focusMovementSystem___s_category;
        if (!_focusMovementSystem___s_category)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_focusMovementSystem___s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "The focus system to use for processing focus movement cannot be nil. Delegate: %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    objc_msgSend(v5, "_preferredFirstResponderFocusSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_didRecognizeFocusMovementRequest:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained
    && objc_msgSend(WeakRetained, "_focusEventRecognizer:didRecognizeFocusMovementRequest:", self, v5))
  {
    -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_moveWithEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (!-[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 5))
  {
    v9 = 0;
    goto LABEL_12;
  }
  self->_inputType = 5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 3)
    goto LABEL_8;
  if (!objc_msgSend(v4, "_focusHeading"))
  {
    v10 = objc_msgSend(v4, "_moveDirection");
    if ((unint64_t)(v10 - 1) <= 3)
    {
      v8 = qword_18667C7E0[v10 - 1];
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v4, "_focusHeading");
LABEL_9:

  -[_UIFocusEventRecognizer _setMoveEvent:](self, "_setMoveEvent:", v4);
  -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "focusGroupMovementBehavior") << 60;

  v13 = 1;
  if ((v8 & 0x330) != 0)
    v13 = 2;
  v9 = -[_UIFocusEventRecognizer _moveInDirection:groupFilter:](self, "_moveInDirection:groupFilter:", v8, v13 & (v12 >> 63));
  -[_UIFocusEventRecognizer _setMoveEvent:](self, "_setMoveEvent:", 0);
  self->_inputType = 0;
LABEL_12:

  return v9;
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4
{
  return -[_UIFocusEventRecognizer _moveInDirection:groupFilter:withSearchInfo:](self, "_moveInDirection:groupFilter:withSearchInfo:", a3, a4, 0);
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withSearchInfo:(id)a5
{
  id v8;
  void *v9;
  _UIFocusMovementRequest *v10;
  _UIFocusMovementInfo *v11;
  BOOL v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t buf[16];

  v8 = a5;
  if (a3)
  {
    -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v9);
      v11 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", a3, 0, 1, 1, 0, a4, self->_inputType);
      -[_UIFocusMovementRequest setMovementInfo:](v10, "setMovementInfo:", v11);

      -[_UIFocusMovementRequest setSearchInfo:](v10, "setSearchInfo:", v8);
      v12 = -[_UIFocusEventRecognizer _didRecognizeFocusMovementRequest:](self, "_didRecognizeFocusMovementRequest:", v10);

    }
    else
    {
      v13 = _moveInDirection_groupFilter_withSearchInfo____s_category;
      if (!_moveInDirection_groupFilter_withSearchInfo____s_category)
      {
        v13 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&_moveInDirection_groupFilter_withSearchInfo____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", buf, 2u);
      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withEvaluator:(id)a5
{
  id v8;
  _UIFocusSearchInfo *v9;

  v8 = a5;
  v9 = -[_UIFocusSearchInfo initWithFocusEvaluator:]([_UIFocusSearchInfo alloc], "initWithFocusEvaluator:", v8);

  LOBYTE(a4) = -[_UIFocusEventRecognizer _moveInDirection:groupFilter:withSearchInfo:](self, "_moveInDirection:groupFilter:withSearchInfo:", a3, a4, v9);
  return a4;
}

- (void)_handleSelectGesture:(id)a3
{
  void *v3;
  id v4;

  -[_UIFocusEventRecognizer _focusSystemSceneComponent](self, "_focusSystemSceneComponent", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setNeedsNonDeferredFocusUpdate");

}

- (void)_handleSelectObserverGesture:(id)a3
{
  CGPoint v5;
  void *v6;
  _OWORD *v7;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[_UIFocusEffectsController startRollbackAnimation](self->_motionEffectsController, "startRollbackAnimation");
    -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
    *(_WORD *)&self->_flags |= 0x80u;
  }
  else
  {
    *(_WORD *)&self->_flags &= ~0x80u;
    -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
    v7 = (_OWORD *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 752, CFSTR("Unexpected gesture recognizer class: %@"), objc_opt_class());

    }
    if (v7)
      v5 = (CGPoint)v7[25];
    else
      v5 = (CGPoint)0;
    self->_lastKnownTouchPoint = v5;

  }
}

- (void)_handleArrowButtonGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t inputType;
  char v16;
  uint64_t v17;
  unsigned int v18;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "state");
  self->_lastButtonPressTime = CACurrentMediaTime();
  -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
  -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
  -[_UIFocusEventRecognizer _resetPanDeadband](self, "_resetPanDeadband");
  if (-[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 4))
  {
    if ((unint64_t)(v4 - 1) <= 1)
    {
      v5 = objc_msgSend(v19, "focusHeading");
      if (v5)
      {
        v6 = v5;
        -[_UIFocusEventRecognizer _resetMomentum](self, "_resetMomentum");
        -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v8, "isEnabled");
        v11 = objc_msgSend(v9, "isEnabled");
        v12 = objc_msgSend(v10, "isEnabled");
        if (objc_msgSend(v7, "indirectMovementPriority") == 2)
        {
          objc_msgSend(v8, "setEnabled:", 0);
          objc_msgSend(v10, "setEnabled:", 0);
        }
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_remoteTouchSurfaceType");

        if (v14 == 2 && objc_msgSend(v7, "shouldConvertIndirectTapsIntoArrowKeys"))
          objc_msgSend(v9, "setEnabled:", 0);
        inputType = self->_inputType;
        self->_inputType = 4;
        if ((objc_msgSend(v7, "focusGroupMovementBehavior") & 4) == 0
          || objc_msgSend(v19, "pressSource") == 2
          || (v16 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusEmulateGameControllerWithKeyboard, (uint64_t)CFSTR("FocusEmulateGameControllerWithKeyboard"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool), v17 = 1, (v16 & 1) == 0)&& byte_1EDDA7FFC)
        {
          v17 = 0;
        }
        -[_UIFocusEventRecognizer _moveInDirection:groupFilter:](self, "_moveInDirection:groupFilter:", v6, v17);
        self->_inputType = inputType;
        objc_msgSend(v8, "setEnabled:", v18);
        objc_msgSend(v9, "setEnabled:", v11);
        objc_msgSend(v10, "setEnabled:", v12);

      }
    }
  }

}

- (void)_handlePageButtonGesture:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  int v10;
  double v11;
  double v12;
  CGPoint lastMomentumTouchPoint;
  id v19;

  v19 = a3;
  v4 = -[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 7);
  v5 = v19;
  if (!v4)
    goto LABEL_17;
  if ((unint64_t)(objc_msgSend(v19, "state") - 1) > 1)
    goto LABEL_15;
  v6 = objc_msgSend(v19, "focusHeading");
  v5 = v19;
  if (!v6)
  {
LABEL_17:

    return;
  }
  -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pageButtonScrollingStyle");

  if (!-[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 7)
    || (unint64_t)(v8 - 1) > 1)
  {
LABEL_15:
    v5 = v19;
    if (self->_inputType == 7)
      self->_inputType = 0;
    goto LABEL_17;
  }
  *(_WORD *)&self->_flags |= 1u;
  self->_inputType = 7;
  -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
  v5 = v19;
  if ((*(_WORD *)&self->_flags & 2) != 0)
    goto LABEL_17;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76358, (uint64_t)CFSTR("FocusMomentumFriction"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 0.99;
  else
    v9 = *(double *)&qword_1ECD76360;
  v10 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD763C8, (uint64_t)CFSTR("FocusPageButtonSwipeScrollingVelocity"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v11 = *(double *)&qword_1ECD763D0;
  if (v10)
    v11 = 10.0;
  v12 = -v11;
  __asm { FMOV            V2.2D, #0.5 }
  self->_lastMomentumTouchPoint = _Q2;
  lastMomentumTouchPoint = self->_lastMomentumTouchPoint;
  if (!_ZF)
    v12 = v11;
  self->_touchBeganPoint = lastMomentumTouchPoint;
  self->_lastKnownTouchPoint = lastMomentumTouchPoint;
  -[_UIFocusEventRecognizer _beginMomentumImmediatelyWithVelocity:friction:](self, "_beginMomentumImmediatelyWithVelocity:friction:", 0.0, v12, v9);

}

- (void)_handleTabulatorGesture:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _UIFocusMovementRequest *v13;
  _UIFocusMovementInfo *v14;
  unint64_t v15;
  NSObject *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (-[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 8)
    && (unint64_t)(v5 - 1) <= 1)
  {
    self->_inputType = 8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(WeakRetained, "_focusBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v4, "focusHeading");
    if (v8)
    {
      v9 = v8;
      -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_msgSend(v7, "focusGroupMovementBehavior") & 2;
        +[_UIFocusSearchInfo defaultInfo](_UIFocusSearchInfo, "defaultInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setForceFocusToLeaveContainer:", 1);
        v13 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v10);
        v14 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", v9, 0, 1, 0, objc_msgSend(v7, "tabBasedMovementLoops"), v11, self->_inputType);
        -[_UIFocusMovementRequest setMovementInfo:](v13, "setMovementInfo:", v14);

        -[_UIFocusMovementRequest setSearchInfo:](v13, "setSearchInfo:", v12);
        -[_UIFocusEventRecognizer _didRecognizeFocusMovementRequest:](self, "_didRecognizeFocusMovementRequest:", v13);

      }
      else
      {
        v15 = _handleTabulatorGesture____s_category;
        if (!_handleTabulatorGesture____s_category)
        {
          v15 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&_handleTabulatorGesture____s_category);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", buf, 2u);
        }
      }
      self->_inputType = 0;

    }
    else
    {
      self->_inputType = 0;
    }

  }
}

- (void)_handlePanGesture:(id)a3
{
  double *v5;
  _BOOL4 v6;
  double *v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double *v19;

  v19 = (double *)a3;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
  v5 = (double *)objc_claimAutoreleasedReturnValue();

  if (v5 != v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 952, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognizer == [self gestureForName:_UIFocusGesturePan]"));

  }
  v6 = -[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 1);
  v7 = v19;
  if (v6)
  {
    if (objc_msgSend(v19, "state") == 1)
      -[_UIFocusEventRecognizer _panGestureStart:](self, "_panGestureStart:", v19);
    if (objc_msgSend(v19, "state") != 4 && (*(_WORD *)&self->_flags & 0x80) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
      objc_msgSend(v19, "velocityInView:", WeakRetained);
      v10 = v9;
      v12 = v11;

      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_remoteTouchSurfaceType");

      if (v19)
      {
        v15 = v19[50];
        v16 = v19[51];
      }
      else
      {
        v16 = 0.0;
        v15 = 0.0;
      }
      -[_UIFocusEventRecognizer _updatePanLocation:reportedVelocity:remoteTouchSurfaceType:](self, "_updatePanLocation:reportedVelocity:remoteTouchSurfaceType:", v14, v15, v16, v10, v12);
    }
    if (objc_msgSend(v19, "state") == 3)
    {
      -[_UIFocusEventRecognizer _panGestureEnd:](self, "_panGestureEnd:", v19);
LABEL_15:
      v7 = v19;
      goto LABEL_16;
    }
    v17 = objc_msgSend(v19, "state");
    v7 = v19;
    if (v17 == 4)
    {
      -[_UIFocusEventRecognizer _panGestureCancelled:](self, "_panGestureCancelled:", v19);
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)_handleTapGesture:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = -[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 2);
  v5 = v12;
  if (v4)
  {
    v6 = objc_msgSend(v12, "state");
    v5 = v12;
    if (v6 == 3)
    {
      self->_inputType = 2;
      objc_msgSend(v12, "_digitizerLocation");
      v7 = -[_UIFocusEventRecognizer _touchRegionForDigitizerLocation:](self, "_touchRegionForDigitizerLocation:") - 1;
      if (v7 <= 3)
      {
        v8 = qword_18667C800[v7];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = v10;

        +[_UIFocusEngineDelayedPressAction sendDelayedPressWithType:timestamp:sender:](_UIFocusEngineDelayedPressAction, "sendDelayedPressWithType:timestamp:sender:", v8, self, v11);
      }
      self->_inputType = 0;
      v5 = v12;
    }
  }

}

- (void)_handleJoystickGesture:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 3);
  v5 = v7;
  if (!v4)
    goto LABEL_8;
  v6 = objc_msgSend(v7, "state");
  if (v6 == 1)
  {
    -[_UIFocusEventRecognizer _joystickGestureBegan:](self, "_joystickGestureBegan:", v7);
  }
  else if ((unint64_t)(v6 - 1) > 2)
  {
    goto LABEL_6;
  }
  -[_UIFocusEventRecognizer _joystickGestureUpdated:](self, "_joystickGestureUpdated:", v7);
LABEL_6:
  v5 = v7;
  if ((unint64_t)(v6 - 3) <= 1)
  {
    -[_UIFocusEventRecognizer _joystickGestureEnded:](self, "_joystickGestureEnded:", v7);
    v5 = v7;
  }
LABEL_8:

}

- (void)_handleLinearDebugOverlayGesture:(id)a3
{
  uint64_t v4;
  _UIFocusLinearMovementDebugView *linearDebugView;
  int v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[_UIFocusEventRecognizer _hideLinearDebugOverlayIfNecessary:](self, "_hideLinearDebugOverlayIfNecessary:", 1);
  }
  else if ((unint64_t)(v4 - 1) <= 1)
  {
    linearDebugView = self->_linearDebugView;
    if (!linearDebugView
      || (v6 = -[_UIFocusLinearMovementDebugView isGroupMode](linearDebugView, "isGroupMode"),
          v6 != objc_msgSend(v7, "isGroupMode")))
    {
      -[_UIFocusEventRecognizer _showLinearDebugOverlay:](self, "_showLinearDebugOverlay:", objc_msgSend(v7, "isGroupMode"));
    }
  }

}

- (void)_showLinearDebugOverlay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  _UIFocusMovementRequest *v9;
  void *v10;
  uint64_t v11;
  _UIFocusMovementInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UIFocusLinearMovementDebugView *v19;
  unint64_t v20;
  NSObject *v21;
  _UIFocusLinearMovementDebugView *v22;
  id WeakRetained;
  id v24;
  _UIFocusLinearMovementDebugView *linearDebugView;
  _QWORD v26[4];
  _UIFocusLinearMovementDebugView *v27;
  uint8_t buf[16];

  v3 = a3;
  -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[_UIFocusEventRecognizer _hideLinearDebugOverlayIfNecessary:](self, "_hideLinearDebugOverlayIfNecessary:", 0);
    objc_msgSend(v5, "focusedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFocusSearchInfo defaultInfo](_UIFocusSearchInfo, "defaultInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setForceFocusToLeaveContainer:", 1);
    v9 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v5);
    -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "focusGroupMovementBehavior") & 2;

    v12 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", 16, 0, 1, 0, 1, v11, self->_inputType);
    -[_UIFocusMovementRequest setMovementInfo:](v9, "setMovementInfo:", v12);

    -[_UIFocusMovementRequest setSearchInfo:](v9, "setSearchInfo:", v8);
    objc_msgSend(v5, "_movementPerformer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contextForFocusMovement:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_focusMapSearchInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v3)
    {
      objc_msgSend(v15, "focusGroupMap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "focusGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[_UIFocusLinearMovementDebugView initWithGroups:]([_UIFocusLinearMovementDebugView alloc], "initWithGroups:", v18);
    }
    else
    {
      objc_msgSend(v15, "linearSortedFocusItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[_UIFocusLinearMovementDebugView initWithItems:]([_UIFocusLinearMovementDebugView alloc], "initWithItems:", v18);
    }
    v22 = v19;

    WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(WeakRetained, "bounds");
    -[UIView setFrame:](v22, "setFrame:");

    v24 = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(v24, "addSubview:", v22);

    if (!v6)
    {
      -[UIView setAlpha:](v22, "setAlpha:", 0.0);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51___UIFocusEventRecognizer__showLinearDebugOverlay___block_invoke;
      v26[3] = &unk_1E16B1B28;
      v27 = v22;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v26, 0, 0.1, 0.0);

    }
    linearDebugView = self->_linearDebugView;
    self->_linearDebugView = v22;

  }
  else
  {
    v20 = _showLinearDebugOverlay____s_category;
    if (!_showLinearDebugOverlay____s_category)
    {
      v20 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&_showLinearDebugOverlay____s_category);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring debug overlay presentation request.", buf, 2u);
    }
  }

}

- (BOOL)_hideLinearDebugOverlayIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  _UIFocusLinearMovementDebugView *v5;
  _UIFocusLinearMovementDebugView *v6;
  uint64_t v7;
  _UIFocusLinearMovementDebugView *linearDebugView;
  _QWORD v10[4];
  _UIFocusLinearMovementDebugView *v11;
  _QWORD v12[4];
  _UIFocusLinearMovementDebugView *v13;

  v3 = a3;
  v5 = self->_linearDebugView;
  v6 = v5;
  if (v5)
  {
    if (v3)
    {
      v7 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke;
      v12[3] = &unk_1E16B1B28;
      v13 = v5;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke_2;
      v10[3] = &unk_1E16B3FD8;
      v11 = v13;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v12, v10, 0.2, 0.0);

    }
    else
    {
      -[UIView removeFromSuperview](v5, "removeFromSuperview");
    }
    linearDebugView = self->_linearDebugView;
    self->_linearDebugView = 0;

  }
  return v6 != 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  int v13;
  double v14;
  BOOL v15;
  double v16;
  int v17;
  double v18;

  v4 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_remoteTouchSurfaceType");

  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v4 || (*(_WORD *)&self->_flags & 0x20) != 0)
  {
    -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v9 == v4;

  }
  else
  {
    v8 = 1;
  }

  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "indirectMovementPriority") == 2)
    {
      v12 = CACurrentMediaTime();
      v13 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76318, (uint64_t)CFSTR("B519_ButtonSupressionTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v14 = *(double *)&qword_1ECD76320;
      if (v13)
        v14 = 0.25;
      v15 = v12 - self->_lastButtonPressTime >= v14;
    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
    if (v10 == v4 && v6 == 2)
    {
      v16 = CACurrentMediaTime();
      v17 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76328, (uint64_t)CFSTR("B519_TapSupressionTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v18 = *(double *)&qword_1ECD76330;
      if (v17)
        v18 = 0.1;
      v15 = v16 - self->_lastButtonPressTime >= v18;
    }
  }

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return (*(_WORD *)&self->_flags & 0x20) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10 == v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  unint64_t inputType;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v7)
  {

LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  inputType = self->_inputType;

  v6 = v7;
  if (inputType == 1)
  {
    -[_UIFocusEventRecognizer _panGestureEnd:](self, "_panGestureEnd:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)rotaryGestureRecognizerBeganClassifyingMovement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 1218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rotaryGesture == [self gestureForName:_UIFocusGestureRotary]"));

    v6 = v8;
  }
  if (objc_msgSend(v6, "beganMode") == 1)
    -[_UIFocusEventRecognizer _showRotaryIndicator](self, "_showRotaryIndicator");
  else
    -[_UIFocusEventRecognizer _showRotaryIndicatorAfterDelay](self, "_showRotaryIndicatorAfterDelay");

}

- (id)currentFocusBehavior
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_buttonMaskTimeHasExpired
{
  double v3;
  int v4;
  double v5;

  v3 = CACurrentMediaTime();
  v4 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_ButtonMaskTime, (uint64_t)CFSTR("B519_ButtonMaskTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v5 = *(double *)&qword_1EDDA7FD0;
  if (v4)
    v5 = 0.0;
  return v3 - self->_lastButtonPressTime >= v5;
}

- (int)_touchRegionForDigitizerLocation:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  int v6;
  uint64_t v7;
  int v8;
  double v9;
  double v10;
  double v12;
  double v13;
  _BOOL4 v16;
  int v17;

  y = a3.y;
  x = a3.x;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76368, (uint64_t)CFSTR("FocusEngineRemoteDeadzoneCenterX"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v5 = 0.5;
  else
    v5 = *(double *)&qword_1ECD76370;
  v6 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76378, (uint64_t)CFSTR("FocusEngineRemoteDeadzoneCenterY"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v7 = qword_1ECD76380;
  v8 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76388, (uint64_t)CFSTR("FocusEngineRemoteDeadzonePercentage"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v9 = *(double *)&qword_1ECD76390;
  if (v8)
    v9 = 0.1;
  if (vabdd_f64(x, v5) < v9)
  {
    v10 = v6 ? 0.5 : *(double *)&v7;
    if (vabdd_f64(y, v10) < v9)
      return 0;
  }
  v12 = 1.0 - y;
  v13 = 1.0 - x;
  if (x <= 1.0 - y && v13 <= v12)
    return 1;
  if (v13 > v12 && x <= v12)
    return 2;
  v16 = x <= v12 || v13 <= v12;
  if (v13 <= v12 && x > v12)
    v17 = 4;
  else
    v17 = 0;
  if (v16)
    return v17;
  else
    return 3;
}

- (CGSize)_touchSensitivityForItem:(id)a3 remoteTouchSurfaceType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CARInputDeviceTouchpad *currentCarTouchpad;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  uint64_t SensitivitySetting;
  double v31;
  void *v32;
  char isKindOfClass;
  double v34;
  double v35;
  double v36;
  void *v37;
  int v38;
  double v39;
  double v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  CGSize result;

  v7 = a3;
  objc_msgSend(v7, "containingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 3)
  {
    currentCarTouchpad = self->_currentCarTouchpad;
    if (!currentCarTouchpad)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 1360, CFSTR("Attempting to retrieve sensitivity information without a touchpad."));

      currentCarTouchpad = self->_currentCarTouchpad;
    }
    -[CARInputDeviceTouchpad sensitivity](currentCarTouchpad, "sensitivity");
    v13 = fmax(v12, 0.0);
    if (v13 >= 1.0)
      v14 = 1.5;
    else
      v14 = v13 + 0.5;
    -[CARInputDeviceTouchpad physicalSize](self->_currentCarTouchpad, "physicalSize");
    v16 = v15 * v14;
    -[CARInputDeviceTouchpad physicalSize](self->_currentCarTouchpad, "physicalSize");
    v18 = v14 * v17;
  }
  else
  {
    v19 = objc_msgSend(v7, "focusTouchSensitivityStyle");
    switch(v19)
    {
      case 0:
      case 3:
        if (dyld_program_sdk_at_least())
        {
          -[_UIFocusEventRecognizer _globalCoordinateSpace](self, "_globalCoordinateSpace");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "focusedRectInCoordinateSpace:", v20);
        }
        else
        {
          objc_msgSend(v7, "containingView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "frame");
        }
        v24 = v21;
        v51 = v22;

        break;
      case 1:
        objc_msgSend(v7, "containingView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bounds");
        v51 = v26;

        v24 = 184.0;
        break;
      case 2:
        v24 = 70.0;
        *(double *)&v23 = 270.0;
        goto LABEL_14;
      default:
        v24 = *MEMORY[0x1E0C9D820];
        v23 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
LABEL_14:
        v51 = *(double *)&v23;
        break;
    }
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76398, (uint64_t)CFSTR("FocusEngineOverallSensitivityAdjustment"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v27 = 1.0;
    else
      v27 = *(double *)&qword_1ECD763A0;
    if (a4 == 2 && (v28 = UIFocusGetSensitivitySetting(), v28 < 3))
    {
      v29 = dbl_18667C820[v28];
    }
    else
    {
      SensitivitySetting = UIFocusGetSensitivitySetting();
      v31 = 0.8;
      if (SensitivitySetting != 1)
        v31 = 1.0;
      if (SensitivitySetting == 2)
        v29 = 0.65;
      else
        v29 = v31;
    }
    objc_msgSend(v7, "item");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v34 = 1.0;
    v35 = 1.0;
    v36 = 1.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "item");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "_disableTouchInput");
      if (v38)
        v35 = 0.75;
      else
        v35 = 1.0;
      if (v38)
        v36 = 1.3;
      else
        v36 = 1.0;

    }
    if (v19 == 3)
      v34 = 1.2;
    if (a4 == 2)
    {
      v39 = 1.1;
    }
    else if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD763B8, (uint64_t)CFSTR("FocusEngineYSensitivityAdjustment"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))
    {
      v39 = 1.3;
    }
    else
    {
      v39 = *(double *)&qword_1ECD763C0;
    }
    v40 = v27 * v29;
    v41 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD763A8, (uint64_t)CFSTR("FocusEngineXSensitivityAdjustment"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v42 = *(double *)&qword_1ECD763B0;
    if (v41)
      v42 = 1.0;
    v43 = v35 * (v40 * v42);
    v44 = v36 * (v34 * (v40 * v39));
    if (dyld_program_sdk_at_least())
    {
      -[_UIFocusEventRecognizer _momentumReferenceSize](self, "_momentumReferenceSize");
      v44 = v44 * (v46 / v45);
    }
    if (self->_inputType == 6)
      v47 = 1.0;
    else
      v47 = 2.0;
    v18 = fmax(v47, fmin(v43 * _UIFocusEngineSensitivityForEdgeLength(v24), 10.0));
    v16 = fmax(v47, fmin(v44 * _UIFocusEngineSensitivityForEdgeLength(v51), 10.0));
  }

  v48 = v18;
  v49 = v16;
  result.height = v49;
  result.width = v48;
  return result;
}

- (BOOL)_shouldAcceptInputType:(unint64_t)a3
{
  unint64_t inputType;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v13;
  void *v14;
  id WeakRetained;
  void *v16;
  BOOL v17;

  inputType = self->_inputType;
  v6 = (0x4Au >> inputType) & 1;
  if (inputType > 6)
    v6 = 0;
  if (a3 == 4)
    v7 = v6;
  else
    v7 = 0;
  -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "focusedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 6
      && !-[_UIFocusEventRecognizer _canMoveFocusWithRotaryInputInFocusContext:](self, "_canMoveFocusWithRotaryInputInFocusContext:", v10))
    {
      goto LABEL_24;
    }
    v11 = self->_inputType;
    v13 = v11 != a3 && v11 != 0;
    if (v7)
    {
      -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "indirectMovementPriority") == 0;

    }
    if (inputType != 3 && v13 || a3 == 2 && (*(_WORD *)&self->_flags & 2) != 0)
    {
LABEL_24:
      v17 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = WeakRetained;
      v17 = !WeakRetained
         || objc_msgSend(WeakRetained, "_shouldRecognizeEventsInFocusEventRecognizer:", self);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_canMoveFocusWithRotaryInputInFocusContext:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  isKindOfClass = 1;
  if ((_UIInternalPreferenceUsesDefault(&dword_1ECD76310, (uint64_t)CFSTR("B519_UniversalFocusMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1ECD76314)
  {
    if ((_UIInternalPreferenceUsesDefault(&_MergedGlobals_908, (uint64_t)CFSTR("B519_KeyboardFocusMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD7630C)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (id)_focusSystemSceneComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIFocusEventRecognizer owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_focusSystemSceneComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_globalCoordinateSpace
{
  void *v2;
  void *v3;

  -[_UIFocusEventRecognizer _focusSystemSceneComponent](self, "_focusSystemSceneComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_resetProgressAccumulator
{
  self->_unlockedAccumulator = 0u;
  self->_progressAccumulator = 0u;
}

- (id)_retrieveCachedFocusItemInfo
{
  void *v3;
  void *v4;
  _UIFocusItemInfo *cachedFocusItemInfo;
  _UIFocusItemInfo *v6;
  _UIFocusItemInfo *v7;
  _UIFocusItemInfo *v8;

  -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  cachedFocusItemInfo = self->_cachedFocusItemInfo;
  if (v4)
  {
    if (!cachedFocusItemInfo)
    {
      +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v4);
      v6 = (_UIFocusItemInfo *)objc_claimAutoreleasedReturnValue();
      v7 = self->_cachedFocusItemInfo;
      self->_cachedFocusItemInfo = v6;

      cachedFocusItemInfo = self->_cachedFocusItemInfo;
    }
    v8 = cachedFocusItemInfo;
  }
  else
  {
    self->_cachedFocusItemInfo = 0;

    v8 = 0;
  }

  return v8;
}

- (void)_resetCachedFocusItemInfo
{
  _UIFocusItemInfo *cachedFocusItemInfo;

  cachedFocusItemInfo = self->_cachedFocusItemInfo;
  self->_cachedFocusItemInfo = 0;

}

- (void)_handleRotaryGesture:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _UIFocusRotaryIndicatorView *rotaryIndicatorView;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;

  v22 = a3;
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 1703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rotaryGesture == [self gestureForName:_UIFocusGestureRotary]"));

  }
  if (-[_UIFocusEventRecognizer _shouldAcceptInputType:](self, "_shouldAcceptInputType:", 6))
  {
    if (objc_msgSend(v22, "state") == 1)
      -[_UIFocusEventRecognizer _handleRotaryBegin:](self, "_handleRotaryBegin:", v22);
    if (objc_msgSend(v22, "state") != 4 && (*(_WORD *)&self->_flags & 0x80) == 0)
    {
      objc_msgSend(v22, "velocity");
      v7 = v6;
      -[_UIFocusEventRecognizer _momentumReferenceSize](self, "_momentumReferenceSize");
      v9 = v8;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_remoteTouchSurfaceType");

      -[_UIFocusEventRecognizer _retrieveCachedFocusItemInfo](self, "_retrieveCachedFocusItemInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rotaryFocusMovementAxis");

      if ((unint64_t)(v13 - 1) <= 2)
      {
        v14 = v7 * v9;
        objc_msgSend(v22, "accumulatedDistance");
        v16 = v15;
        objc_msgSend(v22, "delta");
        -[_UIFocusEventRecognizer _updateRotaryDistance:delta:reportedVelocity:remoteTouchSurfaceType:focusMovementAxis:](self, "_updateRotaryDistance:delta:reportedVelocity:remoteTouchSurfaceType:focusMovementAxis:", v11, v13, v16, v17, v14);
      }
      rotaryIndicatorView = self->_rotaryIndicatorView;
      objc_msgSend(v22, "position");
      -[_UIFocusRotaryIndicatorView updateWheelPosition:](rotaryIndicatorView, "updateWheelPosition:");
    }
    if (objc_msgSend(v22, "state") == 3)
    {
      -[_UIFocusEventRecognizer _handleRotaryEnd:](self, "_handleRotaryEnd:", v22);
    }
    else
    {
      v20 = objc_msgSend(v22, "state") == 4;
      v19 = v22;
      if (!v20)
        goto LABEL_19;
      -[_UIFocusEventRecognizer _handleRotaryCancelled:](self, "_handleRotaryCancelled:", v22);
    }
    v19 = v22;
  }
  else
  {
    v19 = v22;
    if (self->_inputType == 6)
      self->_inputType = 0;
  }
LABEL_19:

}

- (void)_handleRotaryBegin:(id)a3
{
  self->_inputType = 6;
  -[_UIFocusEffectsController cancelRollbackAnimation](self->_motionEffectsController, "cancelRollbackAnimation", a3);
  self->_focusUpdateCountSinceLastContinuousMovementBegan = 0;
  *(_WORD *)&self->_flags |= 0x41u;
  -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
  -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
  -[_UIFocusEventRecognizer _resetMomentum](self, "_resetMomentum");
  -[_UIFocusEventRecognizer _showRotaryIndicator](self, "_showRotaryIndicator");
}

- (void)_handleRotaryEnd:(id)a3
{
  *(_WORD *)&self->_flags &= ~0x80u;
  -[_UIFocusEventRecognizer _resetContinuousMovementState](self, "_resetContinuousMovementState", a3);
  -[_UIFocusEffectsController startRollbackAnimation](self->_motionEffectsController, "startRollbackAnimation");
  -[_UIFocusEffectsController resetDisplayOffsetAccumulationFactor](self->_motionEffectsController, "resetDisplayOffsetAccumulationFactor");
  -[_UIFocusEventRecognizer _hideRotaryIndicator](self, "_hideRotaryIndicator");
}

- (void)_handleRotaryCancelled:(id)a3
{
  -[_UIFocusEventRecognizer _resetContinuousMovementState](self, "_resetContinuousMovementState", a3);
  -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
  -[_UIFocusEventRecognizer _hideRotaryIndicator](self, "_hideRotaryIndicator");
}

- (void)_showRotaryIndicatorAfterDelay
{
  NSTimer *v3;
  NSTimer *showRotaryIndicatorAfterDelayTimer;
  id v5;

  -[_UIFocusEventRecognizer _cancelShowRotaryIndicatorTimer](self, "_cancelShowRotaryIndicatorTimer");
  -[NSTimer invalidate](self->_showRotaryIndicatorAfterDelayTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerFiredForShowRotaryIndicator_, 0, 0, 0.2);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  showRotaryIndicatorAfterDelayTimer = self->_showRotaryIndicatorAfterDelayTimer;
  self->_showRotaryIndicatorAfterDelayTimer = v3;

  if (self->_showRotaryIndicatorAfterDelayTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_showRotaryIndicatorAfterDelayTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)_cancelShowRotaryIndicatorTimer
{
  NSTimer *showRotaryIndicatorAfterDelayTimer;

  -[NSTimer invalidate](self->_showRotaryIndicatorAfterDelayTimer, "invalidate");
  showRotaryIndicatorAfterDelayTimer = self->_showRotaryIndicatorAfterDelayTimer;
  self->_showRotaryIndicatorAfterDelayTimer = 0;

}

- (void)_timerFiredForShowRotaryIndicator:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (self->_showRotaryIndicatorAfterDelayTimer == a3)
  {
    -[_UIFocusEventRecognizer _cancelShowRotaryIndicatorTimer](self, "_cancelShowRotaryIndicatorTimer");
    -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      v6 = objc_msgSend(v4, "state");
      v5 = v7;
      if (!v6)
      {
        -[_UIFocusEventRecognizer _showRotaryIndicator](self, "_showRotaryIndicator");
        v5 = v7;
      }
    }

  }
}

- (void)_showRotaryIndicator
{
  _UIFocusRotaryIndicatorView *rotaryIndicatorView;
  _UIFocusRotaryIndicatorView *v4;
  void *v5;

  -[_UIFocusEventRecognizer _cancelShowRotaryIndicatorTimer](self, "_cancelShowRotaryIndicatorTimer");
  -[_UIFocusEventRecognizer _updateRotaryIndicatorView](self, "_updateRotaryIndicatorView");
  rotaryIndicatorView = self->_rotaryIndicatorView;
  if (rotaryIndicatorView)
  {
    -[_UIFocusRotaryIndicatorView updateFailedMovementHeading:](rotaryIndicatorView, "updateFailedMovementHeading:", 0);
    v4 = self->_rotaryIndicatorView;
    -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "position");
    -[_UIFocusRotaryIndicatorView updateWheelPosition:](v4, "updateWheelPosition:");

    -[_UIFocusRotaryIndicatorView toggleVisible:animated:](self->_rotaryIndicatorView, "toggleVisible:animated:", 1, 1);
  }
}

- (void)_hideRotaryIndicator
{
  -[_UIFocusEventRecognizer _cancelShowRotaryIndicatorTimer](self, "_cancelShowRotaryIndicatorTimer");
  -[_UIFocusRotaryIndicatorView toggleVisible:animated:](self->_rotaryIndicatorView, "toggleVisible:animated:", 0, 1);
}

- (void)_updateRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5 remoteTouchSurfaceType:(unint64_t)a6 focusMovementAxis:(int64_t)a7
{
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[_UIFocusEventRecognizer _createStudyLogDataForRotaryDistance:delta:reportedVelocity:](self, "_createStudyLogDataForRotaryDistance:delta:reportedVelocity:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _retrieveCachedFocusItemInfo](self, "_retrieveCachedFocusItemInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76348, (uint64_t)CFSTR("B519_FocusMovementGain"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v15 = *(double *)&qword_1ECD76350;
  if (v14)
    v15 = 1.5;
  v16 = v15 * a4;
  v17 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76348, (uint64_t)CFSTR("B519_FocusMovementGain"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v18 = *(double *)&qword_1ECD76350;
  if (v17)
    v18 = 1.5;
  v19 = v18 * a5;
  v20 = objc_msgSend(v13, "focusTouchSensitivityStyle");
  if ((unint64_t)(a7 - 1) > 2)
    v21 = 0;
  else
    v21 = qword_18667C838[a7 - 1];
  v22 = v20 == 2;
  -[_UIFocusEventRecognizer _pointForLinearValue:axis:](self, "_pointForLinearValue:axis:", v21, v16);
  v24 = v23;
  v26 = v25;
  -[_UIFocusEventRecognizer _pointForLinearValue:axis:](self, "_pointForLinearValue:axis:", v21, v19);
  v28 = v27;
  v30 = v29;
  -[_UIFocusEventRecognizer _applyHorizontalFlipForFocusItemInfo:toDelta:](self, "_applyHorizontalFlipForFocusItemInfo:toDelta:", v13, v24, v26);
  v32 = v31;
  v34 = v33;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76338, (uint64_t)CFSTR("B519_RotaryMovementAccelerationStrength"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v35 = 0.7;
  else
    v35 = *(double *)&qword_1ECD76340;
  -[_UIFocusEventRecognizer _accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:](self, "_accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:", 1, v22, a6, v28, v30, v35);
  v37 = v36;
  v39 = v38;
  -[_UIFocusEventRecognizer _touchSensitivityForItem:remoteTouchSurfaceType:](self, "_touchSensitivityForItem:remoteTouchSurfaceType:", v13, a6);
  v42 = v41;
  v43 = v40;
  if (v41 == *MEMORY[0x1E0C9D820] && v40 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        goto LABEL_22;
      objc_msgSend(v13, "item");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "debugDescription");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138412290;
      v56 = v54;
      _os_log_fault_impl(&dword_185066000, v52, OS_LOG_TYPE_FAULT, "Focus Sensitivity for focus item must not be zero: %@", (uint8_t *)&v55, 0xCu);
    }
    else
    {
      v50 = _updateRotaryDistance_delta_reportedVelocity_remoteTouchSurfaceType_focusMovementAxis____s_category;
      if (!_updateRotaryDistance_delta_reportedVelocity_remoteTouchSurfaceType_focusMovementAxis____s_category)
      {
        v50 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v50, (unint64_t *)&_updateRotaryDistance_delta_reportedVelocity_remoteTouchSurfaceType_focusMovementAxis____s_category);
      }
      v51 = *(NSObject **)(v50 + 8);
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v52 = v51;
      objc_msgSend(v13, "item");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "debugDescription");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138412290;
      v56 = v54;
      _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "Focus Sensitivity for focus item must not be zero: %@", (uint8_t *)&v55, 0xCu);
    }

LABEL_22:
  }
LABEL_15:
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a6, v32 * v37 * v42, v34 * v39 * v43);
  -[_UIFocusEventRecognizer _updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:](self, "_updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:", v12, v45, v46, v45, v46);
  -[_UIFocusEventRecognizer _updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:](self, "_updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:", self->_progressAccumulator.dx, self->_progressAccumulator.dy, self->_unlockedAccumulator.dx, self->_unlockedAccumulator.dy);
  v47 = -[_UIFocusEventRecognizer _calculateLinearHeadingForAccumulator:studyLogData:](self, "_calculateLinearHeadingForAccumulator:studyLogData:", v12, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  v48 = -[_UIFocusEventRecognizer _calculateDirectionalHeadingForAccumulator:studyLogData:](self, "_calculateDirectionalHeadingForAccumulator:studyLogData:", v12, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _attemptRotaryFocusMovementWithLinearHeading:directionalHeading:focusMovementAxis:focusSystem:acceleratedVelocity:studyLogData:](self, "_attemptRotaryFocusMovementWithLinearHeading:directionalHeading:focusMovementAxis:focusSystem:acceleratedVelocity:studyLogData:", v47, v48, a7, v49, v12, v28 * v37, v30 * v39);

}

- (id)_createStudyLogDataForRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5
{
  return 0;
}

- (id)_createRotaryMovementRequestWithFocusSystem:(id)a3
{
  id v3;
  _UIFocusMovementRequest *v4;

  v3 = a3;
  v4 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v3);

  return v4;
}

- (CGPoint)_pointForLinearValue:(double)a3 axis:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = 0.0;
  if ((a4 & 1) != 0)
    v5 = a3;
  else
    v5 = 0.0;
  if ((a4 & 2) != 0)
    v4 = a3;
  v6 = v5;
  result.y = v4;
  result.x = v6;
  return result;
}

- (unint64_t)_calculateLinearHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4
{
  BOOL v4;
  unint64_t v5;

  v4 = a3.dy > -1.0 && a3.dx > -1.0;
  v5 = 32;
  if (v4)
    v5 = 0;
  if (a3.dy < 1.0 && a3.dx < 1.0)
    return v5;
  else
    return 16;
}

- (BOOL)_attemptRotaryFocusMovementWithLinearHeading:(unint64_t)a3 directionalHeading:(unint64_t)a4 focusMovementAxis:(int64_t)a5 focusSystem:(id)a6 acceleratedVelocity:(CGPoint)a7 studyLogData:(id)a8
{
  _BOOL4 v8;
  double y;
  double x;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;

  LOBYTE(v8) = 0;
  if (a5 != 3)
    a3 = a4;
  if (a6 && a3)
  {
    y = a7.y;
    x = a7.x;
    -[_UIFocusEventRecognizer _createRotaryMovementRequestWithFocusSystem:](self, "_createRotaryMovementRequestWithFocusSystem:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusEventRecognizer currentFocusBehavior](self, "currentFocusBehavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = ((unint64_t)objc_msgSend(v15, "focusGroupMovementBehavior") >> 5) & 1;

    -[_UIFocusEventRecognizer _createMovementInfoForHeading:groupFilter:acceleratedVelocity:](self, "_createMovementInfoForHeading:groupFilter:acceleratedVelocity:", a3, v16, x, y);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMovementInfo:", v17);

    v8 = -[_UIFocusEventRecognizer _attemptToRecognizeContinuousMovementRequest:](self, "_attemptToRecognizeContinuousMovementRequest:", v14);
    if (v8)
      -[_UIFocusEventRecognizer _continuousMovementSucceededWithDirectionalHeading:](self, "_continuousMovementSucceededWithDirectionalHeading:", a4);
    else
      -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", a4);

  }
  return v8;
}

- (void)_resetPanDeadband
{
  int v3;
  double v4;

  v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_PanDeadbandSize, (uint64_t)CFSTR("B519_PanDeadbandSize"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v4 = *(double *)&qword_1EDDA7FB0;
  if (v3)
    v4 = 0.15;
  self->_panDeadBand = v4;
}

- (BOOL)focusEnginePanGestureRecognizerShouldRecognizeImmediately:(id)a3
{
  return (*(_WORD *)&self->_flags & 0x22) != 0;
}

- (void)_panGestureStart:(id)a3
{
  CGPoint v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CARInputDeviceTouchpad *v17;
  CARInputDeviceTouchpad *currentCarTouchpad;
  void *v19;
  _OWORD *v20;

  v20 = a3;
  self->_inputType = 1;
  -[_UIFocusEffectsController cancelRollbackAnimation](self->_motionEffectsController, "cancelRollbackAnimation");
  self->_focusUpdateCountSinceLastContinuousMovementBegan = 0;
  *(_WORD *)&self->_flags |= 0x41u;
  v5 = (CGPoint)0;
  if (v20)
    v5 = (CGPoint)v20[25];
  self->_lastKnownTouchPoint = v5;
  self->_touchBeganPoint = self->_lastKnownTouchPoint;
  -[_UIFocusEventRecognizer _resetProgressAccumulator](self, "_resetProgressAccumulator");
  -[_UIFocusEventRecognizer _resetFailedMovementHeading](self, "_resetFailedMovementHeading");
  self->_previousPoints[3] = 0u;
  self->_previousPoints[4] = 0u;
  self->_previousPoints[1] = 0u;
  self->_previousPoints[2] = 0u;
  self->_previousPoints[0] = 0u;
  self->_numFrames = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    -[UIGestureRecognizer _activeTouchesEvent](v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchesForGestureRecognizer:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)&self->_owningView);
      objc_msgSend(v12, "_screen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_carSessionStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inputDeviceManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "touchpadWithSenderID:", objc_msgSend(v11, "_senderID"));
      v17 = (CARInputDeviceTouchpad *)objc_claimAutoreleasedReturnValue();
      currentCarTouchpad = self->_currentCarTouchpad;
      self->_currentCarTouchpad = v17;

      if (!self->_currentCarTouchpad)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 2115, CFSTR("Attempted a pan-gesture-based focus movement without a touchpad."));

      }
    }

  }
  -[_UIFocusEventRecognizer _resetMomentum](self, "_resetMomentum");
  -[_UIFocusEventRecognizer _sendGestureBeginNotification](self, "_sendGestureBeginNotification");

}

- (void)_updatePanLocation:(CGPoint)a3 reportedVelocity:(CGPoint)a4 remoteTouchSurfaceType:(unint64_t)a5
{
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  void *v49;
  _BOOL8 v50;
  double v51;
  unint64_t v52;
  NSObject *v53;
  _BOOL4 v54;
  double v55;
  double v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v71 = *MEMORY[0x1E0C80C00];
  -[_UIFocusEventRecognizer _createStudyLogDataForPanNormalizedPoint:reportedVelocity:](self, "_createStudyLogDataForPanNormalizedPoint:reportedVelocity:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _retrieveCachedFocusItemInfo](self, "_retrieveCachedFocusItemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _calculateDeltaForNormalizedPoint:studyLogData:](self, "_calculateDeltaForNormalizedPoint:studyLogData:", v11, v9, v8);
  -[_UIFocusEventRecognizer _applyPanDeadbandToValue:startPoint:currentPoint:remoteTouchSurfaceType:](self, "_applyPanDeadbandToValue:startPoint:currentPoint:remoteTouchSurfaceType:", a5);
  v14 = v13;
  v16 = v15;
  -[_UIFocusEventRecognizer _applyHorizontalFlipForFocusItemInfo:toDelta:](self, "_applyHorizontalFlipForFocusItemInfo:toDelta:", v12);
  v67 = v9;
  v68 = v8;
  -[_UIFocusEventRecognizer _applyAxisLockingForNormalizedPoint:toDelta:](self, "_applyAxisLockingForNormalizedPoint:toDelta:", v9, v8, v17, v18);
  v20 = v19;
  v22 = v21;
  -[_UIFocusEventRecognizer _accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:](self, "_accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:", 0, objc_msgSend(v12, "focusTouchSensitivityStyle") == 2, a5, x, y, 1.0);
  v24 = v23;
  v26 = v25;
  -[_UIFocusEventRecognizer _touchSensitivityForItem:remoteTouchSurfaceType:](self, "_touchSensitivityForItem:remoteTouchSurfaceType:", v12, a5);
  v28 = y;
  v29 = v14;
  v30 = x;
  v32 = v31;
  v33 = v27;
  v34 = v20;
  if (v32 == *MEMORY[0x1E0C9D820] && v27 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v51 = v28;
    v64 = v32;
    v66 = v27;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v12, "item");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "debugDescription");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v70 = v62;
        _os_log_fault_impl(&dword_185066000, v60, OS_LOG_TYPE_FAULT, "Focus Sensitivity for focus item must not be zero: %@", buf, 0xCu);

      }
      v28 = v51;
      v30 = x;
      v34 = v20;
      v32 = v64;
      v33 = v66;
    }
    else
    {
      v52 = _updatePanLocation_reportedVelocity_remoteTouchSurfaceType____s_category;
      if (!_updatePanLocation_reportedVelocity_remoteTouchSurfaceType____s_category)
      {
        v52 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v52, (unint64_t *)&_updatePanLocation_reportedVelocity_remoteTouchSurfaceType____s_category);
      }
      v53 = *(NSObject **)(v52 + 8);
      v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
      v34 = v20;
      v32 = v64;
      v33 = v66;
      v28 = v51;
      v30 = x;
      if (v54)
      {
        v55 = v29;
        v56 = v28;
        v57 = v53;
        objc_msgSend(v12, "item");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "debugDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v70 = v59;
        _os_log_impl(&dword_185066000, v57, OS_LOG_TYPE_ERROR, "Focus Sensitivity for focus item must not be zero: %@", buf, 0xCu);

        v28 = v56;
        v29 = v55;
        v30 = x;
        v34 = v20;
        v32 = v64;
        v33 = v66;
      }
    }
  }
  v36 = v28;
  v63 = v30 * v24;
  v65 = v28 * v26;
  v37 = v16 * v26;
  v38 = v34 * v24 * v32;
  v39 = v22 * v26 * v33;
  v40 = v29 * v24 * v32;
  v41 = v37 * v33;
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a5, v38, v39);
  v43 = v42;
  v45 = v44;
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a5, v40, v41);
  -[_UIFocusEventRecognizer _updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:](self, "_updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:", v11, v43, v45, v46, v47);
  -[_UIFocusEventRecognizer _recordMomentumForPoint:reportedVelocity:](self, "_recordMomentumForPoint:reportedVelocity:", v67, v68, v30, v36);
  -[_UIFocusEventRecognizer _updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:](self, "_updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:", self->_progressAccumulator.dx, self->_progressAccumulator.dy, self->_unlockedAccumulator.dx, self->_unlockedAccumulator.dy);
  v48 = -[_UIFocusEventRecognizer _calculateDirectionalHeadingForAccumulator:studyLogData:](self, "_calculateDirectionalHeadingForAccumulator:studyLogData:", v11, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[_UIFocusEventRecognizer _attemptPanFocusMovementWithHeading:acceleratedVelocity:focusSystem:studyLogData:](self, "_attemptPanFocusMovementWithHeading:acceleratedVelocity:focusSystem:studyLogData:", v48, v49, v11, v63, v65);

  -[_UIFocusEventRecognizer _cleanupPanMomentumWithAccumulator:movementSuccess:](self, "_cleanupPanMomentumWithAccumulator:movementSuccess:", v50, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
}

- (id)_createPanMovementRequestWithFocusSystem:(id)a3
{
  id v4;
  _UIFocusMovementRequest *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  CARInputDeviceTouchpad *currentCarTouchpad;
  void *v10;

  v4 = a3;
  v5 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    currentCarTouchpad = self->_currentCarTouchpad;
    if (currentCarTouchpad)
    {
      if (-[CARInputDeviceTouchpad supportedFeedbackTypes](currentCarTouchpad, "supportedFeedbackTypes"))
      {
        +[_UIFocusInputDeviceInfo infoWithSenderID:](_UIFocusInputDeviceInfo, "infoWithSenderID:", -[CARInputDeviceTouchpad senderID](self->_currentCarTouchpad, "senderID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusMovementRequest setInputDeviceInfo:](v5, "setInputDeviceInfo:", v10);
        -[_UIFocusMovementRequest setShouldPerformHapticFeedback:](v5, "setShouldPerformHapticFeedback:", 1);

      }
    }
  }
  return v5;
}

- (id)_createStudyLogDataForPanNormalizedPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4
{
  return 0;
}

- (CGPoint)_calculateDeltaForNormalizedPoint:(CGPoint)a3 studyLogData:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = a3.x - self->_lastKnownTouchPoint.x;
  v5 = a3.y - self->_lastKnownTouchPoint.y;
  self->_lastKnownTouchPoint = a3;
  v6 = v4;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_applyPanDeadbandToValue:(CGPoint)a3 startPoint:(CGPoint)a4 currentPoint:(CGPoint)a5 remoteTouchSurfaceType:(unint64_t)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double panDeadBand;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a6 == 2)
  {
    v8 = a5.y;
    v9 = a5.x;
    v10 = a4.y;
    v11 = a4.x;
    panDeadBand = self->_panDeadBand;
    if (panDeadBand > 0.0)
    {
      v14 = CACurrentMediaTime() - self->_lastButtonPressTime;
      v15 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_PanDeadbandTime, (uint64_t)CFSTR("B519_PanDeadbandTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v16 = *(double *)&qword_1EDDA7FC0;
      if (v15)
        v16 = 3.0;
      if (v14 <= v16)
      {
        panDeadBand = self->_panDeadBand;
      }
      else
      {
        self->_panDeadBand = 0.0;
        panDeadBand = 0.0;
      }
    }
    v17 = sqrt((v9 - v11) * (v9 - v11) + (v8 - v10) * (v8 - v10));
    if (panDeadBand <= 0.0 || v17 >= panDeadBand)
    {
      if (panDeadBand > 0.0 && v17 > panDeadBand)
      {
        v18 = (v17 - panDeadBand) / sqrt(x * x + y * y);
        x = x * v18;
        y = y * v18;
        self->_panDeadBand = 0.0;
      }
    }
    else
    {
      x = *MEMORY[0x1E0C9D538];
      y = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
  }
  v19 = x;
  v20 = y;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)_applyHorizontalFlipForFocusItemInfo:(id)a3 toDelta:(CGPoint)a4
{
  CGFloat y;
  double x;
  int v6;
  double v7;
  double v8;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = objc_msgSend(a3, "isFocusMovementFlippedHorizontally");
  v7 = -x;
  if (!v6)
    v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_applyAxisLockingForNormalizedPoint:(CGPoint)a3 toDelta:(CGPoint)a4
{
  double y;
  double v5;
  double x;
  CGPoint v7;
  CGPoint v8;
  CGPoint lastKnownTouchPoint;
  int numFrames;
  CGPoint *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  if (a3.x > 0.95 && self->_touchBeganPoint.x < 0.95 || (y = 0.0, a3.x < 0.05) && self->_touchBeganPoint.x > 0.05)
  {
    y = a4.y;
    a4.y = 0.0;
  }
  if (a3.y >= 0.1)
  {
    x = 0.0;
  }
  else
  {
    v5 = self->_touchBeganPoint.y;
    if (v5 > 0.1)
      x = a4.x;
    else
      x = 0.0;
    if (v5 > 0.1)
      a4.x = 0.0;
  }
  v7 = self->_previousPoints[3];
  v8 = self->_previousPoints[1];
  self->_previousPoints[3] = self->_previousPoints[2];
  self->_previousPoints[4] = v7;
  lastKnownTouchPoint = self->_lastKnownTouchPoint;
  self->_previousPoints[1] = self->_previousPoints[0];
  self->_previousPoints[2] = v8;
  self->_previousPoints[0] = lastKnownTouchPoint;
  numFrames = self->_numFrames;
  v11 = &self->_lastKnownTouchPoint + numFrames;
  v13 = v11->x;
  v12 = v11->y;
  if (numFrames <= 4)
    self->_numFrames = numFrames + 1;
  v14 = vabdd_f64(self->_lastKnownTouchPoint.x - x, v13);
  v15 = vabdd_f64(self->_lastKnownTouchPoint.y - y, v12);
  if (v14 + v15 > 0.05)
  {
    if (v14 >= v15)
      a4.y = a4.y * 0.0;
    else
      a4.x = a4.x * 0.0;
  }
  v16 = a4.x;
  v17 = a4.y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_applyButtonMaskTimeToValue:(CGPoint)a3 remoteTouchSurfaceType:(unint64_t)a4
{
  double y;
  double x;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4 == 2 && !-[_UIFocusEventRecognizer _buttonMaskTimeHasExpired](self, "_buttonMaskTimeHasExpired"))
  {
    y = 0.0;
    x = 0.0;
  }
  v6 = x;
  v7 = y;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGVector)_accelerationFactorForCurrentVelocity:(CGPoint)a3 alpha:(double)a4 isRotaryGesture:(BOOL)a5 isFocusInKeyboard:(BOOL)a6 remoteTouchSurfaceType:(unint64_t)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  double y;
  double x;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGVector result;

  v8 = a6;
  v9 = a5;
  y = a3.y;
  x = a3.x;
  v14 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusEngineUsesAccelerationCurve, (uint64_t)CFSTR("FocusEngineUsesAccelerationCurve"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  v15 = 1.0;
  if ((v14 & 1) != 0 || !byte_1EDDA7FEC)
  {
    v16 = 1.0;
  }
  else
  {
    v16 = 1.0;
    if ((*(_WORD *)&self->_flags & 0x40) != 0)
    {
      -[_UIFocusEventRecognizer _momentumReferenceSize](self, "_momentumReferenceSize", 1.0, 1.0);
      v18 = x / v17;
      v20 = y / v19;
      v21 = fabs(x / v17);
      v22 = fabs(y / v19);
      v23 = _UIFocusEngineAcceleratedSpeedForSpeed(a7, v9, v8, v21);
      v24 = _UIFocusEngineAcceleratedSpeedForSpeed(a7, v9, v8, v22);
      v16 = 1.0;
      v15 = 1.0;
      if (v18 != 0.0)
        v15 = 1.0 - a4 + v23 / v21 * a4;
      if (v20 != 0.0)
        v16 = 1.0 - a4 + v24 / v22 * a4;
    }
  }
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (void)_updateAccumulatorsWithScaledDelta:(CGPoint)a3 unlockedDelta:(CGPoint)a4 studyLogData:(id)a5
{
  double dy;
  CGFloat v6;

  dy = self->_progressAccumulator.dy;
  self->_progressAccumulator.dx = a3.x + self->_progressAccumulator.dx;
  self->_progressAccumulator.dy = a3.y + dy;
  v6 = a4.y + self->_unlockedAccumulator.dy;
  self->_unlockedAccumulator.dx = a4.x + self->_unlockedAccumulator.dx;
  self->_unlockedAccumulator.dy = v6;
}

- (void)_updateMotionEffectsControllerWithProgressAccumulator:(CGVector)a3 unlockedAccumulator:(CGVector)a4
{
  double v4;
  double v5;

  v4 = a4.dx * 0.8;
  v5 = a4.dy * 0.8;
  if (!self->_focusUpdateCountSinceLastContinuousMovementBegan)
  {
    a3.dy = v5;
    a3.dx = v4;
  }
  -[_UIFocusEffectsController updateCurrentOffset:](self->_motionEffectsController, "updateCurrentOffset:", a3.dx, a3.dy);
}

- (unint64_t)_calculateDirectionalHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = 8;
  v5 = 4;
  if (a3.dx > -1.0)
    v5 = 0;
  if (a3.dx < 1.0)
    v4 = v5;
  v6 = 2;
  if (a3.dy < 1.0)
    v6 = a3.dy <= -1.0;
  if (fabs(a3.dy) >= fabs(a3.dx))
    return v6;
  else
    return v4;
}

- (BOOL)_attemptPanFocusMovementWithHeading:(unint64_t)a3 acceleratedVelocity:(CGPoint)a4 focusSystem:(id)a5 studyLogData:(id)a6
{
  double y;
  double x;
  id v10;
  BOOL v11;
  char v12;
  void *v13;
  void *v14;
  _BOOL4 v15;

  y = a4.y;
  x = a4.x;
  v10 = a5;
  v11 = -[_UIFocusEventRecognizer _shouldPerformFocusUpdateWithCurrentMomentumStatus](self, "_shouldPerformFocusUpdateWithCurrentMomentumStatus");
  if (!a3)
    goto LABEL_8;
  v12 = !v11;
  if (!v10)
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    -[_UIFocusEventRecognizer _stopMomentumAndPerformRollback](self, "_stopMomentumAndPerformRollback");
LABEL_8:
    LOBYTE(v15) = 0;
    goto LABEL_11;
  }
  -[_UIFocusEventRecognizer _createPanMovementRequestWithFocusSystem:](self, "_createPanMovementRequestWithFocusSystem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _createMovementInfoForHeading:groupFilter:acceleratedVelocity:](self, "_createMovementInfoForHeading:groupFilter:acceleratedVelocity:", a3, 0, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMovementInfo:", v14);

  v15 = -[_UIFocusEventRecognizer _attemptToRecognizeContinuousMovementRequest:](self, "_attemptToRecognizeContinuousMovementRequest:", v13);
  if (v15)
    -[_UIFocusEventRecognizer _continuousMovementSucceededWithDirectionalHeading:](self, "_continuousMovementSucceededWithDirectionalHeading:", a3);
  else
    -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", a3);

LABEL_11:
  return v15;
}

- (id)_createMovementInfoForHeading:(unint64_t)a3 groupFilter:(int64_t)a4 acceleratedVelocity:(CGPoint)a5
{
  return -[_UIFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", a3, *(_WORD *)&self->_flags & 1, (a3 & 0x330) == 0, a4, self->_inputType, a5.x, a5.y);
}

- (BOOL)_attemptToRecognizeContinuousMovementRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t failedContinuousMovementHeading;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "movementInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "heading");
  failedContinuousMovementHeading = self->_failedContinuousMovementHeading;

  v8 = (v6 != failedContinuousMovementHeading
     || -[_UIFocusEventRecognizer _hasFailedMovementHeadingExpired](self, "_hasFailedMovementHeadingExpired"))
    && -[_UIFocusEventRecognizer _didRecognizeFocusMovementRequest:](self, "_didRecognizeFocusMovementRequest:", v4);

  return v8;
}

- (void)_continuousMovementSucceededWithDirectionalHeading:(unint64_t)a3
{
  _UIFocusEffectsController *motionEffectsController;
  double dx;
  double dy;
  void *v7;

  -[_UIFocusEventRecognizer _resetProgressAccumulatorWithHeading:](self, "_resetProgressAccumulatorWithHeading:", a3);
  -[_UIFocusEffectsController adjustDisplayOffsetAccumulationFactorForFocusTransfer](self->_motionEffectsController, "adjustDisplayOffsetAccumulationFactorForFocusTransfer");
  motionEffectsController = self->_motionEffectsController;
  dx = self->_progressAccumulator.dx;
  dy = self->_progressAccumulator.dy;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEffectsController updateCurrentOffset:overrideDisplayOffset:](motionEffectsController, "updateCurrentOffset:overrideDisplayOffset:", v7, dx, dy);

  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | (self->_inputType == 7);
  ++self->_focusUpdateCountSinceLastContinuousMovementBegan;
}

- (void)_continuousMovementFailedWithPrimaryHeading:(unint64_t)a3
{
  __asm
  {
    FMOV            V1.2D, #1.0
    FMOV            V2.2D, #-1.0
  }
  self->_progressAccumulator = (CGVector)vmaxnmq_f64(vminnmq_f64((float64x2_t)self->_progressAccumulator, _Q1), _Q2);
  self->_unlockedAccumulator = (CGVector)vmaxnmq_f64(vminnmq_f64((float64x2_t)self->_unlockedAccumulator, _Q1), _Q2);
  -[_UIFocusEventRecognizer _resetCachedFocusItemInfo](self, "_resetCachedFocusItemInfo");
  -[_UIFocusEventRecognizer _updateFailedContinuousMovementHeading:](self, "_updateFailedContinuousMovementHeading:", a3);
}

- (void)_updateFailedContinuousMovementHeading:(unint64_t)a3
{
  CFTimeInterval v5;

  if (self->_failedContinuousMovementHeading != a3
    || -[_UIFocusEventRecognizer _hasFailedMovementHeadingExpired](self, "_hasFailedMovementHeadingExpired"))
  {
    self->_failedContinuousMovementHeading = a3;
    -[_UIFocusRotaryIndicatorView updateFailedMovementHeading:](self->_rotaryIndicatorView, "updateFailedMovementHeading:", a3);
    if (self->_failedContinuousMovementHeading)
      v5 = CACurrentMediaTime();
    else
      v5 = 0.0;
    self->_failedContinuousMovementTime = v5;
  }
}

- (BOOL)_hasFailedMovementHeadingExpired
{
  double v2;
  int v3;
  double v4;

  v2 = CACurrentMediaTime() - self->_failedContinuousMovementTime;
  v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusFailedMovementHeadingTimeout, (uint64_t)CFSTR("FocusFailedMovementHeadingTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v4 = *(double *)&qword_1ECD76300;
  if (v3)
    v4 = 0.5;
  return v2 > v4;
}

- (void)_cleanupPanMomentumWithAccumulator:(CGVector)a3 movementSuccess:(BOOL)a4
{
  double v5;

  if (!a4)
  {
    v5 = hypot(a3.dx, a3.dy);
    if ((*(_WORD *)&self->_flags & 2) != 0 && v5 > 2.0)
      -[_UIFocusEventRecognizer _stopMomentumAndPerformRollback](self, "_stopMomentumAndPerformRollback");
  }
}

- (void)_panGestureEnd:(id)a3
{
  *(_WORD *)&self->_flags &= ~0x80u;
  -[_UIFocusEventRecognizer _continueTouchWithMomentum](self, "_continueTouchWithMomentum", a3);
  -[_UIFocusEventRecognizer _resetContinuousMovementState](self, "_resetContinuousMovementState");
}

- (void)_panGestureCancelled:(id)a3
{
  -[_UIFocusEventRecognizer _resetContinuousMovementState](self, "_resetContinuousMovementState", a3);
  -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
}

- (void)_resetProgressAccumulatorWithHeading:(unint64_t)a3
{
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_remoteTouchSurfaceType") == 2;

  if ((a3 & 0xC) != 0)
  {
    if ((a3 & 3) != 0)
      return;
    v7 = 184;
    v8 = 168;
    v9 = 8;
  }
  else
  {
    if ((a3 & 3) == 0)
      return;
    v7 = 192;
    v8 = 176;
    v9 = 2;
  }
  v10 = dbl_18667C8F0[v6];
  v11 = 2.0 - v10;
  v12 = v10 + -2.0;
  if ((v9 & a3) != 0)
    v12 = v11;
  *(double *)((char *)&self->super.isa + v8) = *(double *)((char *)&self->super.isa + v8) - v12;
  *(double *)((char *)&self->super.isa + v7) = *(double *)((char *)&self->super.isa + v7) - v12;
}

- (void)_resetContinuousMovementState
{
  *(_WORD *)&self->_flags &= ~0x40u;
  self->_inputType = 0;
}

- (void)_resetFailedMovementHeading
{
  -[_UIFocusEventRecognizer _updateFailedContinuousMovementHeading:](self, "_updateFailedContinuousMovementHeading:", 0);
}

- (void)_joystickGestureBegan:(id)a3
{
  NSTimer *joystickModeExitTimer;
  NSTimer *v5;
  id WeakRetained;
  void *v7;
  CADisplayLink *v8;
  CADisplayLink *joystickFocusDirectionDisplayLink;
  CADisplayLink *v10;
  NSTimer *v11;

  self->_inputType = 3;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFA | 1;
  joystickModeExitTimer = self->_joystickModeExitTimer;
  if (joystickModeExitTimer)
  {
    -[NSTimer invalidate](joystickModeExitTimer, "invalidate", a3);
    v5 = self->_joystickModeExitTimer;
    self->_joystickModeExitTimer = 0;
  }
  else
  {
    -[_UIFocusEffectsController cancelRollbackAnimation](self->_motionEffectsController, "cancelRollbackAnimation", a3);
    -[_UIFocusEventRecognizer _resetMomentum](self, "_resetMomentum");
    -[_UIFocusEventRecognizer _sendGestureBeginNotification](self, "_sendGestureBeginNotification");
    -[CADisplayLink invalidate](self->_joystickFocusDirectionDisplayLink, "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(WeakRetained, "_screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayLinkWithTarget:selector:", self, sel__joystickDisplayLinkHeartbeat_);
    v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
    self->_joystickFocusDirectionDisplayLink = v8;

    v10 = self->_joystickFocusDirectionDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);
    v5 = v11;
  }

}

- (void)_joystickGestureUpdated:(id)a3
{
  if ((*(_WORD *)&self->_flags & 8) != 0)
    -[_UIFocusEventRecognizer _handleJoystickRepeatMode:](self, "_handleJoystickRepeatMode:", a3);
  else
    -[_UIFocusEventRecognizer _handleJoystickTiltMode:](self, "_handleJoystickTiltMode:", a3);
}

- (void)_joystickGestureEnded:(id)a3
{
  NSTimer *v4;
  NSTimer *joystickModeExitTimer;
  NSTimer *joystickModeRepeatTimer;

  -[NSTimer invalidate](self->_joystickModeExitTimer, "invalidate", a3);
  _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_JoystickModeExitInterval, (uint64_t)CFSTR("JoystickModeExitInterval"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__exitJoystickModeForReal_);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = v4;

  -[NSTimer invalidate](self->_joystickModeRepeatTimer, "invalidate");
  joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;

}

- (void)_exitJoystickModeForReal:(id)a3
{
  NSTimer *joystickModeExitTimer;

  self->_inputType = 0;
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = 0;

  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF3 | 4;
  self->_joystickRepeatCount = 0;
}

- (void)_handleJoystickRepeatMode:(id)a3
{
  id v4;
  double v5;
  long double v6;
  double v7;
  long double v8;
  double v9;
  void *v10;
  void *v11;
  NSTimer *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _UIFocusMovementRequest *v17;
  _BOOL4 v18;
  unint64_t v19;
  NSObject *v20;
  NSTimer *v21;
  NSTimer *joystickModeRepeatTimer;
  uint8_t v23[16];

  v4 = a3;
  *(_WORD *)&self->_flags &= ~0x10u;
  objc_msgSend(v4, "stickPosition");
  v6 = v5;
  v8 = v7;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD763F8, (uint64_t)CFSTR("JoystickTiltModeRadius"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 0.6;
  else
    v9 = *(double *)&qword_1ECD76400;
  -[_UIFocusEventRecognizer _retrieveCachedFocusItemInfo](self, "_retrieveCachedFocusItemInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEventRecognizer _focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:](self, "_focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:", objc_msgSend(v10, "inheritedFocusMovementStyle"), (double)v6, (double)v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIFocusEventRecognizer _joystickFocusMovement:shouldBeConsideredEqualToFocusMovement:](self, "_joystickFocusMovement:shouldBeConsideredEqualToFocusMovement:", v11, self->_previousJoystickFocusMovementInfo))
  {
    *(_WORD *)&self->_flags &= ~8u;
    self->_joystickRepeatCount = 0;
    -[_UIFocusEventRecognizer _handleJoystickTiltMode:](self, "_handleJoystickTiltMode:", v4);
    goto LABEL_19;
  }
  if (hypot(v6, v8) >= v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13 - self->_previousJoystickFocusMovementTime;
    -[_UIFocusEventRecognizer _joystickRepeatDurationForTimeInMovementZone:](self, "_joystickRepeatDurationForTimeInMovementZone:", v13 - self->_previousJoystickRegionEntryTime);
    if (v14 < v15)
    {
LABEL_18:
      -[NSTimer invalidate](self->_joystickModeRepeatTimer, "invalidate");
      _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__joystickPerformRepeat_);
      v21 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
      self->_joystickModeRepeatTimer = v21;

      goto LABEL_19;
    }
    -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v16);
      -[_UIFocusMovementRequest setMovementInfo:](v17, "setMovementInfo:", v11);
      v18 = -[_UIFocusEventRecognizer _joystickAttemptFocusMovementWithRequest:](self, "_joystickAttemptFocusMovementWithRequest:", v17);

      if (v18)
      {
        ++self->_joystickRepeatCount;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v19 = _handleJoystickRepeatMode____s_category;
      if (!_handleJoystickRepeatMode____s_category)
      {
        v19 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&_handleJoystickRepeatMode____s_category);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring joystick movement request.", v23, 2u);
      }
    }
    -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", objc_msgSend(v11, "heading"));
    goto LABEL_17;
  }
  *(_WORD *)&self->_flags &= ~8u;
  -[NSTimer invalidate](self->_joystickModeRepeatTimer, "invalidate");
  v12 = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;

  self->_joystickRepeatCount = 0;
LABEL_19:

}

- (void)_handleJoystickTiltMode:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  _UIFocusMovementInfo *v19;
  _UIFocusMovementInfo *v20;
  _UIFocusMovementInfo *previousJoystickFocusMovementInfo;
  double v24;
  NSTimer *joystickModeRepeatTimer;
  void *v26;
  _UIFocusMovementRequest *v27;
  _BOOL4 v28;
  NSTimer *v29;
  NSTimer *v30;
  unint64_t v31;
  NSObject *v32;
  uint8_t v33[16];

  v4 = a3;
  objc_msgSend(v4, "stickPosition");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "previousStickPosition");
  v10 = v9;
  v12 = v11;

  -[_UIFocusEventRecognizer _retrieveCachedFocusItemInfo](self, "_retrieveCachedFocusItemInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "inheritedFocusMovementStyle");
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD763F8, (uint64_t)CFSTR("JoystickTiltModeRadius"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v15 = 0.6;
  else
    v15 = *(double *)&qword_1ECD76400;
  -[_UIFocusEventRecognizer _focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:](self, "_focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:", v14, v6, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = -[_UIFocusEventRecognizer _headingForJoystickPosition:usingMinimumRadius:](self, "_headingForJoystickPosition:usingMinimumRadius:", v10, v12, v15);
    v18 = objc_msgSend(v16, "heading");
    v19 = self->_previousJoystickFocusMovementInfo;
    v20 = v19;
    if (v18 == v17 || v19 == 0)
    {
      if (v18 == v17)
        goto LABEL_24;
    }
    else if (-[_UIFocusEventRecognizer _joystickFocusMovement:shouldBeConsideredEqualToFocusMovement:](self, "_joystickFocusMovement:shouldBeConsideredEqualToFocusMovement:", v16, v19))
    {
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_previousJoystickRegionEntryTime = v24;
    self->_joystickRepeatingHeading = objc_msgSend(v16, "heading");
    -[NSTimer invalidate](self->_joystickModeRepeatTimer, "invalidate");
    joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
    self->_joystickModeRepeatTimer = 0;

    -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v26);
      -[_UIFocusMovementRequest setMovementInfo:](v27, "setMovementInfo:", v16);
      v28 = -[_UIFocusEventRecognizer _joystickAttemptFocusMovementWithRequest:](self, "_joystickAttemptFocusMovementWithRequest:", v27);

      if (v28)
      {
        objc_storeStrong((id *)&self->_previousJoystickFocusMovementInfo, v16);
        _UIInternalPreferenceUsesDefault((int *)&unk_1ECD763D8, (uint64_t)CFSTR("JoystickRepeatStartTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__joystickPerformRepeat_);
        v29 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        v30 = self->_joystickModeRepeatTimer;
        self->_joystickModeRepeatTimer = v29;

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      v31 = _handleJoystickTiltMode____s_category;
      if (!_handleJoystickTiltMode____s_category)
      {
        v31 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v31, (unint64_t *)&_handleJoystickTiltMode____s_category);
      }
      v32 = *(NSObject **)(v31 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring joystick movement request.", v33, 2u);
      }
    }
    -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", objc_msgSend(v16, "heading"));
    goto LABEL_23;
  }
  previousJoystickFocusMovementInfo = self->_previousJoystickFocusMovementInfo;
  if (previousJoystickFocusMovementInfo)
  {
    self->_previousJoystickFocusMovementInfo = 0;

  }
LABEL_25:

}

- (BOOL)_joystickAttemptFocusMovementWithRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "movementInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "heading");

  if (v6
    && -[_UIFocusEventRecognizer _attemptToRecognizeContinuousMovementRequest:](self, "_attemptToRecognizeContinuousMovementRequest:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_previousJoystickFocusMovementTime = v7;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_joystickPerformRepeat:(id)a3
{
  *(_WORD *)&self->_flags |= 0x18u;
}

- (double)_joystickRepeatDurationForTimeInMovementZone:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  void *v11;
  float v12;

  if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76428, (uint64_t)CFSTR("JoystickAccelerationBaseline"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v4 = 0.1;
  else
    v4 = *(double *)&qword_1ECD76430;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76438, (uint64_t)CFSTR("JoystickAccelerationMinimum"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v5 = 0.05;
  else
    v5 = *(double *)&qword_1ECD76440;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76408, (uint64_t)CFSTR("JoystickAccelerationBreakpointA"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v6 = 0.75;
  else
    v6 = *(double *)&qword_1ECD76410;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76418, (uint64_t)CFSTR("JoystickAccelerationBreakpointB"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v7 = 2.0;
  else
    v7 = *(double *)&qword_1ECD76420;
  if (v6 > a3 || v7 <= a3)
  {
    if (v7 <= a3)
      return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    LODWORD(v10) = 0;
    if (v6 <= a3)
    {
      LODWORD(v10) = 1.0;
      if (v7 >= a3)
      {
        v10 = (a3 - v6) / (v7 - v6) + 0.0;
        *(float *)&v10 = v10;
      }
    }
    objc_msgSend(v9, "_solveForInput:", v10);
    if (v12 >= 0.0)
    {
      if (v12 <= 1.0)
        v4 = v4 + (v5 - v4) * v12;
      else
        v4 = v5;
    }

  }
  return v4;
}

- (BOOL)_joystickFocusMovement:(id)a3 shouldBeConsideredEqualToFocusMovement:(id)a4
{
  BOOL result;
  id v6;
  id v7;
  double v8;
  long double v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  long double v16;
  double v17;
  double v18;

  result = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "_velocity");
    v9 = v8;
    objc_msgSend(v7, "_velocity");
    v11 = v10;

    v12 = atan2(v9, v11);
    objc_msgSend(v6, "_velocity");
    v14 = v13;
    objc_msgSend(v6, "_velocity");
    v16 = v15;

    v17 = atan2(v14, v16) - v12;
    if (v17 <= 3.14159265)
    {
      if (v17 >= -3.14159265)
        return fabs(v17) <= 0.523598776;
      v18 = 6.28318531;
    }
    else
    {
      v18 = -6.28318531;
    }
    v17 = v17 + v18;
    return fabs(v17) <= 0.523598776;
  }
  return result;
}

- (id)_focusMovementForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4 focusMovementStyle:(int64_t)a5
{
  double y;
  CGFloat x;
  long double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  _UIFocusMovementInfo *v16;

  y = a3.y;
  x = a3.x;
  if (hypot(a3.x, a3.y) <= a4)
  {
    v16 = 0;
  }
  else
  {
    if (a5 == 2
      && (v10 = hypot(x, -y),
          v11 = x / v10 * 2500.0,
          v12 = -y / v10 * 2500.0,
          fabs(atan2(fabs(v12), fabs(v11)) + -0.785398163) <= 0.6981))
    {
      v13 = 0;
    }
    else
    {
      v13 = -[_UIFocusEventRecognizer _headingForJoystickPosition:usingMinimumRadius:](self, "_headingForJoystickPosition:usingMinimumRadius:", x, y, a4);
      -[_UIFocusEventRecognizer _joystickVelocityForHeading:](self, "_joystickVelocityForHeading:", v13);
      v11 = v14;
      v12 = v15;
    }
    v16 = -[_UIFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", v13, *(_WORD *)&self->_flags & 1, 1, 0, self->_inputType, v11, v12);
  }
  return v16;
}

- (CGVector)_joystickVelocityForHeading:(unint64_t)a3
{
  unint64_t v3;
  double v4;
  double v5;
  CGVector result;

  v3 = a3 - 1;
  v4 = 0.0;
  v5 = 0.0;
  if (a3 - 1 <= 7)
  {
    v4 = dbl_18667C868[v3];
    v5 = dbl_18667C8A8[v3];
  }
  result.dy = v4;
  result.dx = v5;
  return result;
}

- (unint64_t)_headingForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4
{
  double y;
  double x;
  double v6;
  BOOL v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;
  unint64_t v11;

  y = a3.y;
  x = a3.x;
  if (hypot(a3.x, a3.y) <= a4)
    return 0;
  v6 = -x;
  v7 = y >= x && y >= -x;
  if (v7)
    return 1;
  v8 = y >= -x;
  if (y >= x)
    v8 = 0;
  if (v8)
    return 8;
  v9 = y >= x;
  if (y >= v6)
    v9 = 1;
  v10 = y < x || !v9;
  if (y >= v6)
    v10 = 1;
  v7 = !v9;
  v11 = 2;
  if (!v7)
    v11 = 0;
  if (v10)
    return v11;
  else
    return 4;
}

- (void)_joystickDisplayLinkHeartbeat:(id)a3
{
  double v4;
  double v5;
  CADisplayLink *joystickFocusDirectionDisplayLink;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  -[_UIFocusEffectsController currentOffset](self->_motionEffectsController, "currentOffset", a3);
  if (fabs(v4) < 0.05)
  {
    -[_UIFocusEffectsController currentOffset](self->_motionEffectsController, "currentOffset");
    if (fabs(v5) < 0.05 && (*(_WORD *)&self->_flags & 4) != 0)
    {
      -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
      -[CADisplayLink invalidate](self->_joystickFocusDirectionDisplayLink, "invalidate");
      joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
      self->_joystickFocusDirectionDisplayLink = 0;

    }
  }
  -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    -[_UIFocusEventRecognizer _handleJoystickRepeatMode:](self, "_handleJoystickRepeatMode:", v7);
    v7 = v19;
  }
  objc_msgSend(v7, "stickPosition");
  v9 = v8;
  v11 = v10;
  v12 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD763F8, (uint64_t)CFSTR("JoystickTiltModeRadius"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v13 = *(double *)&qword_1ECD76400;
  if (v12)
    v13 = 0.6;
  v14 = -1.0;
  v15 = -1.0;
  if (v9 >= -v13)
  {
    v15 = 1.0;
    if (v9 <= v13)
      v15 = (v9 + v13) / (v13 + v13) + (v9 + v13) / (v13 + v13) + -1.0;
  }
  if (v11 <= v13)
  {
    v14 = 1.0;
    if (v13 >= -v11)
      v14 = (v13 - v11) / (v13 + v13) + (v13 - v11) / (v13 + v13) + -1.0;
  }
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD763E8, (uint64_t)CFSTR("JoystickLerp"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v16 = 0.2;
  else
    v16 = *(double *)&qword_1ECD763F0;
  -[_UIFocusEffectsController currentOffset](self->_motionEffectsController, "currentOffset");
  -[_UIFocusEffectsController updateCurrentOffset:](self->_motionEffectsController, "updateCurrentOffset:", v15 * v16 + (1.0 - v16) * v17, v14 * v16 + (1.0 - v16) * v18);

}

- (void)_resetJoystick
{
  CADisplayLink *joystickFocusDirectionDisplayLink;
  NSTimer *joystickModeRepeatTimer;
  NSTimer *joystickModeExitTimer;

  self->_inputType = 0;
  *(_WORD *)&self->_flags &= ~4u;
  -[CADisplayLink invalidate](self->_joystickFocusDirectionDisplayLink, "invalidate");
  joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
  self->_joystickFocusDirectionDisplayLink = 0;

  -[NSTimer invalidate](self->_joystickModeRepeatTimer, "invalidate");
  joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;

  -[NSTimer invalidate](self->_joystickModeExitTimer, "invalidate");
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = 0;

  self->_joystickRepeatCount = 0;
}

- (void)_resetMotionEffects
{
  -[_UIFocusEffectsController reset](self->_motionEffectsController, "reset");
}

- (CGSize)_momentumReferenceSize
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  __int16 v13[8];
  uint8_t buf[16];
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Unable to get screen from owning view for focus momentum calculations.", buf, 2u);
      }

    }
    else
    {
      v4 = _momentumReferenceSize___s_category;
      if (!_momentumReferenceSize___s_category)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_momentumReferenceSize___s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unable to get screen from owning view for focus momentum calculations.", (uint8_t *)v13, 2u);
      }
    }
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_resetMomentum
{
  CGPoint v3;
  CGPoint touchBeganPoint;
  CADisplayLink *momentumDisplayLink;

  v3 = (CGPoint)*MEMORY[0x1E0C9D538];
  touchBeganPoint = self->_touchBeganPoint;
  self->_firstMomentumTouchPoint = touchBeganPoint;
  self->_lastMomentumTouchPoint = touchBeganPoint;
  self->_momentumVelocity = v3;
  -[CADisplayLink invalidate](self->_momentumDisplayLink, "invalidate");
  momentumDisplayLink = self->_momentumDisplayLink;
  self->_momentumDisplayLink = 0;

  *(_WORD *)&self->_flags &= ~2u;
}

- (void)_recordMomentumForPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  id WeakRetained;

  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    y = a4.y;
    x = a4.x;
    self->_lastMomentumTouchPoint = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    -[_UIFocusEventRecognizer _momentumReferenceSize](self, "_momentumReferenceSize");
    self->_momentumVelocity.x = x / v7;
    self->_momentumVelocity.y = y / v8;

  }
}

- (void)_continueTouchWithMomentum
{
  unint64_t focusUpdateCountSinceLastContinuousMovementBegan;
  double v4;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _UIFocusMovementRequest *v9;
  void *v10;
  uint64_t v11;
  float64x2_t v12;
  double x;
  double y;
  double v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  focusUpdateCountSinceLastContinuousMovementBegan = self->_focusUpdateCountSinceLastContinuousMovementBegan;
  if (focusUpdateCountSinceLastContinuousMovementBegan > 1)
    goto LABEL_11;
  v4 = hypot(self->_momentumVelocity.x, self->_momentumVelocity.y);
  if (fabs(self->_progressAccumulator.dx) >= 1.0 || v4 < 0.5)
    goto LABEL_11;
  if (focusUpdateCountSinceLastContinuousMovementBegan)
  {
    -[_UIFocusEventRecognizer _sendMomentumEndNotificationsAndAnimateRollback:](self, "_sendMomentumEndNotificationsAndAnimateRollback:", 1);
    return;
  }
  v6 = -[_UIFocusEventRecognizer _momentumFocusHeadingForAccumulator:](self, "_momentumFocusHeadingForAccumulator:");
  if (!v6)
  {
LABEL_11:
    v12 = vabdq_f64((float64x2_t)self->_lastKnownTouchPoint, *((float64x2_t *)&self->_lastKnownTouchPoint + self->_numFrames));
    if ((vmovn_s64(vcgtq_f64(v12, (float64x2_t)vdupq_laneq_s64((int64x2_t)v12, 1))).u8[0] & 1) != 0)
    {
      x = self->_momentumVelocity.x;
      y = 0.0;
    }
    else
    {
      y = self->_momentumVelocity.y;
      x = 0.0;
    }
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76358, (uint64_t)CFSTR("FocusMomentumFriction"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v15 = 0.99;
    else
      v15 = *(double *)&qword_1ECD76360;
    -[_UIFocusEventRecognizer _beginMomentumImmediatelyWithVelocity:friction:](self, "_beginMomentumImmediatelyWithVelocity:friction:", x, y, v15);
  }
  else
  {
    v7 = v6;
    -[_UIFocusEventRecognizer _focusMovementSystem](self, "_focusMovementSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v8);
      +[_UIFocusMovementInfo _movementWithHeading:isInitial:](_UIFocusMovementInfo, "_movementWithHeading:isInitial:", v7, *(_WORD *)&self->_flags & 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMovementRequest setMovementInfo:](v9, "setMovementInfo:", v10);

      LODWORD(v10) = -[_UIFocusEventRecognizer _attemptToRecognizeContinuousMovementRequest:](self, "_attemptToRecognizeContinuousMovementRequest:", v9);
      v11 = v10 ^ 1;
    }
    else
    {
      v16 = _continueTouchWithMomentum___s_category;
      if (!_continueTouchWithMomentum___s_category)
      {
        v16 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_continueTouchWithMomentum___s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", v18, 2u);
      }
      v11 = 1;
    }
    -[_UIFocusEventRecognizer _sendMomentumEndNotificationsAndAnimateRollback:](self, "_sendMomentumEndNotificationsAndAnimateRollback:", v11);

  }
}

- (void)_beginMomentumImmediatelyWithVelocity:(CGPoint)a3 friction:(double)a4
{
  CADisplayLink *momentumDisplayLink;
  CADisplayLink *v6;
  id WeakRetained;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  CADisplayLink *v11;
  id v12;

  self->_momentumVelocity = a3;
  self->_momentumFriction = a4;
  *(_WORD *)&self->_flags |= 2u;
  momentumDisplayLink = self->_momentumDisplayLink;
  if (momentumDisplayLink)
  {
    -[CADisplayLink invalidate](momentumDisplayLink, "invalidate");
    v6 = self->_momentumDisplayLink;
    self->_momentumDisplayLink = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__momentumHeartbeat_);
  v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  v10 = self->_momentumDisplayLink;
  self->_momentumDisplayLink = v9;

  v11 = self->_momentumDisplayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

}

- (unint64_t)_momentumFocusHeadingForAccumulator:(CGVector)a3
{
  unint64_t v5;

  if (a3.dx > -0.5 && a3.dx < 0.5)
  {
    v5 = 2;
    if (a3.dy <= 0.0)
      v5 = 1;
    if (a3.dy > -0.5 && a3.dy < 0.5)
      return 0;
    else
      return v5;
  }
  else if (a3.dx <= 0.0)
  {
    return 4;
  }
  else
  {
    return 8;
  }
}

- (void)_momentumHeartbeat:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  int v26;
  double v27;
  double v28;
  int v29;
  double v30;
  CADisplayLink *momentumDisplayLink;
  id v32;

  v32 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "_screen");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_13;
  }
  v6 = (void *)v5;
  v7 = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_13:
    -[CADisplayLink invalidate](self->_momentumDisplayLink, "invalidate");
    momentumDisplayLink = self->_momentumDisplayLink;
    self->_momentumDisplayLink = 0;

    goto LABEL_14;
  }
  x = self->_lastMomentumTouchPoint.x;
  y = self->_lastMomentumTouchPoint.y;
  objc_msgSend(v32, "duration");
  v13 = v12;
  v15 = self->_momentumVelocity.x;
  v14 = self->_momentumVelocity.y;
  if (self->_inputType != 7)
  {
    v16 = pow(self->_momentumFriction, v12 * 1000.0);
    v15 = v15 * v16;
    v14 = v14 * v16;
  }
  v17 = x + v13 * v15;
  v18 = y + v13 * v14;
  -[_UIFocusEventRecognizer _momentumReferenceSize](self, "_momentumReferenceSize");
  v20 = v15 * v19;
  v22 = v14 * v21;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "_remoteTouchSurfaceType");

  -[_UIFocusEventRecognizer _updatePanLocation:reportedVelocity:remoteTouchSurfaceType:](self, "_updatePanLocation:reportedVelocity:remoteTouchSurfaceType:", v24, v17, v18, v20, v22);
  self->_lastMomentumTouchPoint.x = v17;
  self->_lastMomentumTouchPoint.y = v18;
  v25 = fabs(v15);
  self->_momentumVelocity.x = v15;
  self->_momentumVelocity.y = v14;
  v26 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoff, (uint64_t)CFSTR("FocusMomentumCutoff"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v27 = *(double *)&qword_1EDDA8018;
  if (v26)
    v27 = 1.0;
  if (v25 < v27)
  {
    v28 = fabs(v14);
    v29 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoff, (uint64_t)CFSTR("FocusMomentumCutoff"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v30 = *(double *)&qword_1EDDA8018;
    if (v29)
      v30 = 1.0;
    if (v28 < v30)
      -[_UIFocusEventRecognizer _stopMomentumAndPerformRollback](self, "_stopMomentumAndPerformRollback");
  }
LABEL_14:

}

- (BOOL)_shouldPerformFocusUpdateWithCurrentMomentumStatus
{
  int v3;
  double v4;

  v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoffStraggler, (uint64_t)CFSTR("FocusMomentumCutoffStraggler"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v4 = *(double *)&qword_1EDDA8028;
  if (v3)
    v4 = 1.0;
  return (*(_WORD *)&self->_flags & 2) == 0
      || fabs(self->_momentumVelocity.x) > v4
      || fabs(self->_momentumVelocity.y) > v4;
}

- (void)_stopMomentumAndPerformRollback
{
  CADisplayLink *momentumDisplayLink;

  -[CADisplayLink invalidate](self->_momentumDisplayLink, "invalidate");
  momentumDisplayLink = self->_momentumDisplayLink;
  self->_momentumDisplayLink = 0;

  -[_UIFocusEventRecognizer _sendMomentumEndNotificationsAndAnimateRollback:](self, "_sendMomentumEndNotificationsAndAnimateRollback:", 1);
}

- (void)_sendMomentumEndNotificationsAndAnimateRollback:(BOOL)a3
{
  if (a3)
  {
    -[_UIFocusEffectsController startRollbackAnimation](self->_motionEffectsController, "startRollbackAnimation");
    -[_UIFocusEffectsController resetDisplayOffsetAccumulationFactor](self->_motionEffectsController, "resetDisplayOffsetAccumulationFactor");
  }
  *(_WORD *)&self->_flags &= ~2u;
}

+ (BOOL)_canSupportFastScrolling
{
  return (byte_1EDDA7FF4 != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusFastScrollingEnabled, (uint64_t)CFSTR("FocusFastScrollingEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (void)_sendGestureBeginNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIFocusEngineGestureDidBeginNotification"), self, 0);

}

- (void)_uiktest_setPanGestureRecognizer:(id)a3
{
  -[_UIFocusEventRecognizer setGesture:forName:](self, "setGesture:forName:", a3, 1);
}

- (id)_uiktest_panGestureRecognizer
{
  return -[_UIFocusEventRecognizer gestureForName:](self, "gestureForName:", 1);
}

- (UIView)owningView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (_UIFocusEventRecognizerDelegate)delegate
{
  return (_UIFocusEventRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIMoveEvent)_moveEvent
{
  return self->_moveEvent;
}

- (void)_setMoveEvent:(id)a3
{
  objc_storeStrong((id *)&self->_moveEvent, a3);
}

- (_UIFocusEffectsController)_motionEffectsController
{
  return self->_motionEffectsController;
}

- (_UIFocusFastScrollingRecognizer)_fastScrollingRecognizer
{
  return self->_fastScrollingRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastScrollingRecognizer, 0);
  objc_storeStrong((id *)&self->_motionEffectsController, 0);
  objc_storeStrong((id *)&self->_moveEvent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_destroyWeak((id *)&self->_owningView);
  objc_storeStrong((id *)&self->_currentCarTouchpad, 0);
  objc_storeStrong((id *)&self->_cachedFocusItemInfo, 0);
  objc_storeStrong((id *)&self->_lastScrolledScroll, 0);
  objc_storeStrong((id *)&self->_previousJoystickFocusMovementInfo, 0);
  objc_storeStrong((id *)&self->_joystickFocusDirectionDisplayLink, 0);
  objc_storeStrong((id *)&self->_joystickModeRepeatTimer, 0);
  objc_storeStrong((id *)&self->_joystickModeExitTimer, 0);
  objc_storeStrong((id *)&self->_momentumDisplayLink, 0);
  objc_storeStrong((id *)&self->_linearDebugView, 0);
  objc_storeStrong((id *)&self->_showRotaryIndicatorAfterDelayTimer, 0);
  objc_storeStrong((id *)&self->_rotaryIndicatorView, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end

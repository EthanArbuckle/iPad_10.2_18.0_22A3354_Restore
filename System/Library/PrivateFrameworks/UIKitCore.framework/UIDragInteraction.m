@implementation UIDragInteraction

- (BOOL)dragDriverWantsExclusionOverride:(id)a3
{
  return (*((unsigned __int8 *)&self->_delegateImplements + 2) >> 6) & 1;
}

- (void)_setLiftDelay:(double)a3
{
  self->_liftDelay = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)willMoveToView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  UIDragInteraction *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_view);

    if (v7 != v4)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = self->_initiationDrivers;
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "setView:", 0, (_QWORD)v17);
          }
          while (v10 != v12);
          v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      v13 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v13, "removeGestureRecognizer:", self->_gestureRecognizerForAddingItems);

      v14 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v14, "_draggingSourceDelegate");
      v15 = (UIDragInteraction *)objc_claimAutoreleasedReturnValue();

      if (v15 == self)
      {
        v16 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v16, "_setDraggingSourceDelegate:", 0);

      }
    }
  }

}

- (void)_updateDriverParameters
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_initiationDrivers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        -[UIDragInteraction _liftDelay](self, "_liftDelay", (_QWORD)v18);
        v10 = v9;
        v11 = -[UIDragInteraction _additionalTouchesCancelLift](self, "_additionalTouchesCancelLift");
        -[UIDragInteraction _liftMoveHysteresis](self, "_liftMoveHysteresis");
        v13 = v12;
        if (-[UIDragInteraction _isPointerDriver:](self, "_isPointerDriver:", v8))
        {
          -[UIDragInteraction _pointerLiftDelay](self, "_pointerLiftDelay");
          v10 = v14;
          -[UIDragInteraction _pointerLiftMoveHysteresis](self, "_pointerLiftMoveHysteresis");
          v13 = v15;
          v16 = 0.0;
        }
        else
        {
          v16 = (double)v11;
        }
        objc_msgSend(v8, "setAutomaticallyAddsFailureRelationships:", -[UIDragInteraction _automaticallyAddsFailureRelationships](self, "_automaticallyAddsFailureRelationships"));
        objc_msgSend(v8, "setAllowsSimultaneousRecognitionDuringLift:", -[UIDragInteraction allowsSimultaneousRecognitionDuringLift](self, "allowsSimultaneousRecognitionDuringLift"));
        objc_msgSend(v8, "setAdditionalTouchesCancelLift:", v16 != 0.0);
        objc_msgSend(v8, "setLiftDelay:", v10);
        -[UIDragInteraction _competingLongPressDelay](self, "_competingLongPressDelay");
        objc_msgSend(v8, "setCompetingLongPressDelay:");
        objc_msgSend(v8, "setCancellationTimerEnabled:", -[UIDragInteraction _isCancellationTimerEnabled](self, "_isCancellationTimerEnabled"));
        -[UIDragInteraction _cancellationDelay](self, "_cancellationDelay");
        objc_msgSend(v8, "setCancellationDelay:");
        objc_msgSend(v8, "setLiftMoveHysteresis:", v13);
        objc_msgSend(v8, "setEnabled:", -[UIDragInteraction isEnabled](self, "isEnabled"));
        -[UIDragInteraction view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setView:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)isEnabled
{
  int v3;
  void *v4;

  if (self->_didSetEnabled)
  {
    LOBYTE(v3) = self->_enabled;
  }
  else
  {
    if ((objc_msgSend((id)objc_opt_class(), "isEnabledByDefault") & 1) != 0)
    {
      v3 = 1;
    }
    else if ((*((_BYTE *)&self->_delegateImplements + 2) & 2) != 0)
    {
      -[UIDragInteraction delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "_dragInteractionAllowsDragOverridingMasterSwitch:", self);

    }
    else
    {
      v3 = 0;
    }
    if (self->_enabled != v3)
    {
      self->_enabled = v3;
      -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
    }
  }
  return v3;
}

- (BOOL)allowsSimultaneousRecognitionDuringLift
{
  return self->_allowsSimultaneousRecognitionDuringLift;
}

- (double)_liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

- (double)_liftDelay
{
  return self->_liftDelay;
}

- (BOOL)_isPointerDriver:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "behavior");

  return v4;
}

- (BOOL)_isCancellationTimerEnabled
{
  return self->_cancellationTimerEnabled;
}

- (double)_competingLongPressDelay
{
  return self->_competingLongPressDelay;
}

- (double)_cancellationDelay
{
  return self->_cancellationDelay;
}

- (BOOL)_automaticallyAddsFailureRelationships
{
  return self->_automaticallyAddsFailureRelationships;
}

- (BOOL)_additionalTouchesCancelLift
{
  return self->_additionalTouchesCancelLift;
}

- (double)_pointerLiftMoveHysteresis
{
  return self->_pointerLiftMoveHysteresis;
}

- (double)_pointerLiftDelay
{
  return self->_pointerLiftDelay;
}

- (BOOL)dragDriver:(id)a3 shouldReceiveTouch:(id)a4
{
  UIDragInteractionDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if ((*((_BYTE *)&self->_delegateImplements + 4) & 8) != 0)
  {
    p_delegate = &self->_delegate;
    v7 = a4;
    v8 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    objc_msgSend(WeakRetained, "_dragInteraction:delayForLiftBeginningAtLocation:", self, v12, v14);
    -[UIDragInteraction _setLiftDelay:](self, "_setLiftDelay:");

  }
  return 1;
}

- (void)_setAllowsPointerDragBeforeLiftDelay:(BOOL)a3
{
  id v4;

  if (self->_allowsPointerDragBeforeLiftDelay != a3)
  {
    self->_allowsPointerDragBeforeLiftDelay = a3;
    -[UIDragInteraction _createDefaultInitiationDrivers](self, "_createDefaultInitiationDrivers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDragInteraction _setInitiationDrivers:](self, "_setInitiationDrivers:", v4);

  }
}

- (UIDragInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIDragInteraction *v5;
  uint64_t v6;
  UIDragInteractionEffect *interactionEffect;
  int v8;
  double v9;
  int v10;
  double v11;
  char v12;
  char v13;
  int v14;
  double v15;
  int v16;
  double v17;
  int v18;
  double v19;
  _UIDragAddItemsGesture *v20;
  _UIDragAddItemsGesture *gestureRecognizerForAddingItems;
  int v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  objc_super v94;

  v4 = delegate;
  v94.receiver = self;
  v94.super_class = (Class)UIDragInteraction;
  v5 = -[UIDragInteraction init](&v94, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    interactionEffect = v5->_interactionEffect;
    v5->_interactionEffect = (UIDragInteractionEffect *)v6;

    v5->_automaticallyAddsFailureRelationships = 1;
    v5->_additionalTouchesCancelLift = 0;
    v8 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD760E8, (uint64_t)CFSTR("DragInteractionDefaultLiftDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v9 = *(double *)&qword_1ECD760F0;
    if (v8)
      v9 = 0.325;
    v5->_liftDelay = v9;
    v5->_pointerLiftDelay = _UIDragInteractionDefaultPointerLiftDelay();
    v5->_allowsPointerDragBeforeLiftDelay = 1;
    v10 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76108, (uint64_t)CFSTR("DragInteractionDefaultCompetingLongPressDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v11 = *(double *)&qword_1ECD76110;
    if (v10)
      v11 = 1.0;
    v5->_competingLongPressDelay = v11;
    v12 = _UIInternalPreferenceUsesDefault(&_MergedGlobals_904, (uint64_t)CFSTR("DragInteractionCancellationTimerEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1ECD760D4)
      v13 = 1;
    else
      v13 = v12;
    v5->_cancellationTimerEnabled = v13;
    v14 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD760F8, (uint64_t)CFSTR("DragInteractionDefaultCancellationDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v15 = *(double *)&qword_1ECD76100;
    if (v14)
      v15 = 3.0;
    v5->_cancellationDelay = v15;
    v16 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76118, (uint64_t)CFSTR("DragInteractionDefaultLiftMoveHysteresis"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v17 = *(double *)&qword_1ECD76120;
    if (v16)
      v17 = 10.0;
    v5->_liftMoveHysteresis = v17;
    v18 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76148, (uint64_t)CFSTR("DragInteractionDefaultPointerLiftMoveHysteresis"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v19 = *(double *)&qword_1ECD76150;
    if (v18)
      v19 = 3.0;
    v5->_pointerLiftMoveHysteresis = v19;
    v20 = objc_alloc_init(_UIDragAddItemsGesture);
    -[UIGestureRecognizer setName:](v20, "setName:", CFSTR("com.apple.UIKit.dragAddingItems"));
    -[UIGestureRecognizer setDelegate:](v20, "setDelegate:", v5);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v20, "setDelaysTouchesBegan:", 1);
    gestureRecognizerForAddingItems = v5->_gestureRecognizerForAddingItems;
    v5->_gestureRecognizerForAddingItems = v20;

    v22 = _UIInternalPreferenceUsesDefault((int *)&algn_1ECD760D5[3], (uint64_t)CFSTR("DragInteractionAddItemsGestureConfiguration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    v23 = qword_1ECD760E0;
    if (v22)
      v23 = 0;
    if (v23 >= 4)
      v24 = 0;
    else
      v24 = v23;
    -[UIDragInteraction _setAddItemsGestureConfiguration:](v5, "_setAddItemsGestureConfiguration:", v24);
    objc_storeWeak((id *)&v5->_delegate, v4);
    v25 = v4;
    _UIValidateAccountBasedDelegateRespondsToSelector(v25, (uint64_t)sel__dragInteraction_dataOwnerForSession_);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      _UIValidateAccountBasedDelegateRespondsToSelector(v25, (uint64_t)sel__dragInteraction_dataOwnerForAddingToSession_withTouchAtPoint_);

    -[UIDragInteraction _createDefaultInitiationDrivers](v5, "_createDefaultInitiationDrivers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragInteraction _setInitiationDrivers:](v5, "_setInitiationDrivers:", v26);

    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFELL | objc_opt_respondsToSelector() & 1);
    v27 = objc_opt_respondsToSelector();
    v28 = 2;
    if ((v27 & 1) == 0)
      v28 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFDLL | v28);
    v29 = objc_opt_respondsToSelector();
    v30 = 4;
    if ((v29 & 1) == 0)
      v30 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFBLL | v30);
    v31 = objc_opt_respondsToSelector();
    v32 = 8;
    if ((v31 & 1) == 0)
      v32 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFF7 | v32);
    v33 = objc_opt_respondsToSelector();
    v34 = 16;
    if ((v33 & 1) == 0)
      v34 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFEFLL | v34);
    v35 = objc_opt_respondsToSelector();
    v36 = 32;
    if ((v35 & 1) == 0)
      v36 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFDFLL | v36);
    v37 = objc_opt_respondsToSelector();
    v38 = 64;
    if ((v37 & 1) == 0)
      v38 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFBFLL | v38);
    v39 = objc_opt_respondsToSelector();
    v40 = 128;
    if ((v39 & 1) == 0)
      v40 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFF7FLL | v40);
    v41 = objc_opt_respondsToSelector();
    v42 = 256;
    if ((v41 & 1) == 0)
      v42 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFEFFLL | v42);
    v43 = objc_opt_respondsToSelector();
    v44 = 512;
    if ((v43 & 1) == 0)
      v44 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFDFFLL | v44);
    v45 = objc_opt_respondsToSelector();
    v46 = 1024;
    if ((v45 & 1) == 0)
      v46 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFBFFLL | v46);
    v47 = objc_opt_respondsToSelector();
    v48 = 2048;
    if ((v47 & 1) == 0)
      v48 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFF7FFLL | v48);
    v49 = objc_opt_respondsToSelector();
    v50 = 4096;
    if ((v49 & 1) == 0)
      v50 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFEFFFLL | v50);
    v51 = objc_opt_respondsToSelector();
    v52 = 0x2000;
    if ((v51 & 1) == 0)
      v52 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFDFFFLL | v52);
    v53 = objc_opt_respondsToSelector();
    v54 = 0x4000;
    if ((v53 & 1) == 0)
      v54 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFFBFFFLL | v54);
    v55 = objc_opt_respondsToSelector();
    v56 = 0x8000;
    if ((v55 & 1) == 0)
      v56 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFF7FFFLL | v56);
    v57 = objc_opt_respondsToSelector();
    v58 = 0x10000;
    if ((v57 & 1) == 0)
      v58 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFEFFFFLL | v58);
    v59 = objc_opt_respondsToSelector();
    v60 = 0x20000;
    if ((v59 & 1) == 0)
      v60 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFDFFFFLL | v60);
    v61 = objc_opt_respondsToSelector();
    v62 = 0x40000;
    if ((v61 & 1) == 0)
      v62 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFFBFFFFLL | v62);
    v63 = objc_opt_respondsToSelector();
    v64 = 0x80000;
    if ((v63 & 1) == 0)
      v64 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFF7FFFFLL | v64);
    v65 = objc_opt_respondsToSelector();
    v66 = 0x100000;
    if ((v65 & 1) == 0)
      v66 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFEFFFFFLL | v66);
    v67 = objc_opt_respondsToSelector();
    v68 = 0x200000;
    if ((v67 & 1) == 0)
      v68 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFDFFFFFLL | v68);
    v69 = objc_opt_respondsToSelector();
    v70 = 0x400000;
    if ((v69 & 1) == 0)
      v70 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFFBFFFFFLL | v70);
    v71 = objc_opt_respondsToSelector();
    v72 = 0x800000;
    if ((v71 & 1) == 0)
      v72 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFF7FFFFFLL | v72);
    v73 = objc_opt_respondsToSelector();
    v74 = 0x1000000;
    if ((v73 & 1) == 0)
      v74 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFEFFFFFFLL | v74);
    v75 = objc_opt_respondsToSelector();
    v76 = 0x2000000;
    if ((v75 & 1) == 0)
      v76 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFDFFFFFFLL | v76);
    v77 = objc_opt_respondsToSelector();
    v78 = 0x4000000;
    if ((v77 & 1) == 0)
      v78 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFFBFFFFFFLL | v78);
    v79 = objc_opt_respondsToSelector();
    v80 = 0x8000000;
    if ((v79 & 1) == 0)
      v80 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFF7FFFFFFLL | v80);
    v81 = objc_opt_respondsToSelector();
    v82 = 0x10000000;
    if ((v81 & 1) == 0)
      v82 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFEFFFFFFFLL | v82);
    v83 = objc_opt_respondsToSelector();
    v84 = 0x20000000;
    if ((v83 & 1) == 0)
      v84 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFDFFFFFFFLL | v84);
    v85 = objc_opt_respondsToSelector();
    v86 = 0x40000000;
    if ((v85 & 1) == 0)
      v86 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFFBFFFFFFFLL | v86);
    v87 = objc_opt_respondsToSelector();
    v88 = 0x200000000;
    if ((v87 & 1) == 0)
      v88 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFDFFFFFFFFLL | v88);
    v89 = objc_opt_respondsToSelector();
    v90 = 0x400000000;
    if ((v89 & 1) == 0)
      v90 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFFBFFFFFFFFLL | v90);
    v91 = objc_opt_respondsToSelector();
    v92 = 0x800000000;
    if ((v91 & 1) == 0)
      v92 = 0;
    v5->_delegateImplements = ($7D05B4C22794768F32303D0F1F1D53E1)(*(_QWORD *)&v5->_delegateImplements & 0xFFFFFFF7FFFFFFFFLL | v92);
  }

  return v5;
}

- (void)_setInitiationDrivers:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSSet *initiationDrivers;
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
  v5 = self->_initiationDrivers;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "setView:", 0);
        objc_msgSend(v10, "setDelegate:", 0);
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  if (!v4 || !objc_msgSend(v4, "count"))
  {
    -[UIDragInteraction _createDefaultInitiationDrivers](self, "_createDefaultInitiationDrivers");
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v11;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (NSSet *)v4;
  v13 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "setDelegate:", self, (_QWORD)v18);
      }
      v14 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  initiationDrivers = self->_initiationDrivers;
  self->_initiationDrivers = v12;

  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (id)_createDefaultInitiationDrivers
{
  _UIDragInteractionDefaultDriverProvider *defaultDriverProvider;
  void *v4;
  void *v5;
  _UIDragInteractionDefaultDriverProvider *v6;
  _UIDragInteractionDefaultDriverProvider *v7;

  if (_createDefaultInitiationDrivers_onceToken != -1)
    dispatch_once(&_createDefaultInitiationDrivers_onceToken, &__block_literal_global_161);
  defaultDriverProvider = self->_defaultDriverProvider;
  if (!defaultDriverProvider)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualStyleClassForStylableClass:", objc_opt_class());

    v6 = (_UIDragInteractionDefaultDriverProvider *)objc_opt_new();
    v7 = self->_defaultDriverProvider;
    self->_defaultDriverProvider = v6;

    defaultDriverProvider = self->_defaultDriverProvider;
  }
  return (id)-[_UIDragInteractionDefaultDriverProvider createDefaultDriversForDragInteraction:](defaultDriverProvider, "createDefaultDriversForDragInteraction:", self);
}

- (BOOL)_allowsPointerDragBeforeLiftDelay
{
  return self->_allowsPointerDragBeforeLiftDelay;
}

- (void)_setAddItemsGestureConfiguration:(int64_t)a3
{
  uint64_t v4;

  self->_addItemsGestureConfiguration = a3;
  if ((unint64_t)a3 <= 3)
  {
    v4 = qword_18667ADF0[a3];
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_gestureRecognizerForAddingItems, "setNumberOfTapsRequired:", qword_18667ADD0[a3]);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_gestureRecognizerForAddingItems, "setNumberOfTouchesRequired:", v4);
  }
}

- (void)setEnabled:(BOOL)enabled
{
  self->_didSetEnabled = 1;
  self->_enabled = enabled;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

void __52__UIDragInteraction__createDefaultInitiationDrivers__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "registerVisualStyleClass:forStylableClass:", v3, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "registerVisualStyleClass:forStylableClass:", v5, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v7, "registerVisualStyleClass:forStylableClass:", v6, objc_opt_class());

}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIDragInteraction");
}

- (void)_setCancellationTimerEnabled:(BOOL)a3
{
  self->_cancellationTimerEnabled = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (BOOL)dragDriver:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[UIDragInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((*((_BYTE *)&self->_delegateImplements + 2) & 0x20) != 0)
    v8 = objc_msgSend(v6, "_dragInteraction:shouldDelayCompetingGestureRecognizer:", self, v5);
  else
    v8 = 1;

  return v8;
}

- (BOOL)dragDriver:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[UIDragInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "_dragInteraction:canExcludeCompetingGestureRecognizer:", self, v5);

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _UIDragAddItemsGesture *v7;
  id v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _UIDragSessionImpl *v18;
  void *v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _UIDragSessionImpl *sessionForAddingItems;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _UIDragSessionImpl *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = (_UIDragAddItemsGesture *)a3;
  v8 = a4;
  if (!-[UIDragInteraction isEnabled](self, "isEnabled"))
  {
    v9 = 0;
    goto LABEL_6;
  }
  if (self->_gestureRecognizerForAddingItems == v7 && !self->_sessionForAddingItems)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UIDragInteraction _delegateRespondsToAddingItems](self, "_delegateRespondsToAddingItems")
      && !-[UIDragInteraction _supportsAddingItemsAsynchronously](self, "_supportsAddingItemsAsynchronously"))
    {
      v9 = 0;
LABEL_31:

      goto LABEL_6;
    }
    _sessionsAvailableForAddingItems();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[UIDragInteraction view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locationInView:", v13);
      v15 = v14;
      v17 = v16;

      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v12, "anyObject");
        v18 = (_UIDragSessionImpl *)objc_claimAutoreleasedReturnValue();
      }
      else if ((*((_BYTE *)&self->_delegateImplements + 1) & 0x10) != 0)
      {
        objc_msgSend(v12, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dragInteraction:sessionForAddingItems:withTouchAtPoint:", self, v19, v15, v17);
        v18 = (_UIDragSessionImpl *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v20 = dyld_program_sdk_at_least();
          v21 = objc_msgSend(v12, "containsObject:", v18);
          if (v20)
          {
            if ((v21 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(sel_dragInteraction_sessionForAddingItems_withTouchAtPoint_);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragInteraction.m"), 1136, CFSTR("delegate (%@) returned a object (%@) from %@ that is not a local drag session."), v11, v18, v23);

            }
          }
          else if ((v21 & 1) == 0)
          {
            v28 = gestureRecognizer_shouldReceiveTouch____s_category;
            if (!gestureRecognizer_shouldReceiveTouch____s_category)
            {
              v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v28, (unint64_t *)&gestureRecognizer_shouldReceiveTouch____s_category);
            }
            v29 = *(NSObject **)(v28 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              NSStringFromSelector(sel_dragInteraction_sessionForAddingItems_withTouchAtPoint_);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v33 = v11;
              v34 = 2112;
              v35 = v18;
              v36 = 2112;
              v37 = v31;
              _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "delegate (%@) returned a object (%@) from %@ that is not a local drag session.", buf, 0x20u);

            }
          }
        }
      }
      else
      {
        v18 = 0;
      }
      if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
      {
        -[_UIDragSessionImpl _internalDragSession](v18, "_internalDragSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "dataOwner");

        v26 = (*((_BYTE *)&self->_delegateImplements + 3) & 2) != 0
            ? objc_msgSend(v11, "_dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:", self, v18, v15, v17)
            : 0;
        if (v25 != v26)
        {
          v9 = 0;
          goto LABEL_29;
        }
      }
      if (v18)
      {
        sessionForAddingItems = self->_sessionForAddingItems;
        self->_sessionForAddingItems = v18;
        v9 = 1;
        v18 = sessionForAddingItems;
LABEL_29:

        goto LABEL_30;
      }
    }
    v9 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (void)didMoveToView:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if (v4)
  {
    objc_msgSend(v4, "addGestureRecognizer:", self->_gestureRecognizerForAddingItems);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_initiationDrivers;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "setView:", v4, (_QWORD)v12);
        }
        while (v7 != v9);
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[UIDragInteraction delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((*((_BYTE *)&self->_delegateImplements + 4) & 4) == 0
      || objc_msgSend(v10, "_dragInteractionShouldBecomeDraggingSourceDelegate:", self))
    {
      objc_msgSend(v4, "_setDraggingSourceDelegate:", self, (_QWORD)v12);
    }

  }
}

- (BOOL)dragDriver:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[UIDragInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((*((_BYTE *)&self->_delegateImplements + 2) & 0x80) != 0)
    v8 = objc_msgSend(v6, "_dragInteraction:competingGestureRecognizerShouldDelayLift:", self, v5);
  else
    v8 = 0;

  return v8;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_delegateRespondsToAddingItems
{
  return (*(_DWORD *)&self->_delegateImplements & 0xA0000800) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTouchTypes, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_initiationDrivers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultDriverProvider, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForAddingItems, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_storeStrong((id *)&self->_sessionForAddingItems, 0);
  objc_storeStrong((id *)&self->_preliminarySession, 0);
}

- (void)_setPointerLiftDelay:(double)a3
{
  self->_pointerLiftDelay = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setPresentationDelegate:(id)a3
{
  _UIDragInteractionPresentationDelegate **p_presentationDelegate;
  id v5;
  char v6;
  char v7;
  char v8;

  p_presentationDelegate = &self->_presentationDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_presentationDelegate, v5);
  *(_BYTE *)&self->_presentationDelegateImplements = *(_BYTE *)&self->_presentationDelegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_presentationDelegateImplements = *(_BYTE *)&self->_presentationDelegateImplements & 0xFD | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_presentationDelegateImplements = *(_BYTE *)&self->_presentationDelegateImplements & 0xFB | v8;
}

- (id)_initiationDriver
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  v3 = self->_initiationDrivers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!-[UIDragInteraction _isPointerDriver:](self, "_isPointerDriver:", v9, (_QWORD)v12))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_cancelAllDrags
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
  +[_UIDragSessionImpl activeSessions](_UIDragSessionImpl, "activeSessions", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_cancelDrag");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_cancelDrag
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
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
  +[_UIDragSessionImpl activeSessions](_UIDragSessionImpl, "activeSessions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "trackedInteractions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", self);

        if (v10)
          objc_msgSend(v8, "_cancelDrag");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)_isActive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
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
  +[_UIDragSessionImpl activeSessions](_UIDragSessionImpl, "activeSessions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "trackedInteractions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "containsObject:", self))
        {
          v10 = objc_msgSend(v8, "_isActive");

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)setDragCancellationDelay:(double)a3
{
  if (setDragCancellationDelay__once != -1)
    dispatch_once(&setDragCancellationDelay__once, &__block_literal_global_270);
  -[UIDragInteraction _setCancellationDelay:](self, "_setCancellationDelay:", a3);
}

void __46__UIDragInteraction_setDragCancellationDelay___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke___s_category;
  if (!_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _setCancellationDelay:] instead.", v2, 2u);
  }
}

- (void)setLiftDelay:(double)a3
{
  if (setLiftDelay__once != -1)
    dispatch_once(&setLiftDelay__once, &__block_literal_global_272);
  -[UIDragInteraction _setLiftDelay:](self, "_setLiftDelay:", a3);
}

void __34__UIDragInteraction_setLiftDelay___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_2___s_category;
  if (!_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_2___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_2___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _setLiftDelay:] instead.", v2, 2u);
  }
}

- (double)liftDelay
{
  double result;

  if (liftDelay_once != -1)
    dispatch_once(&liftDelay_once, &__block_literal_global_273);
  -[UIDragInteraction _liftDelay](self, "_liftDelay");
  return result;
}

void __30__UIDragInteraction_liftDelay__block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_3___s_category;
  if (!_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_3___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_3___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _liftDelay] instead.", v2, 2u);
  }
}

- (void)_setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  self->_automaticallyAddsFailureRelationships = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setAllowedTouchTypes:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_allowedTouchTypes, a3);
  v5 = a3;
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_gestureRecognizerForAddingItems, "setAllowedTouchTypes:", v5);

  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setPointerLiftMoveHysteresis:(double)a3
{
  self->_pointerLiftMoveHysteresis = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)allowsSimultaneousRecognitionDuringLift
{
  self->_allowsSimultaneousRecognitionDuringLift = allowsSimultaneousRecognitionDuringLift;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setCancellationDelay:(double)a3
{
  self->_cancellationDelay = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setCompetingLongPressDelay:(double)a3
{
  self->_competingLongPressDelay = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setCompetingLongPressOnLift:(BOOL)a3
{
  self->_competingLongPressOnLift = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (void)_setAdditionalTouchesCancelLift:(BOOL)a3
{
  self->_additionalTouchesCancelLift = a3;
  -[UIDragInteraction _updateDriverParameters](self, "_updateDriverParameters");
}

- (CGPoint)_locationInView:(id)a3
{
  double v3;
  double v4;
  id v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  v6 = a3;
  v7 = -[UIDragInteractionContextImpl invocationType](self->_interactionContext, "invocationType");
  if (v7 == 1)
  {
    -[UIDragInteractionContextImpl initialLocation](self->_interactionContext, "initialLocation");
    v12 = v11;
    v14 = v13;
    -[UIDragInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:toView:", v6, v12, v14);
    v3 = v16;
    v4 = v17;

    goto LABEL_5;
  }
  if (!v7)
  {
    -[UIDragInteractionContextImpl initiationTouch](self->_interactionContext, "initiationTouch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v6);
    v3 = v9;
    v4 = v10;
LABEL_5:

  }
  v18 = v3;
  v19 = v4;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)_immediatelyBeginDragWithTouch:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, _QWORD);

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragInteraction.m"), 681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touch"));

  }
  if (self->_interactionContext)
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    -[UIDragInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    -[UIDragInteraction view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:toView:", 0, v11, v13);
    v16 = v15;
    v18 = v17;

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__UIDragInteraction__immediatelyBeginDragWithTouch_completion___block_invoke;
    v20[3] = &unk_1E16C3F70;
    v20[4] = self;
    v21 = v7;
    v22 = v8;
    -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 0, v20, v16, v18, 0.0);

  }
}

void __63__UIDragInteraction__immediatelyBeginDragWithTouch_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (!v10)
    goto LABEL_4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInitiationTouch:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queryDelegate:forItemsForBeginningSession:", v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(*(id *)(a1 + 32), "_beginLiftForItems:session:animated:", v5, v10, 0);
  if ((_DWORD)v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_beginDragWithTouches:itemUpdater:", v7, 0);

    v8 = 1;
  }
  else
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "_finalizeLiftCancellation");
    v8 = 0;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);

}

- (void)_prepareForLiftAtPoint:(void *)a3 invocationType:(double)a4 completion:(double)a5
{
  id v11;
  void *v12;
  _UIDragSessionImpl *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  _UIDragSessionImpl *v18;
  _QWORD v19[5];
  _UIDragSessionImpl *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id from;
  id location;

  v11 = a3;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIDragSessionImpl initWithInteraction:]([_UIDragSessionImpl alloc], "initWithInteraction:", a1);
    v14 = objc_opt_new();
    v15 = a1[4];
    a1[4] = (id)v14;

    objc_msgSend(a1[4], "setInvocationType:", a2);
    objc_msgSend(a1[4], "setInitialLocation:", a4, a5, a6);
    objc_initWeak(&location, a1[4]);
    objc_initWeak(&from, a1);
    v16 = a1[4];
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke;
    v22[3] = &unk_1E16B3F18;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    objc_msgSend(v16, "addCompletion:", v22);
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke_2;
    v19[3] = &unk_1E16C3FE0;
    v19[4] = a1;
    v21 = v11;
    v18 = v13;
    v20 = v18;
    objc_msgSend(a1, "_prepareForSession:completion:", v18, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (void)_beginDragWithTouches:(id)a3 itemUpdater:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!-[UIDragInteractionContextImpl hasBegunDrag](self->_interactionContext, "hasBegunDrag"))
  {
    v21 = v6;
    -[UIDragInteractionContextImpl setHasBegunDrag:](self->_interactionContext, "setHasBegunDrag:", 1);
    -[UIDragInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[UIDragInteractionContextImpl items](self->_interactionContext, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
          if (v7)
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15));
          objc_msgSend(v16, "_targetedLiftPreview");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDragInteractionContextImpl initialLocation](self->_interactionContext, "initialLocation");
          objc_msgSend(v17, "takeLiftAnchorPoint:fromView:", v10);

          if ((*((_BYTE *)&self->_delegateImplements + 2) & 1) != 0)
          {
            objc_msgSend(v8, "_dragInteraction:viewToSnapshotItem:", self, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v16, "_targetedLiftPreview");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "_setViewToSnapshot:", v18);

            }
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    -[UIDragInteraction view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v21;
    objc_msgSend(v20, "_beginDragWithInteractionTouches:", v21);

  }
}

- (void)_handoffSession:(id)a3
{
  _UIDragSessionImpl *preliminarySession;

  -[_UIDragSessionImpl _setInternalDragSession:](self->_preliminarySession, "_setInternalDragSession:", a3);
  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;

}

- (id)_queryDelegate:(id)a3 forItemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  UIDragItem *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_delegateImplements & 1) != 0)
  {
    objc_msgSend(v6, "dragInteraction:itemsForBeginningSession:", self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copy");

    if (!v8)
    {
      -[UIDragInteraction view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_effectiveActivityItemsConfigurationForSender:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v11, "itemProvidersForActivityItemsConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v11, "itemProvidersForActivityItemsConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v31;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v14);
              v19 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18));
              objc_msgSend(v8, "addObject:", v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v16);
        }

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v24++), "_setDragDropSession:", v7, (_QWORD)v26);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v22);
  }

  return v20;
}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  $7D05B4C22794768F32303D0F1F1D53E1 delegateImplements;
  void *v16;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v9;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if (self)
  {
    delegateImplements = self->_delegateImplements;
    if ((*(_WORD *)&delegateImplements & 0x800) != 0)
    {
      objc_msgSend(v11, "dragInteraction:itemsForAddingToSession:withTouchAtPoint:", self, v12, x, y);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v16);
      LOBYTE(self) = objc_msgSend(v16, "count") != 0;

    }
    else if ((*(_DWORD *)&delegateImplements & 0x20000000) != 0)
    {
      objc_msgSend(v11, "_dragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:", self, v12, v13, x, y);
      LOBYTE(self) = 1;
    }
    else
    {
      (*((void (**)(id, _QWORD))v13 + 2))(v13, MEMORY[0x1E0C9AA60]);
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void)_queryDelegate:(id)a3 forLiftPreviewsUsingItems:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UITargetedDragPreview *v16;
  void *v17;
  UITargetedDragPreview *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
        {
          objc_msgSend(v8, "dragInteraction:previewForLiftingItem:session:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), v10);
          v18 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = [UITargetedDragPreview alloc];
          -[UIDragInteraction view](self, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[UITargetedDragPreview initWithView:](v16, "initWithView:", v17);

        }
        objc_msgSend(v15, "setTargetedLiftPreview:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (uint64_t)_addItemsWithPoint:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;

  if (!a1)
    return 0;
  v5 = *(void **)(a1 + 24);
  if (!v5)
    return 0;
  v6 = *(void **)(a1 + 16);
  if (v6)
  {
    objc_msgSend(v6, "items");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 != 0;
    if (v8)
      objc_msgSend(*(id *)(a1 + 24), "addItems:forDragSourceInteraction:", v7, a1);
    v10 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v11 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;
  }
  else
  {
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 24);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__UIDragInteraction__addItemsWithPoint___block_invoke;
    v18[3] = &unk_1E16BC3F0;
    v18[4] = a1;
    v19 = v15;
    v7 = v15;
    v9 = objc_msgSend((id)a1, "_itemsForAddingToSession:atPoint:completion:", v16, v18, a2, a3, a4);
    v11 = v19;
  }

  return v9;
}

void __40__UIDragInteraction__addItemsWithPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _UIDragAnimatingWrapper *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count") && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) == *(_QWORD *)(a1 + 40))
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = (id)objc_msgSend(v3, "copy");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_setDragDropSession:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), (_QWORD)v17);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_queryDelegate:forLiftPreviewsUsingItems:session:", v10, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    if ((*(_BYTE *)(v12 + 56) & 4) != 0)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "pauseAnimation");
      v14 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v13);
      objc_msgSend(v11, "dragInteraction:willAnimateLiftWithAnimator:session:", *(_QWORD *)(a1 + 32), v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(v13, "startAnimation");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addItems:forDragSourceInteraction:", v4);
      objc_msgSend(v13, "stopAnimation:", 0);
      objc_msgSend(v13, "finishAnimationAtPosition:", 0);

    }
    else
    {
      objc_msgSend(*(id *)(v12 + 24), "addItems:forDragSourceInteraction:", v4);
    }
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 24);
    *(_QWORD *)(v15 + 24) = 0;

  }
}

- (void)_updateInteractionEffectWithContext:(id)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Attempting to update a nil context", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v10 = _updateInteractionEffectWithContext_notifyDelegate____s_category;
    if (!_updateInteractionEffectWithContext_notifyDelegate____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_updateInteractionEffectWithContext_notifyDelegate____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Attempting to update a nil context", v12, 2u);
    }
  }
  -[UIDragInteraction interactionEffect](self, "interactionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interaction:didChangeWithContext:", self, v6);

  if (v4)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)&self->_delegateImplements + 2) & 8) != 0)
      objc_msgSend(v8, "_dragInteraction:liftAnimationDidChangeDirection:", self, objc_msgSend(v6, "state") == 0);

  }
}

- (UIDragInteractionEffect)interactionEffect
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
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
  v3 = self->_initiationDrivers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "interactionEffect", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v8, "interactionEffect");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            return (UIDragInteractionEffect *)v11;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  return self->_interactionEffect;
}

- (void)_accessibilityPrepareForDragAtPoint:(CAPoint3D)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIDragInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", 0, x, y);
  v10 = v9;
  v12 = v11;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__UIDragInteraction__accessibilityPrepareForDragAtPoint_completion___block_invoke;
  v14[3] = &unk_1E16C3F98;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 1, v14, v10, v12, 0.0);

}

void __68__UIDragInteraction__accessibilityPrepareForDragAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_queryDelegate:forItemsForBeginningSession:", v4, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(*(id *)(a1 + 32), "_beginLiftForItems:session:animated:", v5, v8, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setHasBegunDrag:", v6);

  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);

}

- (BOOL)_accessibilityAddItemsToDragSessionAtPoint:(CAPoint3D)a3
{
  double z;
  double y;
  double x;
  int v7;
  void *v8;
  _UIDragSessionImpl *v9;
  _UIDragSessionImpl *sessionForAddingItems;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v7 = -[UIDragInteraction _accessibilityCanAddItemsToDragSession](self, "_accessibilityCanAddItemsToDragSession");
  if (v7)
  {
    _sessionsAvailableForAddingItems();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (_UIDragSessionImpl *)objc_claimAutoreleasedReturnValue();
    sessionForAddingItems = self->_sessionForAddingItems;
    self->_sessionForAddingItems = v9;

    LOBYTE(v7) = -[UIDragInteraction _addItemsWithPoint:]((uint64_t)self, x, y, z);
  }
  return v7;
}

- (BOOL)_accessibilityCanAddItemsToDragSession
{
  void *v3;
  void *v4;
  _UIDragSessionImpl *sessionForAddingItems;
  BOOL v6;

  -[UIDragInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIDragInteraction isEnabled](self, "isEnabled"))
    goto LABEL_7;
  _sessionsAvailableForAddingItems();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {

    goto LABEL_7;
  }
  sessionForAddingItems = self->_sessionForAddingItems;

  if (sessionForAddingItems)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = -[UIDragInteraction _delegateRespondsToAddingItems](self, "_delegateRespondsToAddingItems")
    || -[UIDragInteraction _supportsAddingItemsAsynchronously](self, "_supportsAddingItemsAsynchronously");
LABEL_8:

  return v6;
}

void __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  _QWORD *WeakRetained;

  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained[4])
    {
      v3 = objc_loadWeakRetained((id *)(a1 + 40));
      v4 = (id)WeakRetained[4];

      if (v3 == v4)
        objc_msgSend(WeakRetained, "_finalizeLiftCancellation");
    }

  }
}

uint64_t __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPreparedForLift:", 1);
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  -[UIDragInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateImplements + 2) & 4) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__UIDragInteraction__prepareForSession_completion___block_invoke;
    v9[3] = &unk_1E16B1BF8;
    v10 = v7;
    objc_msgSend(v8, "_dragInteraction:prepareForSession:completion:", self, v6, v9);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

uint64_t __51__UIDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_beginLiftForItems:(id)a3 session:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    objc_storeStrong((id *)&self->_preliminarySession, a4);
    -[_UIDragSessionImpl addItems:forDragSourceInteraction:](self->_preliminarySession, "addItems:forDragSourceInteraction:", v8, self);
    -[UIDragInteractionContextImpl setItems:](self->_interactionContext, "setItems:", v8);
    -[UIDragInteractionContextImpl setShouldAnimateLift:](self->_interactionContext, "setShouldAnimateLift:", v5);
    -[UIDragInteraction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragInteraction _queryDelegate:forLiftPreviewsUsingItems:session:](self, "_queryDelegate:forLiftPreviewsUsingItems:session:", v11, v8, v9);
    if ((*(_BYTE *)&self->_delegateImplements & 4) != 0)
      objc_msgSend(v11, "dragInteraction:willAnimateLiftWithAnimator:session:", self, self->_interactionContext, v9);
    v20 = v11;
    v21 = v9;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "_targetedLiftPreview", v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_previewContainer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_animateLiftAlongsideAnimator:completion:", self->_interactionContext, &__block_literal_global_289);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    -[UIDragInteractionContextImpl setState:](self->_interactionContext, "setState:", 1);
    -[UIDragInteraction _updateInteractionEffectWithContext:notifyDelegate:](self, "_updateInteractionEffectWithContext:notifyDelegate:", self->_interactionContext, 0);

    v9 = v21;
  }

  return v10 != 0;
}

- (void)_endLiftWithoutDragging
{
  UIDragInteractionContextImpl *interactionContext;
  void *v4;
  id v5;

  interactionContext = self->_interactionContext;
  if (interactionContext)
  {
    -[UIDragInteractionContextImpl setState:](interactionContext, "setState:", 0);
    -[UIDragInteraction _updateInteractionEffectWithContext:notifyDelegate:](self, "_updateInteractionEffectWithContext:notifyDelegate:", self->_interactionContext, 1);
    -[UIDragInteraction delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)&self->_delegateImplements + 2) & 0x10) != 0)
    {
      v5 = v4;
      objc_msgSend(v4, "_dragInteractionDidCancelLiftWithoutDragging:", self);
      v4 = v5;
    }

  }
}

- (void)_cancelLift
{
  NSSet *v2;
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
  v2 = self->_initiationDrivers;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_finalizeLiftCancellation
{
  _UIDragSessionImpl *preliminarySession;
  UIDragInteractionContextImpl *interactionContext;

  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;

  interactionContext = self->_interactionContext;
  self->_interactionContext = 0;

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_gestureRecognizerForAddingItems != a3)
    return 0;
  v5 = a3;
  -[UIDragInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  return -[UIDragInteraction _addItemsWithPoint:]((uint64_t)self, v8, v10, 0.0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v4;
  id v5;
  char isKindOfClass;

  if (self->_gestureRecognizerForAddingItems == a3)
  {
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v4 = isKindOfClass ^ 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UIDragAddItemsGesture *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (_UIDragAddItemsGesture *)a3;
  v7 = a4;
  v8 = v7;
  v9 = self->_gestureRecognizerForAddingItems == v6 && (objc_msgSend(v7, "_isGestureType:", 0) & 1) != 0;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  uint64_t v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_gestureRecognizerForAddingItems == a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = self->_initiationDrivers;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isGestureRecognizerForDragInitiation:", v6, (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  _UIDragSessionImpl *sessionForAddingItems;

  if (self->_gestureRecognizerForAddingItems == a3)
  {
    sessionForAddingItems = self->_sessionForAddingItems;
    self->_sessionForAddingItems = 0;

  }
}

- (id)_itemsToDragFromView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  -[_UIDragSessionImpl items](self->_preliminarySession, "items", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "_setSourceVisualTarget:", self->_preliminarySession);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[_UIDragSessionImpl items](self->_preliminarySession, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (void)_view:(id)a3 willBeginDraggingWithSession:(id)a4
{
  -[UIDragInteraction _handoffSession:](self, "_handoffSession:", a4);
}

- (BOOL)_viewRestrictsDragToSourceApp:(id)a3
{
  UIDragInteraction *v4;
  void *v5;

  if ((*(_BYTE *)&self->_delegateImplements & 0x20) == 0)
    return 0;
  v4 = self;
  -[UIDragInteraction delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "dragInteraction:sessionIsRestrictedToDraggingApplication:", v4, v4->_preliminarySession);

  return (char)v4;
}

- (void)_viewFailedToDrag:(id)a3
{
  NSSet *v3;
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
  v3 = self->_initiationDrivers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_viewDragSessionProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIDragInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*((_BYTE *)&self->_delegateImplements + 3) & 0x10) == 0
    || (objc_msgSend(v4, "_dragInteraction:sessionPropertiesForSession:", self, self->_preliminarySession),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)objc_opt_new();
    if ((*((_BYTE *)&self->_delegateImplements + 3) & 4) != 0)
      objc_msgSend(v6, "set_supportsSystemDrag:", objc_msgSend(v5, "_dragInteraction:sessionSupportsSystemDrag:", self, self->_preliminarySession));
  }

  return v6;
}

- (id)_requiredContextIDsForDragSessionInView:(id)a3
{
  id v4;
  UIDragInteraction *v5;
  void *v6;

  v4 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v5 = (UIDragInteraction *)objc_claimAutoreleasedReturnValue();
  if (v5 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[UIDragInteraction _requiredContextIDsForDragSessionInView:](v5, "_requiredContextIDsForDragSessionInView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)_dataOwnerOfDragFromView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[UIDragInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*((_BYTE *)&self->_delegateImplements + 3) & 1) != 0)
    v6 = objc_msgSend(v4, "_dragInteraction:dataOwnerForSession:", self, self->_preliminarySession);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)_session:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  v4 = a4;
  v6 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if ((*(_BYTE *)&self->_delegateImplements & 0x10) != 0
      && !objc_msgSend(v7, "dragInteraction:sessionAllowsMoveOperation:", self, v6))
    {
      v9 = 1;
    }
    else
    {
      v9 = 17;
    }
  }
  else
  {
    objc_msgSend(v6, "_internalDragSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldCancelOnAppDeactivation");

    if ((v11 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "_internalDragSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "restrictedToSourceApp");

      v9 = v13 ^ 1u;
    }
  }

  return v9;
}

- (BOOL)_sessionPrefersFullSizePreviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((*(_BYTE *)&self->_delegateImplements & 0x40) != 0)
    v7 = objc_msgSend(v5, "dragInteraction:prefersFullSizePreviewsForSession:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_sessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[UIDragInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*((_BYTE *)&self->_delegateImplements + 4) & 2) != 0)
    v6 = objc_msgSend(v4, "_dragInteractionDynamicallyUpdatesPrefersFullSizePreviews:", self);
  else
    v6 = 0;

  return v6;
}

- (void)_sessionHandedOffDragImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  UIDragInteractionContextImpl *interactionContext;
  id v10;

  v4 = a3;
  if (self->_interactionContext)
  {
    v10 = v4;
    -[UIDragInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((*(_BYTE *)&self->_delegateImplements & 8) != 0)
      objc_msgSend(v5, "dragInteraction:sessionWillBegin:", self, v10);
    objc_msgSend(v10, "_setSentSessionDidBegin:", 1);
    -[UIDragInteractionContextImpl setState:](self->_interactionContext, "setState:", 2);
    -[UIDragInteraction _updateInteractionEffectWithContext:notifyDelegate:](self, "_updateInteractionEffectWithContext:notifyDelegate:", self->_interactionContext, 0);
    -[UIDragInteractionContextImpl _sessionDidBegin](self->_interactionContext, "_sessionDidBegin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIDragInteractionContextImpl _sessionDidBegin](self->_interactionContext, "_sessionDidBegin");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v10);

    }
    interactionContext = self->_interactionContext;
    self->_interactionContext = 0;

    v4 = v10;
  }

}

- (void)_sessionDidMove:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*(_BYTE *)&self->_delegateImplements & 0x80) != 0)
    objc_msgSend(v4, "dragInteraction:sessionDidMove:", self, v6);

}

- (void)_session:(id)a3 willAddItems:(id)a4 forInteraction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[UIDragInteraction delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((*((_BYTE *)&self->_delegateImplements + 1) & 0x20) != 0)
    objc_msgSend(v10, "dragInteraction:session:willAddItems:forInteraction:", self, v12, v8, v9);

}

- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  id v6;
  UIDragInteractionContextImpl *interactionContext;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = a3;
  interactionContext = self->_interactionContext;
  v17 = v6;
  if (interactionContext)
  {
    v8 = -[UIDragInteractionContextImpl state](interactionContext, "state");
    v6 = v17;
    if (v8 != 2)
    {
      -[UIDragInteraction _endLiftWithoutDragging](self, "_endLiftWithoutDragging");
      -[UIDragInteraction _finalizeLiftCancellation](self, "_finalizeLiftCancellation");
      -[UIDragInteraction _presentationDelegate](self, "_presentationDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if ((*(_BYTE *)&self->_presentationDelegateImplements & 4) != 0)
        objc_msgSend(v9, "_dragInteractionPresentation:sessionDidEnd:withoutBeginning:", self, v17, 1);

      v6 = v17;
    }
  }
  v11 = objc_msgSend(v6, "_sentSessionDidBegin");
  v12 = v17;
  if (v11)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((*((_BYTE *)&self->_delegateImplements + 1) & 1) != 0)
    {
      v15 = 2;
      if (a4 == 16)
        v15 = 3;
      if (a4)
        v16 = v15;
      else
        v16 = 0;
      objc_msgSend(v13, "dragInteraction:session:willEndWithOperation:", self, v17, v16);
    }

    v12 = v17;
  }

}

- (void)_sessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "_sentSessionDidBegin"))
  {
    -[UIDragInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((*((_BYTE *)&self->_delegateImplements + 1) & 2) != 0)
    {
      v8 = 2;
      if (a4 == 16)
        v8 = 3;
      if (a4)
        v9 = v8;
      else
        v9 = 0;
      objc_msgSend(v6, "dragInteraction:session:didEndWithOperation:", self, v12, v9);
    }
    -[UIDragInteraction _presentationDelegate](self, "_presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((*(_BYTE *)&self->_presentationDelegateImplements & 4) != 0)
      objc_msgSend(v10, "_dragInteractionPresentation:sessionDidEnd:withoutBeginning:", self, v12, 0);

  }
}

- (id)_session:(id)a3 targetedPreviewForCancellingItem:(id)a4 duiPreview:(id)a5 snapshotView:(id)a6 container:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  UITargetedDragPreview *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  UIDragPreviewTarget *v20;
  void *v21;
  UIDragPreviewTarget *v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIDragPreviewTarget *v30;
  void *v31;
  UITargetedDragPreview *v32;
  void *v33;
  void *v34;
  UITargetedDragPreview *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v46;

  v11 = a4;
  v46 = a5;
  v12 = a6;
  v13 = a7;
  -[UIDragInteraction delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateImplements + 1) & 0x40) != 0
    || (-[UIDragInteraction _presentationDelegate](self, "_presentationDelegate"),
        v15 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    -[UIDragInteraction view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17 && (v18 = (void *)v17, v19 = objc_msgSend(v16, "isHiddenOrHasHiddenAncestor"), v18, !v19))
    {
      v21 = v13;
      objc_msgSend(v16, "frame");
      v26 = v25 + v24 * 0.5;
      v29 = v28 + v27 * 0.5;
      v30 = [UIDragPreviewTarget alloc];
      objc_msgSend(v16, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UIPreviewTarget initWithContainer:center:](v30, "initWithContainer:center:", v31, v26, v29);

      v23 = 0;
    }
    else
    {
      v20 = [UIDragPreviewTarget alloc];
      objc_msgSend(v12, "center");
      v21 = v13;
      v22 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v13);
      v23 = 1;
    }
    v32 = [UITargetedDragPreview alloc];
    objc_msgSend(v46, "parameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UITargetedDragPreview initWithView:parameters:target:](v32, "initWithView:parameters:target:", v12, v33, v22);

    -[UITargetedPreview _setDefaultPreview:](v15, "_setDefaultPreview:", 1);
  }
  else
  {
    v21 = v13;
    v23 = 0;
  }
  if ((*((_BYTE *)&self->_delegateImplements + 1) & 0x40) == 0)
  {
    v34 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v14, "dragInteraction:previewForCancellingItem:withDefault:", self, v11, v15);
  v35 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue();
  if (v35 == v15)
    v36 = v23;
  else
    v36 = 0;
  if ((v36 & 1) != 0)
  {
    v34 = 0;
    v37 = v15;
  }
  else
  {
    v34 = v35;
    if (!v35)
      goto LABEL_20;
    -[UITargetedPreview target](v35, "target");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "container");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "_window");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39 || (v40 = (void *)v39, v41 = objc_msgSend(v37, "isHiddenOrHasHiddenAncestor"), v40, v41))
    {

      v34 = 0;
    }
  }

LABEL_20:
  -[UIDragInteraction _presentationDelegate](self, "_presentationDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if ((*(_BYTE *)&self->_presentationDelegateImplements & 1) != 0)
  {
    objc_msgSend(v42, "_dragInteractionPresentation:previewForCancellingItem:defaultPreview:proposedPreview:", self, v11, v15, v34);
    v44 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v44;
  }

  return v34;
}

- (void)_session:(id)a3 item:(id)a4 willCancelWithAnimator:(id)a5
{
  id v7;
  void *v8;
  _UIDragAnimatingWrapper *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  if (v15)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)&self->_delegateImplements + 1) & 0x80) != 0)
    {
      v9 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v7);
      objc_msgSend(v8, "dragInteraction:item:willAnimateCancelWithAnimator:", self, v15, v9);
    }
    else
    {
      v9 = 0;
    }
    -[UIDragInteraction _presentationDelegate](self, "_presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&self->_presentationDelegateImplements & 2) != 0)
    {
      if (!v9)
        v9 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v7);
      objc_msgSend(v10, "_dragInteractionPresentation:item:willAnimateCancelWithAnimator:", self, v15, v9);
    }
    objc_msgSend(v15, "_targetedLiftPreview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_previewContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (!v9)
        v9 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v7);
      objc_msgSend(v15, "_targetedLiftPreview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_previewContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_animateLiftCancellationAlongsideAnimator:completion:", v9, &__block_literal_global_297);

    }
  }

}

- (BOOL)_session:(id)a3 item:(id)a4 shouldDelaySetDownAnimationWithCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((*((_BYTE *)&self->_delegateImplements + 3) & 0x40) != 0)
      v13 = objc_msgSend(v11, "_dragInteraction:item:shouldDelaySetDownAnimationWithCompletion:", self, v9, v10);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_session:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (v5)
  {
    -[UIDragInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((*((_BYTE *)&self->_delegateImplements + 3) & 8) != 0)
    {
      objc_msgSend(v6, "_dragInteraction:customSpringAnimationBehaviorForCancellingItem:", self, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_sessionDidTransferItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIDragInteraction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*((_BYTE *)&self->_delegateImplements + 1) & 4) != 0)
    objc_msgSend(v4, "dragInteraction:sessionDidTransferItems:", self, v6);

}

- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return -[UIDragInteraction dragDriver:shouldBeginAtLocation3D:](self, "dragDriver:shouldBeginAtLocation3D:", a3, a4.x, a4.y, 0.0);
}

- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation3D:(CAPoint3D)a4
{
  double y;
  double x;
  id v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  UIDragInteractionContextImpl *interactionContext;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  char v22;
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

  y = a4.y;
  x = a4.x;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[UIDragInteraction _isActive](self, "_isActive") && !self->_allowsMultipleSessions)
  {
    LOBYTE(v18) = 0;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_initiationDrivers;
    v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (v13 != v7 && (objc_msgSend(v13, "isActive") & 1) != 0)
          {
            LOBYTE(v18) = 0;
            goto LABEL_28;
          }
        }
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v10)
          continue;
        break;
      }
    }

    interactionContext = self->_interactionContext;
    if (interactionContext
      && (-[UIDragInteractionContextImpl items](interactionContext, "items"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "count"),
          v15,
          v16))
    {
      -[UIDragInteraction view](self, "view");
      v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[UIDragInteractionContextImpl items](self->_interactionContext, "items", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v25;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "_targetedLiftPreview");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsPoint:fromView:", v8, x, y);

            if ((v22 & 1) != 0)
            {
              LOBYTE(v18) = 1;
              goto LABEL_27;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_27:

LABEL_28:
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }

  return v18;
}

- (void)dragDriver:(id)a3 prepareToLiftWithCompletion:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  if (self)
  {
    objc_msgSend(a3, "initialLocationInWindow");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
    v8 = 0.0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__UIDragInteraction_dragDriver_prepareToLiftWithCompletion___block_invoke;
  v12[3] = &unk_1E16C3F98;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 1, v12, v8, v10, 0.0);

}

void __60__UIDragInteraction_dragDriver_prepareToLiftWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v4 = a2;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4 != 0);

}

- (BOOL)dragDriverBeginLift:(id)a3
{
  _UIDragSessionImpl *preliminarySession;
  _UIDragSessionImpl *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;
  v6 = preliminarySession;
  v7 = a3;

  -[UIDragInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDragInteraction _queryDelegate:forItemsForBeginningSession:](self, "_queryDelegate:forItemsForBeginningSession:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "shouldAnimateLift");
  LOBYTE(v7) = -[UIDragInteraction _beginLiftForItems:session:animated:](self, "_beginLiftForItems:session:animated:", v9, v6, v10);

  return (char)v7;
}

- (void)dragDriverCancelLift:(id)a3
{
  id v4;
  UIDragInteractionContextImpl *interactionContext;
  BOOL v6;
  id v7;

  v4 = a3;
  interactionContext = self->_interactionContext;
  if (interactionContext)
  {
    v7 = v4;
    v6 = -[UIDragInteractionContextImpl hasBegunDrag](interactionContext, "hasBegunDrag");
    v4 = v7;
    if (!v6)
    {
      -[UIDragInteraction _endLiftWithoutDragging](self, "_endLiftWithoutDragging");
      -[UIDragInteraction _finalizeLiftCancellation](self, "_finalizeLiftCancellation");
      v4 = v7;
    }
  }

}

- (void)dragDriver:(id)a3 beginDragWithTouches:(id)a4 itemUpdater:(id)a5 beginningSessionHandler:(id)a6
{
  id v9;

  v9 = a6;
  -[UIDragInteraction _beginDragWithTouches:itemUpdater:](self, "_beginDragWithTouches:itemUpdater:", a4, a5);
  -[UIDragInteractionContextImpl set_sessionDidBegin:](self->_interactionContext, "set_sessionDidBegin:", v9);

}

- (void)dragDriverCancelAddItemsGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIGestureRecognizer _allActiveTouches](self->_gestureRecognizerForAddingItems, "_allActiveTouches", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)UIApp;
    v8[0] = self->_gestureRecognizerForAddingItems;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cancelGestureRecognizers:", v7);

  }
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return 0;
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (NSSet)_initiationDrivers
{
  return self->_initiationDrivers;
}

- (_UIDragInteractionPresentationDelegate)_presentationDelegate
{
  return (_UIDragInteractionPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setInteractionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_interactionEffect, a3);
}

- (BOOL)_competingLongPressOnLift
{
  return self->_competingLongPressOnLift;
}

- (BOOL)_allowsMultipleSessions
{
  return self->_allowsMultipleSessions;
}

- (void)_setAllowsMultipleSessions:(BOOL)a3
{
  self->_allowsMultipleSessions = a3;
}

- (int64_t)_addItemsGestureConfiguration
{
  return self->_addItemsGestureConfiguration;
}

- (NSArray)_allowedTouchTypes
{
  return self->_allowedTouchTypes;
}

@end

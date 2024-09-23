@implementation UIFocusSystem

+ (UIFocusSystem)focusSystemForEnvironment:(id)environment
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v5 = environment;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 549, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v6 = (id)qword_1ECD7DA88;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    _UIFocusEnvironmentRootAncestorEnvironment(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v8))
    {
      if (objc_msgSend(v8, "_focusSystemIsValid"))
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return (UIFocusSystem *)v10;
}

+ (id)_focusSystemForEnvironment:(id)a3
{
  return +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", a3);
}

- (UIFocusSystem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 124, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (UIFocusSystem)initWithFocusBehavior:(id)a3
{
  return -[UIFocusSystem initWithFocusBehavior:enabled:](self, "initWithFocusBehavior:enabled:", a3, 1);
}

- (UIFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4
{
  id v7;
  UIFocusSystem *v8;
  UIFocusSystem *v9;
  _UIFocusMovementPerformer *v10;
  _UIFocusMovementPerformer *movementPerformer;
  _UIFocusMovementPerformer *v12;
  uint64_t v13;
  UIFocusSystem *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIFocusSystem;
  v8 = -[UIFocusSystem init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_behavior, a3);
    v9->_enabled = a4;
    v10 = (_UIFocusMovementPerformer *)objc_opt_new();
    -[_UIFocusMovementPerformer setDelegate:](v10, "setDelegate:", v9);
    movementPerformer = v9->_movementPerformer;
    v9->_movementPerformer = v10;
    v12 = v10;

    v13 = qword_1ECD7DB40;
    v14 = v9;
    if (v13 != -1)
      dispatch_once(&qword_1ECD7DB40, &__block_literal_global_207);
    objc_msgSend((id)qword_1ECD7DA88, "addObject:", v14);

    -[UIFocusSystem _focusBehaviorDidChange](v14, "_focusBehaviorDidChange");
  }

  return v9;
}

- (void)_prepareForTeardown
{
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _UIFocusMovementRequest *v19;
  uint64_t v20;
  void *v21;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  UIFocusEnvironment *appearingFocusEnvironment;
  UIFocusEnvironment *disappearingFocusEnvironment;
  _UIFocusUpdateRequest *v31;
  void *v32;
  int v33;
  const __CFString *v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
LABEL_12:
    -[UIFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 0);
    if (self->_enabled == v3)
      return;
    -[UIFocusSystem _hostFocusSystem](self, "_hostFocusSystem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = qword_1ECD7DA40;
      if (!qword_1ECD7DA40)
      {
        v11 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7DA40);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = CFSTR("disabled");
        if (v3)
          v13 = CFSTR("enabled");
        v33 = 138543362;
        v34 = v13;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Focus system %{public}@", (uint8_t *)&v33, 0xCu);
      }
    }
    self->_enabled = v3;
    if (!v3)
    {
      -[UIFocusSystem focusedItem](self, "focusedItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        -[UIFocusSystem _setNeedsFocusRestoration](self, "_setNeedsFocusRestoration");
      -[UIFocusSystem _contextForUpdateToEnvironment:](self, "_contextForUpdateToEnvironment:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v27, 0);
      -[UIFocusSystem setPendingFocusMovementAction:](self, "setPendingFocusMovementAction:", 0);
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      goto LABEL_36;
    }
    -[UIFocusSystem pendingFocusMovementAction](self, "pendingFocusMovementAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[UIFocusSystem pendingFocusMovementAction](self, "pendingFocusMovementAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "focusMovementInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "heading");

      if (v18)
      {
        v19 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", self);
        -[UIFocusSystem pendingFocusMovementAction](self, "pendingFocusMovementAction");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "focusMovementInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusMovementRequest setMovementInfo:](v19, "setMovementInfo:", v21);

        LOBYTE(v20) = -[UIFocusSystem _performFocusMovement:](self, "_performFocusMovement:", v19);
        -[UIFocusSystem setPendingFocusMovementAction:](self, "setPendingFocusMovementAction:", 0);

        if ((v20 & 1) != 0)
        {
LABEL_35:
          -[UIFocusSystem _tickHasSeenFocusedItemTimer:](self, "_tickHasSeenFocusedItemTimer:", 0);
LABEL_36:
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "postNotificationName:object:", CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), self);

          return;
        }
      }
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFFB);
      -[UIFocusSystem _previousFocusedItem](self, "_previousFocusedItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusSystem _contextForUpdateToEnvironment:](self, "_contextForUpdateToEnvironment:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[UIFocusSystem _shouldRestoreFocusInContext:](self, "_shouldRestoreFocusInContext:", v24))
      {
        -[UIFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v25, 0);
        if (!self->_pendingFocusUpdateRequest)
          goto LABEL_35;
LABEL_33:
        -[UIFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");
        goto LABEL_35;
      }

    }
    if (!self->_pendingFocusUpdateRequest)
    {
      v31 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", self);
      -[UIFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v31);
      -[UIFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");

      goto LABEL_35;
    }
    goto LABEL_33;
  }
  -[UIFocusSystem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[UIFocusSystem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_shouldWaitForFocusMovementActionToEnableFocusSystem:", self) & 1) == 0)
  {

    goto LABEL_11;
  }
  -[UIFocusSystem pendingFocusMovementAction](self, "pendingFocusMovementAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_12;
  v8 = _MergedGlobals_1041;
  if (!_MergedGlobals_1041)
  {
    v8 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_MergedGlobals_1041);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Tried to enable focus system without receiving focus movement action, waiting until action is received to enable", (uint8_t *)&v33, 2u);
  }
  -[UIFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 1);
}

- (BOOL)_focusSystemIsValid
{
  return (*(_BYTE *)&self->_flags & 1) == 0;
}

- (void)_enableWithoutFocusRestoration
{
  id v3;

  if (_AXSFullKeyboardAccessEnabled())
  {
    if (!self->_enabled)
    {
      self->_enabled = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), self);

    }
  }
}

- (id)focusedItem
{
  UIFocusItem **p_focusedItem;
  id WeakRetained;
  id v5;
  UIFocusSystem *v6;
  id v7;

  p_focusedItem = &self->_focusedItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  if (WeakRetained && -[UIFocusSystem _requiresFocusedItemToBeInHierarchy](self, "_requiresFocusedItemToBeInHierarchy"))
  {
    v5 = objc_loadWeakRetained((id *)p_focusedItem);
    _UIFocusEnvironmentRootAncestorEnvironment(v5);
    v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
      v7 = objc_loadWeakRetained((id *)p_focusedItem);
    else
      v7 = 0;

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_focusedItem);
  }

  return v7;
}

- (UIFocusItem)_focusedItemOrDeferralTarget
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  -[UIFocusSystem focusedItem](self, "focusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  v6 = WeakRetained;

  return (UIFocusItem *)v6;
}

- (id)_focusItemForValidation
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || -[UIFocusSystem _isEnabled](self, "_isEnabled"))
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  v5 = WeakRetained;

  return v5;
}

- (BOOL)_hasValidItemForCurrentDeferralState
{
  BOOL v2;
  int64_t v4;
  void *v5;

  v4 = -[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  if ((unint64_t)(v4 - 1) < 4)
  {
    -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v2 = v5 != 0;

    return v2;
  }
  if (!v4)
  {
    -[UIFocusSystem focusedItem](self, "focusedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v2;
}

- (UIView)_focusedView
{
  void *v2;
  void *v3;

  -[UIFocusSystem focusedItem](self, "focusedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentContainingView(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)_focusedWindow
{
  void *v2;
  void *v3;

  -[UIFocusSystem _focusedView](self, "_focusedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setFocusCastingController:(id)a3
{
  _UIFocusCastingController *v5;
  _UIFocusCastingController *focusCastingController;
  _UIFocusCastingController *v7;

  v5 = (_UIFocusCastingController *)a3;
  focusCastingController = self->_focusCastingController;
  if (focusCastingController != v5)
  {
    v7 = v5;
    if (focusCastingController)
    {
      -[_UIFocusCastingController setFocusSystem:](focusCastingController, "setFocusSystem:", 0);
      -[_UIFocusCastingController teardown](self->_focusCastingController, "teardown");
      v5 = v7;
    }
    -[_UIFocusCastingController setFocusSystem:](v5, "setFocusSystem:", self);
    objc_storeStrong((id *)&self->_focusCastingController, a3);
    v5 = v7;
  }

}

- (_UIFocusGroupHistory)_focusGroupHistory
{
  _UIFocusGroupHistory *focusGroupHistory;
  _UIFocusGroupHistory *v4;
  _UIFocusGroupHistory *v5;

  focusGroupHistory = self->_focusGroupHistory;
  if (!focusGroupHistory)
  {
    v4 = (_UIFocusGroupHistory *)objc_opt_new();
    v5 = self->_focusGroupHistory;
    self->_focusGroupHistory = v4;

    focusGroupHistory = self->_focusGroupHistory;
  }
  return focusGroupHistory;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  switch(-[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
  {
    case 1:
    case 4:
      objc_msgSend(v5, "_request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowsDeferral");
      goto LABEL_5;
    case 2:
      v7 = 1;
      break;
    case 3:
      objc_msgSend(v5, "_request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "allowsDeferral"))
      {
        objc_msgSend(v5, "nextFocusedItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (_UIFocusItemDeferralModeForItem(v9) == 1)
        {
          v7 = 1;
        }
        else if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(v5, "nextFocusedItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = _UIFocusItemDeferralModeForItem(v10) != 2;

        }
      }
      else
      {
        v7 = 0;
      }
LABEL_5:

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "nextFocusedItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        v11 = -[UIFocusSystem _prefersDeferralForFocusUpdateInContext:](self, "_prefersDeferralForFocusUpdateInContext:", v8), v10, v11))
  {
    if (objc_msgSend(v7, "shouldLog"))
    {
      v12 = qword_1ECD7DA48;
      if (!qword_1ECD7DA48)
      {
        v12 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7DA48);
      }
      v13 = *(id *)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "nextFocusedItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v14);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = CFSTR("(nil)");
        }
        v26 = v18;
        +[_UIDebugReportFormatter defaultFormatter](_UIFocusUpdateReportFormatter, "defaultFormatter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringFromReport:", v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        v33 = 2114;
        v34 = v28;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Deferring focus update to item %{public}@:\n%{public}@", buf, 0x16u);

      }
    }
    else
    {
      v20 = qword_1ECD7DA50;
      if (!qword_1ECD7DA50)
      {
        v20 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&qword_1ECD7DA50);
      }
      v13 = *(id *)(v20 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "nextFocusedItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v21);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138543362;
        v32 = v25;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Deferring focus update to item %{public}@. No additional info available.", buf, 0xCu);

      }
    }

    objc_msgSend(v8, "nextFocusedItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", v29);

    -[UIFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
    v19 = v8;
  }

  return v19;
}

- (BOOL)_performDeferredFocusUpdateIfAvailable
{
  id WeakRetained;
  BOOL v4;
  unint64_t v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[UIFocusSystem _isEnabled](self, "_isEnabled"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  if (WeakRetained && -[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior") != 2)
  {
    v5 = _performDeferredFocusUpdateIfAvailable___s_category;
    if (!_performDeferredFocusUpdateIfAvailable___s_category)
    {
      v5 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_performDeferredFocusUpdateIfAvailable___s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v8 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = WeakRetained;
        v11 = v8;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v16 = v14;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Executing previously deferred focus update to item %{public}@", buf, 0xCu);

      }
    }
    -[UIFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
    -[UIFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDeferredUpdate:", 1);
    v4 = -[UIFocusSystem _updateFocusImmediatelyWithContext:](self, "_updateFocusImmediatelyWithContext:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  id WeakRetained;
  void *v7;
  _BYTE *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  WeakRetained = objc_loadWeakRetained((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_msgSend(WeakRetained, "invalidate");

  -[UIFocusSystem focusedItem](self, "focusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v5 == 3)
  {
    if (v3)
    {
      v8 = (_BYTE *)qword_1ECD7DA58;
      if (!qword_1ECD7DA58)
      {
        v8 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v8, (unint64_t *)&qword_1ECD7DA58);
      }
      if ((*v8 & 1) != 0)
      {
        v13 = qword_1ECD7DA60;
        if (!qword_1ECD7DA60)
        {
          v13 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&qword_1ECD7DA60);
        }
        if ((*(_BYTE *)v13 & 1) != 0)
        {
          v14 = *(NSObject **)(v13 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = (void *)MEMORY[0x1E0CB3978];
            v16 = v14;
            objc_msgSend(v15, "callStackSymbols");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v21 = v17;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Disabling focus deferral.\n%{public}@", buf, 0xCu);

          }
        }
      }
      else
      {
        v9 = qword_1ECD7DA68;
        if (!qword_1ECD7DA68)
        {
          v9 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&qword_1ECD7DA68);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Disabling focus deferral.", buf, 2u);
        }
      }
      *(_DWORD *)&self->_flags |= 0x10u;
    }
    objc_initWeak((id *)buf, self);
    v11 = (void *)MEMORY[0x1E0C99E88];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__UIFocusSystem__tickHasSeenFocusedItemTimer___block_invoke;
    v18[3] = &unk_1E16B26E0;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, v18, 60.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer, v12);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __46__UIFocusSystem__tickHasSeenFocusedItemTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hasSeenFocusedItemDidExpire");

}

- (void)_resetFocusDeferral
{
  unint64_t v3;
  _BYTE *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v4 = (_BYTE *)qword_1ECD7DA70;
    if (!qword_1ECD7DA70)
    {
      v4 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v4, (unint64_t *)&qword_1ECD7DA70);
    }
    if ((*v4 & 1) != 0)
    {
      v10 = qword_1ECD7DA78;
      if (!qword_1ECD7DA78)
      {
        v10 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7DA78);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v14;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Starting to defer focus updates.\n%{public}@", (uint8_t *)&v15, 0xCu);

          v3 = 0x1E0CB3000;
        }
      }
    }
    else
    {
      v5 = qword_1ECD7DA80;
      if (!qword_1ECD7DA80)
      {
        v5 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD7DA80);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Starting to defer focus updates.", (uint8_t *)&v15, 2u);
      }
    }
  }
  objc_msgSend(*(id *)(v3 + 2424), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hasSeenFocusedItemDidExpire, 0);
  *(_DWORD *)&self->_flags &= ~0x10u;
  -[UIFocusSystem behavior](self, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "focusCastingMode");

  if (v8 == 2)
  {
    -[UIFocusSystem _focusCastingController](self, "_focusCastingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forgetEntryPoint");

  }
}

- (void)_startDeferringFocusIfSupported
{
  int64_t v3;
  _BOOL4 v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  -[UIFocusSystem _resetFocusDeferral](self, "_resetFocusDeferral");
  v3 = -[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 != 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
      goto LABEL_10;
    }
    v5 = objc_loadWeakRetained((id *)&self->_focusedItem);
    v4 = _UIFocusItemDeferralModeForItem(v5) != 2;

  }
  else
  {
    v4 = 1;
  }
  v6 = objc_loadWeakRetained((id *)&self->_focusedItem);

  if (v6 && v4)
  {
    v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
    -[UIFocusSystem _dropFocusAndStartDeferring:suppressUpdate:](self, "_dropFocusAndStartDeferring:suppressUpdate:", 0, 1);
    -[UIFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", v8);
    WeakRetained = v8;
LABEL_10:

  }
}

- (void)_clearDeferredFocusUpdateTarget
{
  -[UIFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
}

- (void)_setDeferredFocusUpdateTarget:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_deferredFocusUpdateTarget, obj);
    if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
    {
      -[UIFocusSystem delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_focusSystem:didUpdateDeferralTarget:", self, obj);

    }
  }

}

- (int64_t)_effectiveFocusDeferralBehavior
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[UIFocusSystem _overrideFocusDeferralBehavior](self, "_overrideFocusDeferralBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    -[UIFocusSystem behavior](self, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "focusDeferral");

  }
  return v5;
}

- (void)_setOverrideFocusDeferralBehavior:(id)a3
{
  NSNumber *v5;
  BOOL v6;
  NSNumber *v7;

  v5 = (NSNumber *)a3;
  if (self->_overrideFocusDeferralBehavior != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, a3);
    if (-[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
    {
      -[UIFocusSystem _startDeferringFocusIfSupported](self, "_startDeferringFocusIfSupported");
LABEL_6:
      v5 = v7;
      goto LABEL_7;
    }
    v6 = -[UIFocusSystem _performDeferredFocusUpdateIfAvailable](self, "_performDeferredFocusUpdateIfAvailable");
    v5 = v7;
    if (!v6)
    {
      -[UIFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
      -[UIFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");
      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (NSArray)_allFocusSystems
{
  void *v2;
  void *v3;
  NSArray *v4;

  objc_msgSend((id)qword_1ECD7DA88, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return 0;
}

- (_UIFocusRegionContainer)_focusMapContainer
{
  _UIFocusRegionContainerProxy *v3;
  void *v4;
  _UIFocusRegionContainerProxy *v5;

  v3 = [_UIFocusRegionContainerProxy alloc];
  -[UIFocusSystem focusItemContainer](self, "focusItemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIFocusRegionContainerProxy initWithOwningEnvironment:itemContainer:](v3, "initWithOwningEnvironment:itemContainer:", self, v4);

  -[_UIFocusRegionContainerProxy setAllowsLazyLoading:](v5, "setAllowsLazyLoading:", 0);
  -[_UIFocusRegionContainerProxy setShouldCreateRegionForOwningItem:](v5, "setShouldCreateRegionForOwningItem:", 0);
  -[_UIFocusRegionContainerProxy setShouldCreateRegionForGuideBehavior:](v5, "setShouldCreateRegionForGuideBehavior:", 0);
  return (_UIFocusRegionContainer *)v5;
}

- (UIFocusItemContainer)focusItemContainer
{
  _UIFocusSystemDelegate **p_delegate;
  id WeakRetained;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (flags = self->_flags, WeakRetained, (*(_DWORD *)&flags & 0x10000) != 0))
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_focusItemContainerForFocusSystem:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UIFocusItemContainer *)v6;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    v8 = a3;
    -[UIFocusSystem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_clippingRectForFocusSystem:inCoordinateSpace:", self, v8);
    v3 = v10;
    v4 = v11;
    v5 = v12;
    v6 = v13;

  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v10;

  -[UIFocusSystem delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (*(_BYTE *)&self->_flags & 0x80) == 0)
    goto LABEL_3;
  objc_msgSend(v4, "_preferredFocusEnvironmentsForFocusSystem:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 625, CFSTR("Returning nil for a focus system's preferred focus environments is not allowed."));

LABEL_3:
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

- (void)setNeedsFocusUpdate
{
  -[UIFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_prefersFocusContainment
{
  return 1;
}

+ (BOOL)environment:(id)environment containsEnvironment:(id)otherEnvironment
{
  id v7;
  id v8;
  void *v9;
  BOOL IsAncestorOfEnvironment;
  void *v12;
  void *v13;

  v7 = environment;
  v8 = otherEnvironment;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 657, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 658, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherEnvironment"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v9);

  return IsAncestorOfEnvironment;
}

- (void)requestFocusUpdateToEnvironment:(id)environment
{
  _UIFocusUpdateRequest *v5;
  void *v6;
  id v7;

  v7 = environment;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 667, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v5 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", v7);
  -[UIFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v5);

}

- (void)_requestFocusUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  _BYTE *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  objc_class *v28;
  void *v29;
  id v30;
  void *v31;
  objc_class *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  NSObject *log;
  _QWORD v49[4];
  id v50;
  id v51;
  _BYTE location[12];
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 674, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  if ((objc_msgSend(v5, "isFocusRemovalRequest") & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "cacheCurrentFocusSystem");
    if (!objc_msgSend(v6, "isValidInFocusSystem:", self))
      goto LABEL_34;
    -[UIFocusSystem _validatedPendingFocusUpdateRequest](self, "_validatedPendingFocusUpdateRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "canMergeWithRequest:", v6))
    {
      objc_msgSend(v8, "requestByMergingWithRequest:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = 1;
      v6 = (void *)v9;
      goto LABEL_28;
    }
    objc_msgSend(v6, "environment");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (_BYTE *)qword_1ECD7DA90;
    if (!qword_1ECD7DA90)
    {
      v12 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v12, (unint64_t *)&qword_1ECD7DA90);
    }
    if ((*v12 & 1) != 0)
      v13 = (void *)objc_opt_new();
    else
      v13 = 0;
    v51 = 0;
    v14 = -[UIFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", v11, &v51, v13);
    v15 = v51;
    v16 = v15;
    if (v14)
    {

      if (v8)
        v10 = 1;
      else
        v10 = self->_appearingFocusEnvironment != 0;
LABEL_28:
      objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, v6);
      -[UIFocusSystem updateThrottle](self, "updateThrottle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
      {
        if (!v10)
        {
          objc_initWeak((id *)location, self);
          v24 = (void *)UIApp;
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __37__UIFocusSystem__requestFocusUpdate___block_invoke;
          v49[3] = &unk_1E16B3F40;
          objc_copyWeak(&v50, (id *)location);
          objc_msgSend(v24, "_performBlockAfterCATransactionCommits:", v49);
          objc_destroyWeak(&v50);
          objc_destroyWeak((id *)location);
        }
      }
      else
      {
        -[UIFocusSystem updateThrottle](self, "updateThrottle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scheduleProgrammaticFocusUpdate");

        if (objc_msgSend(v6, "resetsUpdateThrottle"))
        {
          -[UIFocusSystem updateThrottle](self, "updateThrottle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reset");

        }
      }
      goto LABEL_33;
    }
    if (!v15 || v11 == v15)
    {
      v19 = qword_1ECD7DAA0;
      if (!qword_1ECD7DAA0)
      {
        v19 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7DAA0);
      }
      if ((*(_BYTE *)v19 & 1) == 0)
        goto LABEL_26;
      v18 = *(id *)(v19 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v30 = v11;
        if (v30)
        {
          v31 = (void *)MEMORY[0x1E0CB3940];
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p>"), v33, v30);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = CFSTR("(nil)");
        }

        v43 = v34;
        v44 = (void *)objc_opt_new();
        objc_msgSend(v44, "stringFromReport:", v13);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v34;
        v53 = 2114;
        v54 = v45;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Ignoring focus update request for ineligible environment %{public}@.\n%{public}@", location, 0x16u);

      }
    }
    else
    {
      v17 = qword_1ECD7DA98;
      if (!qword_1ECD7DA98)
      {
        v17 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7DA98);
      }
      if ((*(_BYTE *)v17 & 1) != 0)
      {
        log = *(id *)(v17 + 8);
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v26 = v11;
          if (v26)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p>"), v29, v26);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v46 = CFSTR("(nil)");
          }

          v35 = (void *)MEMORY[0x1E0CB3940];
          v36 = v16;
          v47 = v46;
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p>"), v38, v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = v39;
          v41 = (void *)objc_opt_new();
          objc_msgSend(v41, "stringFromReport:", v13);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v46;
          v53 = 2114;
          v54 = v39;
          v55 = 2114;
          v56 = v42;
          _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Ignoring focus update request for ineligible environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", location, 0x20u);

        }
      }
      objc_msgSend(v6, "requestByRedirectingRequestToEnvironment:", v16);
      v18 = objc_claimAutoreleasedReturnValue();
      -[UIFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v18);
    }

LABEL_26:
LABEL_33:

    goto LABEL_34;
  }
  v6 = v5;
LABEL_34:

}

void __37__UIFocusSystem__requestFocusUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

- (void)_focusEnvironmentWillBecomeInvisible:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[UIFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    v5 = (void *)UIApp;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__UIFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v6);

  }
}

uint64_t __54__UIFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_focusSystemIsValid");
  if ((_DWORD)result)
  {
    result = _UIFocusEnvironmentIsEligibleForFocusOcclusion(*(void **)(a1 + 40), 0);
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_focusEnvironmentWillDisappear:remainingInHierarchy:", *(_QWORD *)(a1 + 40), 1);
  }
  return result;
}

- (void)_focusEnvironmentWillDisappear:(id)a3
{
  -[UIFocusSystem _focusEnvironmentWillDisappear:remainingInHierarchy:](self, "_focusEnvironmentWillDisappear:remainingInHierarchy:", a3, 0);
}

- (void)_focusEnvironmentWillDisappear:(id)a3 remainingInHierarchy:(BOOL)a4
{
  id v8;
  void *v9;
  _BOOL4 v10;
  _BYTE *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  _UIFocusUpdateRequest *v18;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  const char *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  id v37;
  void *v38;
  objc_class *v39;
  void *v40;
  __CFString *v41;
  const char *v42;
  void *v43;
  id v44;
  objc_class *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  NSObject *log;
  os_log_t loga;
  _QWORD v57[4];
  id v58;
  UIFocusSystem *v59;
  id v60;
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[UIFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    if (a4 || !dyld_program_sdk_at_least())
    {
      v10 = 0;
    }
    else
    {
      -[UIFocusSystem focusedItem](self, "focusedItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = -[UIFocusSystem _focusedItemIsContainedInEnvironment:includeSelf:](self, "_focusedItemIsContainedInEnvironment:includeSelf:", v8, 1);
      else
        v10 = 0;

    }
    v11 = (_BYTE *)qword_1ECD7DAA8;
    if (!qword_1ECD7DAA8)
    {
      v11 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v11, (unint64_t *)&qword_1ECD7DAA8);
    }
    if ((*v11 & 1) != 0)
      v12 = (void *)objc_opt_new();
    else
      v12 = 0;
    v60 = 0;
    v13 = -[UIFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", v8, &v60, v12);
    v14 = v60;
    v15 = v14;
    if (v13)
    {
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke;
      v57[3] = &unk_1E16C6698;
      v58 = v8;
      v59 = self;
      _UIFocusEnvironmentEnumerateAncestorEnvironments(v58, v57);
      objc_storeStrong((id *)&self->_disappearingFocusEnvironment, a3);

    }
    else if (v14)
    {
      v16 = qword_1ECD7DAB0;
      if (!qword_1ECD7DAB0)
      {
        v16 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7DAB0);
      }
      if ((*(_BYTE *)v16 & 1) != 0)
      {
        v30 = *(id *)(v16 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          log = v30;
          v31 = v8;
          if (v31)
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v34, v31);
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v35 = CFSTR("(nil)");
          }

          v43 = (void *)MEMORY[0x1E0CB3940];
          v44 = v15;
          v53 = v35;
          v54 = v35;
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v46, v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = v47;
          v52 = (void *)objc_opt_new();
          objc_msgSend(v52, "stringFromReport:", v12);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v53;
          v63 = 2114;
          v64 = v47;
          v65 = 2114;
          v66 = v49;
          v30 = log;
          _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Ignoring focus update request for disappearing focus environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", buf, 0x20u);

        }
      }
      -[UIFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", v15);
    }
    else
    {
      v17 = qword_1ECD7DAB8;
      if (!qword_1ECD7DAB8)
      {
        v17 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7DAB8);
      }
      if ((*(_BYTE *)v17 & 1) != 0)
      {
        v36 = *(id *)(v17 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = v8;
          if (v37)
          {
            v38 = (void *)MEMORY[0x1E0CB3940];
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v37);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v41 = CFSTR("(nil)");
          }

          loga = v41;
          v50 = (void *)objc_opt_new();
          objc_msgSend(v50, "stringFromReport:", v12);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v41;
          v63 = 2114;
          v64 = v51;
          _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "Ignoring focus update request for disappearing focus environment %{public}@.\n%{public}@", buf, 0x16u);

        }
      }
    }
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    if (!v10 || !-[UIFocusSystem _isEnabled](self, "_isEnabled"))
      goto LABEL_45;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      v18 = self->_pendingFocusUpdateRequest;
      -[UIFocusSystem _dropFocusAndStartDeferring:suppressUpdate:](self, "_dropFocusAndStartDeferring:suppressUpdate:", 0, 1);
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = v18;

LABEL_45:
      -[UIFocusSystem _focusMovementCache](self, "_focusMovementCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "environmentWillDisappear:", v8);

      goto LABEL_46;
    }
    if (dyld_program_sdk_at_least() && (_UIIsPrivateMainBundle() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusSystem focusedItem](self, "focusedItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 830, CFSTR("The newly focused item or one of its parent environments is getting removed from the hierarchy in response of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focused item: %@; environment being removed: %@."),
        v28,
        v8);

      goto LABEL_45;
    }
    if (dyld_program_sdk_at_least() && _UIIsPrivateMainBundle())
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v20 = qword_1ECD7DAC0;
        if (!qword_1ECD7DAC0)
        {
          v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&qword_1ECD7DAC0);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        v22 = v21;
        -[UIFocusSystem focusedItem](self, "focusedItem");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v23;
        v63 = 2112;
        v64 = v8;
        v24 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response"
              " of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. F"
              "ocused item: %@; environment being removed: %@. This is a hard assert for other clients and requires immediate attention.";
        goto LABEL_41;
      }
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_43;
      -[UIFocusSystem focusedItem](self, "focusedItem");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v23;
      v63 = 2112;
      v64 = v8;
      v42 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response o"
            "f that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focus"
            "ed item: %@; environment being removed: %@. This is a hard assert for other clients and requires immediate attention.";
    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v25 = qword_1ECD7DAC8;
        if (!qword_1ECD7DAC8)
        {
          v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD7DAC8);
        }
        v26 = *(NSObject **)(v25 + 8);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        v22 = v26;
        -[UIFocusSystem focusedItem](self, "focusedItem");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v23;
        v63 = 2112;
        v64 = v8;
        v24 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response"
              " of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. F"
              "ocused item: %@; environment being removed: %@. This will become an assert in a future version.";
LABEL_41:
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
LABEL_42:

LABEL_43:
        goto LABEL_45;
      }
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_43;
      -[UIFocusSystem focusedItem](self, "focusedItem");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v23;
      v63 = 2112;
      v64 = v8;
      v42 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response o"
            "f that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focus"
            "ed item: %@; environment being removed: %@. This will become an assert in a future version.";
    }
    _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, v42, buf, 0x16u);
    goto LABEL_42;
  }
LABEL_46:

}

void __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  _UIFocusUpdateRequest *v6;
  id v7;
  void *v8;
  id v9;
  _UIFocusUpdateRequest *v10;
  id v11;
  _QWORD block[4];
  _UIFocusUpdateRequest *v13;

  v11 = a2;
  if (v11)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0 && (objc_msgSend(v11, sel_allowsWeakReference) & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke_2;
      block[3] = &unk_1E16B1B28;
      v10 = (_UIFocusUpdateRequest *)v11;
      v13 = v10;
      if (__allFocusSystems_block_invoke_once == -1)
      {
        v6 = v10;
        v5 = 0;
      }
      else
      {
        dispatch_once(&__allFocusSystems_block_invoke_once, block);
        v5 = 0;
        v6 = v13;
      }
LABEL_12:

      goto LABEL_13;
    }
    v5 = v11;
    if (*(id *)(a1 + 32) != v5)
    {
      v6 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", v5);
      -[_UIFocusUpdateRequest setAllowsFocusingCurrentItem:](v6, "setAllowsFocusingCurrentItem:", 1);
      objc_msgSend(*(id *)(a1 + 40), "_requestFocusUpdate:", v6);
      v7 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "environment");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v5)
          *a3 = 1;
      }

      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_13:

}

void __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = __allFocusSystems_block_invoke_2___s_category;
  if (!__allFocusSystems_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&__allFocusSystems_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Focus system attempting to use a deallocating focus environment. Offending object: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_focusEnvironmentDidBecomeVisible:(id)a3
{
  void *v4;
  BOOL HaveCommonHierarchy;
  id v6;

  v6 = a3;
  if (-[UIFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0
      || (-[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          HaveCommonHierarchy = _UIFocusEnvironmentsHaveCommonHierarchy(v6, v4),
          v4,
          !HaveCommonHierarchy))
    {
      -[UIFocusSystem _focusEnvironmentDidAppear:](self, "_focusEnvironmentDidAppear:", v6);
    }
  }

}

- (void)_focusEnvironmentDidAppear:(id)a3
{
  id v4;
  void *v5;
  UIFocusSystem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  UIFocusEnvironment *appearingFocusEnvironment;
  UIFocusEnvironment **p_appearingFocusEnvironment;
  void *v29;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  id location[2];
  CGRect v37;
  CGRect v38;

  v4 = a3;
  if (-[UIFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    if (-[NSHashTable containsObject:](self->_focusItemAncestorCache, "containsObject:", v4))
      -[UIFocusSystem _clearFocusItemAncestorCache](self, "_clearFocusItemAncestorCache");
    -[UIFocusSystem _focusMovementCache](self, "_focusMovementCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentDidAppear:", v4);

    if (-[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
    {
      if ((*(_BYTE *)&self->_flags & 2) == 0)
      {
        if (v4)
        {
          _UIFocusEnvironmentRootAncestorEnvironment(v4);
          v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }
        if (v6 != self)
          goto LABEL_31;
        objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
        -[UIFocusSystem _focusItemForValidation](self, "_focusItemForValidation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
        {
          if (!self->_pendingFocusUpdateRequest && -[UIFocusSystem _isEnabled](self, "_isEnabled"))
            -[UIFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
          goto LABEL_30;
        }
        _UIFocusEnvironmentFirstCommonAncestor(v7, v4);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 && (void *)v9 != v8)
        {
          if (!_UIFocusItemIsViewOrRespondsToSelector(v4))
            goto LABEL_18;
          objc_msgSend(v10, "focusItemContainer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinateSpace");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = _UIFocusItemFrameInCoordinateSpace(v4, v12);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v20 = _UIFocusItemFrameInCoordinateSpace(v8, v12);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v37.origin.x = v13;
          v37.origin.y = v15;
          v37.size.width = v17;
          v37.size.height = v19;
          if (!CGRectIsNull(v37))
          {
            v38.origin.x = v20;
            v38.origin.y = v22;
            v38.size.width = v24;
            v38.size.height = v26;
            if (!CGRectIsNull(v38))
            {
              if (_UIRectSmartIntersectsRect(v13, v15, v17, v19, v20, v22, v24, v26))
              {

LABEL_18:
                p_appearingFocusEnvironment = &self->_appearingFocusEnvironment;
                appearingFocusEnvironment = self->_appearingFocusEnvironment;
                if (appearingFocusEnvironment)
                {
                  _UIFocusEnvironmentFirstCommonAncestor(appearingFocusEnvironment, v10);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_storeStrong((id *)p_appearingFocusEnvironment, v29);
                  v10 = v29;
                }
                else
                {
                  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
                  objc_storeStrong((id *)&self->_appearingFocusEnvironment, v10);
                  if (!pendingFocusUpdateRequest)
                  {
                    v31 = _focusEnvironmentDidAppear____s_category[0];
                    if (!_focusEnvironmentDidAppear____s_category[0])
                    {
                      v31 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v31, _focusEnvironmentDidAppear____s_category);
                    }
                    if ((*(_BYTE *)v31 & 1) != 0)
                    {
                      v33 = *(NSObject **)(v31 + 8);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                      {
                        LOWORD(location[0]) = 0;
                        _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Scheduling focused item validation for appearing environment.", (uint8_t *)location, 2u);
                      }
                    }
                    objc_initWeak(location, self);
                    v32 = (void *)UIApp;
                    v34[0] = MEMORY[0x1E0C809B0];
                    v34[1] = 3221225472;
                    v34[2] = __44__UIFocusSystem__focusEnvironmentDidAppear___block_invoke;
                    v34[3] = &unk_1E16B3F40;
                    objc_copyWeak(&v35, location);
                    objc_msgSend(v32, "_performBlockAfterCATransactionCommits:", v34);
                    objc_destroyWeak(&v35);
                    objc_destroyWeak(location);
                  }
                }
                goto LABEL_29;
              }
            }
          }

        }
LABEL_29:

LABEL_30:
LABEL_31:

      }
    }
  }

}

void __44__UIFocusSystem__focusEnvironmentDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

- (id)_validatedAppearingFocusEnvironmentRequest
{
  UIFocusEnvironment *v3;
  unint64_t v4;
  void *v5;
  UIFocusSystem *v6;
  _UIFocusUpdateRequest *v7;
  void *appearingFocusEnvironment;
  _UIFocusMap *v9;
  UIFocusEnvironment *v10;
  NSObject *v12;
  void *v13;
  UIFocusEnvironment *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = self->_appearingFocusEnvironment;
  if (v3)
  {
    v4 = qword_1ECD7DAD0;
    if (!qword_1ECD7DAD0)
    {
      v4 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD7DAD0);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v12 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = v3;
        v15 = v12;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v23 = v18;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Validating focused item for appearing environment %{public}@.", buf, 0xCu);

      }
    }
    -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (_UIFocusEnvironmentRootAncestorEnvironment(v3),
          v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 != self))
    {
      v7 = 0;
      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;
LABEL_15:

      goto LABEL_16;
    }
    _UIFocusEnvironmentPreferredFocusMapContainer(v3);
    appearingFocusEnvironment = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (appearingFocusEnvironment)
      {
LABEL_11:
        v9 = -[_UIFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:]([_UIFocusMap alloc], "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", self, appearingFocusEnvironment, 0, 0, 0);
        if (-[_UIFocusMap verifyFocusabilityForItem:](v9, "verifyFocusabilityForItem:", v5))
        {
          v10 = self->_appearingFocusEnvironment;
          self->_appearingFocusEnvironment = 0;

          v7 = 0;
        }
        else
        {
          v7 = -[_UIFocusUpdateRequest initWithFocusSystem:environment:]([_UIFocusUpdateRequest alloc], "initWithFocusSystem:environment:", self, v3);
        }
        goto LABEL_14;
      }
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Unable to find a focus map container. This should never happen.", buf, 2u);
      }

    }
    else
    {
      if (appearingFocusEnvironment)
        goto LABEL_11;
      v20 = qword_1ECD7DAD8;
      if (!qword_1ECD7DAD8)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&qword_1ECD7DAD8);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Unable to find a focus map container. This should never happen.", buf, 2u);
      }
    }
    v7 = 0;
    v9 = (_UIFocusMap *)self->_appearingFocusEnvironment;
    self->_appearingFocusEnvironment = 0;
LABEL_14:

    goto LABEL_15;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (id)_validatedPendingFocusUpdateRequest
{
  _UIFocusUpdateRequest *v3;
  _UIFocusUpdateRequest *v4;
  _UIFocusUpdateRequest *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  UIFocusSystem *v14;
  __CFString *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = self->_pendingFocusUpdateRequest;
  v4 = v3;
  if (v3 && !-[_UIFocusUpdateRequest isValidInFocusSystem:](v3, "isValidInFocusSystem:", self))
  {
    v6 = _validatedPendingFocusUpdateRequest___s_category;
    if (!_validatedPendingFocusUpdateRequest___s_category)
    {
      v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_validatedPendingFocusUpdateRequest___s_category);
    }
    v7 = *(id *)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[_UIFocusUpdateRequest environment](v4, "environment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v8);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = CFSTR("(nil)");
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = self;
      v15 = v12;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Found invalid pending focus update request for environment %{public}@ in focus system %{public}@.", buf, 0x16u);

    }
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)_topEnvironment
{
  UIFocusSystem *v2;
  UIFocusSystem *v3;
  void *v4;
  UIFocusSystem *v5;
  void *v6;
  UIFocusEnvironment *disappearingFocusEnvironment;

  v2 = self;
  v3 = v2;
  v4 = v2;
  if ((*(_BYTE *)&v2->_flags & 0x40) == 0
    || (-[UIFocusSystem delegate](v2, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "_topEnvironmentForFocusSystem:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v6,
        v4)
    && ((disappearingFocusEnvironment = v3->_disappearingFocusEnvironment) != 0
     && _UIFocusEnvironmentIsAncestorOfEnvironment(disappearingFocusEnvironment, v4)
     || !_UIFocusEnvironmentIsAncestorOfEnvironment(v3, v4)))
  {
    v5 = v3;
  }
  else
  {
    v5 = v4;
    v4 = v5;
  }

  return v5;
}

- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4
{
  return -[UIFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", a3, 0, a4);
}

- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5
{
  UIFocusSystem *v8;
  id v9;
  void *v10;
  UIFocusSystem *v11;
  UIFocusSystem *v12;
  _BOOL4 IsAncestorOfEnvironment;
  _BOOL4 v14;
  void *v15;
  _UIFocusUpdateRequest *v16;
  _UIFocusUpdateRequest *v17;
  int v18;
  void *v19;
  BOOL v20;
  const __CFString *v21;
  void *v22;
  BOOL v23;
  const __CFString *v26;
  void *v27;

  v8 = (UIFocusSystem *)a3;
  v9 = a5;
  if (!-[UIFocusSystem _isEnabled](self, "_isEnabled"))
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("Focus is not currently enabled in this environment's focus system, updates will be delayed."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIssue:", v10);

  }
  -[UIFocusSystem _topEnvironment](self, "_topEnvironment");
  v11 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("The current first responder is not a focus environment, no focus updates are allowed as that would force the first responder to change."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIssue:", v15);
    v23 = 0;
LABEL_25:

    goto LABEL_26;
  }
  IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v11, v8);
  if (v12 != v8)
  {
    v14 = IsAncestorOfEnvironment;
    -[UIFocusSystem _focusItemForValidation](self, "_focusItemForValidation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_pendingFocusUpdateRequest;
    v17 = v16;
    if (v16)
    {
      if (v15)
        v18 = 1;
      else
        v18 = v14;
      if (v18 != 1
        || (-[_UIFocusUpdateRequest environment](v16, "environment"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = _UIFocusEnvironmentIsAncestorOfEnvironment(v8, v19),
            v19,
            !v20))
      {
        v21 = CFSTR("An ancestor of this environment has already requested a focus update, which takes priority.");
LABEL_12:
        +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addIssue:", v22);

LABEL_13:
        v23 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (v15)
    {
      if (!_UIFocusEnvironmentIsAncestorOfEnvironment(v8, v15))
      {
        v21 = CFSTR("This environment does not contain the currently focused item.");
        goto LABEL_12;
      }
    }
    else if (v12 == self || !v14)
    {
      if (v12 == self)
        v26 = CFSTR("Nothing is currently focused, so this environment's request will be ignored and focus will be reset to the focus system's preferred focused item.");
      else
        v26 = CFSTR("This environment is not inside the current first responder.");
      +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIssue:", v27);

      if (a4)
      {
        v23 = 0;
        *a4 = objc_retainAutorelease(v12);
        goto LABEL_24;
      }
      goto LABEL_13;
    }
    v23 = 1;
    goto LABEL_24;
  }
  v23 = 1;
LABEL_26:

  return v23;
}

- (void)_updateWantsTreeLocking
{
  void *v3;
  int v4;
  _UIFocusTreeLock *treeLock;
  _UIFocusTreeLock *v6;
  _UIFocusTreeLock *v7;

  -[UIFocusSystem behavior](self, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsTreeLocking");

  treeLock = self->_treeLock;
  if (v4)
  {
    if (!treeLock)
    {
      v6 = (_UIFocusTreeLock *)objc_opt_new();
      v7 = self->_treeLock;
      self->_treeLock = v6;

    }
  }
  else if (treeLock)
  {
    self->_treeLock = 0;

    -[UIFocusSystem _reevaluateLockedEnvironments](self, "_reevaluateLockedEnvironments");
  }
}

- (BOOL)_isEnvironmentLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[UIFocusSystem treeLock](self, "treeLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isEnvironmentLocked:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)_lockEnvironment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIFocusSystem treeLock](self, "treeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "lockEnvironmentTree:", v6);

}

- (void)_unlockEnvironment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIFocusSystem treeLock](self, "treeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "unlockEnvironmentTree:", v6))
    -[UIFocusSystem _reevaluateLockedEnvironments](self, "_reevaluateLockedEnvironments");

}

- (void)updateFocusIfNeeded
{
  $C26450B17F84A6D740AC00827B43141C flags;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *deepestPreferredFocusableItemCacheForCurrentUpdate;
  void *v10;
  BOOL IsAncestorOfEnvironment;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  unint64_t v25;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  UIFocusEnvironment *appearingFocusEnvironment;
  _UIFocusUpdateRequest *v28;
  unint64_t v29;
  NSObject *v30;
  id v31;
  _BYTE *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  _UIFocusUpdateRequest *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  id v45;
  _BYTE *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIFocusEnvironment *disappearingFocusEnvironment;
  void *v53;
  _BYTE *v54;
  _UIFocusUpdateReport *v55;
  void *v56;
  unint64_t v57;
  NSObject *v58;
  unint64_t v59;
  _UIFocusUpdateRequest *v60;
  _UIFocusUpdateRequest *v61;
  UIFocusEnvironment *v62;
  UIFocusEnvironment *v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  _UIDebugIssueReport *v69;
  _UIDebugLogReport *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  int v77;
  UIFocusEnvironment *v78;
  _UIFocusUpdateRequest *v79;
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!-[UIFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
    return;
  if (!-[UIFocusSystem _isEnabled](self, "_isEnabled"))
    return;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 9) != 0)
    return;
  if (self->_appearingFocusEnvironment)
  {
    v5 = -[UIFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:");
    flags = self->_flags;
    if (v5)
    {
      self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 8);
      return;
    }
  }
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v6 = *(_BYTE *)&flags & 0x20;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 0x20);
    -[UIFocusSystem _validatedPendingFocusUpdateRequest](self, "_validatedPendingFocusUpdateRequest");
    v7 = objc_claimAutoreleasedReturnValue();
    -[UIFocusSystem _validatedAppearingFocusEnvironmentRequest](self, "_validatedAppearingFocusEnvironmentRequest");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
    {
      -[UIFocusSystem _topEnvironment](self, "_topEnvironment");
      deepestPreferredFocusableItemCacheForCurrentUpdate = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend((id)v7, "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v10);

        if (!IsAncestorOfEnvironment)
        {
          objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", deepestPreferredFocusableItemCacheForCurrentUpdate);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = v12;
        }
      }
      if (v8)
      {
        objc_msgSend((id)v8, "environment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _UIFocusEnvironmentFirstCommonAncestor(deepestPreferredFocusableItemCacheForCurrentUpdate, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != deepestPreferredFocusableItemCacheForCurrentUpdate)
        {
          v15 = v14;

          deepestPreferredFocusableItemCacheForCurrentUpdate = v15;
        }
        if (v7)
        {
          objc_msgSend((id)v7, "environment");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v8, "environment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _UIFocusEnvironmentFirstCommonAncestor(v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1205, CFSTR("The appearing environment and the requested environment are not part of the same focus system."));

          }
          objc_msgSend((id)v7, "environment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 != v19)
          {
            objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", v18);
            v20 = objc_claimAutoreleasedReturnValue();

            v7 = v20;
          }

        }
        else
        {
          v7 = (uint64_t)(id)v8;
        }

      }
      objc_msgSend((id)v7, "environment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[UIFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:", v23);

      if (v24)
      {
        v25 = qword_1ECD7DAE8;
        if (!qword_1ECD7DAE8)
        {
          v25 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD7DAE8);
        }
        if ((*(_BYTE *)v25 & 1) != 0)
        {
          v66 = *(NSObject **)(v25 + 8);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = v66;
            objc_msgSend((id)v7, "environment");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v81 = v68;
            _os_log_impl(&dword_185066000, v67, OS_LOG_TYPE_ERROR, "Postponing update for locked environment %@", buf, 0xCu);

          }
        }
        self->_flags = ($C26450B17F84A6D740AC00827B43141C)(v6 | *(_DWORD *)&self->_flags & 0xFFFFFFDF | 8);
        goto LABEL_78;
      }
      v78 = self->_appearingFocusEnvironment;
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      v28 = (_UIFocusUpdateRequest *)(id)v7;
      v29 = qword_1ECD7DAF0;
      if (!qword_1ECD7DAF0)
      {
        v29 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&qword_1ECD7DAF0);
      }
      v77 = v6;
      v30 = *(id *)(v29 + 8);
      if (os_signpost_id_make_with_pointer(*(os_log_t *)(v29 + 8), v28) - 1 <= 0xFFFFFFFFFFFFFFFDLL
        && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

      v31 = -[UIFocusUpdateContext _initWithFocusUpdateRequest:]([UIFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v28);
      v32 = (_BYTE *)qword_1ECD7DAF8;
      if (!qword_1ECD7DAF8)
      {
        v32 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v32, (unint64_t *)&qword_1ECD7DAF8);
      }
      if ((*v32 & 1) != 0)
      {
        v69 = objc_alloc_init(_UIDebugIssueReport);
        objc_msgSend(v31, "_setValidationReport:", v69);

        v70 = objc_alloc_init(_UIDebugLogReport);
        objc_msgSend(v31, "_setPreferredFocusReport:", v70);

      }
      objc_msgSend(v31, "nextFocusedItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v28;
      if (v33 || !deepestPreferredFocusableItemCacheForCurrentUpdate)
      {
        v45 = v31;
LABEL_66:

        v31 = v45;
        v7 = (uint64_t)v28;
      }
      else
      {
        v7 = (uint64_t)v28;
        while (1)
        {
          objc_msgSend((id)v7, "environment");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
            break;
          v35 = (void *)v34;
          objc_msgSend((id)v7, "environment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36 == deepestPreferredFocusableItemCacheForCurrentUpdate)
            break;
          objc_msgSend((id)v7, "environment");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (_UIFocusEnvironmentPrefersFocusContainment(v37))
          {
            v38 = -[UIFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");

            if (v38 == 3)
              -[UIFocusSystem _resetFocusDeferral](self, "_resetFocusDeferral");
          }
          else
          {

          }
          objc_msgSend((id)v7, "requestByRedirectingRequestToNextContainerEnvironment");
          v39 = (_UIFocusUpdateRequest *)objc_claimAutoreleasedReturnValue();
          if (os_variant_has_internal_diagnostics())
          {
            if (!v39)
            {
              __UIFaultDebugAssertLog();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_185066000, v75, OS_LOG_TYPE_FAULT, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
              }

              break;
            }
          }
          else if (!v39)
          {
            v64 = qword_1ECD7DB00;
            if (!qword_1ECD7DB00)
            {
              v64 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v64, (unint64_t *)&qword_1ECD7DB00);
            }
            v65 = *(NSObject **)(v64 + 8);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v65, OS_LOG_TYPE_ERROR, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
            }
            break;
          }
          -[_UIFocusUpdateRequest environment](v39, "environment");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = _UIFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v40);

          if (!v41)
          {
            objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", deepestPreferredFocusableItemCacheForCurrentUpdate);
            v42 = objc_claimAutoreleasedReturnValue();

            v39 = (_UIFocusUpdateRequest *)v42;
            if (!v42)
              break;
          }
          -[_UIFocusUpdateRequest environment](v39, "environment");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[UIFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:", v43);

          if (v44)
          {
            v59 = qword_1ECD7DB08;
            if (!qword_1ECD7DB08)
            {
              v59 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v59, (unint64_t *)&qword_1ECD7DB08);
            }
            if ((*(_BYTE *)v59 & 1) != 0)
            {
              v72 = *(NSObject **)(v59 + 8);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                v73 = v72;
                -[_UIFocusUpdateRequest environment](v39, "environment");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v81 = v74;
                _os_log_impl(&dword_185066000, v73, OS_LOG_TYPE_ERROR, "Postponing update for locked environment %@", buf, 0xCu);

              }
            }
            *(_DWORD *)&self->_flags |= 8u;
            v60 = self->_pendingFocusUpdateRequest;
            self->_pendingFocusUpdateRequest = v39;
            v61 = v39;

            v62 = self->_appearingFocusEnvironment;
            self->_appearingFocusEnvironment = v78;
            v63 = v78;

            goto LABEL_78;
          }
          v28 = v39;

          v45 = -[UIFocusUpdateContext _initWithFocusUpdateRequest:]([UIFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v28);
          v46 = (_BYTE *)qword_1ECD7DB10;
          if (!qword_1ECD7DB10)
          {
            v46 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
            atomic_store((unint64_t)v46, (unint64_t *)&qword_1ECD7DB10);
          }
          if ((*v46 & 1) != 0)
          {
            objc_msgSend(v31, "_preferredFocusReport");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addLineBreak");

            objc_msgSend(v31, "_preferredFocusReport");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addMessage:", CFSTR(" === unable to find focused item in context. retrying with updated request. === "));

            objc_msgSend(v31, "_preferredFocusReport");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addLineBreak");

            objc_msgSend(v31, "_validationReport");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "_setValidationReport:", v50);

            objc_msgSend(v31, "_preferredFocusReport");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "_setPreferredFocusReport:", v51);

          }
          objc_msgSend(v45, "nextFocusedItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (uint64_t)v28;
          v31 = v45;
          if (v33)
            goto LABEL_66;
        }
      }
      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      -[UIFocusSystem updateThrottle](self, "updateThrottle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "didCreateProgrammaticFocusUpdateContext:", v31);

      v54 = (_BYTE *)qword_1ECD7DB18;
      if (!qword_1ECD7DB18)
      {
        v54 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v54, (unint64_t *)&qword_1ECD7DB18);
      }
      if ((*v54 & 1) != 0)
      {
        v55 = -[_UIFocusUpdateReport initWithFocusSystem:]([_UIFocusUpdateReport alloc], "initWithFocusSystem:", self);
        -[_UIFocusUpdateReport setContext:](v55, "setContext:", v31);
      }
      else
      {
        v55 = 0;
      }
      -[UIFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v31, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v56, v55);
      v57 = qword_1ECD7DB20;
      if (!qword_1ECD7DB20)
      {
        v57 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v57, (unint64_t *)&qword_1ECD7DB20);
      }
      v58 = *(id *)(v57 + 8);
      v6 = v77;
      if (os_signpost_id_make_with_pointer(*(os_log_t *)(v57 + 8), v79) - 1 <= 0xFFFFFFFFFFFFFFFDLL
        && os_signpost_enabled(v58))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

    }
    else
    {
      v7 = 0;
    }
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v6);
    deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
    self->_deepestPreferredFocusableItemCacheForCurrentUpdate = 0;
LABEL_78:

    return;
  }
  v21 = qword_1ECD7DAE0;
  if (!qword_1ECD7DAE0)
  {
    v21 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v21, (unint64_t *)&qword_1ECD7DAE0);
  }
  v22 = *(NSObject **)(v21 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Calling updateFocusIfNeeded while a focus update is in progress. This call will be ignored.", buf, 2u);
  }
}

- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  int v11;
  unint64_t v12;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v14;
  id v15;
  _UIFocusUpdateRequest *pendingFocusUpdateRequest;
  UIFocusEnvironment *appearingFocusEnvironment;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1315, CFSTR("Attempting to initiate a focus update with a nil context."));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  objc_msgSend(v7, "_willUpdateFocusFromFocusedItem:", WeakRetained);
  v10 = objc_msgSend(v7, "_isValidInFocusSystem:", self);
  v11 = objc_msgSend(v8, "shouldLog");
  if ((v10 & 1) != 0)
  {
    if (v11)
    {
      v12 = qword_1ECD7DB38;
      if (!qword_1ECD7DB38)
      {
        v12 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7DB38);
      }
      if ((*(_BYTE *)v12 & 1) != 0)
      {
        v41 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v41;
          +[_UIDebugReportFormatter defaultFormatter](_UIFocusUpdateReportFormatter, "defaultFormatter");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringFromReport:", v8);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 138543618;
          v46 = v7;
          v47 = 2114;
          v48 = v44;
          _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "Updating focus with context %{public}@:\n%{public}@", (uint8_t *)&v45, 0x16u);

        }
      }
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1336, CFSTR("_ignoreFocusUpdateIfNeeded should never be YES at the beginning of a focus update."));

      flags = self->_flags;
    }
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      -[UIFocusSystem delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_focusSystem:willUpdateFocusInContext:", self, v7);

    }
    -[UIFocusSystem _sendWillUpdateFocusNotificationsInContext:](self, "_sendWillUpdateFocusNotificationsInContext:", v7);
    objc_storeWeak((id *)&self->_previousFocusedItem, WeakRetained);
    objc_msgSend(v7, "nextFocusedItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_focusedItem, v15);
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    appearingFocusEnvironment = self->_appearingFocusEnvironment;
    self->_appearingFocusEnvironment = 0;

    -[UIFocusSystem _clearFocusItemAncestorCache](self, "_clearFocusItemAncestorCache");
    -[UIFocusSystem _sendDidUpdateFocusNotificationsInContext:](self, "_sendDidUpdateFocusNotificationsInContext:", v7);
    if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    {
      -[UIFocusSystem delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_focusSystem:didUpdateFocusInContext:", self, v7);

    }
    -[UIFocusSystem _focusCastingController](self, "_focusCastingController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[UIFocusSystem _focusCastingController](self, "_focusCastingController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateFocusCastingWithContext:", v7);

    }
    -[UIFocusSystem _focusMovementCache](self, "_focusMovementCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[UIFocusSystem _focusMovementCache](self, "_focusMovementCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateCacheWithContext:", v7);

    }
    -[UIFocusSystem _didFinishUpdatingFocusInContext:](self, "_didFinishUpdatingFocusInContext:", v7);
    objc_msgSend(v7, "_didUpdateFocus");
    *(_DWORD *)&self->_flags &= ~2u;
    if (v15 && v15 != WeakRetained)
    {
      objc_msgSend(v7, "_focusMovement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        v24 = 1;
      else
        v24 = objc_msgSend(v7, "_isDeferredUpdate");
      -[UIFocusSystem _tickHasSeenFocusedItemTimer:](self, "_tickHasSeenFocusedItemTimer:", v24);

    }
    v32 = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
    objc_msgSend(v7, "_previouslyFocusedGroupIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v32 && v33)
    {
      objc_msgSend(v7, "_nextFocusedGroupIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (!v35 || (objc_msgSend(v35, "isEqualToString:", v34) & 1) == 0)
      {
        -[UIFocusSystem _focusGroupHistory](self, "_focusGroupHistory");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setLastFocusedItem:forGroupIdentifier:", v32, v34);

      }
    }

  }
  else if (v11)
  {
    v25 = qword_1ECD7DB28;
    if (!qword_1ECD7DB28)
    {
      v25 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&qword_1ECD7DB28);
    }
    v26 = *(NSObject **)(v25 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      +[_UIDebugReportFormatter defaultFormatter](_UIFocusUpdateReportFormatter, "defaultFormatter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringFromReport:", v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543618;
      v46 = v7;
      v47 = 2114;
      v48 = v29;
      _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "Failed to update focus with context %{public}@:\n%{public}@", (uint8_t *)&v45, 0x16u);

    }
  }
  else
  {
    v30 = qword_1ECD7DB30;
    if (!qword_1ECD7DB30)
    {
      v30 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&qword_1ECD7DB30);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v45 = 138543362;
      v46 = v7;
      _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "Failed to update focus with context %{public}@. No additional info available.", (uint8_t *)&v45, 0xCu);
    }
  }

  return v10;
}

- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_didUpdateFocusInContext:", v6);
  }
  else if ((*((_BYTE *)&self->_flags + 1) & 0x40) != 0)
  {
    -[UIFocusSystem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusSystem:environment:didUpdateFocusInContext:", self, v8, v6);

  }
}

- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__UIFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_1E16C6A88;
  v9 = v5;
  v6 = v5;
  -[UIFocusSystem _sendNotificationsForFocusUpdateInContext:usingBlock:](self, "_sendNotificationsForFocusUpdateInContext:usingBlock:", v6, v8);

}

void __60__UIFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_willUpdateFocusInContext:", *(_QWORD *)(a1 + 32));

}

- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__UIFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_1E16C6AB0;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  -[UIFocusSystem _sendNotificationsForFocusUpdateInContext:usingBlock:](self, "_sendNotificationsForFocusUpdateInContext:usingBlock:", v6, v8);

}

uint64_t __59__UIFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyEnvironment:didUpdateFocusInContext:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  objc_msgSend(v7, "previouslyFocusedItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextFocusedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_commonAncestorEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
    {
      -[UIFocusSystem delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_focusSystem:willMessageOldFocusNodes:", self, v7);

    }
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke;
    v20[3] = &unk_1E16C6AD8;
    v21 = v12;
    v22 = v9;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v10, v20);

  }
  if (v11)
  {
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
    {
      -[UIFocusSystem delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_focusSystem:willMessageNewFocusNodes:", self, v7);

    }
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2;
    v18[3] = &unk_1E16C6B00;
    v19 = v9;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v11, v18);

  }
}

uint64_t __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) != a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  *a3 = 1;
  return result;
}

uint64_t __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIFocusEnvironment)_disappearingFocusEnvironment
{
  return self->_disappearingFocusEnvironment;
}

- (void)_performWithoutFocusUpdates:(id)a3
{
  $C26450B17F84A6D740AC00827B43141C flags;

  if (a3)
  {
    flags = self->_flags;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | (2
                                                                                              * ((*(unsigned int *)&flags >> 1) & 1)));
  }
}

- (BOOL)_updateFocusImmediatelyWithContext:(id)a3
{
  id v5;
  _BYTE *v6;
  _UIFocusUpdateReport *v7;
  void *v8;
  BOOL v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1505, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v6 = (_BYTE *)_updateFocusImmediatelyWithContext____s_category;
  if (!_updateFocusImmediatelyWithContext____s_category)
  {
    v6 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v6, (unint64_t *)&_updateFocusImmediatelyWithContext____s_category);
  }
  if ((*v6 & 1) != 0)
  {
    objc_msgSend(v5, "_focusMovement");
    v7 = (_UIFocusUpdateReport *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v7 = -[_UIFocusUpdateReport initWithFocusSystem:]([_UIFocusUpdateReport alloc], "initWithFocusSystem:", self);
      -[_UIFocusUpdateReport setContext:](v7, "setContext:", v5);
    }
  }
  else
  {
    v7 = 0;
  }
  -[UIFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UIFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v8, v7);
  return v9;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  UIFocusSystem *v16;
  void *v17;
  void *v18;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  BOOL v24;
  BOOL v25;
  uint8_t buf[16];

  v8 = a3;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
      }

    }
    else
    {
      v20 = _updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate____s_category;
      if (!_updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&_updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if (!dyld_program_sdk_at_least() || -[UIFocusSystem _isEnabled](self, "_isEnabled"))
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __104__UIFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke;
      v23[3] = &unk_1E16B70C0;
      v24 = a4;
      v23[4] = self;
      v25 = a5;
      v9 = (void (**)(_QWORD))_Block_copy(v23);
      -[UIFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", v8, 0, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8
        && (objc_msgSend(v10, "nextFocusedItem"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        -[UIFocusSystem _topEnvironment](self, "_topEnvironment");
        v16 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
        if (v16 == self)
        {

          v16 = 0;
        }
        -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16 && v17 && !_UIFocusEnvironmentIsAncestorOfEnvironment(v16, v17))
          v9[2](v9);

      }
      else
      {
        if (!-[UIFocusSystem _isEnabled](self, "_isEnabled"))
        {
          objc_msgSend(v11, "nextFocusedItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeWeak((id *)&self->_previousFocusedItem, v15);

          -[UIFocusSystem _setNeedsFocusRestoration](self, "_setNeedsFocusRestoration");
          v14 = 1;
LABEL_26:

          goto LABEL_27;
        }
        if (objc_msgSend(v11, "_isValidInFocusSystem:", self))
        {
          -[UIFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v11, 0);
          v13 = objc_claimAutoreleasedReturnValue();

          if (-[UIFocusSystem _updateFocusImmediatelyWithContext:](self, "_updateFocusImmediatelyWithContext:", v13))
          {
            if (!-[UIFocusSystem _hasValidItemForCurrentDeferralState](self, "_hasValidItemForCurrentDeferralState"))
              v9[2](v9);
            v14 = 1;
          }
          else
          {
            v14 = 0;
          }
          v11 = (void *)v13;
          goto LABEL_26;
        }
      }
      v14 = 0;
      goto LABEL_26;
    }
    -[UIFocusSystem _cancelPendingFocusRestoration](self, "_cancelPendingFocusRestoration");
  }
  v14 = 0;
LABEL_27:

  return v14;
}

uint64_t __104__UIFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
  {
    result = objc_msgSend(*(id *)(result + 32), "_effectiveFocusDeferralBehavior");
    if (result)
      result = objc_msgSend(*(id *)(v1 + 32), "_resetFocusDeferral");
  }
  if (!*(_BYTE *)(v1 + 41))
    return objc_msgSend(*(id *)(v1 + 32), "requestFocusUpdateToEnvironment:", *(_QWORD *)(v1 + 32));
  return result;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3
{
  return -[UIFocusSystem _updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:](self, "_updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:", a3, 1, 0);
}

- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4
{
  -[UIFocusSystem _updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:](self, "_updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:", 0, a3, a4);
}

- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3
{
  return -[UIFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", a3, 0, 0);
}

- (id)_contextForUpdateToEnvironment:(id)a3
{
  return -[UIFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", a3, 1, 1);
}

- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _UIFocusUpdateRequest *v9;
  _UIFocusUpdateRequest *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = -[_UIFocusUpdateRequest initWithFocusSystem:environment:]([_UIFocusUpdateRequest alloc], "initWithFocusSystem:environment:", self, v8);
  }
  else
  {
    +[_UIFocusUpdateRequest requestForRemovingFocusInFocusSystem:](_UIFocusUpdateRequest, "requestForRemovingFocusInFocusSystem:", self);
    v9 = (_UIFocusUpdateRequest *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[_UIFocusUpdateRequest setAllowsOverridingPreferedFocusEnvironments:](v9, "setAllowsOverridingPreferedFocusEnvironments:", v6);
  -[_UIFocusUpdateRequest setAllowsDeferral:](v10, "setAllowsDeferral:", v5);
  v11 = -[UIFocusUpdateContext _initWithFocusUpdateRequest:]([UIFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v10);

  return v11;
}

- (BOOL)_performFocusMovement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UIFocusSystem _movementPerformer](self, "_movementPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "performFocusMovement:", v4);

  return v6;
}

- (void)invalidateFocusItemContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFocusSystem _focusMovementCache](self, "_focusMovementCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateFocusItemContainer:", v4);

}

- (_UIFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate
{
  void *v3;
  int v4;
  _UIFocusEnvironmentPreferenceCache *v5;
  _UIFocusEnvironmentPreferenceCache *deepestPreferredFocusableItemCacheForCurrentUpdate;

  if (!self->_deepestPreferredFocusableItemCacheForCurrentUpdate && (*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    -[UIFocusSystem behavior](self, "behavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "cachesPreferredEnvironmentEnumerationResults");

    if (v4)
    {
      v5 = (_UIFocusEnvironmentPreferenceCache *)objc_opt_new();
      deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
      self->_deepestPreferredFocusableItemCacheForCurrentUpdate = v5;

    }
  }
  return self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
}

- (void)_buildFocusItemAncestorCacheIfNecessary
{
  NSHashTable **p_focusItemAncestorCache;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  p_focusItemAncestorCache = &self->_focusItemAncestorCache;
  if (!self->_focusItemAncestorCache)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __56__UIFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke;
      v6[3] = &unk_1E16C6B28;
      v7 = v4;
      _UIFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);

    }
    else
    {
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }

  }
}

uint64_t __56__UIFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_clearFocusItemAncestorCache
{
  NSHashTable *focusItemAncestorCache;

  focusItemAncestorCache = self->_focusItemAncestorCache;
  self->_focusItemAncestorCache = 0;

}

- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4
{
  char *v7;
  int v8;
  BOOL IsAncestorOfEnvironment;
  char *WeakRetained;
  int v12;
  void *v13;
  id v14;

  v7 = (char *)a3;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v8 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_4;
  v12 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic)
    goto LABEL_4;
  while (v8 >= v12)
  {
    _UIInternalPreferenceSync(v8, &_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic, (uint64_t)CFSTR("FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v12 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic;
    if (v8 == _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic)
      goto LABEL_4;
  }
  if (!byte_1EDDA7D6C)
  {
LABEL_4:
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1680, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment != nil"));

    }
    -[UIFocusSystem _buildFocusItemAncestorCacheIfNecessary](self, "_buildFocusItemAncestorCacheIfNecessary");
    if (a4)
    {
      IsAncestorOfEnvironment = -[NSHashTable containsObject:](self->_focusItemAncestorCache, "containsObject:", v7);
    }
    else
    {
      WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_focusedItem);
      IsAncestorOfEnvironment = WeakRetained != v7
                             && -[NSHashTable containsObject:](self->_focusItemAncestorCache, "containsObject:", v7);

    }
  }
  else
  {
    if (!a4)
    {
      a2 = (SEL)objc_loadWeakRetained((id *)&self->_focusedItem);
      if (a2 == v7)
      {
        IsAncestorOfEnvironment = 0;
        a2 = v7;
LABEL_23:

        goto LABEL_12;
      }
    }
    v14 = objc_loadWeakRetained((id *)&self->_focusedItem);
    IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v14);

    if (!a4)
      goto LABEL_23;
  }
LABEL_12:

  return IsAncestorOfEnvironment;
}

- (void)_reevaluateLockedEnvironments
{
  $C26450B17F84A6D740AC00827B43141C flags;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location[2];

  flags = self->_flags;
  self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFF7);
  if ((*(_BYTE *)&flags & 8) != 0 && (self->_pendingFocusUpdateRequest || self->_appearingFocusEnvironment))
  {
    v4 = _reevaluateLockedEnvironments___s_category;
    if (!_reevaluateLockedEnvironments___s_category)
    {
      v4 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_reevaluateLockedEnvironments___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v6 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Trying to execute postponed update...", (uint8_t *)location, 2u);
      }
    }
    objc_initWeak(location, self);
    v5 = (void *)UIApp;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__UIFocusSystem__reevaluateLockedEnvironments__block_invoke;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, location);
    objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __46__UIFocusSystem__reevaluateLockedEnvironments__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

- (void)_setNeedsFocusRestoration
{
  *(_DWORD *)&self->_flags |= 4u;
}

- (void)_cancelPendingFocusRestoration
{
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)_handleFocusMovementAction:(id)a3
{
  -[UIFocusSystem setPendingFocusMovementAction:](self, "setPendingFocusMovementAction:", a3);
  if (-[UIFocusSystem waitingForFocusMovementAction](self, "waitingForFocusMovementAction"))
  {
    -[UIFocusSystem _setEnabled:](self, "_setEnabled:", 1);
    -[UIFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 0);
  }
}

- (UIFocusEnvironment)_deepestPreferredFocusEnvironment
{
  void *v3;
  void *v4;
  id v5;
  UIFocusEnvironment **p_deepestPreferredFocusEnvironment;
  id WeakRetained;
  _UIDeepestPreferredEnvironmentSearch *v8;
  void *v9;
  void *v10;

  -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    p_deepestPreferredFocusEnvironment = &self->_deepestPreferredFocusEnvironment;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deepestPreferredFocusEnvironment);

    if (!WeakRetained)
    {
      v8 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      -[_UIDeepestPreferredEnvironmentSearch deepestPreferredFocusEnvironmentForEnvironment:](v8, "deepestPreferredFocusEnvironmentForEnvironment:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_deepestPreferredFocusEnvironment, v9);

    }
    v5 = objc_loadWeakRetained((id *)p_deepestPreferredFocusEnvironment);
  }
  v10 = v5;

  return (UIFocusEnvironment *)v10;
}

- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3
{
  UIFocusSystem *v4;
  id v5;
  void *v6;

  if ((*((_BYTE *)&self->_flags + 2) & 0x10) == 0)
    return 0;
  v4 = self;
  v5 = a3;
  -[UIFocusSystem delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_focusSystem:shouldReverseLayoutDirectionForEnvironment:", v4, v5);

  return (char)v4;
}

- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3
{
  UIFocusSystem *v4;
  id v5;
  void *v6;

  if ((*((_BYTE *)&self->_flags + 2) & 0x20) == 0)
    return 0;
  v4 = self;
  v5 = a3;
  -[UIFocusSystem delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_focusSystem:shouldReverseLinearWrappingForEnvironment:", v4, v5);

  return (char)v4;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  void *v2;
  char v3;

  -[UIFocusSystem behavior](self, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modernFocusedItemGetterBehavior") ^ 1;

  return v3;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 1;
}

- (UIFocusSystem)_hostFocusSystem
{
  return 0;
}

- (BOOL)_uiktest_updateFocusToItem:(id)a3
{
  UIFocusSystem *v3;
  void *v4;

  v3 = self;
  -[UIFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[UIFocusSystem _updateFocusWithContext:report:](v3, "_updateFocusWithContext:report:", v4, 0);

  return (char)v3;
}

- (void)_uiktest_setPreviousFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_previousFocusedItem, a3);
}

- (void)_uiktest_disableFocusDeferral
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1807, CFSTR("This method is only to be used during UIKit tests."));

}

- (void)_uiktest_disableThrottle
{
  _UIFocusUpdateThrottle *updateThrottle;

  -[_UIFocusUpdateThrottle teardown](self->_updateThrottle, "teardown");
  updateThrottle = self->_updateThrottle;
  self->_updateThrottle = 0;

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 64;
    else
      v5 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 128;
    else
      v6 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 256;
    else
      v7 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 512;
    else
      v8 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 1024;
    else
      v9 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 2048;
    else
      v10 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4096;
    else
      v11 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x2000;
    else
      v12 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 0x4000;
    else
      v13 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 0x8000;
    else
      v14 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 0x10000;
    else
      v15 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 0x20000;
    else
      v16 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 0x40000;
    else
      v17 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v17);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 0x80000;
    else
      v18 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x100000;
    else
      v19 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 0x200000;
    else
      v20 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 0x400000;
    else
      v21 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v21);
  }

}

- (BOOL)_shouldRestoreFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char IsAncestorOfEnvironment;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1852, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  -[UIFocusSystem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    IsAncestorOfEnvironment = objc_msgSend(v6, "_focusSystem:shouldRestoreFocusInContext:", self, v5);
  }
  else
  {
    objc_msgSend(v5, "nextFocusedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(self, v8);

  }
  return IsAncestorOfEnvironment;
}

- (void)_didFinishUpdatingFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusSystem.m"), 1864, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    v5 = 0;
  }
  objc_msgSend(v5, "_sourceItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateFocusedRegion");

  objc_msgSend(v11, "_destinationItemInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateFocusedRegion");

  -[UIFocusSystem delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (*((_BYTE *)&self->_flags + 1) & 8) != 0)
    objc_msgSend(v8, "_focusSystem:didFinishUpdatingFocusInContext:", self, v11);

}

- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[UIFocusSystem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (*((_BYTE *)&self->_flags + 2) & 0x40) != 0)
    v9 = objc_msgSend(v7, "_focusSystem:isScrollingScrollableContainer:targetContentOffset:", self, v6, a4);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4
{
  UIFocusSystem *v5;
  id v6;
  void *v7;

  if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    return 0;
  v5 = self;
  v6 = a3;
  -[UIFocusSystem delegate](v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "_focusSystem:handleFailedMovementRequest:", v5, v6);

  return (char)v5;
}

- (void)setBehavior:(id)a3
{
  _UIFocusBehavior *v5;
  _UIFocusBehavior *v6;

  v5 = (_UIFocusBehavior *)a3;
  if (self->_behavior != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_behavior, a3);
    -[UIFocusSystem _focusBehaviorDidChange](self, "_focusBehaviorDidChange");
    v5 = v6;
  }

}

- (void)_focusBehaviorDidChange
{
  -[UIFocusSystem _updateFocusUpdateThrottle](self, "_updateFocusUpdateThrottle");
  -[UIFocusSystem _updateWantsTreeLocking](self, "_updateWantsTreeLocking");
}

- (void)_updateFocusUpdateThrottle
{
  void *v3;
  _UIFocusUpdateThrottle *updateThrottle;
  _UIFocusUpdateThrottle *v5;
  _UIFocusUpdateThrottle *v6;
  _UIFocusUpdateThrottle *v7;
  _UIFocusUpdateThrottle *v8;
  _UIFocusUpdateThrottle *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[UIFocusSystem behavior](self, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "throttlesProgrammaticFocusUpdates"))
  {
    updateThrottle = self->_updateThrottle;

    if (!updateThrottle)
    {
      objc_initWeak(&location, self);
      v5 = [_UIFocusUpdateThrottle alloc];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __43__UIFocusSystem__updateFocusUpdateThrottle__block_invoke;
      v11[3] = &unk_1E16B3F40;
      objc_copyWeak(&v12, &location);
      v6 = -[_UIFocusUpdateThrottle initWithUpdateHandler:](v5, "initWithUpdateHandler:", v11);
      v7 = self->_updateThrottle;
      self->_updateThrottle = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  -[UIFocusSystem behavior](self, "behavior");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "throttlesProgrammaticFocusUpdates") & 1) != 0)
  {

  }
  else
  {
    v8 = self->_updateThrottle;

    if (v8)
    {
      -[_UIFocusUpdateThrottle teardown](self->_updateThrottle, "teardown");
      v9 = self->_updateThrottle;
      self->_updateThrottle = 0;

    }
  }
}

void __43__UIFocusSystem__updateFocusUpdateThrottle__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

- (NSString)description
{
  UIDescriptionBuilder *v3;
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  id v10;

  v3 = -[UIDescriptionBuilder initWithObject:]([UIDescriptionBuilder alloc], "initWithObject:", self);
  if (os_variant_has_internal_diagnostics() && (*(_BYTE *)&self->_flags & 1) != 0)
    v10 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("TEARDOWN RECEIVED"), CFSTR("YES"));
  v4 = -[UIDescriptionBuilder appendName:BOOLValue:](v3, "appendName:BOOLValue:", CFSTR("enabled"), self->_enabled);
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  v6 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("focusedItem"), WeakRetained);

  if (self->_pendingFocusUpdateRequest)
    v7 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("pendingFocusUpdateRequest"));
  -[UIDescriptionBuilder string](v3, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (_UIFocusMovementPerformer)_movementPerformer
{
  return self->_movementPerformer;
}

- (BOOL)waitingForFocusMovementAction
{
  return self->_waitingForFocusMovementAction;
}

- (void)setWaitingForFocusMovementAction:(BOOL)a3
{
  self->_waitingForFocusMovementAction = a3;
}

- (UIFocusMovementAction)pendingFocusMovementAction
{
  return self->_pendingFocusMovementAction;
}

- (void)setPendingFocusMovementAction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, a3);
}

- (_UIFocusUpdateThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (_UIFocusTreeLock)treeLock
{
  return self->_treeLock;
}

- (_UIFocusSystemDelegate)delegate
{
  return (_UIFocusSystemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIFocusItem)_previousFocusedItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_previousFocusedItem);
}

- (_UIFocusCastingController)_focusCastingController
{
  return self->_focusCastingController;
}

- (_UIFocusLinearMovementCache)_focusMovementCache
{
  return self->_focusMovementCache;
}

- (void)_setFocusMovementCache:(id)a3
{
  objc_storeStrong((id *)&self->_focusMovementCache, a3);
}

- (_UIFocusBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (NSNumber)_overrideFocusDeferralBehavior
{
  return self->_overrideFocusDeferralBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_focusMovementCache, 0);
  objc_storeStrong((id *)&self->_focusCastingController, 0);
  objc_destroyWeak((id *)&self->_previousFocusedItem);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_treeLock, 0);
  objc_storeStrong((id *)&self->_updateThrottle, 0);
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, 0);
  objc_destroyWeak((id *)&self->_deepestPreferredFocusEnvironment);
  objc_storeStrong((id *)&self->_deepestPreferredFocusableItemCacheForCurrentUpdate, 0);
  objc_storeStrong((id *)&self->_focusGroupHistory, 0);
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_movementPerformer, 0);
  objc_destroyWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_storeStrong((id *)&self->_focusItemAncestorCache, 0);
  objc_storeStrong((id *)&self->_disappearingFocusEnvironment, 0);
  objc_storeStrong((id *)&self->_appearingFocusEnvironment, 0);
  objc_destroyWeak((id *)&self->_deferredFocusUpdateTarget);
  objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, 0);
}

+ (void)registerURL:(NSURL *)soundFileURL forSoundIdentifier:(UIFocusSoundIdentifier)identifier
{
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURL *v12;

  v12 = soundFileURL;
  v7 = identifier;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 1967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("soundFileURL"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 1968, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  if (-[NSString isEqual:](v7, "isEqual:", CFSTR("UIFocusSoundIdentifierDefault")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 1969, CFSTR("UIFocusSoundIdentifierDefault is reserved for system use."));

  }
  if (-[NSString isEqual:](v7, "isEqual:", CFSTR("UIFocusSoundIdentifierNone")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusSystem.m"), 1970, CFSTR("UIFocusSoundIdentifierNone is reserved for system use."));

  }
  +[_UIFocusSoundGenerator registerURL:forIdentifier:](_UIFocusSoundGenerator, "registerURL:forIdentifier:", v12, v7);

}

- (UIFocusSystem)_preferredFirstResponderFocusSystem
{
  void *v3;
  void *v4;

  -[UIFocusSystem focusedItem](self, "focusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusSystem _preferredFirstResponderFocusSystemForFocusedItem:](self, "_preferredFirstResponderFocusSystemForFocusedItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusSystem *)v4;
}

- (id)_preferredFirstResponderFocusSystemForFocusedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UIFocusSystem *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  UIFocusSystem *v18;
  UIFocusSystem *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    _UIHostedFocusSystemsForHostEnvironment(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "anyObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "focusedItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_25;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_25;
      }
      v20 = self;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v8 = 0;
        v7 = 0;
        v13 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v15, "focusedItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              if (v7)
              {

                goto LABEL_21;
              }
              v7 = v15;
              v17 = v16;

              v8 = v17;
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v12)
            continue;
          break;
        }
      }
      else
      {
        v8 = 0;
LABEL_21:
        v7 = 0;
      }

      self = v20;
      if (!v7)
        goto LABEL_25;
    }
    if (v8)
    {
      objc_msgSend(v7, "_preferredFirstResponderFocusSystemForFocusedItem:", v8);
      v18 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v9 = v18;

      goto LABEL_27;
    }
LABEL_25:
    v18 = self;
    goto LABEL_26;
  }
  v9 = self;
LABEL_27:

  return v9;
}

- (UIResponder)_preferredFirstResponder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  UIFocusSystem *v11;
  UIFocusSystem *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  objc_getAssociatedObject(self, &_overridePreferredFirstResponderKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[UIFocusSystem focusedItem](self, "focusedItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = 1;
    else
      v9 = v7 == 0;
    v10 = !v9;
    if (v9)
    {
      if (v6)
      {
LABEL_14:
        -[UIFocusSystem _preferredFirstResponderFocusSystemForFocusedItem:](self, "_preferredFirstResponderFocusSystemForFocusedItem:", v6);
        v11 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 == self
          || (-[UIFocusSystem _preferredFirstResponder](v11, "_preferredFirstResponder"),
              (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          _UIFirstResponderCandidateForEnvironment(v6);
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v10)
        {
          _UIFocusEnvironmentContainingView(v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_21;
          objc_msgSend((id)UIApp, "_physicalKeyboardEventForWindow:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15
            || (v16 = (void *)v15,
                objc_setAssociatedObject(self, &_overridePreferredFirstResponderKey, v5, (void *)0x301),
                objc_msgSend(v5, "_keyCommandForEvent:", v16),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_setAssociatedObject(self, &_overridePreferredFirstResponderKey, 0, (void *)0x301),
                v16,
                !v17))
          {
LABEL_21:

            v17 = 0;
            v5 = 0;
          }

        }
        goto LABEL_26;
      }
    }
    else
    {
      if (_UIFocusItemIsViewOrRespondsToSelector(v7)
        && objc_msgSend(v8, "_wantsKeyCommandsWhenDeferred"))
      {
        v6 = v8;
        goto LABEL_14;
      }
      v6 = 0;
    }
    v5 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v5 = v3;
LABEL_27:

  return (UIResponder *)v5;
}

- (BOOL)_safari_moveFocusToNextGroup
{
  _UIFocusMovementInfo *v3;
  _UIFocusMovementRequest *v4;

  _UIFocusSystemAssertIfNotSafari();
  v3 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", 16, 0, 1, 0, 1, 2, 5);
  v4 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", self);
  -[_UIFocusMovementRequest setMovementInfo:](v4, "setMovementInfo:", v3);
  LOBYTE(self) = -[UIFocusSystem _performFocusMovement:](self, "_performFocusMovement:", v4);

  return (char)self;
}

- (BOOL)_safari_moveFocusToPreviousGroup
{
  _UIFocusMovementInfo *v3;
  _UIFocusMovementRequest *v4;

  _UIFocusSystemAssertIfNotSafari();
  v3 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", 32, 0, 1, 0, 1, 2, 5);
  v4 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", self);
  -[_UIFocusMovementRequest setMovementInfo:](v4, "setMovementInfo:", v3);
  LOBYTE(self) = -[UIFocusSystem _performFocusMovement:](self, "_performFocusMovement:", v4);

  return (char)self;
}

@end

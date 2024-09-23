@implementation SBKeyboardDismissalManager

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer *v6;
  id v7;
  char v8;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (UIGestureRecognizer *)a3;
  v7 = a4;
  if (-[BSCompoundAssertion isActive](self->_participantsAssertion, "isActive")
    && !self->_trackedTouchIdentifier)
  {
    if (self->_dismissGestureRecognizer == v6)
    {
      SBLogKeyboardDismissal();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SBKeyboardDismissalManager gestureRecognizer:shouldReceiveTouch:].cold.1();

      v11 = -[SBKeyboardDismissalManager _shouldPreventDismissalForTouch:](self, "_shouldPreventDismissalForTouch:", v7);
      if (!v11)
      {
        SBLogKeyboardDismissal();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          _SBFLoggingMethodProem();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = v13;
          v17 = 2114;
          v18 = v7;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ tracking touch for keyboard dismiss: %{public}@", (uint8_t *)&v15, 0x16u);

        }
        v14 = objc_msgSend(v7, "_touchIdentifier");
        self->_trackedTouchIdentifier = v14;
        -[BKSTouchDeliveryObservationService addObserver:forTouchIdentifier:](self->_touchService, "addObserver:forTouchIdentifier:", self, v14);
      }
      v8 = !v11;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBKeyboardDismissalManager)initWithTouchDeliveryService:(id)a3 systemGestureManager:(id)a4 keyboardArbiterManager:(id)a5 focusController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBKeyboardDismissalManager *v15;
  SBKeyboardDismissalManager *v16;
  uint64_t v17;
  BSCompoundAssertion *participantsAssertion;
  BSCompoundAssertion *v19;
  void *v20;
  SBFailureNotifyingTapGestureRecognizer *v21;
  UIGestureRecognizer *dismissGestureRecognizer;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBKeyboardDismissalManager;
  v15 = -[SBKeyboardDismissalManager init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keyboardArbiterManager, a5);
    objc_storeStrong((id *)&v16->_systemGestureManager, a4);
    objc_storeStrong((id *)&v16->_keyboardFocusCoordinator, a6);
    objc_storeStrong((id *)&v16->_touchService, a3);
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("SBKeyboardDismissalManager"));
    v17 = objc_claimAutoreleasedReturnValue();
    participantsAssertion = v16->_participantsAssertion;
    v16->_participantsAssertion = (BSCompoundAssertion *)v17;

    v19 = v16->_participantsAssertion;
    SBLogKeyboardDismissal();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v19, "setLog:", v20);

    v21 = -[SBFailureNotifyingTapGestureRecognizer initWithTarget:action:]([SBFailureNotifyingTapGestureRecognizer alloc], "initWithTarget:action:", v16, sel__didTap_);
    dismissGestureRecognizer = v16->_dismissGestureRecognizer;
    v16->_dismissGestureRecognizer = &v21->super.super;

    -[UIGestureRecognizer setName:](v16->_dismissGestureRecognizer, "setName:", CFSTR("keyboardDismissal"));
    -[UIGestureRecognizer setAllowedTouchTypes:](v16->_dismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEBC0);
    -[UIGestureRecognizer setDelegate:](v16->_dismissGestureRecognizer, "setDelegate:", v16);
    -[UIGestureRecognizer setCancelsTouchesInView:](v16->_dismissGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v16->_dismissGestureRecognizer, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v16->_dismissGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[SBSystemGestureManager addGestureRecognizer:withType:](v16->_systemGestureManager, "addGestureRecognizer:withType:", v16->_dismissGestureRecognizer, 126);
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_participantsAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBKeyboardDismissalManager;
  -[SBKeyboardDismissalManager dealloc](&v3, sel_dealloc);
}

- (id)registerKeyboardDismissalParticipant:(id)a3
{
  BSCompoundAssertion *participantsAssertion;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  participantsAssertion = self->_participantsAssertion;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](participantsAssertion, "acquireForReason:withContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_didTap:(id)a3
{
  id v5;
  unsigned int trackedTouchIdentifier;
  BSAbsoluteMachTimer *touchExpiryTimer;
  BSAbsoluteMachTimer *v8;
  BSAbsoluteMachTimer *v9;
  NSObject *v10;
  _QWORD v11[6];
  unsigned int v12;

  v5 = a3;
  trackedTouchIdentifier = self->_trackedTouchIdentifier;
  if (trackedTouchIdentifier)
  {
    touchExpiryTimer = self->_touchExpiryTimer;
    if (!touchExpiryTimer)
    {
      v8 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBKeyboardDismissalManager.touchExpiry"));
      v9 = self->_touchExpiryTimer;
      self->_touchExpiryTimer = v8;

      trackedTouchIdentifier = self->_trackedTouchIdentifier;
      touchExpiryTimer = self->_touchExpiryTimer;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__SBKeyboardDismissalManager__didTap___block_invoke;
    v11[3] = &unk_1E8EB5778;
    v12 = trackedTouchIdentifier;
    v11[4] = self;
    v11[5] = a2;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](touchExpiryTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v11, 0.02, 0.05);
    SBLogKeyboardDismissal();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SBKeyboardDismissalManager _didTap:].cold.1();

  }
}

uint64_t __38__SBKeyboardDismissalManager__didTap___block_invoke(uint64_t result)
{
  id *v1;
  uint64_t v2;
  NSObject *v3;

  v1 = (id *)(result + 32);
  if (*(_DWORD *)(result + 48) == *(_DWORD *)(*(_QWORD *)(result + 32) + 56))
  {
    v2 = result;
    SBLogKeyboardDismissal();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__SBKeyboardDismissalManager__didTap___block_invoke_cold_1((uint64_t)v1, v2, v3);

    return objc_msgSend(*v1, "_reset");
  }
  return result;
}

- (void)gestureRecognizerTransitionedToFailed:(id)a3
{
  NSObject *v4;

  SBLogKeyboardDismissal();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SBKeyboardDismissalManager gestureRecognizerTransitionedToFailed:].cold.1();

  -[SBKeyboardDismissalManager _reset](self, "_reset");
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures", a3);
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  BSDispatchMain();
}

uint64_t __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke(uint64_t result)
{
  uint64_t v1;
  id *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(result + 32);
  v1 = *(_QWORD *)(result + 32);
  v3 = *(_DWORD *)(result + 48);
  if (v3)
    v4 = v3 == *(_DWORD *)(v1 + 56);
  else
    v4 = 0;
  if (!v4)
    return result;
  v5 = result;
  if (objc_msgSend(*(id *)(v1 + 40), "isActive"))
  {
    v6 = *(_DWORD *)(v5 + 52);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 24), "presentingKeyboardProcessIdentifier");
    SBLogKeyboardDismissal();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6 != v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing keyboard", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(*((id *)*v2 + 1), "forceKeyboardAway");
      goto LABEL_16;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      _SBFLoggingMethodProem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_DWORD *)(v5 + 52);
      v11 = *(_DWORD *)(v5 + 56);
      v15 = 138543874;
      v16 = v10;
      v17 = 1024;
      v18 = v11;
      v19 = 1024;
      v20 = v12;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ hittest keyboard; preventing dismiss; context: %x; pid: %u",
        (uint8_t *)&v15,
        0x18u);

    }
  }
  else
  {
    SBLogKeyboardDismissal();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_2((uint64_t)v2);
  }

LABEL_16:
  SBLogKeyboardDismissal();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_1((uint64_t)v2);

  return objc_msgSend(*v2, "_reset");
}

- (BOOL)_shouldPreventDismissalForTouch:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  BOOL v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[BSCompoundAssertion isActive](self->_participantsAssertion, "isActive") & 1) == 0)
  {
    SBLogKeyboardDismissal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBKeyboardDismissalManager _shouldPreventDismissalForTouch:].cold.1();
LABEL_16:
    v14 = 1;
    goto LABEL_17;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BSCompoundAssertion context](self->_participantsAssertion, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "keyboardDismissalManager:shouldPreventDismissalForTouch:inWindow:", self, v4, v11);

        SBLogKeyboardDismissal();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          _SBFLoggingMethodProem();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v16;
          v23 = 2114;
          v24 = v10;
          v25 = 1024;
          v26 = v12;
          _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ participantWantsPreventDismiss?: %{BOOL}u", buf, 0x1Cu);

        }
        if ((v12 & 1) != 0)
          goto LABEL_16;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (void)_reset
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_9();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ resetting touch tracking", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchExpiryTimer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_participantsAssertion, 0);
  objc_storeStrong((id *)&self->_touchService, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
}

- (void)gestureRecognizer:shouldReceiveTouch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_9();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ first check for preventDismissal", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)_didTap:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_9();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ starting expiry timer for successful tap", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

void __38__SBKeyboardDismissalManager__didTap___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_10(a1);
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to receive touchUp; resetting",
    v5,
    0xCu);

  OUTLINED_FUNCTION_2_2();
}

- (void)gestureRecognizerTransitionedToFailed:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_9();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ resetting after failed tap", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

void __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_10(a1);
  _SBFLoggingMethodProem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ resetting after touchUp", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

void __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_10(a1);
  _SBFLoggingMethodProem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ no longer active; preventing dismiss", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_shouldPreventDismissalForTouch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_9();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ preventing dismiss as we're not active", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

@end

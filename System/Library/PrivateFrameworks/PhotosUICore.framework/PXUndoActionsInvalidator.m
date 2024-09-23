@implementation PXUndoActionsInvalidator

- (PXUndoActionsInvalidator)initWithUndoManager:(id)a3 privacyController:(id)a4
{
  id v7;
  id v8;
  PXUndoActionsInvalidator *v9;
  PXUndoActionsInvalidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUndoActionsInvalidator;
  v9 = -[PXUndoActionsInvalidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_undoManager, a3);
    objc_storeStrong((id *)&v10->_privacyController, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PXUndoActionsInvalidator stopObservingSystemEventsForAutomaticInvalidation](self, "stopObservingSystemEventsForAutomaticInvalidation");
  v3.receiver = self;
  v3.super_class = (Class)PXUndoActionsInvalidator;
  -[PXUndoActionsInvalidator dealloc](&v3, sel_dealloc);
}

- (void)beginObservingSystemEventsForAutomaticInvalidation
{
  void *v3;

  if (!-[PXUndoActionsInvalidator isObservingApplicationState](self, "isObservingApplicationState"))
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerChangeObserver:context:", self, ApplicationStateObservationContext);

    -[PXUndoActionsInvalidator setObservingApplicationState:](self, "setObservingApplicationState:", 1);
  }
}

- (void)stopObservingSystemEventsForAutomaticInvalidation
{
  void *v3;

  if (-[PXUndoActionsInvalidator isObservingApplicationState](self, "isObservingApplicationState"))
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterChangeObserver:context:", self, ApplicationStateObservationContext);

    -[PXUndoActionsInvalidator setObservingApplicationState:](self, "setObservingApplicationState:", 0);
  }
}

- (void)clearUndoClearingTimer
{
  void *v3;

  -[PXUndoActionsInvalidator undoClearingTimer](self, "undoClearingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXUndoActionsInvalidator setUndoClearingTimer:](self, "setUndoClearingTimer:", 0);
}

- (void)startUndoClearingTimer
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Starting undo timer", v11, 2u);
  }

  -[PXUndoActionsInvalidator undoClearingTimer](self, "undoClearingTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
    -[PXUndoActionsInvalidator clearUndoClearingTimer](self, "clearUndoClearingTimer");
  -[PXUndoActionsInvalidator setTimerDidClearUndoStack:](self, "setTimerDidClearUndoStack:", 0);
  +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundThresholdDurationForUndoActionsInvalidation");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_undoClearingTimerFired, 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUndoActionsInvalidator setUndoClearingTimer:](self, "setUndoClearingTimer:", v9);

  -[PXUndoActionsInvalidator undoClearingTimer](self, "undoClearingTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTolerance:", 0.0);

}

- (void)undoClearingTimerFired
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  int v9;
  uint8_t v10[16];

  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Undo clearing timer did fire.", v10, 2u);
  }

  -[PXUndoActionsInvalidator privacyController](self, "privacyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXUndoActionsInvalidator privacyController](self, "privacyController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isContentPrivacyEnabled");

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }
  +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldClearUndoStackAutomatically");

  if ((v7 & 1) == 0 && v9)
  {
    -[PXUndoActionsInvalidator setTimerDidClearUndoStack:](self, "setTimerDidClearUndoStack:", 1);
    -[PXUndoActionsInvalidator clearUndoStack](self, "clearUndoStack");
  }
  -[PXUndoActionsInvalidator clearUndoClearingTimer](self, "clearUndoClearingTimer");
}

- (void)invalidateUndoTimerIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[PXUndoActionsInvalidator timerDidClearUndoStack](self, "timerDidClearUndoStack"))
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Timer not fired yet, clearing timer.", v4, 2u);
    }

    -[PXUndoActionsInvalidator clearUndoClearingTimer](self, "clearUndoClearingTimer");
  }
}

- (void)clearUndoStack
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Clearing undo stack", v5, 2u);
  }

  -[PXUndoActionsInvalidator undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllActions");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)ApplicationStateObservationContext == a5)
    px_dispatch_on_main_queue();
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyController, a3);
}

- (BOOL)isObservingApplicationState
{
  return self->_observingApplicationState;
}

- (void)setObservingApplicationState:(BOOL)a3
{
  self->_observingApplicationState = a3;
}

- (NSTimer)undoClearingTimer
{
  return self->_undoClearingTimer;
}

- (void)setUndoClearingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_undoClearingTimer, a3);
}

- (BOOL)timerDidClearUndoStack
{
  return self->_timerDidClearUndoStack;
}

- (void)setTimerDidClearUndoStack:(BOOL)a3
{
  self->_timerDidClearUndoStack = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoClearingTimer, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

void __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibilityState");

  v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    if (objc_msgSend(v4, "isObservingApplicationState"))
    {
      v5 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke_2;
      block[3] = &unk_1E5149198;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    objc_msgSend(v4, "startUndoClearingTimer");
  }
}

void __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibilityState");

  if (v3 == 1)
    objc_msgSend(*(id *)(a1 + 32), "invalidateUndoTimerIfNeeded");
}

@end

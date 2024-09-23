@implementation SBDashBoardIdleTimerController

- (SBDashBoardIdleTimerController)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardIdleTimerController *v6;
  SBDashBoardIdleTimerController *v7;
  SBDashBoardIdleTimerProvider *v8;
  SBDashBoardIdleTimerProvider *dashBoardIdleTimerProvider;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardIdleTimerController;
  v6 = -[SBDashBoardIdleTimerController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    v8 = -[SBDashBoardIdleTimerProvider initWithDelegate:]([SBDashBoardIdleTimerProvider alloc], "initWithDelegate:", v7);
    dashBoardIdleTimerProvider = v7->_dashBoardIdleTimerProvider;
    v7->_dashBoardIdleTimerProvider = v8;

    -[CSCoverSheetViewController registerExternalEventHandler:](v7->_coverSheetViewController, "registerExternalEventHandler:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardIdleTimerController;
  -[SBDashBoardIdleTimerController dealloc](&v3, sel_dealloc);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  SBDashBoardIdleTimerProvider *v7;
  const __CFString *v8;
  SBDashBoardIdleTimerProvider *v9;
  void *v10;
  SBDashBoardIdleTimerProvider *dashBoardIdleTimerProvider;
  const __CFString *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = 0;
  if (v5 > 23)
  {
    if (v5 != 24)
    {
      if (v5 == 25)
      {
        dashBoardIdleTimerProvider = self->_dashBoardIdleTimerProvider;
        v12 = CFSTR("SBDashBoardScreenOff");
        goto LABEL_14;
      }
      if (v5 != 38)
        goto LABEL_16;
    }
    v7 = self->_dashBoardIdleTimerProvider;
    v8 = CFSTR("SBDashBoardScreenOff");
    goto LABEL_10;
  }
  switch(v5)
  {
    case 2:
      v9 = self->_dashBoardIdleTimerProvider;
      -[CSCoverSheetViewController activeBehavior](self->_coverSheetViewController, "activeBehavior");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardIdleTimerProvider updateIdleTimerWithIdleDimProvider:reason:](v9, "updateIdleTimerWithIdleDimProvider:reason:", v10, CFSTR("BehaviorChanged"));

      goto LABEL_15;
    case 7:
      dashBoardIdleTimerProvider = self->_dashBoardIdleTimerProvider;
      v12 = CFSTR("SBDashBoardIsDeactivated");
LABEL_14:
      -[SBDashBoardIdleTimerProvider addDisabledIdleTimerAssertionReason:](dashBoardIdleTimerProvider, "addDisabledIdleTimerAssertionReason:", v12);
      goto LABEL_15;
    case 8:
      v7 = self->_dashBoardIdleTimerProvider;
      v8 = CFSTR("SBDashBoardIsDeactivated");
LABEL_10:
      -[SBDashBoardIdleTimerProvider removeDisabledIdleTimerAssertionReason:](v7, "removeDisabledIdleTimerAssertionReason:", v8);
LABEL_15:
      v6 = objc_msgSend(v4, "isConsumable");
      break;
  }
LABEL_16:

  return v6;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return -[SBDashBoardIdleTimerController requestIdleTimerBehaviorForReason:](self, "requestIdleTimerBehaviorForReason:", CFSTR("IdleTimerCoordinatorRequested"));
}

- (void)resetIdleTimerIfTopMost
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v10[16];

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasActivePresentation");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idleTimerSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "increaseNotificationScrollLogging");

    if (v8)
    {
      SBLogIdleTimer();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[IdleTimerController] Not frontmost, not resetting", v10, 2u);
      }

    }
  }
  else
  {
    -[SBDashBoardIdleTimerProvider resetIdleTimer](self->_dashBoardIdleTimerProvider, "resetIdleTimer");
  }
}

- (void)idleTimerDidRefresh:(id)a3
{
  -[CSCoverSheetViewController idleTimerDidRefresh](self->_coverSheetViewController, "idleTimerDidRefresh", a3);
}

- (void)idleTimerDidExpire:(id)a3
{
  -[CSCoverSheetViewController idleTimerDidExpire](self->_coverSheetViewController, "idleTimerDidExpire", a3);
}

- (void)idleTimerDidWarn:(id)a3
{
  -[CSCoverSheetViewController idleTimerDidWarn](self->_coverSheetViewController, "idleTimerDidWarn", a3);
}

- (void)idleTimerDidChange:(id)a3
{
  -[CSCoverSheetViewController idleTimerDidChange](self->_coverSheetViewController, "idleTimerDidChange", a3);
}

- (void)idleTimerWillRefresh:(id)a3
{
  -[CSCoverSheetViewController idleTimerWillRefresh](self->_coverSheetViewController, "idleTimerWillRefresh", a3);
}

- (id)dashBoardIdleTimerProvider:(id)a3 didProposeBehavior:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBDisabledIdleTimer *v11;
  SBDisabledIdleTimer *v12;

  v7 = a4;
  v8 = a5;
  -[SBDashBoardIdleTimerController idleTimerCoordinator](self, "idleTimerCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "idleTimerProvider:didProposeBehavior:forReason:", self, v7, v8);
    v11 = (SBDisabledIdleTimer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(SBDisabledIdleTimer);
  }
  v12 = v11;

  return v12;
}

- (id)requestIdleTimerBehaviorForReason:(id)a3
{
  return -[SBDashBoardIdleTimerProvider effectiveIdleTimerBehavior](self->_dashBoardIdleTimerProvider, "effectiveIdleTimerBehavior", a3);
}

- (void)addIdleTimerDisabledAssertionReason:(id)a3
{
  -[SBDashBoardIdleTimerProvider addDisabledIdleTimerAssertionReason:](self->_dashBoardIdleTimerProvider, "addDisabledIdleTimerAssertionReason:", a3);
}

- (void)removeIdleTimerDisabledAssertionReason:(id)a3
{
  -[SBDashBoardIdleTimerProvider removeDisabledIdleTimerAssertionReason:](self->_dashBoardIdleTimerProvider, "removeDisabledIdleTimerAssertionReason:", a3);
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_dashBoardIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end

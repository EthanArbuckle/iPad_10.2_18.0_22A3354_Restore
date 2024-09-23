@implementation SBDeveloperBuildExpirationTrigger

- (id)_initWithAlertItemsController:(id)a3 eventSource:(id)a4 expirationDate:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SBDeveloperBuildExpirationTrigger *v14;
  void *v15;
  SBDeveloperBuildExpirationTrigger *v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (!v12)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeveloperBuildExpirationTrigger.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItemsController"));

    if (!v13)
      goto LABEL_8;
  }
  v19.receiver = self;
  v19.super_class = (Class)SBDeveloperBuildExpirationTrigger;
  v14 = -[SBDeveloperBuildExpirationTrigger init](&v19, sel_init);
  self = v14;
  if (!v14)
    goto LABEL_8;
  objc_storeStrong((id *)&v14->_expirationDate, a5);
  objc_storeStrong((id *)&self->_alertItemsController, a3);
  if (v11)
  {
    objc_storeStrong((id *)&self->_eventSource, a4);
    -[SBAppInteractionEventSourceProviding addObserver:](self->_eventSource, "addObserver:", self);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__coverSheetDidDismiss_, CFSTR("SBCoverSheetDidDismissNotification"), 0);

  self = self;
  v16 = self;
LABEL_9:

  return v16;
}

- (SBDeveloperBuildExpirationTrigger)initWithAlertItemsController:(id)a3 eventSource:(id)a4
{
  return (SBDeveloperBuildExpirationTrigger *)-[SBDeveloperBuildExpirationTrigger _initWithAlertItemsController:eventSource:expirationDate:](self, "_initWithAlertItemsController:eventSource:expirationDate:", a3, a4, 0);
}

- (void)dealloc
{
  SBAppInteractionEventSourceProviding *eventSource;
  objc_super v4;

  eventSource = self->_eventSource;
  if (eventSource)
    -[SBAppInteractionEventSourceProviding removeObserver:](eventSource, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBDeveloperBuildExpirationTrigger;
  -[SBDeveloperBuildExpirationTrigger dealloc](&v4, sel_dealloc);
}

- (void)showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:(BOOL)a3 toLauncher:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  SBDeveloperBuildExpirationAlert *v18;
  SBDeveloperBuildExpirationAlert *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_expirationDate)
  {
    v25 = v7;
    v9 = objc_msgSend(v7, "isAfterDate:");
    if ((v9 & 1) != 0 || !v4)
    {
      v8 = v25;
      if ((v9 & v5) == 1)
      {
        v19 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
        v8 = v25;
        v18 = v19;
        if (v19)
        {
LABEL_30:
          -[SBAlertItemsController deactivateAlertItemsOfClass:](self->_alertItemsController, "deactivateAlertItemsOfClass:", objc_opt_class());
          -[SBAlertItemsController activateAlertItem:](self->_alertItemsController, "activateAlertItem:", v18);

          v8 = v25;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (double)objc_msgSend(v11, "secondsFromGMT");

      -[NSDate dateByAddingTimeInterval:](self->_expirationDate, "dateByAddingTimeInterval:", -v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "softwareUpdateDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v14) = objc_msgSend(v15, "hasDeveloperInstallBrickAlertShown7DayWarning");
      v16 = objc_msgSend(v15, "hasDeveloperInstallBrickAlertShown3DayWarning");
      v17 = objc_msgSend(v15, "hasDeveloperInstallBrickAlertShownTomorrowWarning");
      if ((v14 & 1) != 0)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(v25, "bs_dateByAddingDays:", 7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "date:isSameDayAsDate:", v20, v13))
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          objc_msgSend(v15, "setDeveloperInstallBrickAlertShown7DayWarning:", 1);
        }
        else
        {
          v18 = 0;
        }

      }
      if (v18)
        v21 = 1;
      else
        v21 = v16;
      if ((v21 & 1) == 0)
      {
        objc_msgSend(v25, "bs_dateByAddingDays:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "date:isSameDayAsDate:", v22, v13))
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          objc_msgSend(v15, "setDeveloperInstallBrickAlertShown3DayWarning:", 1);
        }
        else
        {
          v18 = 0;
        }

      }
      if (v18)
        v23 = 1;
      else
        v23 = v17;
      if ((v23 & 1) == 0)
      {
        objc_msgSend(v25, "bs_dateByAddingDays:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "date:isSameDayAsDate:", v24, v13))
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          objc_msgSend(v15, "setDeveloperInstallBrickAlertShownTomorrowWarning:", 1);
        }
        else
        {
          v18 = 0;
        }

      }
      v8 = v25;
      if (v18)
        goto LABEL_30;
    }
  }

}

- (void)eventSource:(id)a3 didFinishTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  if (a4 == 1)
    -[SBDeveloperBuildExpirationTrigger showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:](self, "showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:", 0, 1, a5, a6, a7);
}

- (void)_coverSheetDidDismiss:(id)a3
{
  id v4;

  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDeveloperBuildExpirationTrigger showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:](self, "showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:", 1, objc_msgSend(v4, "unlockedEnvironmentMode") == 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventSource, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
}

@end

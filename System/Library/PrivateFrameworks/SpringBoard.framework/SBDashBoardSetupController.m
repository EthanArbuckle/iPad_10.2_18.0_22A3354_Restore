@implementation SBDashBoardSetupController

- (SBDashBoardSetupController)init
{
  -[SBDashBoardSetupController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SBDashBoardSetupController)initWithCoverSheetViewController:(id)a3 setupManager:(id)a4
{
  id v7;
  id v8;
  SBDashBoardSetupController *v9;
  SBDashBoardSetupController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardSetupController;
  v9 = -[SBDashBoardSetupController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverSheetViewController, a3);
    objc_storeStrong((id *)&v10->_setupManager, a4);
    -[CSCoverSheetViewController registerExternalBehaviorProvider:](v10->_coverSheetViewController, "registerExternalBehaviorProvider:", v10);
    -[CSCoverSheetViewController registerExternalEventHandler:](v10->_coverSheetViewController, "registerExternalEventHandler:", v10);
    -[SBDashBoardSetupController _configureForCurrentSetupMode](v10, "_configureForCurrentSetupMode");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__setupModeChanged_, CFSTR("SBInBuddyModeDidChangeNotification"), 0);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CSCoverSheetViewController unregisterExternalBehaviorProvider:](self->_coverSheetViewController, "unregisterExternalBehaviorProvider:", self);
  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInBuddyModeDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupController;
  -[SBDashBoardSetupController dealloc](&v4, sel_dealloc);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode"))
    return 2;
  else
    return 1;
}

- (unint64_t)restrictedCapabilities
{
  void *v2;
  void *v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 12199108;
  else
    return 12203260;
}

- (int64_t)notificationBehavior
{
  if (SUSUIRequiresAlertPresentationAfterUpdate())
    return 0;
  else
    return 3;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 3:
    case 8:
      -[SBDashBoardSetupController _configureForCurrentSetupMode](self, "_configureForCurrentSetupMode");
      goto LABEL_4;
    case 6:
    case 9:
      -[SBDashBoardSetupController _clearSetupViewIfNecessaryAnimated:](self, "_clearSetupViewIfNecessaryAnimated:", 0);
LABEL_4:
      v5 = objc_msgSend(v4, "isConsumable");
      break;
    default:
      break;
  }

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)_configureForCurrentSetupMode
{
  -[CSCoverSheetViewController externalBehaviorProviderBehaviorChanged:](self->_coverSheetViewController, "externalBehaviorProviderBehaviorChanged:", self);
  -[SBDashBoardSetupController _addOrRemoveSetupViewIfNecessaryAnimated:](self, "_addOrRemoveSetupViewIfNecessaryAnimated:", 0);
}

- (void)_addOrRemoveSetupViewIfNecessaryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SBDashBoardSetupViewController *v5;
  SBDashBoardSetupViewController *setupViewController;
  id v7;

  v3 = a3;
  if (-[SBDashBoardSetupController participantState](self, "participantState") == 2
    && (SUSUIRequiresAlertPresentationAfterUpdate() & 1) == 0)
  {
    if (!self->_setupViewController)
    {
      v5 = -[SBDashBoardSetupViewController initWithCoverSheetViewController:]([SBDashBoardSetupViewController alloc], "initWithCoverSheetViewController:", self->_coverSheetViewController);
      setupViewController = self->_setupViewController;
      self->_setupViewController = v5;

    }
    -[CSCoverSheetViewController mainPagePresentationViewController](self->_coverSheetViewController, "mainPagePresentationViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentContentViewController:animated:completion:", self->_setupViewController, v3, 0);

  }
  else
  {
    -[SBDashBoardSetupController _clearSetupViewIfNecessaryAnimated:](self, "_clearSetupViewIfNecessaryAnimated:", v3);
  }
}

- (void)_clearSetupViewIfNecessaryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SBDashBoardSetupViewController *setupViewController;
  _QWORD v7[5];

  if (self->_setupViewController)
  {
    v3 = a3;
    -[CSCoverSheetViewController mainPagePresentationViewController](self->_coverSheetViewController, "mainPagePresentationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    setupViewController = self->_setupViewController;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__SBDashBoardSetupController__clearSetupViewIfNecessaryAnimated___block_invoke;
    v7[3] = &unk_1E8E9DED8;
    v7[4] = self;
    objc_msgSend(v5, "dismissContentViewController:animated:completion:", setupViewController, v3, v7);

  }
}

void __65__SBDashBoardSetupController__clearSetupViewIfNecessaryAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupViewController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end

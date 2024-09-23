@implementation SBNCNotificationDispatcher

- (SBNotificationBannerDestination)bannerDestination
{
  return self->_bannerDestination;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[SBNCNotificationDispatcher isCarDestinationActive](self, "isCarDestinationActive"))
  {
    -[SBNotificationCarPlayDestination keyWindowForScreen:](self->_carDestination, "keyWindowForScreen:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCarDestinationActive
{
  return -[SBNotificationCarPlayDestination isActive](self->_carDestination, "isActive");
}

- (SBNCNotificationDispatcher)init
{
  SBNCNotificationDispatcher *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  SBLockScreenManager *lockScreenManager;
  uint64_t v7;
  SBLockStateAggregator *lockStateAggregator;
  uint64_t v9;
  SBCommunicationPolicyManager *communicationPolicyManager;
  SBNCSoundController *v11;
  SBNCScreenController *v12;
  SBNCAlertingController *v13;
  SBNCAlertingController *alertingController;
  uint64_t v15;
  NCNotificationDispatcher *dispatcher;
  SBNCNotificationDispatcherDelegate *v17;
  SBNCNotificationDispatcherDelegate *dispatcherDelegate;
  uint64_t v19;
  NCBulletinNotificationSource *notificationSource;
  SBWalletNotificationSource *v21;
  SBWalletNotificationSource *walletNotificationSource;
  SBUserAlertNotificationSource *v23;
  SBUserAlertNotificationSource *userNotificationAlertSource;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  SBNCNotificationDispatcher *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SBNCNotificationDispatcher;
  v2 = -[SBNCNotificationDispatcher init](&v29, sel_init);
  if (v2)
  {
    NCRegisterUserNotificationsUILogging();
    v3 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Setting up SpringBoard notifications dispatcher %{public}@", buf, 0xCu);
    }
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v5;

    +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    lockStateAggregator = v2->_lockStateAggregator;
    v2->_lockStateAggregator = (SBLockStateAggregator *)v7;

    +[SBCommunicationPolicyManager sharedInstance](SBCommunicationPolicyManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    communicationPolicyManager = v2->_communicationPolicyManager;
    v2->_communicationPolicyManager = (SBCommunicationPolicyManager *)v9;

    v11 = -[SBNCSoundController initWithLockScreenManager:lockStateAggregator:]([SBNCSoundController alloc], "initWithLockScreenManager:lockStateAggregator:", v2->_lockScreenManager, v2->_lockStateAggregator);
    v12 = -[SBNCScreenController initWithBackLightController:lockScreenManager:lockStateAggregator:]([SBNCScreenController alloc], "initWithBackLightController:lockScreenManager:lockStateAggregator:", v4, v2->_lockScreenManager, v2->_lockStateAggregator);
    v13 = -[SBNCAlertingController initWithSoundController:screenController:lockScreenManager:communicationPolicyManager:]([SBNCAlertingController alloc], "initWithSoundController:screenController:lockScreenManager:communicationPolicyManager:", v11, v12, v2->_lockScreenManager, v2->_communicationPolicyManager);
    alertingController = v2->_alertingController;
    v2->_alertingController = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC5FF8]), "initWithAlertingController:", v2->_alertingController);
    dispatcher = v2->_dispatcher;
    v2->_dispatcher = (NCNotificationDispatcher *)v15;

    v17 = objc_alloc_init(SBNCNotificationDispatcherDelegate);
    dispatcherDelegate = v2->_dispatcherDelegate;
    v2->_dispatcherDelegate = v17;

    -[NCNotificationDispatcher setDelegate:](v2->_dispatcher, "setDelegate:", v2->_dispatcherDelegate);
    -[SBNCNotificationDispatcher _setupNewDestinationsForDispatcher:](v2, "_setupNewDestinationsForDispatcher:", v2->_dispatcher);
    -[SBNCNotificationDispatcher _updateActiveDestinations](v2, "_updateActiveDestinations");
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6138]), "initWithDispatcher:", v2->_dispatcher);
    notificationSource = v2->_notificationSource;
    v2->_notificationSource = (NCBulletinNotificationSource *)v19;

    v21 = -[SBWalletNotificationSource initWithDispatcher:]([SBWalletNotificationSource alloc], "initWithDispatcher:", v2->_dispatcher);
    walletNotificationSource = v2->_walletNotificationSource;
    v2->_walletNotificationSource = v21;

    v23 = -[SBUserAlertNotificationSource initWithDispatcher:]([SBUserAlertNotificationSource alloc], "initWithDispatcher:", v2->_dispatcher);
    userNotificationAlertSource = v2->_userNotificationAlertSource;
    v2->_userNotificationAlertSource = v23;

    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLockScreenNotificationsAlertItemPresenter:", v2->_userNotificationAlertSource);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel__aggregateLockStateDidChange, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel__carPlayDestinationAvailabilityDidChange, CFSTR("SBNotificationCarPlayDestinationAvailabilityDidChange"), 0);
    -[SBLockScreenManager coverSheetViewController](v2->_lockScreenManager, "coverSheetViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addCoverSheetObserver:", v2);

  }
  return v2;
}

- (BSServiceConnectionEndpoint)carOpenServiceEndpoint
{
  return -[SBNotificationCarPlayDestination endpoint](self->_carDestination, "endpoint");
}

- (void)_aggregateLockStateDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Lock state changed", v4, 2u);
  }
  -[SBNCNotificationDispatcher _updateActiveDestinations](self, "_updateActiveDestinations");
}

- (void)_carPlayDestinationAvailabilityDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay destination availability changed", v4, 2u);
  }
  -[SBNCNotificationDispatcher _updateActiveDestinations](self, "_updateActiveDestinations");
}

- (void)_updateActiveDestinations
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  SBNotificationCarPlayDestination *carDestination;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  -[SBNCNotificationDispatcher lockScreenManager](self, "lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInLostMode");

  v7 = -[SBNCNotificationDispatcher isCarDestinationActive](self, "isCarDestinationActive");
  v8 = v4 ^ 1 | -[SBNCNotificationDispatcher _lockScreenWantsBanners](self, "_lockScreenWantsBanners");
  v9 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109888;
    v15[1] = v4;
    v16 = 1024;
    v17 = v6;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Updating active destinations [ lockScreenVisible: %d lostMode: %d carPlay: %d bannersActive : %d ]", (uint8_t *)v15, 0x1Au);
  }
  -[SBNCNotificationDispatcher dispatcher](self, "dispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerDestination:", self->_bannerDestination);
  -[SBNCNotificationDispatcher bannerDestination](self, "bannerDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDestination:enabled:", v11, v8);

  if ((v8 & 1) == 0)
    -[SBNotificationBannerDestination destinationDidBecomeDisabled](self->_bannerDestination, "destinationDidBecomeDisabled");
  if (self->_dashBoardDestination)
  {
    objc_msgSend(v10, "registerDestination:");
    -[SBNCNotificationDispatcher dashBoardDestination](self, "dashBoardDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDestination:enabled:", v12, 1);

  }
  carDestination = self->_carDestination;
  if (v7)
  {
    objc_msgSend(v10, "registerDestination:", carDestination);
    -[SBNCNotificationDispatcher carDestination](self, "carDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDestination:enabled:", v14, 1);

  }
  else
  {
    objc_msgSend(v10, "unregisterDestination:", carDestination);
  }

}

- (void)_setupNewDestinationsForDispatcher:(id)a3
{
  SBNotificationCarPlayDestination *v4;
  SBNotificationCarPlayDestination *carDestination;
  SBNotificationCarPlayDestination *v6;
  void *v7;
  SBNotificationBannerDestination *v8;
  SBNotificationBannerDestination *bannerDestination;
  SBNotificationBannerDestination *v10;
  void *v11;
  SBNotificationBannerDestination *v12;
  void *v13;
  SBNotificationBannerDestination *v14;
  void *v15;
  void *v16;
  SBNotificationDestination *v17;
  SBNotificationDestination *dashBoardDestination;
  SBNotificationDestination *v19;
  id v20;

  v4 = objc_alloc_init(SBNotificationCarPlayDestination);
  carDestination = self->_carDestination;
  self->_carDestination = v4;

  v6 = self->_carDestination;
  -[SBNCNotificationDispatcher alertingController](self, "alertingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationCarPlayDestination setAlertingController:](v6, "setAlertingController:", v7);

  v8 = objc_alloc_init(SBNotificationBannerDestination);
  bannerDestination = self->_bannerDestination;
  self->_bannerDestination = v8;

  v10 = self->_bannerDestination;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination setSetupManager:](v10, "setSetupManager:", v11);

  v12 = self->_bannerDestination;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination setLockScreenManager:](v12, "setLockScreenManager:", v13);

  v14 = self->_bannerDestination;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination setAssistantController:](v14, "setAssistantController:", v15);

  -[SBNCNotificationDispatcherDelegate setBannerDestination:](self->_dispatcherDelegate, "setBannerDestination:", self->_bannerDestination);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "notificationDestination");
  v17 = (SBNotificationDestination *)objc_claimAutoreleasedReturnValue();
  dashBoardDestination = self->_dashBoardDestination;
  self->_dashBoardDestination = v17;

  v19 = self->_dashBoardDestination;
  -[SBNCNotificationDispatcher alertingController](self, "alertingController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SBNotificationDestination setAlertingController:](v19, "setAlertingController:", v20);

}

- (BOOL)_lockScreenWantsBanners
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "notificationBehavior") == 2;

  return v5;
}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  v5 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Cover Sheet active behavior changed", v6, 2u);
  }
  -[SBNCNotificationDispatcher _updateActiveDestinations](self, "_updateActiveDestinations");
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[SBNCNotificationDispatcher dashBoardDestination](self, "dashBoardDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isNotificationContentExtensionVisible:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[SBNCNotificationDispatcher bannerDestination](self, "bannerDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isNotificationContentExtensionVisible:", v4);

  }
  return v6;
}

- (SBNotificationDestination)dashBoardDestination
{
  return self->_dashBoardDestination;
}

- (SBWalletNotificationSource)walletNotificationSource
{
  return self->_walletNotificationSource;
}

- (SBNotificationCenterDestination)notificationCenterDestination
{
  return self->_notificationCenterDestination;
}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (SBNCNotificationDispatcherDelegate)dispatcherDelegate
{
  return self->_dispatcherDelegate;
}

- (void)setDispatcherDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcherDelegate, a3);
}

- (NCBulletinNotificationSource)notificationSource
{
  return self->_notificationSource;
}

- (void)setNotificationSource:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSource, a3);
}

- (SBUserAlertNotificationSource)userNotificationAlertSource
{
  return self->_userNotificationAlertSource;
}

- (void)setUserNotificationAlertSource:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationAlertSource, a3);
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenManager, a3);
}

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateAggregator, a3);
}

- (SBNotificationCarPlayDestination)carDestination
{
  return self->_carDestination;
}

- (void)setCarDestination:(id)a3
{
  objc_storeStrong((id *)&self->_carDestination, a3);
}

- (SBCommunicationPolicyManager)communicationPolicyManager
{
  return self->_communicationPolicyManager;
}

- (void)setCommunicationPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_communicationPolicyManager, a3);
}

- (SBNCAlertingController)alertingController
{
  return self->_alertingController;
}

- (void)setAlertingController:(id)a3
{
  objc_storeStrong((id *)&self->_alertingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingController, 0);
  objc_storeStrong((id *)&self->_communicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_carDestination, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_userNotificationAlertSource, 0);
  objc_storeStrong((id *)&self->_notificationSource, 0);
  objc_storeStrong((id *)&self->_dispatcherDelegate, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenterDestination, 0);
  objc_storeStrong((id *)&self->_walletNotificationSource, 0);
  objc_storeStrong((id *)&self->_dashBoardDestination, 0);
  objc_storeStrong((id *)&self->_bannerDestination, 0);
}

@end

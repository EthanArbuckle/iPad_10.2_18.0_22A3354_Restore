@implementation STRootViewModelCoordinator

- (STRootViewModelCoordinator)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5 usageContext:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  STRootViewModelCoordinator *v12;
  uint64_t v13;
  NSNumber *userDSID;
  uint64_t v15;
  NSString *deviceIdentifier;
  uint64_t v17;
  NSNumber *usageReportType;
  uint64_t v19;
  STAdminPersistenceController *persistenceController;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString *userName;
  uint64_t v25;
  STRootViewModel *viewModel;
  uint64_t v27;
  NSMutableDictionary *coordinatorsByChildDSID;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)STRootViewModelCoordinator;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[STRootViewModelCoordinator init](&v31, sel_init);
  v13 = objc_msgSend(v11, "copy", v31.receiver, v31.super_class);
  userDSID = v12->_userDSID;
  v12->_userDSID = (NSNumber *)v13;

  v15 = objc_msgSend(v10, "copy");
  deviceIdentifier = v12->_deviceIdentifier;
  v12->_deviceIdentifier = (NSString *)v15;

  v17 = objc_msgSend(v9, "copy");
  usageReportType = v12->_usageReportType;
  v12->_usageReportType = (NSNumber *)v17;

  v12->_usageContext = a6;
  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v19 = objc_claimAutoreleasedReturnValue();
  persistenceController = v12->_persistenceController;
  v12->_persistenceController = (STAdminPersistenceController *)v19;

  v21 = objc_msgSend(v11, "unsignedIntegerValue");
  if (!v21)
    v12->_isLocalUser = 1;
  -[STAdminPersistenceController persistentContainer](v12->_persistenceController, "persistentContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPersistentContainer:", v22);

  userName = v12->_userName;
  v12->_userName = 0;

  v25 = objc_opt_new();
  viewModel = v12->_viewModel;
  v12->_viewModel = (STRootViewModel *)v25;

  v27 = objc_opt_new();
  coordinatorsByChildDSID = v12->_coordinatorsByChildDSID;
  v12->_coordinatorsByChildDSID = (NSMutableDictionary *)v27;

  -[STRootViewModelCoordinator loadViewModelRightNow](v12, "loadViewModelRightNow");
  -[STRootViewModelCoordinator _registerForPersistentStoreNotifications](v12, "_registerForPersistentStoreNotifications");
  -[STRootViewModelCoordinator _registerForWillResignActiveNotifications](v12, "_registerForWillResignActiveNotifications");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v12, sel__willRefreshUsage_, 0x24DB93070, 0);

  return v12;
}

- (STRootViewModelCoordinator)init
{
  return -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:](self, "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", 0, 0, 0, 0);
}

- (void)_registerForPersistentStoreNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  STGroupFetchedResultsController *fetchedResultsController;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE84568], "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithFetchRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE84630], "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithFetchRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE845B8], "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestWithFetchRequest:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE84678], "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestWithFetchRequest:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x24BE845B0]);
  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "viewContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v14;
  v24[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithContext:resultsRequests:", v20, v21);

  objc_msgSend(v22, "setDelegate:", self);
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = (STGroupFetchedResultsController *)v22;

}

- (void)groupResultsControllerDidChangeContents:(id)a3
{
  -[STRootViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", 0);
}

- (void)_registerForWillResignActiveNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__passcodeSessionHasEnded_, *MEMORY[0x24BEBE010], 0);

}

- (void)_passcodeSessionHasEnded:(id)a3
{
  -[STRootViewModelCoordinator setHasAlreadyEnteredPINForSession:](self, "setHasAlreadyEnteredPINForSession:", 0);
}

- (id)coordinatorForChild:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  STRootViewModelCoordinator *v13;
  STRootViewModelCoordinator *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[STRootViewModelCoordinator coordinatorsByChildDSID](self, "coordinatorsByChildDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dsid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (STRootViewModelCoordinator *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = [STRootViewModelCoordinator alloc];
    objc_msgSend(v8, "dsid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:](v14, "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v15, v9, v10, -[STRootViewModelCoordinator usageContext](self, "usageContext"));

    -[STRootViewModelCoordinator coordinatorsByChildDSID](self, "coordinatorsByChildDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dsid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v17);

  }
  return v13;
}

+ (id)keyPathsForValuesAffectingUsageDetailsCoordinator
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("viewModel.screenTimeEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (STUsageDetailsViewModelCoordinator)usageDetailsCoordinator
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STUsageDetailsViewModelCoordinator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  STUsageDetailsViewModelCoordinator *v15;
  STUsageDetailsViewModelCoordinator *usageDetailsCoordinator;

  if (!self->_usageDetailsCoordinator)
  {
    -[STRootViewModelCoordinator viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isScreenTimeEnabled");

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K == %hd OR %K == %hd)"), CFSTR("platform"), 4, CFSTR("platform"), 5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "devices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filteredArrayUsingPredicate:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[STRootViewModelCoordinator _validateDeviceIdentifier](self, "_validateDeviceIdentifier");
      v9 = [STUsageDetailsViewModelCoordinator alloc];
      -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator organizationIdentifierForUsage](self, "organizationIdentifierForUsage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator userDSID](self, "userDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator deviceIdentifier](self, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator usageReportType](self, "usageReportType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[STUsageDetailsViewModelCoordinator initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:](v9, "initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:", v10, v11, v12, v8, v13, v14, -[STRootViewModelCoordinator usageContext](self, "usageContext"));
      usageDetailsCoordinator = self->_usageDetailsCoordinator;
      self->_usageDetailsCoordinator = v15;

    }
  }
  return self->_usageDetailsCoordinator;
}

- (void)_validateDeviceIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__STRootViewModelCoordinator__validateDeviceIdentifier__block_invoke;
  v14[3] = &unk_24DB879A0;
  v14[4] = self;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v14);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[STRootViewModelCoordinator isLocalUser](self, "isLocalUser"))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("isLocalDevice"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRootViewModelCoordinator viewModel](self, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "devices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[STRootViewModelCoordinator viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "devices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUILog usage](STUILog, "usage");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[STRootViewModelCoordinator deviceIdentifier](self, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_219AB4000, v12, OS_LOG_TYPE_DEFAULT, "_validateDeviceIdentifier: deviceIdentifier %{public}@ not found. Switching to %{public}@", buf, 0x16u);

    }
    -[STRootViewModelCoordinator setDeviceIdentifier:](self, "setDeviceIdentifier:", v11);

  }
}

uint64_t __55__STRootViewModelCoordinator__validateDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (STTimeAllowancesViewModelCoordinator)timeAllowancesCoordinator
{
  STTimeAllowancesViewModelCoordinator *timeAllowancesCoordinator;
  STTimeAllowancesViewModelCoordinator *v4;
  void *v5;
  void *v6;
  STTimeAllowancesViewModelCoordinator *v7;
  STTimeAllowancesViewModelCoordinator *v8;

  timeAllowancesCoordinator = self->_timeAllowancesCoordinator;
  if (!timeAllowancesCoordinator)
  {
    v4 = [STTimeAllowancesViewModelCoordinator alloc];
    -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator userDSID](self, "userDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[STTimeAllowancesViewModelCoordinator initWithPersistenceController:userDSID:](v4, "initWithPersistenceController:userDSID:", v5, v6);
    v8 = self->_timeAllowancesCoordinator;
    self->_timeAllowancesCoordinator = v7;

    timeAllowancesCoordinator = self->_timeAllowancesCoordinator;
  }
  return timeAllowancesCoordinator;
}

- (STContentPrivacyViewModelCoordinator)contentPrivacyCoordinator
{
  STContentPrivacyViewModelCoordinator *contentPrivacyCoordinator;
  STContentPrivacyViewModelCoordinator *v4;
  void *v5;
  void *v6;
  void *v7;
  STContentPrivacyViewModelCoordinator *v8;
  STContentPrivacyViewModelCoordinator *v9;

  contentPrivacyCoordinator = self->_contentPrivacyCoordinator;
  if (!contentPrivacyCoordinator)
  {
    v4 = [STContentPrivacyViewModelCoordinator alloc];
    -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator userDSID](self, "userDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator userName](self, "userName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[STContentPrivacyViewModelCoordinator initWithPersistenceController:userDSID:userName:](v4, "initWithPersistenceController:userDSID:userName:", v5, v6, v7);
    v9 = self->_contentPrivacyCoordinator;
    self->_contentPrivacyCoordinator = v8;

    contentPrivacyCoordinator = self->_contentPrivacyCoordinator;
  }
  return contentPrivacyCoordinator;
}

- (STCommunicationSafetyViewModelCoordinator)communicationSafetyCoordinator
{
  STCommunicationSafetyViewModelCoordinator *communicationSafetyCoordinator;
  STCommunicationSafetyViewModelCoordinator *v4;
  void *v5;
  void *v6;
  STCommunicationSafetyViewModelCoordinator *v7;
  STCommunicationSafetyViewModelCoordinator *v8;

  communicationSafetyCoordinator = self->_communicationSafetyCoordinator;
  if (!communicationSafetyCoordinator)
  {
    v4 = [STCommunicationSafetyViewModelCoordinator alloc];
    -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator userDSID](self, "userDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[STCommunicationSafetyViewModelCoordinator initWithPersistenceController:userDSID:](v4, "initWithPersistenceController:userDSID:", v5, v6);
    v8 = self->_communicationSafetyCoordinator;
    self->_communicationSafetyCoordinator = v7;

    communicationSafetyCoordinator = self->_communicationSafetyCoordinator;
  }
  return communicationSafetyCoordinator;
}

- (STEyeReliefViewModelCoordinator)eyeReliefCoordinator
{
  STEyeReliefViewModelCoordinator *eyeReliefCoordinator;
  STEyeReliefViewModelCoordinator *v4;
  void *v5;
  void *v6;
  STEyeReliefViewModelCoordinator *v7;
  STEyeReliefViewModelCoordinator *v8;

  eyeReliefCoordinator = self->_eyeReliefCoordinator;
  if (!eyeReliefCoordinator)
  {
    v4 = [STEyeReliefViewModelCoordinator alloc];
    -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator userDSID](self, "userDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[STEyeReliefViewModelCoordinator initWithPersistenceController:userDSID:](v4, "initWithPersistenceController:userDSID:", v5, v6);
    v8 = self->_eyeReliefCoordinator;
    self->_eyeReliefCoordinator = v7;

    eyeReliefCoordinator = self->_eyeReliefCoordinator;
  }
  return eyeReliefCoordinator;
}

- (BOOL)hasShownMiniBuddy
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RMSetupShown"));

  return v3;
}

- (void)setHasShownMiniBuddy:(BOOL)a3
{
  id v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("RMSetupShown"));

  }
}

+ (id)keyPathsForValuesAffectingPasscodeEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("viewModel.me.hasPasscode"), 0);
}

- (BOOL)isPasscodeEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPasscode");

  return v4;
}

- (BOOL)validatePIN:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  return v8;
}

- (void)setPIN:(id)a3 completionHandler:(id)a4
{
  -[STRootViewModelCoordinator _setPIN:recoveryAltDSID:shouldSetRecoveryAppleID:completionHandler:](self, "_setPIN:recoveryAltDSID:shouldSetRecoveryAppleID:completionHandler:", a3, 0, 0, a4);
}

- (void)setPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5
{
  -[STRootViewModelCoordinator _setPIN:recoveryAltDSID:shouldSetRecoveryAppleID:completionHandler:](self, "_setPIN:recoveryAltDSID:shouldSetRecoveryAppleID:completionHandler:", a3, a4, 1, a5);
}

- (void)_setPIN:(id)a3 recoveryAltDSID:(id)a4 shouldSetRecoveryAppleID:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  STRootViewModelCoordinator *v29;
  id v30;
  BOOL v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "me");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator timeAllowancesCoordinator](self, "timeAllowancesCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allowancesByIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke;
  v24[3] = &unk_24DB879F0;
  v25 = v14;
  v26 = v10;
  v31 = a5;
  v27 = v11;
  v28 = v17;
  v29 = self;
  v30 = v12;
  v19 = v12;
  v20 = v17;
  v21 = v11;
  v22 = v10;
  v23 = v14;
  objc_msgSend(v18, "performBackgroundTask:", v24);

}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void (**v16)(id, _QWORD);
  id v17;
  void (**v18)(id, _QWORD);
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  void (**v29)(id, _QWORD);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEffectivePasscode:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(v5, "setEffectiveRecoveryAltDSID:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    v23 = 0;
    v6 = objc_msgSend(MEMORY[0x24BE84510], "saveManagedUserBlueprintForUser:error:", v5, &v23);
    v7 = v23;
    if ((v6 & 1) != 0)
      goto LABEL_13;
    +[STUILog persistence](STUILog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2();
  }
  else
  {
    v22 = 0;
    v9 = objc_msgSend(MEMORY[0x24BE84510], "deleteManagedUserBlueprintForUser:error:", v5, &v22);
    v7 = v22;
    if ((v9 & 1) == 0)
    {
      +[STUILog persistence](STUILog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1();

    }
    objc_msgSend(v5, "setContactsEditable:", 1);
    objc_msgSend(v5, "setIsCommunicationSafetySendingRestricted:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyReceivingRestricted:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyNotificationEnabled:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyAnalyticsEnabled:", 0);
    v11 = *(void **)(a1 + 56);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_347;
    v20[3] = &unk_24DB879C8;
    v21 = v5;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
    v8 = v21;
  }

LABEL_13:
  objc_msgSend(*(id *)(a1 + 64), "persistenceController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  v13 = objc_msgSend(v12, "saveContext:error:", v3, &v19);
  v14 = v19;

  v15 = *(void **)(a1 + 72);
  if ((v13 & 1) != 0)
  {
    v16 = v15;
    if (v16)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v16[2](v16, 0);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v27 = &unk_24DB86C38;
        v18 = v16;
        v28 = 0;
        v29 = v18;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
  }
  else
  {
    v16 = v15;
    v17 = v14;
    if (v16)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v16)[2](v16, v17);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v27 = &unk_24DB86C38;
        v29 = v16;
        v28 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_347(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "behaviorType") == 1)
  {
    objc_msgSend(v4, "setBehaviorType:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 0;
    v6 = +[STTimeAllowancesViewModelCoordinator saveAllowance:forUser:error:](STTimeAllowancesViewModelCoordinator, "saveAllowance:forUser:error:", v4, v5, &v9);
    v7 = v9;
    if (!v6)
    {
      +[STUILog persistence](STUILog, "persistence");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_347_cold_1();

    }
  }

}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STRootViewModelCoordinator *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke;
  v12[3] = &unk_24DB87A18;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  char v9;
  void (**v10)(id, _QWORD);
  void (**v11)(id, id);
  void *v12;
  void (**v13)(id, id);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  void (**v25)(id, id);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isManaged");
  objc_msgSend(v5, "setScreenTimeEnabled:", *(unsigned __int8 *)(a1 + 56));
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 40), "persistenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "saveContext:error:", v3, &v19);
  v7 = v19;

  if ((v9 & 1) != 0)
  {
LABEL_4:
    if ((objc_msgSend(v5, "isManaged") | v6) == 1 && (_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v5, "notifyServerOfScreenTimeEnabled:", *(unsigned __int8 *)(a1 + 56));
    if (*(_BYTE *)(a1 + 56) && (_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "timeAllowancesCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke_2;
      v17 = &unk_24DB870F0;
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v12, "saveDefaultAlwaysAllowListWithCompletionHandler:", &v14);

    }
    else
    {
      v10 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
      if (v10)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v10[2](v10, 0);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
          v23 = &unk_24DB86C38;
          v13 = v10;
          v24 = 0;
          v25 = v13;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_reportCoreAnalyticsEventScreenTimeEnabled:user:userType:userIsRemote:", *(unsigned __int8 *)(a1 + 56), v5, objc_msgSend(*(id *)(a1 + 32), "type", v14, v15, v16, v17), objc_msgSend(*(id *)(a1 + 32), "isRemoteUser"));
    goto LABEL_21;
  }
  v11 = (void (**)(id, id))*(id *)(a1 + 48);
  v7 = v7;
  if (v11)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v11[2](v11, v7);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v23 = &unk_24DB86C38;
      v25 = v11;
      v24 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_21:
}

void __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(id, id);
  id v5;
  _QWORD v6[4];
  id v7;
  void (**v8)(id, id);

  v3 = a2;
  v4 = (void (**)(id, id))*(id *)(a1 + 32);
  v5 = v3;
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v4[2](v4, v5);
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v6[3] = &unk_24DB86C38;
      v8 = v4;
      v7 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v6);

    }
  }

}

- (void)setManagementEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STRootViewModelCoordinator *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__STRootViewModelCoordinator_setManagementEnabled_completionHandler___block_invoke;
  v12[3] = &unk_24DB87A18;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __69__STRootViewModelCoordinator_setManagementEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  void (**v13)(id, _QWORD);
  id v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  void (**v20)(id, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isManaged");
  objc_msgSend(v6, "setManaged:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "persistenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v8, "saveContext:error:", v4, &v14);

  v10 = v14;
  if ((v9 & 1) != 0)
  {
    if ((objc_msgSend(v6, "isManaged") | v7) == 1)
      objc_msgSend(v6, "notifyServerOfScreenTimeEnabled:", *(unsigned __int8 *)(a1 + 56));
    v11 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v11[2](v11, 0);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v13 = v11;
        v19 = 0;
        v20 = v13;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
  }
  else
  {
    v11 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
    v12 = v10;
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v20 = v11;
        v19 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STRootViewModelCoordinator *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__STRootViewModelCoordinator_setScreenTimeSyncingEnabled_completionHandler___block_invoke;
  v12[3] = &unk_24DB87A18;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __76__STRootViewModelCoordinator_setScreenTimeSyncingEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void (**v11)(id, _QWORD);
  id v12;
  void (**v13)(id, _QWORD);
  id v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  void (**v20)(id, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSyncingEnabled:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "saveContext:error:", v4, &v14);

  v9 = v14;
  v10 = *(void **)(a1 + 48);
  if ((v8 & 1) != 0)
  {
    v11 = v10;
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v11[2](v11, 0);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v13 = v11;
        v19 = 0;
        v20 = v13;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
  }
  else
  {
    v11 = v10;
    v12 = v9;
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v20 = v11;
        v19 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

- (void)setShareWebUsageEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STRootViewModelCoordinator *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__STRootViewModelCoordinator_setShareWebUsageEnabled_completionHandler___block_invoke;
  v12[3] = &unk_24DB87A18;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __72__STRootViewModelCoordinator_setShareWebUsageEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void (**v11)(id, _QWORD);
  id v12;
  void (**v13)(id, _QWORD);
  id v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  void (**v20)(id, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShareWebUsage:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "saveContext:error:", v4, &v14);

  v9 = v14;
  v10 = *(void **)(a1 + 48);
  if ((v8 & 1) != 0)
  {
    v11 = v10;
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v11[2](v11, 0);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v13 = v11;
        v19 = 0;
        v20 = v13;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
  }
  else
  {
    v11 = v10;
    v12 = v9;
    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        v18 = &unk_24DB86C38;
        v20 = v11;
        v19 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

- (void)enableManagementWithPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  STRootViewModelCoordinator *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "me");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke;
  v18[3] = &unk_24DB87A40;
  v19 = v12;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v23 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  v17 = v12;
  objc_msgSend(v13, "performBackgroundTask:", v18);

}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  void (**v14)(id, _QWORD);
  void *v15;
  NSObject *v16;
  void (**v17)(id, id);
  id v18;
  void (**v19)(id, id);
  void *v20;
  char v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint64_t block;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  void (**v33)(id, id);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
    objc_msgSend(v5, "setManaged:", 1);
  else
    objc_msgSend(v5, "setScreenTimeEnabled:", 1);
  objc_msgSend(v5, "setEffectivePasscode:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setEffectiveRecoveryAltDSID:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    v27 = 0;
    v6 = objc_msgSend(MEMORY[0x24BE84510], "saveManagedUserBlueprintForUser:error:", v5, &v27);
    v7 = v27;
    if ((v6 & 1) == 0)
    {
      +[STUILog persistence](STUILog, "persistence");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2();

    }
  }
  else
  {
    v26 = 0;
    v9 = objc_msgSend(MEMORY[0x24BE84510], "deleteManagedUserBlueprintForUser:error:", v5, &v26);
    v7 = v26;
    if ((v9 & 1) == 0)
    {
      +[STUILog persistence](STUILog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1();

    }
    objc_msgSend(v5, "setContactsEditable:", 1);
    objc_msgSend(v5, "setIsCommunicationSafetySendingRestricted:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyReceivingRestricted:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyNotificationEnabled:", 0);
    objc_msgSend(v5, "setIsCommunicationSafetyAnalyticsEnabled:", 0);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
LABEL_17:
    if (objc_msgSend(v5, "isManaged"))
      objc_msgSend(v5, "notifyServerOfScreenTimeEnabled:", 1);
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v14 = (void (**)(id, _QWORD))*(id *)(a1 + 64);
      if (v14)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v14[2](v14, 0);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v29 = 3221225472;
          v30 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
          v31 = &unk_24DB86C38;
          v19 = v14;
          v32 = 0;
          v33 = v19;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

      objc_msgSend(*(id *)(a1 + 56), "persistenceController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      v21 = objc_msgSend(v20, "saveContext:error:", v3, &v22);
      v18 = v22;

      if ((v21 & 1) != 0)
        goto LABEL_33;
      +[STUILog persistence](STUILog, "persistence");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_cold_1();
      v7 = v18;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "timeAllowancesCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_352;
      v23[3] = &unk_24DB870F0;
      v24 = *(id *)(a1 + 64);
      objc_msgSend(v15, "saveDefaultAlwaysAllowListWithCompletionHandler:", v23);

      v16 = v24;
    }

    v18 = v7;
LABEL_33:
    objc_msgSend(*(id *)(a1 + 56), "_reportCoreAnalyticsEventScreenTimeEnabled:user:userType:userIsRemote:", 1, v5, objc_msgSend(*(id *)(a1 + 32), "type"), objc_msgSend(*(id *)(a1 + 32), "isRemoteUser"));
    goto LABEL_36;
  }
  objc_msgSend(*(id *)(a1 + 56), "persistenceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  v12 = objc_msgSend(v11, "saveContext:error:", v3, &v25);
  v13 = v25;

  if ((v12 & 1) != 0)
  {
    v7 = v13;
    goto LABEL_17;
  }
  v17 = (void (**)(id, id))*(id *)(a1 + 64);
  v18 = v13;
  if (v17)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v17[2](v17, v18);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v31 = &unk_24DB86C38;
      v33 = v17;
      v32 = v18;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_36:
}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_352(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(id, id);
  id v5;
  _QWORD v6[4];
  id v7;
  void (**v8)(id, id);

  v3 = a2;
  v4 = (void (**)(id, id))*(id *)(a1 + 32);
  v5 = v3;
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v4[2](v4, v5);
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v6[3] = &unk_24DB86C38;
      v8 = v4;
      v7 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v6);

    }
  }

}

- (void)applyIntroductionViewModel:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BOOL v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  BOOL v38;
  _QWORD v39[4];
  NSObject *v40;
  BOOL v41;
  _QWORD v42[4];
  NSObject *v43;
  BOOL v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  BOOL v49;

  v6 = a3;
  v7 = a4;
  -[STRootViewModelCoordinator timeAllowancesCoordinator](self, "timeAllowancesCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewModelCoordinator communicationSafetyCoordinator](self, "communicationSafetyCoordinator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewModelCoordinator contentPrivacyCoordinator](self, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewModelCoordinator eyeReliefCoordinator](self, "eyeReliefCoordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = dispatch_group_create();
  else
    v10 = 0;
  objc_msgSend(v6, "communicationSafetyEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    if (v7)
      dispatch_group_enter(v10);
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke;
    v47[3] = &unk_24DB86B58;
    v49 = v7 != 0;
    v48 = v10;
    objc_msgSend(v28, "saveCommunicationSafetyReceivingRestricted:communicationSafetySendingRestricted:completionHandler:", 1, 1, v47);

  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v6, "appAndWebsiteActivityEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "appAndWebsiteActivityEnabled");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_353;
      v45[3] = &unk_24DB866E0;
      v46 = v6;
      -[STRootViewModelCoordinator setScreenTimeEnabled:completionHandler:](self, "setScreenTimeEnabled:completionHandler:", v15, v45);

    }
  }
  objc_msgSend(v6, "bedtime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  if (v16)
  {
    if (v7)
      dispatch_group_enter(v10);
    objc_msgSend(v6, "bedtime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v17;
    v42[1] = 3221225472;
    v42[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_358;
    v42[3] = &unk_24DB86B58;
    v44 = v7 != 0;
    v43 = v10;
    objc_msgSend(v8, "saveDeviceBedtime:completionHandler:", v18, v42);

  }
  objc_msgSend(v6, "allowance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (v7)
      dispatch_group_enter(v10);
    objc_msgSend(v6, "allowance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v17;
    v39[1] = 3221225472;
    v39[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_359;
    v39[3] = &unk_24DB86B58;
    v41 = v7 != 0;
    v40 = v10;
    objc_msgSend(v8, "saveAllowance:completionHandler:", v20, v39);

  }
  objc_msgSend(v6, "restrictions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(v9, "saveContentPrivacyEnabled:completionHandler:", 1, &__block_literal_global_15);
    objc_msgSend(v6, "restrictions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_361;
    v35[3] = &unk_24DB87A88;
    v38 = v7 != 0;
    v36 = v10;
    v37 = v9;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v35);

  }
  else
  {
    objc_msgSend(v9, "saveContentPrivacyEnabled:completionHandler:", 0, &__block_literal_global_364);
  }
  objc_msgSend(v6, "screenDistanceEnabled");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "screenDistanceEnabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (v7)
      dispatch_group_enter(v10);
    v31[0] = v17;
    v31[1] = 3221225472;
    v31[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_365;
    v31[3] = &unk_24DB867F0;
    v34 = v7 != 0;
    v32 = v10;
    v33 = v6;
    objc_msgSend(v27, "persistEyeReliefState:withCompletionHandler:", v26, v31);

  }
  if (v7)
  {
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_366;
    block[3] = &unk_24DB86DB8;
    v30 = v7;
    dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Communication Safety setup during onboarding.", v6, 2u);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_353(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_353_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "appAndWebsiteActivityEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = CFSTR("disabled");
    if (v7)
      v8 = CFSTR("enabled");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set App & Website Activity state during onboarding: %@", (uint8_t *)&v9, 0xCu);

  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_358(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_358_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Downtime during onboarding.", v6, 2u);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_359(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_359_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved App Limit during onboarding.", v6, 2u);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_360(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[STUILog childSetup](STUILog, "childSetup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_360_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_DEFAULT, "Successfully enabled Content & Privacy during onboarding.", v5, 2u);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_361(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STRestrictionItem *v13;
  char v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  STRestrictionItem *v18;
  char v19;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (STRestrictionTypeWithString_onceToken != -1)
    dispatch_once(&STRestrictionTypeWithString_onceToken, &__block_literal_global_596);
  objc_msgSend((id)STRestrictionTypeWithString_restrictionItemTypes, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v12, v11, &stru_24DB8A1D0, objc_msgSend(v8, "unsignedIntegerValue"), 0);

  }
  else
  {
    v13 = 0;
  }

  if (v13)
  {
    v14 = *(_BYTE *)(a1 + 48);
    if (v14)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      v14 = *(_BYTE *)(a1 + 48);
    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2;
    v16[3] = &unk_24DB867F0;
    v19 = v14;
    v15 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v18 = v13;
    objc_msgSend(v15, "saveRestrictionValue:forItem:completionHandler:", v6, v18, v16);

  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2_cold_1(a1, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved content restriction for item %{public}@ during onboarding.", (uint8_t *)&v7, 0xCu);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_363(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[STUILog childSetup](STUILog, "childSetup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_363_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_DEFAULT, "Successfully disabled Content & Privacy during onboarding.", v5, 2u);
  }

}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_365(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  +[STUILog childSetup](STUILog, "childSetup");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_365_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "screenDistanceEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Screen Distance state: %@", (uint8_t *)&v7, 0xCu);

  }
}

uint64_t __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_366(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[STUILog childSetup](STUILog, "childSetup");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Calling onboarding completion handler. Finished saving values for model.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reportCoreAnalyticsEventScreenTimeEnabled:(BOOL)a3 user:(id)a4 userType:(unint64_t)a5 userIsRemote:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v6 = a6;
  v8 = a3;
  objc_msgSend(a4, "effectivePasscode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 > 7)
    v10 = 0;
  else
    v10 = qword_219BA4D08[a5];
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequest");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != NULL AND %K == YES"), CFSTR("familySettings"), CFSTR("isParent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v11);

  objc_msgSend(v16, "execute:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "count");
  else
    v14 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84628]), "initWithScreenTimeEnabled:numberOfGuardians:pinSet:userAgeGroup:userIsRemote:", v8, v14, v9 != 0, v10, v6);
  objc_msgSend(MEMORY[0x24BE84558], "reportEvent:", v15);

}

+ (id)loadViewModelFromManagedObjectContext:(id)a3 isLocalUser:(BOOL)a4 userDSID:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  uint64_t v11;
  STUIUser *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  STUIUser *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  void *v20;
  STUIUser *v21;
  void *v22;
  STUIUser *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  STUIDevice *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  STUIDevice *v47;
  NSObject *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  id v71;
  id v72;
  STUIDevice *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  STUIDevice *v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  NSObject *v101;
  id v102;
  id v103;
  NSObject *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  id v110;
  void *v111;
  id v112;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  NSObject *v120;
  void *v121;
  char v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t k;
  void *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  STUIDevice *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  STUIDevice *v139;
  NSObject *v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  NSObject *v150;
  NSObject *v151;
  void *v152;
  void *v153;
  NSObject *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  NSObject *v160;
  NSObject *v161;
  void *v162;
  id v163;
  id v164;
  STUIDevice *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  STUIDevice *v170;
  NSObject *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t m;
  void *v186;
  void *v187;
  _BOOL8 v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  NSObject *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  NSObject *v203;
  id v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  void *v210;
  void *v211;
  _BOOL4 v212;
  void *v213;
  id v214;
  void *v215;
  id obj;
  uint64_t v217;
  STUIUser *v218;
  uint64_t v219;
  void *v220;
  STUIUser *v221;
  id v222;
  uint64_t v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  void *v228;
  NSObject *v229;
  void *v230;
  void *v231;
  NSObject *v232;
  id v233;
  uint64_t v234;
  id v235;
  NSObject *v236;
  id v237;
  id v238;
  NSObject *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  void *v246;
  id v247;
  id v248;
  id v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  id v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t (*v259)(uint64_t, void *);
  void *v260;
  NSObject *v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  id v270;
  id v271;
  _QWORD v272[2];
  _QWORD v273[2];
  _BYTE v274[128];
  uint8_t v275[32];
  __int128 v276;
  __int128 v277;
  uint8_t buf[4];
  id v279;
  uint8_t v280[4];
  NSObject *v281;
  __int16 v282;
  uint64_t v283;
  __int16 v284;
  id v285;
  uint64_t v286;

  v8 = a4;
  v286 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v213 = (void *)objc_opt_new();
  v212 = v8;
  if (!v8)
  {
    v249 = 0;
    v207 = v10;
    objc_msgSend(MEMORY[0x24BE84570], "fetchUserWithDSID:inContext:error:", v10, v9, &v249);
    v99 = objc_claimAutoreleasedReturnValue();
    v225 = v249;
    if (v99)
    {
      v17 = -[STUIUser initWithUser:]([STUIUser alloc], "initWithUser:", v99);
      objc_msgSend(v213, "setMe:", v17);
      v15 = (void *)v99;
      goto LABEL_92;
    }
    +[STUILog persistence](STUILog, "persistence");
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.1();

    if (a6)
    {
      v102 = objc_retainAutorelease(v225);
      v103 = 0;
      *a6 = v102;
      v100 = v207;
      goto LABEL_83;
    }
    v103 = 0;
    v100 = v207;
LABEL_173:
    v105 = v213;
    v102 = v225;
    goto LABEL_179;
  }
  v256 = 0;
  objc_msgSend(MEMORY[0x24BE84570], "fetchLocalUserInContext:error:", v9, &v256);
  v11 = objc_claimAutoreleasedReturnValue();
  v225 = v256;
  if (!v11)
  {
    v100 = v10;
    +[STUILog persistence](STUILog, "persistence");
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.1();

    if (a6)
    {
      v102 = objc_retainAutorelease(v225);
      v103 = 0;
      *a6 = v102;
LABEL_83:
      v105 = v213;
      goto LABEL_179;
    }
    v103 = 0;
    goto LABEL_173;
  }
  v207 = v10;
  v12 = -[STUIUser initWithUser:]([STUIUser alloc], "initWithUser:", v11);
  v13 = v213;
  objc_msgSend(v213, "setMe:", v12);
  v218 = v12;
  v14 = -[STUIUser isParent](v12, "isParent");
  v15 = (void *)v11;
  if (!v14)
  {
    v17 = v218;
    goto LABEL_85;
  }
  v208 = v9;
  v210 = (void *)v11;
  v255 = v225;
  objc_msgSend(MEMORY[0x24BE845A0], "fetchWithContext:error:", v9, &v255);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = v255;

  v215 = (void *)objc_opt_new();
  v251 = 0u;
  v252 = 0u;
  v253 = 0u;
  v254 = 0u;
  v206 = v16;
  objc_msgSend(v16, "settings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = v218;
  v219 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v251, v274, 16);
  if (!v219)
    goto LABEL_72;
  v18 = &off_24DB85000;
  v217 = *(_QWORD *)v252;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v252 != v217)
        objc_enumerationMutation(obj);
      v223 = v19;
      v20 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * v19);
      v21 = [STUIUser alloc];
      objc_msgSend(v20, "user");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[STUIUser initWithUser:](v21, "initWithUser:", v22);

      if (-[STUIUser isChild](v23, "isChild"))
        objc_msgSend(v215, "addObject:", v23);
      objc_msgSend(v20, "user");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "userDeviceStates");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = v23;
      -[STUIUser altDSID](v23, "altDSID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v27 = v25;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18[235], "usage");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v279 = v27;
        _os_log_impl(&dword_219AB4000, v28, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
      }
      v226 = v27;

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "BOOLForKey:", 0x24DB93050);

      if (_os_feature_enabled_impl() && (v30 & 1) == 0)
      {
        v270 = 0;
        +[DeviceDetails detailsForUserWithAltDSID:error:](_TtC20ScreenTimeSettingsUI13DeviceDetails, "detailsForUserWithAltDSID:error:", v27, &v270);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v270;
        if (v31)
        {
          v268 = 0u;
          v269 = 0u;
          v266 = 0u;
          v267 = 0u;
          v236 = v31;
          v33 = -[NSObject countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v266, buf, 16);
          if (v33)
          {
            v34 = v33;
            v214 = v32;
            v227 = v31;
            v233 = v26;
            v241 = *(_QWORD *)v267;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v267 != v241)
                  objc_enumerationMutation(v236);
                v36 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * i);
                objc_msgSend(v36, "coreDuetIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18[235], "usage");
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v36, "identifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "name");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v275 = 138543874;
                  *(_QWORD *)&v275[4] = v37;
                  *(_WORD *)&v275[12] = 2114;
                  *(_QWORD *)&v275[14] = v39;
                  *(_WORD *)&v275[22] = 2114;
                  *(_QWORD *)&v275[24] = v40;
                  _os_log_impl(&dword_219AB4000, v38, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v275, 0x20u);

                }
                v41 = [STUIDevice alloc];
                objc_msgSend(v36, "name");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v36, "platform");
                v45 = objc_msgSend(v36, "isLocalDevice");
                objc_msgSend(v36, "lastUpdatedDate");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v41, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v42, v43, v37, v44, 1, v45, v46);

                objc_msgSend(v245, "addObject:", v47);
                v18 = &off_24DB85000;
                +[STUILog usage](STUILog, "usage");
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v36, "identifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v275 = 138543618;
                  *(_QWORD *)&v275[4] = v37;
                  *(_WORD *)&v275[12] = 2114;
                  *(_QWORD *)&v275[14] = v49;
                  _os_log_impl(&dword_219AB4000, v48, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v275, 0x16u);

                }
              }
              v34 = -[NSObject countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v266, buf, 16);
            }
            while (v34);
            v31 = v227;
            v26 = v233;
            v32 = v214;
          }
        }
        else
        {
          objc_msgSend(v18[235], "usage");
          v236 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v236, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v279 = v32;
            _os_log_error_impl(&dword_219AB4000, v236, OS_LOG_TYPE_ERROR, "Failed to fetch device details from DeviceActivity: %{public}@", buf, 0xCu);
          }
        }

      }
      v264 = 0u;
      v265 = 0u;
      v262 = 0u;
      v263 = 0u;
      v50 = v26;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v262, v275, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v263;
        v234 = *(_QWORD *)v263;
        v237 = v50;
        do
        {
          v54 = 0;
          v242 = v52;
          do
          {
            if (*(_QWORD *)v263 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * v54);
            objc_msgSend(v55, "device");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if (!v56)
            {
              objc_msgSend(v18[235], "usage");
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v280 = 138543618;
                v281 = 0;
                v282 = 2114;
                v283 = (uint64_t)v55;
                _os_log_error_impl(&dword_219AB4000, v62, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v280, 0x16u);
              }
              goto LABEL_57;
            }
            if (objc_msgSend(v56, "platform") == 1 || objc_msgSend(v57, "platform") == 2)
            {
              objc_msgSend(v55, "coreDuetIdentifier");
              v58 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18[235], "usage");
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v57, "identifier");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "name");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v280 = 138543874;
                v281 = v58;
                v282 = 2114;
                v283 = (uint64_t)v60;
                v284 = 2114;
                v285 = v61;
                _os_log_impl(&dword_219AB4000, v59, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v280, 0x20u);

                v52 = v242;
              }

              v257 = MEMORY[0x24BDAC760];
              v258 = 3221225472;
              v259 = __createDevices_block_invoke;
              v260 = &unk_24DB879A0;
              v62 = v58;
              v261 = v62;
              if (objc_msgSend(v245, "indexOfObjectPassingTest:", &v257) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v55, "user");
                v63 = (id)objc_claimAutoreleasedReturnValue();
                v64 = v57;
                objc_msgSend(MEMORY[0x24BE84658], "fetchRequestMatchingUser:device:", v63, v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v271 = 0;
                objc_msgSend(v65, "execute:", &v271);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = v271;
                if (v67)
                {
                  objc_msgSend(v18[235], "usage");
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v63, "altDSID");
                    v69 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "name");
                    v228 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v280 = 138543874;
                    v281 = v69;
                    v282 = 2114;
                    v283 = (uint64_t)v228;
                    v284 = 2114;
                    v285 = v67;
                    _os_log_fault_impl(&dword_219AB4000, v68, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);

                  }
                  goto LABEL_52;
                }
                if (!v66
                  || !objc_msgSend(v66, "count")
                  || (objc_msgSend(v66, "objectAtIndexedSubscript:", 0),
                      v70 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v70, "lastUpdatedDate"),
                      v71 = (id)objc_claimAutoreleasedReturnValue(),
                      v71,
                      v70,
                      !v71))
                {
                  +[STUILog usage](STUILog, "usage");
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v63, "altDSID");
                    v229 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "name");
                    v81 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v280 = 138543874;
                    v281 = v229;
                    v282 = 2114;
                    v283 = v81;
                    v82 = (void *)v81;
                    v284 = 2114;
                    v285 = v66;
                    _os_log_error_impl(&dword_219AB4000, v68, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);

                  }
LABEL_52:

                  v71 = 0;
                }
                v72 = v71;

                v73 = [STUIDevice alloc];
                objc_msgSend(v64, "name");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "identifier");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend(v64, "platform");
                objc_msgSend(v64, "localUserDeviceState");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v73, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v74, v75, v62, v76, 0, v77 != 0, v72);

                objc_msgSend(v245, "addObject:", v78);
                +[STUILog usage](STUILog, "usage");
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  -[STUIDevice identifier](v78, "identifier");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v280 = 138543618;
                  v281 = v62;
                  v282 = 2114;
                  v283 = (uint64_t)v80;
                  _os_log_impl(&dword_219AB4000, v79, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v280, 0x16u);

                }
                v18 = &off_24DB85000;
                v50 = v237;
                v53 = v234;
                v52 = v242;
              }

LABEL_57:
            }

            ++v54;
          }
          while (v52 != v54);
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v262, v275, 16);
        }
        while (v52);
      }

      v83 = v245;
      v84 = v83;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "startOfDayForDate:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v87, 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v276 = 0u;
      v277 = 0u;
      memset(v275, 0, sizeof(v275));
      v89 = v84;
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", v275, buf, 16);
      if (v90)
      {
        v91 = **(_QWORD **)&v275[16];
        while (2)
        {
          for (j = 0; j != v90; ++j)
          {
            if (**(_QWORD **)&v275[16] != v91)
              objc_enumerationMutation(v89);
            objc_msgSend(*(id *)(*(_QWORD *)&v275[8] + 8 * j), "lastFamilyCheckinDate");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v88, "compare:", v93);

            if (v94 == 1)
            {
              v90 = 1;
              goto LABEL_70;
            }
          }
          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", v275, buf, 16);
          if (v90)
            continue;
          break;
        }
      }
LABEL_70:

      -[STUIUser setHasDeviceWithoutUsageReported:](v221, "setHasDeviceWithoutUsageReported:", v90);
      v19 = v223 + 1;
      v17 = v218;
    }
    while (v223 + 1 != v219);
    v219 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v251, v274, 16);
  }
  while (v219);
LABEL_72:

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v273[0] = v95;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("dsid"), 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v273[1] = v96;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v273, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v215, "sortedArrayUsingDescriptors:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v213;
  objc_msgSend(v213, "setChildren:", v98);

  v225 = v205;
  v9 = v208;
  v15 = v210;
LABEL_85:
  if (_os_feature_enabled_impl())
  {
    v106 = v15;
    v107 = v9;
    v108 = (void *)objc_opt_new();
    v250 = 0;
    v109 = objc_msgSend(v108, "isCloudSyncEnabled:", &v250);
    v110 = v250;
    v111 = v13;
    v112 = v110;
    objc_msgSend(v111, "setIsCloudSyncEnabled:", v109);
    if (v112)
    {
      +[STUILog persistence](STUILog, "persistence");
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.5();

    }
    v9 = v107;
    v15 = v106;
    v17 = v218;
  }
  else
  {
    objc_msgSend(v13, "setIsCloudSyncEnabled:", objc_msgSend(v15, "syncingEnabled"));
  }
LABEL_92:
  v209 = v9;

  objc_msgSend(v15, "userDeviceStates");
  v114 = objc_claimAutoreleasedReturnValue();
  v115 = v15;
  v116 = (void *)v114;
  v211 = v115;
  objc_msgSend(v115, "altDSID");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v116;
  v119 = v117;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v118, "count"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUILog usage](STUILog, "usage");
  v120 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v279 = v119;
    _os_log_impl(&dword_219AB4000, v120, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "BOOLForKey:", 0x24DB93050);

  v224 = v119;
  if (_os_feature_enabled_impl() && (v122 & 1) == 0)
  {
    v270 = 0;
    +[DeviceDetails detailsForUserWithAltDSID:error:](_TtC20ScreenTimeSettingsUI13DeviceDetails, "detailsForUserWithAltDSID:error:", v119, &v270);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v270;
    if (v123)
    {
      v268 = 0u;
      v269 = 0u;
      v266 = 0u;
      v267 = 0u;
      v239 = v123;
      v125 = -[NSObject countByEnumeratingWithState:objects:count:](v239, "countByEnumeratingWithState:objects:count:", &v266, buf, 16);
      if (v125)
      {
        v126 = v125;
        v222 = v124;
        v230 = v123;
        v235 = v118;
        v243 = *(_QWORD *)v267;
        do
        {
          for (k = 0; k != v126; ++k)
          {
            if (*(_QWORD *)v267 != v243)
              objc_enumerationMutation(v239);
            v128 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * k);
            objc_msgSend(v128, "coreDuetIdentifier");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUILog usage](STUILog, "usage");
            v130 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v128, "identifier");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "name");
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v275 = 138543874;
              *(_QWORD *)&v275[4] = v129;
              *(_WORD *)&v275[12] = 2114;
              *(_QWORD *)&v275[14] = v131;
              *(_WORD *)&v275[22] = 2114;
              *(_QWORD *)&v275[24] = v132;
              _os_log_impl(&dword_219AB4000, v130, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v275, 0x20u);

            }
            v133 = [STUIDevice alloc];
            objc_msgSend(v128, "name");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "identifier");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = objc_msgSend(v128, "platform");
            v137 = objc_msgSend(v128, "isLocalDevice");
            objc_msgSend(v128, "lastUpdatedDate");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v133, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v134, v135, v129, v136, 1, v137, v138);

            objc_msgSend(v246, "addObject:", v139);
            +[STUILog usage](STUILog, "usage");
            v140 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v128, "identifier");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v275 = 138543618;
              *(_QWORD *)&v275[4] = v129;
              *(_WORD *)&v275[12] = 2114;
              *(_QWORD *)&v275[14] = v141;
              _os_log_impl(&dword_219AB4000, v140, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v275, 0x16u);

            }
          }
          v126 = -[NSObject countByEnumeratingWithState:objects:count:](v239, "countByEnumeratingWithState:objects:count:", &v266, buf, 16);
        }
        while (v126);
        v123 = v230;
        v118 = v235;
        v124 = v222;
      }
    }
    else
    {
      +[STUILog usage](STUILog, "usage");
      v239 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v239, OS_LOG_TYPE_ERROR))
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.4();
    }

  }
  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  v142 = v118;
  v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v262, v275, 16);
  if (v143)
  {
    v144 = v143;
    v145 = *(_QWORD *)v263;
    v244 = *(_QWORD *)v263;
    v238 = v142;
    do
    {
      v146 = 0;
      v240 = v144;
      do
      {
        if (*(_QWORD *)v263 != v145)
          objc_enumerationMutation(v142);
        v147 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * v146);
        objc_msgSend(v147, "device");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v148;
        if (!v148)
        {
          +[STUILog usage](STUILog, "usage");
          v154 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v280 = 138543618;
            v281 = 0;
            v282 = 2114;
            v283 = (uint64_t)v147;
            _os_log_error_impl(&dword_219AB4000, v154, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v280, 0x16u);
          }
          goto LABEL_138;
        }
        if (objc_msgSend(v148, "platform") == 1 || objc_msgSend(v149, "platform") == 2)
        {
          objc_msgSend(v147, "coreDuetIdentifier");
          v150 = objc_claimAutoreleasedReturnValue();
          +[STUILog usage](STUILog, "usage");
          v151 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v149, "identifier");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "name");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v280 = 138543874;
            v281 = v150;
            v282 = 2114;
            v283 = (uint64_t)v152;
            v284 = 2114;
            v285 = v153;
            _os_log_impl(&dword_219AB4000, v151, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v280, 0x20u);

            v145 = v244;
          }

          v257 = MEMORY[0x24BDAC760];
          v258 = 3221225472;
          v259 = __createDevices_block_invoke;
          v260 = &unk_24DB879A0;
          v154 = v150;
          v261 = v154;
          if (objc_msgSend(v246, "indexOfObjectPassingTest:", &v257) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v147, "user");
            v155 = (id)objc_claimAutoreleasedReturnValue();
            v156 = v149;
            objc_msgSend(MEMORY[0x24BE84658], "fetchRequestMatchingUser:device:", v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v271 = 0;
            objc_msgSend(v157, "execute:", &v271);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v271;
            if (v159)
            {
              +[STUILog usage](STUILog, "usage");
              v160 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v155, "altDSID");
                v161 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "name");
                v231 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v280 = 138543874;
                v281 = v161;
                v282 = 2114;
                v283 = (uint64_t)v231;
                v284 = 2114;
                v285 = v159;
                _os_log_fault_impl(&dword_219AB4000, v160, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);

              }
              goto LABEL_133;
            }
            if (!v158
              || !objc_msgSend(v158, "count")
              || (objc_msgSend(v158, "objectAtIndexedSubscript:", 0),
                  v162 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v162, "lastUpdatedDate"),
                  v163 = (id)objc_claimAutoreleasedReturnValue(),
                  v163,
                  v162,
                  !v163))
            {
              +[STUILog usage](STUILog, "usage");
              v160 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v155, "altDSID");
                v232 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "name");
                v173 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v280 = 138543874;
                v281 = v232;
                v282 = 2114;
                v283 = v173;
                v174 = (void *)v173;
                v284 = 2114;
                v285 = v158;
                _os_log_error_impl(&dword_219AB4000, v160, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);

              }
LABEL_133:

              v163 = 0;
            }
            v164 = v163;

            v165 = [STUIDevice alloc];
            objc_msgSend(v156, "name");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "identifier");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = objc_msgSend(v156, "platform");
            objc_msgSend(v156, "localUserDeviceState");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v165, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v166, v167, v154, v168, 0, v169 != 0, v164);

            objc_msgSend(v246, "addObject:", v170);
            +[STUILog usage](STUILog, "usage");
            v171 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
            {
              -[STUIDevice identifier](v170, "identifier");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v280 = 138543618;
              v281 = v154;
              v282 = 2114;
              v283 = (uint64_t)v172;
              _os_log_impl(&dword_219AB4000, v171, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v280, 0x16u);

            }
            v142 = v238;
            v144 = v240;
            v145 = v244;
          }

LABEL_138:
        }

        ++v146;
      }
      while (v144 != v146);
      v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v262, v275, 16);
    }
    while (v144);
  }

  v175 = v246;
  objc_msgSend(v211, "userDeviceStates");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "altDSID");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v176;
  v179 = v177;
  memset(v275, 0, sizeof(v275));
  v276 = 0u;
  v277 = 0u;
  v180 = v178;
  v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", v275, buf, 16);
  if (v181)
  {
    v182 = v181;
    v183 = 0;
    v184 = **(_QWORD **)&v275[16];
    do
    {
      for (m = 0; m != v182; ++m)
      {
        if (**(_QWORD **)&v275[16] != v184)
          objc_enumerationMutation(v180);
        objc_msgSend(*(id *)(*(_QWORD *)&v275[8] + 8 * m), "device");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v186;
        if (v186 && objc_msgSend(v186, "platform") == 4)
          ++v183;

      }
      v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", v275, buf, 16);
    }
    while (v182);
  }
  else
  {
    v183 = 0;
  }

  objc_msgSend(v213, "setHasWatchOSDevicesInternal:", v183 != 0);
  if (v183)
    v188 = objc_msgSend(v175, "count") == 0;
  else
    v188 = 0;
  objc_msgSend(v213, "setHasWatchOSDevicesOnlyInternal:", v188);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v272[0] = v189;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v272[1] = v190;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v272, 2);
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v175, "sortedArrayUsingDescriptors:", v191);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "setDevices:", v192);

  v193 = (void *)MEMORY[0x24BE845B8];
  if (v212)
  {
    v194 = &unk_24DBBEAA8;
  }
  else
  {
    objc_msgSend(v211, "dsid");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v248 = v225;
  objc_msgSend(v193, "bundleIdentifiersInstalledForDSID:inContext:error:", v194, v209, &v248);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v248;

  if (!v212)
  if (v195)
  {
    objc_msgSend(v213, "setInstalledBundleIDs:", v195);
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v197 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.3();

  }
  if (v212 && (objc_msgSend(v213, "isCloudSyncEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE84510], "fetchRequest");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v211, "managingOrganization");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "predicateWithFormat:", CFSTR("(%K == NO) AND (%@ IN %K) AND (%K == %@) AND (%K != %@) AND (%K != %@)"), CFSTR("isTombstoned"), v211, CFSTR("users"), CFSTR("organization"), v200, CFSTR("type"), *MEMORY[0x24BE846B0], CFSTR("type"), *MEMORY[0x24BE846C0]);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "setPredicate:", v201);

    v247 = v196;
    objc_msgSend(v198, "execute:", &v247);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v247;

    if (v202)
    {
      objc_msgSend(v213, "setCanStopScreenTimeWithoutPasscode:", objc_msgSend(v202, "count") == 0);
    }
    else
    {
      +[STUILog persistence](STUILog, "persistence");
      v203 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.2();

    }
  }
  else
  {
    v102 = v196;
  }
  v103 = v213;

  v105 = v213;
  v100 = v207;
  v9 = v209;
LABEL_179:

  return v103;
}

- (void)saveViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewModelCoordinator setUserDSID:](self, "setUserDSID:", v6);

  objc_msgSend(v4, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewModelCoordinator setUserName:](self, "setUserName:", v8);

  -[STRootViewModelCoordinator setViewModel:](self, "setViewModel:", v4);
  objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedBundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke;
  v12[3] = &unk_24DB865B0;
  v12[4] = self;
  objc_msgSend(v9, "categoriesForBundleIDs:completionHandler:", v11, v12);

}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke_396;
    v18[3] = &unk_24DB87AD0;
    v10 = v7;
    v19 = v10;
    v11 = v8;
    v20 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v18);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke_2;
    v15[3] = &unk_24DB871D8;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v17 = v10;
    v13 = v10;
    v14 = v11;
    objc_msgSend(v12, "addOperationWithBlock:", v15);

  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __44__STRootViewModelCoordinator_saveViewModel___block_invoke_cold_1();
  }

}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_396(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v5, "canonicalBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v6;
  else
    v7 = v12;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "addObject:", v8);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v8, 0);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v9);
  }

}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInstalledBundleIDsByCategoryIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setInstalledBundleIDs:", *(_QWORD *)(a1 + 48));

}

- (void)loadViewModelRightNow
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "Unable to load view model: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __51__STRootViewModelCoordinator_loadViewModelRightNow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v4, "loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:", v3, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v4 = a3;
  -[STRootViewModelCoordinator userDSID](self, "userDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STRootViewModelCoordinator isLocalUser](self, "isLocalUser");
  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v10[3] = &unk_24DB87A18;
  v13 = v6;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v7, "performBackgroundTask:", v10);

}

void __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (**v9)(id, id);
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  void (**v17)(id, id);

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v4, "loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:", v3, v5, v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_24DB87B20;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

  }
  else
  {
    v9 = (void (**)(id, id))*(id *)(a1 + 48);
    v10 = v8;
    if (v9)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v9[2](v9, v10);
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        block[3] = &unk_24DB86C38;
        v17 = v9;
        v16 = v10;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

  }
}

void __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);
  _QWORD v3[4];
  id v4;
  void (**v5)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "saveViewModel:", *(_QWORD *)(a1 + 40));
  v2 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v2[2](v2, 0);
    }
    else
    {
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v3[3] = &unk_24DB86C38;
      v4 = 0;
      v5 = v2;
      dispatch_async(MEMORY[0x24BDAC9B8], v3);

    }
  }

}

- (id)organizationIdentifierForUsage
{
  _BOOL4 v2;
  id *v3;

  v2 = -[STRootViewModelCoordinator isLocalUser](self, "isLocalUser");
  v3 = (id *)MEMORY[0x24BE84788];
  if (!v2)
    v3 = (id *)MEMORY[0x24BE84780];
  return *v3;
}

- (id)organizationIdentifierForManagement
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;

  -[STRootViewModelCoordinator viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "source");
  v5 = (id *)MEMORY[0x24BE84788];
  if (v4)
    v5 = (id *)MEMORY[0x24BE84780];
  v6 = *v5;

  return v6;
}

- (void)_willRefreshUsage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  -[STRootViewModelCoordinator persistenceController](self, "persistenceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke;
  v18[3] = &unk_24DB87B48;
  v18[4] = self;
  v7 = v6;
  v19 = v7;
  v20 = &v21;
  objc_msgSend(v7, "performBlockAndWait:", v18);
  if (v22[5])
  {
    +[STUILog persistence](STUILog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[STRootViewModelCoordinator viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "devices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKeyPath:", CFSTR("name"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v22[5], "valueForKeyPath:", CFSTR("name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v11;
      v29 = 2114;
      v30 = v12;
      _os_log_impl(&dword_219AB4000, v8, OS_LOG_TYPE_DEFAULT, "Updating devices from: %{public}@\n to: %{public}@", buf, 0x16u);

    }
    v13 = v22[5];
    -[STRootViewModelCoordinator viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDevices:", v13);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K == %hd OR %K == %hd)"), CFSTR("platform"), 4, CFSTR("platform"), 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v22[5], "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewModelCoordinator usageDetailsCoordinator](self, "usageDetailsCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDevices:", v16);

  }
  _Block_object_dispose(&v21, 8);

}

void __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  STUIDevice *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  STUIDevice *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  STUIDevice *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  STUIDevice *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  NSObject *v84;
  id v85;
  NSObject *v86;
  NSObject *obj;
  id obja;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  _QWORD v94[4];
  NSObject *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  id v105;
  _QWORD v106[2];
  uint8_t v107[4];
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  uint8_t buf[4];
  id v114;
  uint8_t v115[4];
  NSObject *v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  id v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isRemoteUser");
  v5 = (void *)MEMORY[0x24BE84570];
  if (v4)
  {
    objc_msgSend(v3, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v93 = 0;
    objc_msgSend(v5, "fetchUserWithDSID:inContext:error:", v6, v7, &v93);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v93;

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v92 = 0;
    objc_msgSend(MEMORY[0x24BE84570], "fetchLocalUserInContext:error:", v10, &v92);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v92;
  }
  if (v8)
  {
    v77 = v9;
    v78 = a1;
    v80 = v3;
    objc_msgSend(v8, "userDeviceStates");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = (void *)v11;
    v79 = v12;
    objc_msgSend(v12, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v81 = v14;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUILog usage](STUILog, "usage");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v114 = v81;
      _os_log_impl(&dword_219AB4000, v16, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLForKey:", 0x24DB93050);

    if (_os_feature_enabled_impl() && (v18 & 1) == 0)
    {
      v104 = 0;
      +[DeviceDetails detailsForUserWithAltDSID:error:](_TtC20ScreenTimeSettingsUI13DeviceDetails, "detailsForUserWithAltDSID:error:", v81, &v104);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v104;
      if (v19)
      {
        v102 = 0u;
        v103 = 0u;
        v101 = 0u;
        v100 = 0u;
        obj = v19;
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
        if (v21)
        {
          v22 = v21;
          v76 = v20;
          v82 = v19;
          v85 = v15;
          v89 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v101 != v89)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              objc_msgSend(v24, "coreDuetIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[STUILog usage](STUILog, "usage");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "name");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v107 = 138543874;
                v108 = v25;
                v109 = 2114;
                v110 = v27;
                v111 = 2114;
                v112 = v28;
                _os_log_impl(&dword_219AB4000, v26, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v107, 0x20u);

              }
              v29 = [STUIDevice alloc];
              objc_msgSend(v24, "name");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v24, "platform");
              v33 = objc_msgSend(v24, "isLocalDevice");
              objc_msgSend(v24, "lastUpdatedDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v29, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v30, v31, v25, v32, 1, v33, v34);

              objc_msgSend(v91, "addObject:", v35);
              +[STUILog usage](STUILog, "usage");
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v107 = 138543618;
                v108 = v25;
                v109 = 2114;
                v110 = v37;
                _os_log_impl(&dword_219AB4000, v36, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v107, 0x16u);

              }
            }
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
          }
          while (v22);
          v19 = v82;
          v15 = v85;
          v20 = v76;
        }
      }
      else
      {
        +[STUILog usage](STUILog, "usage");
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.4();
      }

    }
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v38 = v15;
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v97;
      v90 = *(_QWORD *)v97;
      v86 = v38;
      do
      {
        v42 = 0;
        obja = (id)v40;
        do
        {
          if (*(_QWORD *)v97 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v42);
          objc_msgSend(v43, "device");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (!v44)
          {
            +[STUILog usage](STUILog, "usage");
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v115 = 138543618;
              v116 = 0;
              v117 = 2114;
              v118 = (uint64_t)v43;
              _os_log_error_impl(&dword_219AB4000, v50, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v115, 0x16u);
            }
            goto LABEL_53;
          }
          if (objc_msgSend(v44, "platform") == 1 || objc_msgSend(v45, "platform") == 2)
          {
            objc_msgSend(v43, "coreDuetIdentifier");
            v46 = objc_claimAutoreleasedReturnValue();
            +[STUILog usage](STUILog, "usage");
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v45, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "name");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v115 = 138543874;
              v116 = v46;
              v117 = 2114;
              v118 = (uint64_t)v48;
              v119 = 2114;
              v120 = v49;
              _os_log_impl(&dword_219AB4000, v47, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v115, 0x20u);

              v41 = v90;
            }

            v94[0] = MEMORY[0x24BDAC760];
            v94[1] = 3221225472;
            v94[2] = __createDevices_block_invoke;
            v94[3] = &unk_24DB879A0;
            v50 = v46;
            v95 = v50;
            if (objc_msgSend(v91, "indexOfObjectPassingTest:", v94) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v43, "user");
              v51 = (id)objc_claimAutoreleasedReturnValue();
              v52 = v45;
              objc_msgSend(MEMORY[0x24BE84658], "fetchRequestMatchingUser:device:", v51, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = 0;
              objc_msgSend(v53, "execute:", &v105);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v105;
              if (v55)
              {
                +[STUILog usage](STUILog, "usage");
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v51, "altDSID");
                  v57 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "name");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v115 = 138543874;
                  v116 = v57;
                  v117 = 2114;
                  v118 = (uint64_t)v83;
                  v119 = 2114;
                  v120 = v55;
                  _os_log_fault_impl(&dword_219AB4000, v56, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v115, 0x20u);

                }
                goto LABEL_48;
              }
              if (!v54
                || !objc_msgSend(v54, "count")
                || (objc_msgSend(v54, "objectAtIndexedSubscript:", 0),
                    v58 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v58, "lastUpdatedDate"),
                    v59 = (void *)objc_claimAutoreleasedReturnValue(),
                    v58,
                    !v59))
              {
                +[STUILog usage](STUILog, "usage");
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v51, "altDSID");
                  v84 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "name");
                  v68 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v115 = 138543874;
                  v116 = v84;
                  v117 = 2114;
                  v118 = v68;
                  v69 = (void *)v68;
                  v119 = 2114;
                  v120 = v54;
                  _os_log_error_impl(&dword_219AB4000, v56, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v115, 0x20u);

                }
LABEL_48:

                v59 = 0;
              }

              v60 = [STUIDevice alloc];
              objc_msgSend(v52, "name");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "identifier");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v52, "platform");
              objc_msgSend(v52, "localUserDeviceState");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v60, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v61, v62, v50, v63, 0, v64 != 0, v59);

              objc_msgSend(v91, "addObject:", v65);
              +[STUILog usage](STUILog, "usage");
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                -[STUIDevice identifier](v65, "identifier");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v115 = 138543618;
                v116 = v50;
                v117 = 2114;
                v118 = (uint64_t)v67;
                _os_log_impl(&dword_219AB4000, v66, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v115, 0x16u);

              }
              v38 = v86;
              v40 = (uint64_t)obja;
              v41 = v90;
            }

LABEL_53:
          }

          ++v42;
        }
        while (v40 != v42);
        v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
      }
      while (v40);
    }

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v70;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "sortedArrayUsingDescriptors:", v72);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = *(_QWORD *)(*(_QWORD *)(v78 + 48) + 8);
    v75 = *(void **)(v74 + 40);
    *(_QWORD *)(v74 + 40) = v73;

    v8 = v79;
    v3 = v80;
    v9 = v77;
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke_cold_1();
  }

}

- (BOOL)hasAlreadyEnteredPINForSession
{
  return self->_hasAlreadyEnteredPINForSession;
}

- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3
{
  self->_hasAlreadyEnteredPINForSession = a3;
}

- (STAdminPersistenceController)persistenceController
{
  return (STAdminPersistenceController *)objc_getProperty(self, a2, 56, 1);
}

- (STRootViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (STGroupFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (NSMutableDictionary)coordinatorsByChildDSID
{
  return self->_coordinatorsByChildDSID;
}

- (void)setCoordinatorsByChildDSID:(id)a3
{
  objc_storeStrong((id *)&self->_coordinatorsByChildDSID, a3);
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)usageReportType
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)usageContext
{
  return self->_usageContext;
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isLocalUser
{
  return self->_isLocalUser;
}

- (void)setIsLocalUser:(BOOL)a3
{
  self->_isLocalUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_usageReportType, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_coordinatorsByChildDSID, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_eyeReliefCoordinator, 0);
  objc_storeStrong((id *)&self->_communicationSafetyCoordinator, 0);
  objc_storeStrong((id *)&self->_contentPrivacyCoordinator, 0);
  objc_storeStrong((id *)&self->_timeAllowancesCoordinator, 0);
  objc_storeStrong((id *)&self->_usageDetailsCoordinator, 0);
}

- (id)defaultValueForRestrictionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  STRestrictionItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (STRestrictionTypeWithString_onceToken_0 != -1)
    dispatch_once(&STRestrictionTypeWithString_onceToken_0, &__block_literal_global_16);
  objc_msgSend((id)STRestrictionTypeWithString_restrictionItemTypes_0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v9, v8, &stru_24DB8A1D0, objc_msgSend(v5, "unsignedIntegerValue"), 0);

  }
  else
  {
    v10 = 0;
  }

  -[STRootViewModelCoordinator contentPrivacyCoordinator](self, "contentPrivacyCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictionItem rmConfiguration](v10, "rmConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictionItem payloadKey](v10, "payloadKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleRestrictionWithConfiguration:key:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRootViewModelCoordinator contentPrivacyCoordinator](self, "contentPrivacyCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultValueForRestriction:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[STRootViewModelCoordinator contentPrivacyCoordinator](self, "contentPrivacyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __101__STRootViewModelCoordinator_STRestrictionsDataSource__loadValuesByRestrictionWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DB87C08;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadValuesByRestrictionWithCompletionHandler:", v7);

}

void __101__STRootViewModelCoordinator_STRestrictionsDataSource__loadValuesByRestrictionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v18 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v11, "rmConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payloadKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@"), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to save managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_347_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to save allowance: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to enable remote management: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not save Communication Safety setup during onboarding: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_353_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "appAndWebsiteActivityEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "BOOLValue");
  OUTLINED_FUNCTION_3_3(&dword_219AB4000, v2, v3, "Failed to set App & Website Activity state during onboarding to %@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_2();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_358_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not save Downtime during onboarding: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_359_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not save App Limit during onboarding: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_360_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not enable Content & Privacy during onboarding: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3(&dword_219AB4000, v2, v3, "Failed to save content restriction for item %{public}@ during onboarding: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_2();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_363_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not disable Content & Privacy during onboarding: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_365_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not save Screen Distance state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Error fetching blueprints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Error fetching installed bundle IDs: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch device details from DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "failed to get cloud sync status: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch categories for installed bundle identifiers: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

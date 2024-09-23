@implementation SUSUISoftwareUpdateController

- (id)availableBetaPrograms
{
  SUSettingsStatefulUIManager *v3;
  NSArray *v4;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager betaPrograms](v3, "betaPrograms");

  return v4;
}

- (void)setBetaProgramFromUI:(id)a3 forSpecifier:(id)a4
{
  SUSettingsStatefulUIManager *v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[SUSUISoftwareUpdateController manager](v8, "manager");
  -[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:completionHandler:](v5, "enrollInBetaUpdatesProgram:completionHandler:", location[0], 0);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)unenrollFromBetaProgramsWithCompletion:(id)a3
{
  SUSettingsStatefulUIManager *v3;
  id location[2];
  SUSUISoftwareUpdateController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController manager](v5, "manager");
  -[SUSettingsStatefulUIManager unenrollFromBetaUpdatesWithCompletion:](v3, "unenrollFromBetaUpdatesWithCompletion:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)enrolledBetaProgram
{
  SUSettingsStatefulUIManager *v3;
  SDBetaProgram *v4;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v3, "enrolledBetaProgram");

  return v4;
}

- (id)betaUpdatesAppleID
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v4 = (id)objc_msgSend(v3, "seedingAppleIDUsernameForCurrentDevice");

  return v4;
}

- (int64_t)betaUpdatesHasInstallationRestriction
{
  SDDevice *v3;
  SUSettingsStatefulUIManager *v4;
  char v5;

  if ((objc_msgSend(MEMORY[0x24BEAEC88], "isLockdownModeEnabled") & 1) != 0)
    return 1;
  v4 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v3 = -[SUSettingsStatefulUIManager currentSeedingDevice](v4, "currentSeedingDevice");
  v5 = -[SDDevice hasDeviceManagementRestriction](v3, "hasDeviceManagementRestriction");

  if ((v5 & 1) != 0)
    return 2;
  else
    return 0;
}

- (void)setAutomaticUpdatesFromUI:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id location[2];
  SUSUISoftwareUpdateController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSUISoftwareUpdateController setAutomaticUpdatesFromUI:userSpecified:forSpecifier:](v7, "setAutomaticUpdatesFromUI:userSpecified:forSpecifier:", location[0], 1, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticUpdatesFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5
{
  SUSettingsSUPreferencesManager *v5;
  SUSettingsStatefulUIManager *v6;
  SUSettingsSUPreferencesManager *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  BOOL v12;
  id location[2];
  SUSUISoftwareUpdateController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10 = -[SUSUISoftwareUpdateController manager](v14, "manager");
  v9 = -[SUSettingsStatefulUIManager preferences](v10, "preferences");
  -[SUSettingsSUPreferencesManager enableAutomaticUpdateV2:](v9, "enableAutomaticUpdateV2:", objc_msgSend(location[0], "BOOLValue") & 1);

  if (v12)
  {
    v6 = -[SUSUISoftwareUpdateController manager](v14, "manager");
    v5 = -[SUSettingsStatefulUIManager preferences](v6, "preferences");
    -[SUSettingsSUPreferencesManager enablePreviousUserSpecifiedAutomaticUpdateV2:](v5, "enablePreviousUserSpecifiedAutomaticUpdateV2:", objc_msgSend(location[0], "BOOLValue") & 1);

  }
  -[SUSUISoftwareUpdateController refreshupdateAutoUpdateButton](v14, "refreshupdateAutoUpdateButton");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticDownloadFromUI:(id)a3 forSpecifier:(id)a4
{
  SUSettingsSUPreferencesManager *v5;
  SUSettingsStatefulUIManager *v6;
  id v7;
  id location[2];
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[SUSUISoftwareUpdateController manager](v9, "manager");
  v5 = -[SUSettingsStatefulUIManager preferences](v6, "preferences");
  -[SUSettingsSUPreferencesManager enableAutomaticDownload:](v5, "enableAutomaticDownload:", objc_msgSend(location[0], "BOOLValue") & 1);

  -[SUSUISoftwareUpdateController refreshupdateAutoUpdateButton](v9, "refreshupdateAutoUpdateButton");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseFromUI:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id location[2];
  SUSUISoftwareUpdateController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSUISoftwareUpdateController setSecurityResponseFromUI:userSpecified:forSpecifier:](v7, "setSecurityResponseFromUI:userSpecified:forSpecifier:", location[0], 1, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5
{
  SUSettingsSUPreferencesManager *v5;
  SUSettingsStatefulUIManager *v6;
  SUSettingsSUPreferencesManager *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  BOOL v12;
  id location[2];
  SUSUISoftwareUpdateController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10 = -[SUSUISoftwareUpdateController manager](v14, "manager");
  v9 = -[SUSettingsStatefulUIManager preferences](v10, "preferences");
  -[SUSettingsSUPreferencesManager enableAutoInstallSecurityResponse:](v9, "enableAutoInstallSecurityResponse:", objc_msgSend(location[0], "BOOLValue") & 1);

  if (v12)
  {
    v6 = -[SUSUISoftwareUpdateController manager](v14, "manager");
    v5 = -[SUSettingsStatefulUIManager preferences](v6, "preferences");
    -[SUSettingsSUPreferencesManager enablePreviousUserSpecifiedAutoInstallSecurityResponse:](v5, "enablePreviousUserSpecifiedAutoInstallSecurityResponse:", objc_msgSend(location[0], "BOOLValue") & 1);

  }
  -[SUSUISoftwareUpdateController refreshupdateAutoUpdateButton](v14, "refreshupdateAutoUpdateButton");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticInstallSystemDataFilesFromUI:(id)a3 forSpecifier:(id)a4
{
  SUSettingsSUPreferencesManager *v5;
  SUSettingsStatefulUIManager *v6;
  id v7;
  id location[2];
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[SUSUISoftwareUpdateController manager](v9, "manager");
  v5 = -[SUSettingsStatefulUIManager preferences](v6, "preferences");
  -[SUSettingsSUPreferencesManager enableAutoInstallSystemAndDataFiles:](v5, "enableAutoInstallSystemAndDataFiles:", objc_msgSend(location[0], "BOOLValue") & 1);

  -[SUSUISoftwareUpdateController refreshupdateAutoUpdateButton](v9, "refreshupdateAutoUpdateButton");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)automaticUpdateStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager isAutomaticUpdateV2Enabled](v4, "isAutomaticUpdateV2Enabled"));

  return v6;
}

- (id)previousUserSpecifiedAutomaticUpdateStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager previousUserSpecifiedAutomaticUpdateV2Enabled](v4, "previousUserSpecifiedAutomaticUpdateV2Enabled"));

  return v6;
}

- (id)automaticDownloadStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager isAutomaticDownloadEnabled](v4, "isAutomaticDownloadEnabled"));

  return v6;
}

- (id)securityResponseStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager autoInstallSecurityResponse](v4, "autoInstallSecurityResponse"));

  return v6;
}

- (id)previousUserSpecifiedSecurityResponseStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager previousUserSpecifiedAutoInstallSecurityResponse](v4, "previousUserSpecifiedAutoInstallSecurityResponse"));

  return v6;
}

- (id)automaticInstallSystemDataFilesStatus
{
  void *v3;
  SUSettingsSUPreferencesManager *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferences](v5, "preferences");
  v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager autoInstallSystemAndDataFiles](v4, "autoInstallSystemAndDataFiles"));

  return v6;
}

- (void)submitAnalyticsEvent:(id)a3
{
  id v3;
  SUManagerClient *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(MEMORY[0x24BEAEC00]);
  v6 = (id)objc_msgSend(v3, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  objc_msgSend(v6, "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], location[0]);
  v5 = -[SUSUISoftwareUpdateController manager](v8, "manager");
  v4 = -[SUSettingsStatefulUIManager suClient](v5, "suClient");
  -[SUManagerClient submitSUAnalyticsEvent:](v4, "submitSUAnalyticsEvent:", v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)recordAnalyticsEvent:(id)a3
{
  id v3;
  SUManagerClient *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(MEMORY[0x24BEAEC00]);
  v6 = (id)objc_msgSend(v3, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  objc_msgSend(v6, "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], location[0]);
  v5 = -[SUSUISoftwareUpdateController manager](v8, "manager");
  v4 = -[SUSettingsStatefulUIManager suClient](v5, "suClient");
  -[SUManagerClient recordSUAnalyticsEvent:](v4, "recordSUAnalyticsEvent:", v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)analyticsDownloadOnlyTappedString
{
  return (id)*MEMORY[0x24BEAEEB8];
}

- (id)analyticsDownloadAndInstallTonightTappedString
{
  return (id)*MEMORY[0x24BEAEEB0];
}

- (id)analyticsDownloadAndInstallNowTappedString
{
  return (id)*MEMORY[0x24BEAEEA8];
}

- (id)analyticsOpenStorageTappedString
{
  return (id)*MEMORY[0x24BEAEED8];
}

- (id)learnMoreTappedString
{
  return (id)*MEMORY[0x24BEAEED0];
}

- (id)installNowTappedString
{
  return (id)*MEMORY[0x24BEAEEC8];
}

- (id)installLaterTappedString
{
  return (id)*MEMORY[0x24BEAEEC0];
}

- (SUSUISoftwareUpdateController)init
{
  dispatch_queue_t v2;
  OS_dispatch_queue *handleURLQueue;
  SUSUISoftwareUpdateController *v5;
  SUSUIServiceManager *v6;
  objc_super v7;
  SEL v8;
  SUSUISoftwareUpdateController *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUISoftwareUpdateController;
  v9 = -[SUSUISoftwareUpdateController init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v2 = dispatch_queue_create("com.apple.softwareupdatesettings.handleURLQueue", 0);
    handleURLQueue = v9->_handleURLQueue;
    v9->_handleURLQueue = (OS_dispatch_queue *)v2;

    v6 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
    -[SUSUIServiceManager initialize](v6, "initialize");

    -[SUSUISoftwareUpdateController initStatefulUI](v9, "initStatefulUI");
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (id)presentingStatefulDescriptor
{
  SUSettingsStatefulUIManager *v3;
  SUSettingsStatefulDescriptor *v4;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v3, "preferredStatefulDescriptor");

  return v4;
}

- (id)presentingDescriptor
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
  v4 = (id)objc_msgSend(v3, "descriptor");

  return v4;
}

- (id)presentingDescriptorError
{
  NSError *v2;
  id v4;
  id v5;
  char v6;
  NSError *v7;
  char v8;
  SUSettingsStatefulUIManager *v9;
  NSError *v11;

  v4 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
  v5 = (id)objc_msgSend(v4, "updateDownloadError");
  v8 = 0;
  v6 = 0;
  if (v5)
  {
    v2 = (NSError *)v5;
  }
  else
  {
    v9 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v8 = 1;
    v7 = -[SUSettingsStatefulUIManager scanError](v9, "scanError");
    v6 = 1;
    v2 = v7;
  }
  v11 = v2;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  return v11;
}

- (id)presentingAlternateStatefulDescriptor
{
  SUSettingsStatefulUIManager *v3;
  SUSettingsStatefulDescriptor *v4;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v3, "alternateStatefulDescriptor");

  return v4;
}

- (id)presentingAlternateDescriptor
{
  id v3;
  id v4;

  v3 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](self, "presentingAlternateStatefulDescriptor");
  v4 = (id)objc_msgSend(v3, "descriptor");

  return v4;
}

- (BOOL)presentingStatefulDescriptorPromotedAsAlternate
{
  SUSettingsStatefulUIManager *v3;
  BOOL v4;
  char v5;
  id v6;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v5 = 0;
  v4 = 0;
  if (-[SUSettingsStatefulUIManager isPreferredUpdatePromotedAsAlternate](v3, "isPreferredUpdatePromotedAsAlternate"))
  {
    v6 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
    v5 = 1;
    v4 = objc_msgSend(v6, "currentState") == 1;
  }
  if ((v5 & 1) != 0)

  return v4;
}

- (BOOL)presentingStatefulDescriptorIsTargetedUpdate
{
  id v3;
  SUSettingsStatefulUIManager *v4;
  BOOL v5;

  v4 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v3 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
  v5 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v4, "doesTargetedUpdateMatchDescriptor:");

  return v5;
}

- (unint64_t)presentingDescriptorUpgradeType
{
  unint64_t v3;
  id v4;
  char v5;
  id v6;

  v4 = -[SUSUISoftwareUpdateController presentingDescriptor](self, "presentingDescriptor");
  v5 = 0;
  if (v4)
  {
    v6 = -[SUSUISoftwareUpdateController presentingDescriptor](self, "presentingDescriptor");
    v5 = 1;
    v3 = objc_msgSend(v6, "upgradeType");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (unint64_t)presentingAlternateDescriptorUpgradeType
{
  unint64_t v3;
  id v4;
  char v5;
  id v6;

  v4 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](self, "presentingAlternateDescriptor");
  v5 = 0;
  if (v4)
  {
    v6 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](self, "presentingAlternateDescriptor");
    v5 = 1;
    v3 = objc_msgSend(v6, "upgradeType");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (void)dealloc
{
  id v2;
  SUSettingsSUPreferencesManager *v3;
  SUSettingsStatefulUIManager *v4;
  id v5;
  char isKindOfClass;
  objc_super v7;
  SEL v8;
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  v8 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v9, *MEMORY[0x24BEBE008], 0);

  v4 = -[SUSUISoftwareUpdateController manager](v9, "manager");
  v3 = -[SUSettingsStatefulUIManager preferences](v4, "preferences");
  -[SUSettingsSUPreferencesManager removeObserver:](v3, "removeObserver:", v9);

  v5 = (id)-[SUSUISoftwareUpdateController presentedViewController](v9, "presentedViewController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[SUSUISoftwareUpdateController dismissViewControllerAnimated:completion:](v9, "dismissViewControllerAnimated:completion:", 0, 0);
  v7.receiver = v9;
  v7.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController dealloc](&v7, sel_dealloc);
}

- (BOOL)hasAlternateUpdate
{
  id v2;
  BOOL v4;

  v2 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](self, "presentingAlternateStatefulDescriptor");
  v4 = v2 != 0;

  return v4;
}

- (id)paneTitle
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));

  return v4;
}

- (id)statusString
{
  __CFString *v2;
  int v4;
  id v5;
  SUSettingsStatefulUIManager *v6;
  BOOL v7;
  SUDownload *v8;
  SUSettingsStatefulUIManager *v9;
  SUDescriptor *v10;
  SUDownload *v11;
  SUSettingsStatefulUIManager *v12;
  SUSettingsStatefulUIManager *v13;
  NSError *v14;
  char v15;
  NSObject *log;
  os_log_type_t type;
  __CFString *v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  char v34;
  SUSettingsStatefulErrorContextProvider *v35;
  char v36;
  SUSettingsStatefulUIManager *v37;
  char v38;
  id v39;
  char v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  unint64_t v45;
  __CFString *v46;
  char v47;
  os_log_t v48[2];
  SUSUISoftwareUpdateController *v49;
  __CFString *v50;
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49 = self;
  v48[1] = (os_log_t)a2;
  if (-[SUSUISoftwareUpdateController currentUIState](self, "currentUIState") == 4)
  {
    v45 = -[SUSUISoftwareUpdateController currentDescriptorState](v49, "currentDescriptorState");
    v6 = -[SUSUISoftwareUpdateController manager](v49, "manager");
    v5 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v49, "presentingStatefulDescriptor");
    v7 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v6, "doesTargetedUpdateMatchDescriptor:");

    v44 = v7;
    v9 = -[SUSUISoftwareUpdateController manager](v49, "manager");
    v8 = -[SUSettingsStatefulUIManager currentDownload](v9, "currentDownload");
    v43 = -[SUDownload progress](v8, "progress");

    v42 = (id)objc_msgSend(v43, "phase");
    objc_msgSend(v43, "percentComplete");
    v12 = -[SUSUISoftwareUpdateController manager](v49, "manager");
    v11 = -[SUSettingsStatefulUIManager currentDownload](v12, "currentDownload");
    v10 = -[SUDownload descriptor](v11, "descriptor");
    -[SUDescriptor isSplatOnly](v10, "isSplatOnly");

    v13 = -[SUSUISoftwareUpdateController manager](v49, "manager");
    v14 = -[SUSettingsStatefulUIManager scanError](v13, "scanError");
    v40 = 0;
    v38 = 0;
    v36 = 0;
    v34 = 0;
    v32 = 0;
    v30 = 0;
    v28 = 0;
    v15 = 1;
    if (!v14)
    {
      v41 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v49, "presentingStatefulDescriptor");
      v40 = 1;
      v39 = (id)objc_msgSend(v41, "updateDownloadError");
      v38 = 1;
      LOBYTE(v4) = 0;
      if (v39)
      {
        v37 = -[SUSUISoftwareUpdateController manager](v49, "manager");
        v36 = 1;
        v35 = -[SUSettingsStatefulUIManager errorContextProvider](v37, "errorContextProvider");
        v34 = 1;
        v33 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v49, "presentingStatefulDescriptor");
        v32 = 1;
        v31 = (id)objc_msgSend(v33, "updateDownloadError");
        v30 = 1;
        v29 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v49, "presentingStatefulDescriptor");
        v28 = 1;
        v4 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v35, "shouldIgnoreUpdateError:withStatefulDescriptor:", v31);
      }
      v15 = v4;
    }
    if ((v28 & 1) != 0)

    if ((v30 & 1) != 0)
    if ((v32 & 1) != 0)

    if ((v34 & 1) != 0)
    if ((v36 & 1) != 0)

    if ((v38 & 1) != 0)
    if ((v40 & 1) != 0)

    if ((v15 & 1) != 0)
    {
      v26 = 0;
      v24 = 0;
      v22 = 0;
      v20 = 0;
      if (v44 && v45 >= 4)
      {
        v27 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = 1;
        v25 = (id)objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_INSTALL"), &stru_24E0011F0, CFSTR("Software Update"));
        v24 = 1;
        v2 = (__CFString *)v25;
      }
      else
      {
        v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = 1;
        v21 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_DOWNLOAD"), &stru_24E0011F0, CFSTR("Software Update"));
        v20 = 1;
        v2 = (__CFString *)v21;
      }
      v50 = v2;
      if ((v20 & 1) != 0)

      if ((v22 & 1) != 0)
      if ((v24 & 1) != 0)

      if ((v26 & 1) != 0)
    }
    else
    {
      if (v45 - 1 <= 4)
        __asm { BR              X8 }
      v50 = 0;
    }
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
  }
  else
  {
    v19 = SUSettingsSharedLogger();
    v48[0] = (os_log_t)(id)objc_msgSend(v19, "oslog");

    v47 = 16;
    if (os_log_type_enabled(v48[0], OS_LOG_TYPE_ERROR))
    {
      log = v48[0];
      type = v47;
      v18 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v49, "currentUIState"));
      v46 = v18;
      __os_log_helper_16_2_2_8_64_8_0((uint64_t)v51, (uint64_t)v46, -[SUSUISoftwareUpdateController currentUIState](v49, "currentUIState"));
      _os_log_error_impl(&dword_21BF33000, log, type, "Could not create a status string for the UI state: %@ (%ld). Must be UpdatesAvailable.", v51, 0x16u);

      objc_storeStrong((id *)&v46, 0);
    }
    objc_storeStrong((id *)v48, 0);
    v50 = &stru_24E0011F0;
  }
  return v50;
}

- (BOOL)supportsPullToRefresh
{
  return 1;
}

+ (unint64_t)updateActionForString:(id)a3
{
  id location[3];
  unint64_t v5;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("SUSUIUpdateNowAction")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("SUSUIUpdateTonightAction")) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (unint64_t)currentUIState
{
  SUSettingsStatefulUIManager *v3;
  unint64_t v4;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v4 = -[SUSettingsStatefulUIManager currentState](v3, "currentState");

  return v4;
}

- (unint64_t)currentDescriptorState
{
  unint64_t v3;
  id v4;
  char v5;
  id v6;

  v4 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
  v5 = 0;
  if (v4)
  {
    v6 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
    v5 = 1;
    v3 = objc_msgSend(v6, "currentState");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (OS_dispatch_queue)handleURLQueue
{
  return self->_handleURLQueue;
}

- (void)setHandleURLQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handleURLQueue, a3);
}

- (PSTableCell)automaticUpdatesCell
{
  return self->_automaticUpdatesCell;
}

- (void)setAutomaticUpdatesCell:(id)a3
{
  objc_storeStrong((id *)&self->_automaticUpdatesCell, a3);
}

- (PSTableCell)betaUpdatesCell
{
  return self->_betaUpdatesCell;
}

- (void)setBetaUpdatesCell:(id)a3
{
  objc_storeStrong((id *)&self->_betaUpdatesCell, a3);
}

- (PSTableCell)alternateUpdateCell
{
  return self->_alternateUpdateCell;
}

- (void)setAlternateUpdateCell:(id)a3
{
  objc_storeStrong((id *)&self->_alternateUpdateCell, a3);
}

- (PSTableCell)nonPromotedUpdateCell
{
  return self->_nonPromotedUpdateCell;
}

- (void)setNonPromotedUpdateCell:(id)a3
{
  objc_storeStrong((id *)&self->_nonPromotedUpdateCell, a3);
}

- (SUSSoftwareUpdateTitleCell)titleCell
{
  return self->_titleCell;
}

- (void)setTitleCell:(id)a3
{
  objc_storeStrong((id *)&self->_titleCell, a3);
}

- (SUSSoftwareUpdateScanCell)scanCell
{
  return self->_scanCell;
}

- (void)setScanCell:(id)a3
{
  objc_storeStrong((id *)&self->_scanCell, a3);
}

- (SUSSoftwareUpdateComingSoonTipCell)comingSoonCell
{
  return self->_comingSoonCell;
}

- (void)setComingSoonCell:(id)a3
{
  objc_storeStrong((id *)&self->_comingSoonCell, a3);
}

- (SUSSoftwareUpdateUpdateOptionsCell)updateOptionsCell
{
  return self->_updateOptionsCell;
}

- (void)setUpdateOptionsCell:(id)a3
{
  objc_storeStrong((id *)&self->_updateOptionsCell, a3);
}

- (SUSSoftwareUpdateProactiveSuggestionCell)proactiveSuggestionCell
{
  return self->_proactiveSuggestionCell;
}

- (void)setProactiveSuggestionCell:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveSuggestionCell, a3);
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
}

- (SUSettingsStatefulUIManager)manager
{
  return (SUSettingsStatefulUIManager *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1496);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionCell, 0);
  objc_storeStrong((id *)&self->_updateOptionsCell, 0);
  objc_storeStrong((id *)&self->_comingSoonCell, 0);
  objc_storeStrong((id *)&self->_scanCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_nonPromotedUpdateCell, 0);
  objc_storeStrong((id *)&self->_alternateUpdateCell, 0);
  objc_storeStrong((id *)&self->_betaUpdatesCell, 0);
  objc_storeStrong((id *)&self->_automaticUpdatesCell, 0);
  objc_storeStrong((id *)&self->_handleURLQueue, 0);
  objc_storeStrong((id *)&self->_UsageStorageController, 0);
  objc_storeStrong(&self->_passcodeReplyHandler, 0);
  objc_storeStrong((id *)&self->_termsManager, 0);
}

- (void)initStatefulUI
{
  SUSUIServiceManager *v2;
  SUSUIServiceManager *v3;
  id v4;
  SUSettingsStatefulUIManager *v5;
  SUSettingsStatefulUIManager *v6;
  objc_class *v7;
  SUSUISoftwareUpdateController *v8;
  SUSettingsStatefulUIManager *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  SUSettingsStatefulUIManager *v12;
  id v13;
  uint64_t v14;
  objc_class *v15;
  Class v16;
  SEL v17;
  SUSUISoftwareUpdateController *v18;

  v18 = self;
  v17 = a2;
  v2 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
  v16 = -[SUSUIServiceManager classForService:](v2, "classForService:", objc_opt_class());

  v3 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
  v15 = -[SUSUIServiceManager classForService:](v3, "classForService:", objc_opt_class());

  v14 = objc_msgSend([v16 alloc], "initWithDelegate:queue:clientType:", 0, 0, 1);
  v5 = [SUSettingsStatefulUIManager alloc];
  v4 = (id)v14;
  v7 = -[objc_class sharedInstance](v15, "sharedInstance");
  v6 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v5, "initWithManagerClient:betaManager:preferences:options:", v4, 0);
  -[SUSUISoftwareUpdateController setManager:](v18, "setManager:");

  v8 = v18;
  v9 = -[SUSUISoftwareUpdateController manager](v18, "manager");
  -[SUSettingsStatefulUIManager setDelegate:](v9, "setDelegate:", v8);

  v11 = MEMORY[0x24BDAC9B8];
  v10 = -[SUSUISoftwareUpdateController manager](v18, "manager");
  -[SUSettingsStatefulUIManager setDelegateCallbackQueue:](v10, "setDelegateCallbackQueue:", v11);

  v13 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v12 = -[SUSUISoftwareUpdateController manager](v18, "manager");
  objc_msgSend(v13, "addResponderDelegate:forServiceType:");

  objc_storeStrong((id *)&v14, 0);
}

- (void)statefulUIManager:(id)a3 requestRollbackRestartApprovalWithReplyHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  int v20;
  int v21;
  void (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location[2];
  SUSUISoftwareUpdateController *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_BODY"));

  v6 = (void *)MEMORY[0x24BEBD3B0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
  v25 = (id)objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:");

  v10 = v25;
  v9 = (void *)MEMORY[0x24BEBD3A8];
  v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E0011F0, CFSTR("Software Update"));
  v19[1] = (id)MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke;
  v23 = &unk_24DFF9F08;
  v24 = v27;
  v11 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:", v12, 1);
  objc_msgSend(v10, "addAction:");

  v15 = v25;
  v14 = (void *)MEMORY[0x24BEBD3A8];
  v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_BUTTON_REBOOT_NOW"), &stru_24E0011F0, CFSTR("Software Update"));
  v19[0] = v27;
  v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:", v17, 0);
  objc_msgSend(v15, "addAction:");

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v29, "presentViewController:animated:completion:", v25, 1, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

void __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didTransitionFromUIState:(unint64_t)a4 toState:(unint64_t)a5
{
  objc_class *v5;
  char v6;
  const char *v7;
  uint64_t v8;
  SUSUISoftwareUpdateController *v9;
  id v10;
  _BOOL4 v11;
  id v12;
  id v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  const char *v20;
  id v21;
  uint64_t v22;
  id v23;
  SUSUISoftwareUpdateController *v24;
  id v25;
  unint64_t v26;
  uint64_t *v27;
  os_log_t log;
  os_log_type_t type[4];
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id *v50;
  id obj;
  const char *v52;
  unint64_t v53;
  unint64_t v54;
  BOOL v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  unsigned __int8 v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  id location[2];
  SUSUISoftwareUpdateController *v66;
  _BYTE v67[168];
  uint64_t v68;

  v53 = a4;
  v54 = a5;
  v52 = "-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManager:didTransitionFromUIState:toState:]";
  v68 = *MEMORY[0x24BDAC8D0];
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = v53;
  v63 = v54;
  v62 = _SUSUILoggingFacility();
  v61 = 0;
  if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v62;
    *(_DWORD *)type = v61;
    v5 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v5);
    v23 = v45;
    v50 = &v60;
    v60 = v23;
    v24 = v66;
    v44 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v66, "currentUIState"));
    v25 = v44;
    v49 = &v59;
    v59 = v25;
    v26 = -[SUSUISoftwareUpdateController currentUIState](v66, "currentUIState");
    v43 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v66, "presentingStatefulDescriptor");
    v42 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v66, "presentingStatefulDescriptor");
    v41 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v66, "presentingAlternateStatefulDescriptor");
    v40 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v66, "presentingAlternateStatefulDescriptor");
    v39 = -[SUSUISoftwareUpdateController manager](v66, "manager");
    v38 = (id)objc_msgSend(v39, "currentDownload");
    v37 = (id)objc_msgSend(v38, "descriptor");
    v36 = (id)objc_msgSend(v37, "humanReadableUpdateName");
    v19 = v36;
    v48 = &v58;
    v58 = v19;
    v35 = -[SUSUISoftwareUpdateController manager](v66, "manager");
    v34 = (id)objc_msgSend(v35, "currentDownload");
    v33 = -[SUSUISoftwareUpdateController manager](v66, "manager");
    v6 = objc_msgSend(v33, "isTargetedUpdateScheduledForAutoInstall");
    v7 = "YES";
    if ((v6 & 1) == 0)
      v7 = "NO";
    v20 = v7;
    v32 = SUSettingsUIStateToString(v64);
    v21 = v32;
    v47 = &v57;
    v57 = v21;
    v22 = v64;
    v31 = SUSettingsUIStateToString(v63);
    v46 = &v56;
    v56 = v31;
    v27 = &v8;
    buf = v67;
    __os_log_helper_16_2_16_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64_8_0_8_64_8_0((uint64_t)v67, (uint64_t)v52, (uint64_t)v23, (uint64_t)v24, (uint64_t)v25, v26, (uint64_t)v43, (uint64_t)v42, (uint64_t)v41, (uint64_t)v40, (uint64_t)v19, (uint64_t)v34, (uint64_t)v20, (uint64_t)v21, v22, (uint64_t)v56, v63);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nUI State Transition: %@ (%ld) -> %@ (%ld)", buf, 0xA2u);

    obj = 0;
    objc_storeStrong(v46, 0);
    objc_storeStrong(v47, obj);
    objc_storeStrong(v48, obj);
    objc_storeStrong(v49, obj);
    objc_storeStrong(v50, obj);
  }
  objc_storeStrong(&v62, 0);
  if (-[SUSUISoftwareUpdateController supportsPullToRefresh](v66, "supportsPullToRefresh"))
  {
    v16 = (id)-[SUSUISoftwareUpdateController table](v66, "table");
    v17 = (id)objc_msgSend(v16, "refreshControl");
    v18 = 0;
    if (!v17)
    {
      v15 = 1;
      if (v63 != 3)
        v15 = v63 == 4;
      v18 = v15;
    }
    v14 = v18;

    if (v14)
    {
      v13 = (id)-[SUSUISoftwareUpdateController table](v66, "table");
      v12 = -[SUSUISoftwareUpdateController refreshControl](v66, "refreshControl");
      objc_msgSend(v13, "setRefreshControl:");

    }
  }
  -[SUSUISoftwareUpdateController _setNeedsUpdateContentUnavailableConfiguration](v66, "_setNeedsUpdateContentUnavailableConfiguration");
  v55 = 0;
  if (v64 || (v11 = 1, v63 != 1))
  {
    if (v64 != 1 || (v11 = 1, v63 != 1))
    {
      if (v64 != 1 || (v11 = 1, v63 != 2))
      {
        v11 = 1;
        if (v64 != v63)
          v11 = v64 == 2;
      }
    }
  }
  v55 = v11;
  v9 = v66;
  v10 = -[SUSUISoftwareUpdateController updatedSpecifiersArray](v66, "updatedSpecifiersArray");
  -[SUSUISoftwareUpdateController reloadUsingNewSpecifiers:animated:](v9, "reloadUsingNewSpecifiers:animated:");

  -[SUSUISoftwareUpdateController reloadCustomCells](v66, "reloadCustomCells");
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6
{
  objc_class *v6;
  id v7;
  char v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  SUSUISoftwareUpdateController *v18;
  id v19;
  unint64_t v20;
  uint64_t *v21;
  os_log_t log;
  os_log_type_t v23[4];
  uint8_t *buf;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id *v42;
  id *v43;
  id *v44;
  id *v45;
  id *v46;
  id *v47;
  id v48;
  const char *v49;
  id obj;
  unint64_t v51;
  unint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  os_log_type_t type;
  os_log_t oslog;
  unint64_t v61;
  uint64_t v62;
  id v63;
  id location[2];
  SUSUISoftwareUpdateController *v65;
  _BYTE v66[184];
  uint64_t v67;

  obj = a4;
  v51 = a5;
  v52 = a6;
  v49 = "-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManager:descriptor:didTransitionFromDescriptorState:toState:]";
  v67 = *MEMORY[0x24BDAC8D0];
  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v63 = 0;
  objc_storeStrong(&v63, obj);
  v62 = v51;
  v61 = v52;
  oslog = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v23 = type;
    v6 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v6);
    v17 = v41;
    v47 = &v58;
    v58 = v17;
    v18 = v65;
    v40 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v65, "currentUIState"));
    v19 = v40;
    v46 = &v57;
    v57 = v19;
    v20 = -[SUSUISoftwareUpdateController currentUIState](v65, "currentUIState");
    v39 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v65, "presentingStatefulDescriptor");
    v38 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v65, "presentingStatefulDescriptor");
    v7 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v65, "presentingAlternateStatefulDescriptor");
    v37 = v7;
    v36 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v65, "presentingAlternateStatefulDescriptor");
    v35 = -[SUSUISoftwareUpdateController manager](v65, "manager");
    v34 = (id)objc_msgSend(v35, "currentDownload");
    v33 = (id)objc_msgSend(v34, "descriptor");
    v32 = (id)objc_msgSend(v33, "humanReadableUpdateName");
    v12 = v32;
    v45 = &v56;
    v56 = v12;
    v31 = -[SUSUISoftwareUpdateController manager](v65, "manager");
    v30 = (id)objc_msgSend(v31, "currentDownload");
    v29 = -[SUSUISoftwareUpdateController manager](v65, "manager");
    v8 = objc_msgSend(v29, "isTargetedUpdateScheduledForAutoInstall");
    v9 = "YES";
    if ((v8 & 1) == 0)
      v9 = "NO";
    v13 = v9;
    v28 = (id)objc_msgSend(v63, "humanReadableUpdateName");
    v14 = v28;
    v44 = &v55;
    v55 = v14;
    v27 = (id)objc_msgSend(v63, "descriptor");
    v26 = SUSettingsDescriptorStateToString(v62);
    v15 = v26;
    v43 = &v54;
    v54 = v15;
    v16 = v62;
    v25 = SUSettingsDescriptorStateToString(v61);
    v42 = &v53;
    v53 = v25;
    v21 = &v10;
    buf = v66;
    __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0_8_64_8_0_8_64_8_0((uint64_t)v66, (uint64_t)v49, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, v20, (uint64_t)v39, (uint64_t)v38, (uint64_t)v7, (uint64_t)v36, (uint64_t)v12, (uint64_t)v30, (uint64_t)v13, (uint64_t)v14, (uint64_t)v27, (uint64_t)v15, v16, (uint64_t)v53, v61);
    _os_log_impl(&dword_21BF33000, log, v23[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nDescriptor %{public}@ (%p) State Transition: %@ (%ld) -> %@ (%ld)", buf, 0xB6u);

    v48 = 0;
    objc_storeStrong(v42, 0);
    objc_storeStrong(v43, v48);
    objc_storeStrong(v44, v48);
    objc_storeStrong(v45, v48);
    objc_storeStrong(v46, v48);
    objc_storeStrong(v47, v48);
  }
  v11 = 0;
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUISoftwareUpdateController refreshPane](v65, "refreshPane");
  objc_storeStrong(&v63, v11);
  objc_storeStrong(location, v11);
}

- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4
{
  UIRefreshControl *v4;
  BOOL v6;
  char v7;
  UIRefreshControl *v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = 0;
  v6 = 0;
  if (-[SUSUISoftwareUpdateController supportsPullToRefresh](v11, "supportsPullToRefresh"))
  {
    v8 = -[SUSUISoftwareUpdateController refreshControl](v11, "refreshControl");
    v7 = 1;
    v6 = v8 != 0;
  }
  if ((v7 & 1) != 0)

  if (v6)
  {
    v4 = -[SUSUISoftwareUpdateController refreshControl](v11, "refreshControl");
    -[UIRefreshControl endRefreshing](v4, "endRefreshing");

  }
  -[SUSUISoftwareUpdateController refreshPane](v11, "refreshPane");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4
{
  UIRefreshControl *v4;
  BOOL v6;
  char v7;
  UIRefreshControl *v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = 0;
  v6 = 0;
  if (-[SUSUISoftwareUpdateController supportsPullToRefresh](v11, "supportsPullToRefresh"))
  {
    v8 = -[SUSUISoftwareUpdateController refreshControl](v11, "refreshControl");
    v7 = 1;
    v6 = v8 != 0;
  }
  if ((v7 & 1) != 0)

  if (v6)
  {
    v4 = -[SUSUISoftwareUpdateController refreshControl](v11, "refreshControl");
    -[UIRefreshControl endRefreshing](v4, "endRefreshing");

  }
  -[SUSUISoftwareUpdateController refreshPane](v11, "refreshPane");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didChangeProgressForDownloadOfDescriptor:(id)a4 withDownload:(id)a5
{
  id v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  if ((unint64_t)objc_msgSend(v8, "currentState") >= 2)
    -[SUSUISoftwareUpdateController refreshPane](v10, "refreshPane");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFinishDownloadForDescriptor:(id)a4 withDownload:(id)a5
{
  id v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  -[SUSUISoftwareUpdateController refreshPane](v10, "refreshPane");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didStartInstallingUpdateWithDescriptor:(id)a4
{
  id v5;
  id location[2];
  SUSUISoftwareUpdateController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSUISoftwareUpdateController refreshPane](v7, "refreshPane");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManagerDidRefreshState:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  id v6;
  NSString *v7;
  SUSUISoftwareUpdateController *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v13;
  SUDownload *v14;
  SUSettingsStatefulUIManager *v15;
  id v16;
  SUDescriptor *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  NSString *v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  os_log_type_t v29;
  id v30;
  id location[2];
  SUSUISoftwareUpdateController *v32;
  uint8_t v33[136];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = _SUSUILoggingFacility();
  v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    log = v30;
    type = v29;
    v3 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v3);
    v7 = v25;
    v28 = v7;
    v8 = v32;
    v24 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState"));
    v9 = v24;
    v27 = v9;
    v10 = -[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState");
    v23 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUDownload descriptor](v18, "descriptor");
    v16 = (id)-[SUDescriptor humanReadableUpdateName](v17, "humanReadableUpdateName");
    v6 = v16;
    v26 = v6;
    v15 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v14 = -[SUSettingsStatefulUIManager currentDownload](v15, "currentDownload");
    v13 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v13, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManagerDidRefreshState:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nRefresh request", v33, 0x7Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  -[SUSUISoftwareUpdateController refreshPane](v32, "refreshPane");
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestPurgeConfirmationForDownload:(id)a4 replyHandler:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(_QWORD *, void *);
  void *v36;
  id v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(_QWORD *, void *);
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id location[2];
  SUSUISoftwareUpdateController *v52;

  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = 0;
  objc_storeStrong(&v50, a4);
  v49 = 0;
  objc_storeStrong(&v49, a5);
  v48 = 0;
  v22 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v47 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"));

  v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v46 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E0011F0, CFSTR("Software Update"));

  v24 = (void *)MEMORY[0x24BDD17C8];
  v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DELETE_CONFIRMATION_TITLE"));
  v27 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:");
  v26 = (id)objc_msgSend(v50, "descriptor");
  v25 = (id)objc_msgSend(v26, "productVersion");
  v45 = (id)objc_msgSend(v24, "stringWithFormat:", v27, v25);

  v30 = (id)objc_msgSend(v50, "progress");
  v31 = objc_msgSend(v30, "isDone");

  if ((v31 & 1) != 0)
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE_CONFIRMATION_BODY_DOWNLOADED"), &stru_24E0011F0, CFSTR("Software Update"));
    v6 = v48;
    v48 = v5;

  }
  else
  {
    v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_CONFIRMATION_BODY_DOWNLOADING"), &stru_24E0011F0, CFSTR("Software Update"));
    v8 = v48;
    v48 = v7;

  }
  v44 = (id)objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v45, v48);
  v11 = v44;
  v10 = (void *)MEMORY[0x24BEBD3A8];
  v9 = v47;
  v13 = MEMORY[0x24BDAC760];
  v38 = MEMORY[0x24BDAC760];
  v39 = -1073741824;
  v40 = 0;
  v41 = __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke;
  v42 = &unk_24DFF9F08;
  v43 = v49;
  v12 = (id)objc_msgSend(v10, "actionWithTitle:style:handler:", v9, 1, &v38);
  objc_msgSend(v11, "addAction:");

  v16 = v44;
  v15 = (void *)MEMORY[0x24BEBD3A8];
  v14 = v46;
  v32 = v13;
  v33 = -1073741824;
  v34 = 0;
  v35 = __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke_2;
  v36 = &unk_24DFF9F08;
  v37 = v49;
  v17 = (id)objc_msgSend(v15, "actionWithTitle:style:handler:", v14, 0, &v32);
  objc_msgSend(v16, "addAction:");

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v52, "presentViewController:animated:completion:", v44, 1);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
}

void __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestDevicePasscodeForDescriptor:(id)a4 replyHandler:(id)a5
{
  objc_class *v5;
  const char *v6;
  objc_class *v7;
  uint64_t v8;
  id passcodeReplyHandler;
  id v10;
  NSString *v11;
  id v12;
  NSString *v13;
  SUSUISoftwareUpdateController *v14;
  __CFString *v15;
  uint64_t v16;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v19;
  SUDownload *v20;
  SUSettingsStatefulUIManager *v21;
  id v22;
  SUDescriptor *v23;
  SUDownload *v24;
  SUSettingsStatefulUIManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __CFString *v30;
  NSString *v31;
  id v34;
  __CFString *v35;
  NSString *v36;
  os_log_type_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location[2];
  SUSUISoftwareUpdateController *v43;
  uint8_t v44[152];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = 0;
  objc_storeStrong(&v40, a5);
  v39 = -[SUSUISoftwareUpdateController specifierWithID:](v43, "specifierWithID:", CFSTR("SUSpecifierUpdateOptionsCell"));
  if (!v39)
  {
    v39 = -[SUSUISoftwareUpdateController specifierWithID:](v43, "specifierWithID:", CFSTR("SUProactiveSuggestionCell"));

  }
  v38 = _SUSUILoggingFacility();
  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    log = v38;
    type = v37;
    v5 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v5);
    v13 = v31;
    v36 = v13;
    v14 = v43;
    v30 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v43, "currentUIState"));
    v15 = v30;
    v35 = v15;
    v16 = -[SUSUISoftwareUpdateController currentUIState](v43, "currentUIState");
    v29 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v43, "presentingStatefulDescriptor");
    v28 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v43, "presentingStatefulDescriptor");
    v27 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v43, "presentingAlternateStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v43, "presentingAlternateStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    v24 = -[SUSettingsStatefulUIManager currentDownload](v25, "currentDownload");
    v23 = -[SUDownload descriptor](v24, "descriptor");
    v22 = (id)-[SUDescriptor humanReadableUpdateName](v23, "humanReadableUpdateName");
    v12 = v22;
    v34 = v12;
    v21 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    v20 = -[SUSettingsStatefulUIManager currentDownload](v21, "currentDownload");
    v19 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    if (-[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v19, "isTargetedUpdateScheduledForAutoInstall"))
    {
      v6 = "YES";
    }
    else
    {
      v6 = "NO";
    }
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0((uint64_t)v44, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestDevicePasscodeForDescriptor:replyHandler:]", (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v16, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, (uint64_t)v12, (uint64_t)v20, (uint64_t)v6, (uint64_t)v39, (uint64_t)v39);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nShowing PIN sheet using specifier: %{public}@ (%p)", v44, 0x8Eu);

    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong((id *)&v36, 0);
  }
  objc_storeStrong(&v38, 0);
  if (v39)
  {
    v10 = v39;
    v7 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v7);
    objc_msgSend(v10, "setProperty:forKey:");

    objc_msgSend(v39, "setEditPaneClass:", objc_opt_class());
    objc_msgSend(v39, "setProperty:forKey:", &unk_24E0116E8, CFSTR("mode"));
    v8 = MEMORY[0x220773A28](v40);
    passcodeReplyHandler = v43->_passcodeReplyHandler;
    v43->_passcodeReplyHandler = (id)v8;

    -[SUSUISoftwareUpdateController showPINSheet:](v43, "showPINSheet:", v39);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestAgreementToTermsAndConditionsForUpdate:(id)a4 replyHandler:(id)a5
{
  uint64_t v5;
  SUSSoftwareUpdateTermsManager *termsManager;
  SUSSoftwareUpdateTermsManager *v9;
  id v10;
  id v11;
  SUSUISoftwareUpdateController *v12;
  SUSSoftwareUpdateTermsManager *v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, char, id);
  void *v18;
  SUSUISoftwareUpdateController *v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  SUSUISoftwareUpdateController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v5 = objc_opt_new();
  termsManager = v24->_termsManager;
  v24->_termsManager = (SUSSoftwareUpdateTermsManager *)v5;

  v9 = v24->_termsManager;
  v10 = (id)objc_msgSend(MEMORY[0x24BE7EE08], "defaultStyle");
  -[SUSSoftwareUpdateTermsManager setServerFlowStyle:](v9, "setServerFlowStyle:");

  v13 = v24->_termsManager;
  v11 = v22;
  v12 = v24;
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __114__SUSUISoftwareUpdateController_StatefulUI__operation_requestAgreementToTermsAndConditionsForUpdate_replyHandler___block_invoke;
  v18 = &unk_24DFF9F30;
  v19 = v24;
  v20 = v21;
  -[SUSSoftwareUpdateTermsManager presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:](v13, "presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:", v11, v12, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __114__SUSUISoftwareUpdateController_StatefulUI__operation_requestAgreementToTermsAndConditionsForUpdate_replyHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_class *v3;
  const char *v4;
  id v5;
  NSString *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *log;
  os_log_type_t type;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  NSString *v24;
  id v26;
  __CFString *v27;
  NSString *v28;
  os_log_type_t v29;
  id v30[2];
  id location;
  char v32;
  uint64_t v33;
  uint8_t v34[152];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = a1;
  v32 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v30[1] = (id)a1;
  v30[0] = _SUSUILoggingFacility();
  v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v30[0];
    type = v29;
    v3 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v3);
    v6 = v24;
    v28 = v6;
    v7 = *(void **)(a1 + 32);
    v23 = SUSettingsUIStateToString(objc_msgSend(v7, "currentUIState"));
    v8 = v23;
    v27 = v8;
    v9 = objc_msgSend(*(id *)(a1 + 32), "currentUIState");
    v22 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
    v21 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
    v20 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
    v19 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
    v18 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v17 = (id)objc_msgSend(v18, "currentDownload");
    v16 = (id)objc_msgSend(v17, "descriptor");
    v15 = (id)objc_msgSend(v16, "humanReadableUpdateName");
    v5 = v15;
    v26 = v5;
    v14 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v13 = (id)objc_msgSend(v14, "currentDownload");
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    if ((objc_msgSend(v12, "isTargetedUpdateScheduledForAutoInstall") & 1) != 0)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_4_0_8_66((uint64_t)v34, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestAgreementToTermsAndConditionsForUpdate:replyHandler:]_block_invoke", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4, v32 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSUSSoftwareUpdateTermsManager returned accepted state: %d; error: %{public}@",
      v34,
      0x8Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(v30, 0);
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), (v32 & 1) == 0);
  objc_storeStrong(&location, 0);
}

- (void)operation:(id)a3 requestApprovalForDownloadConstraints:(id)a4 downloadPolicy:(id)a5 replyHandler:(id)a6
{
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  char v28;
  const __CFString *v29;
  char v30;
  id v31;
  id v32;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(_QWORD *, void *);
  void *v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  void (*v45)(_QWORD *, void *);
  void *v46;
  id v47;
  id v48;
  os_log_type_t v49;
  id v50;
  id v51;
  id v52;
  _BYTE v53[9];
  id v54;
  id v55;
  id v56;
  id v57;
  id location[2];
  SUSUISoftwareUpdateController *v59;
  uint8_t v60[24];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = 0;
  objc_storeStrong(&v57, a4);
  v56 = 0;
  objc_storeStrong(&v56, a5);
  v55 = 0;
  objc_storeStrong(&v55, a6);
  v54 = 0;
  v53[8] = 0;
  *(_QWORD *)v53 = objc_msgSend(v56, "isDownloadFreeForCellular") & 1;
  v52 = 0;
  v51 = 0;
  v32 = SUSettingsSharedLogger();
  v50 = (id)objc_msgSend(v32, "oslog");

  v49 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v60, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestApprovalForDownloadConstraints:downloadPolicy:replyHandler:]", v53[0] & 1);
    _os_log_impl(&dword_21BF33000, (os_log_t)v50, v49, "%s: Alerting user about cellular fees. zero rated = %d", v60, 0x12u);
  }
  objc_storeStrong(&v50, 0);
  v31 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if ((v53[0] & 1) != 0)
  {
    v30 = 0;
    if (v57)
      v30 = objc_msgSend(v57, "isSplatOnly");
    v6 = CFSTR("RSR_CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES");
    if ((v30 & 1) == 0)
      v6 = CFSTR("CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES");
    v29 = v6;
  }
  else
  {
    v28 = 0;
    if (v57)
      v28 = objc_msgSend(v57, "isSplatOnly");
    v7 = CFSTR("RSR_CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES");
    if ((v28 & 1) == 0)
      v7 = CFSTR("CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES");
    v29 = v7;
  }
  v8 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:", v29);
  v9 = *(void **)&v53[1];
  *(_QWORD *)&v53[1] = v8;

  v16 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24E0011F0, CFSTR("Software Update"));
  v11 = v52;
  v52 = v10;

  v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E0011F0, CFSTR("Software Update"));
  v13 = v51;
  v51 = v12;

  v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ALLOW_CELLULAR_DOWNLOAD"), &stru_24E0011F0, CFSTR("Software Update"));
  v15 = v54;
  v54 = v14;

  v48 = (id)objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v54, *(_QWORD *)&v53[1]);
  v21 = v48;
  v20 = (void *)MEMORY[0x24BEBD3A8];
  v19 = v52;
  v23 = MEMORY[0x24BDAC760];
  v42 = MEMORY[0x24BDAC760];
  v43 = -1073741824;
  v44 = 0;
  v45 = __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke;
  v46 = &unk_24DFF9F08;
  v47 = v55;
  v22 = (id)objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 0, &v42);
  objc_msgSend(v21, "addAction:");

  v26 = v48;
  v25 = (void *)MEMORY[0x24BEBD3A8];
  v24 = v51;
  v36 = v23;
  v37 = -1073741824;
  v38 = 0;
  v39 = __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke_2;
  v40 = &unk_24DFF9F08;
  v41 = v55;
  v27 = (id)objc_msgSend(v25, "actionWithTitle:style:handler:", v24, 1, &v36);
  objc_msgSend(v26, "addAction:");

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v59, "presentViewController:animated:completion:", v48, 1);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong((id *)&v53[1], 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

void __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)didAcceptEnteredPIN:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  const char *v6;
  const char *v7;
  id passcodeReplyHandler;
  id v9;
  NSString *v10;
  NSString *v11;
  SUSUISoftwareUpdateController *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SUSettingsStatefulUIManager *v20;
  SUDownload *v21;
  SUDescriptor *v22;
  id v23;
  id v24;
  SUSettingsStatefulUIManager *v25;
  SUDownload *v26;
  SUSettingsStatefulUIManager *v27;
  uint64_t v28;
  BOOL v29;
  os_log_t oslog;
  id v31;
  id v32;
  id v33;
  os_log_type_t v34;
  id v35;
  id location[2];
  SUSUISoftwareUpdateController *v37;
  uint8_t v38[16];
  uint8_t v39[152];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = _SUSUILoggingFacility();
  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v3);
    v11 = v10;
    v33 = v11;
    v12 = v37;
    v13 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v37, "currentUIState"));
    v14 = v13;
    v32 = v14;
    v15 = -[SUSUISoftwareUpdateController currentUIState](v37, "currentUIState");
    v16 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
    v17 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v37, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v37, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v21 = -[SUSettingsStatefulUIManager currentDownload](v20, "currentDownload");
    v22 = -[SUDownload descriptor](v21, "descriptor");
    v23 = (id)-[SUDescriptor humanReadableUpdateName](v22, "humanReadableUpdateName");
    v24 = v23;
    v31 = v24;
    v25 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v26 = -[SUSettingsStatefulUIManager currentDownload](v25, "currentDownload");
    v27 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v27, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    v28 = (uint64_t)v5;
    v29 = 0;
    if (location[0])
      v29 = objc_msgSend(location[0], "length") != 0;
    v6 = "YES";
    if (v29)
      v7 = "YES";
    else
      v7 = "NO";
    if (!v37->_passcodeReplyHandler)
      v6 = "NO";
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32((uint64_t)v39, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) didAcceptEnteredPIN:]", (uint64_t)v11, (uint64_t)v12, (uint64_t)v14, v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, (uint64_t)v24, (uint64_t)v26, v28, (uint64_t)v7, (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, (os_log_t)v35, v34, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nRecieved the user entered passcode. Not Empty? %s; Reply handler exists? %s",
      v39,
      0x8Eu);

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v35, 0);
  if (v37->_passcodeReplyHandler)
  {
    (*((void (**)(void))v37->_passcodeReplyHandler + 2))();
    passcodeReplyHandler = v37->_passcodeReplyHandler;
    v37->_passcodeReplyHandler = 0;

  }
  else
  {
    v9 = SUSettingsSharedLogger();
    oslog = (os_log_t)(id)objc_msgSend(v9, "oslog");

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) didAcceptEnteredPIN:]");
      _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "%s: Could not continue the installation as the passcode entry reply handler is nil. This is a bug.", v38, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_passcodeReplyHandler)
    (*((void (**)(void))v4->_passcodeReplyHandler + 2))();
  objc_storeStrong(location, 0);
}

- (id)updatedSpecifiersArray
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;
  uint64_t v30;
  id location;
  _QWORD __b[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  id (*v39)(uint64_t, uint64_t, uint64_t);
  void *v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  id (*v45)(uint64_t, uint64_t, uint64_t);
  void *v46;
  id v47;
  uint64_t v48;
  int v49;
  int v50;
  id (*v51)(uint64_t, uint64_t, uint64_t);
  void *v52;
  id v53;
  uint64_t v54;
  int v55;
  int v56;
  id (*v57)(uint64_t, uint64_t, uint64_t);
  void *v58;
  id v59;
  uint64_t v60;
  int v61;
  int v62;
  id (*v63)(uint64_t, uint64_t, uint64_t);
  void *v64;
  id v65;
  uint64_t v66;
  int v67;
  int v68;
  id (*v69)(uint64_t, uint64_t, uint64_t);
  void *v70;
  id v71;
  uint64_t v72;
  int v73;
  int v74;
  id (*v75)(uint64_t, uint64_t, uint64_t);
  void *v76;
  id v77;
  uint64_t v78;
  int v79;
  int v80;
  id (*v81)(uint64_t, uint64_t, uint64_t);
  void *v82;
  id v83;
  uint64_t v84;
  int v85;
  int v86;
  id (*v87)(uint64_t, uint64_t, uint64_t);
  void *v88;
  id v89;
  uint64_t v90;
  int v91;
  int v92;
  id (*v93)(uint64_t, uint64_t, uint64_t);
  void *v94;
  id v95;
  uint64_t v96;
  int v97;
  int v98;
  id (*v99)(uint64_t, uint64_t, uint64_t);
  void *v100;
  id v101;
  uint64_t v102;
  int v103;
  int v104;
  id (*v105)(uint64_t, uint64_t, uint64_t);
  void *v106;
  id v107;
  uint64_t v108;
  int v109;
  int v110;
  id (*v111)(uint64_t, uint64_t, uint64_t);
  void *v112;
  id v113;
  uint64_t v114;
  int v115;
  int v116;
  id (*v117)(uint64_t, uint64_t, uint64_t);
  void *v118;
  id v119;
  uint64_t v120;
  int v121;
  int v122;
  id (*v123)(uint64_t, uint64_t, uint64_t);
  void *v124;
  id v125;
  uint64_t v126;
  int v127;
  int v128;
  id (*v129)(uint64_t, uint64_t, uint64_t);
  void *v130;
  id v131;
  uint64_t v132;
  int v133;
  int v134;
  id (*v135)(uint64_t, uint64_t, uint64_t);
  void *v136;
  id v137;
  uint64_t v138;
  int v139;
  int v140;
  id (*v141)(uint64_t, uint64_t, uint64_t);
  void *v142;
  id v143;
  uint64_t v144;
  int v145;
  int v146;
  id (*v147)(uint64_t, uint64_t, uint64_t);
  void *v148;
  id v149;
  uint64_t v150;
  int v151;
  int v152;
  id (*v153)(uint64_t, uint64_t, uint64_t);
  void *v154;
  id v155;
  id v156;
  id v157[2];
  id v158;
  _BYTE v159[128];
  _QWORD v160[21];

  v160[20] = *MEMORY[0x24BDAC8D0];
  v158 = self;
  v157[1] = (id)a2;
  v157[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = MEMORY[0x24BDAC760];
  v150 = MEMORY[0x24BDAC760];
  v151 = -1073741824;
  v152 = 0;
  v153 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke;
  v154 = &unk_24DFFA308;
  v155 = v158;
  v28 = (id)MEMORY[0x220773A28](&v150);
  v160[0] = v28;
  v144 = v8;
  v145 = -1073741824;
  v146 = 0;
  v147 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_2;
  v148 = &unk_24DFFA308;
  v149 = v158;
  v27 = (id)MEMORY[0x220773A28](&v144);
  v160[1] = v27;
  v138 = v8;
  v139 = -1073741824;
  v140 = 0;
  v141 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_3;
  v142 = &unk_24DFFA308;
  v143 = v158;
  v26 = (id)MEMORY[0x220773A28](&v138);
  v160[2] = v26;
  v132 = v8;
  v133 = -1073741824;
  v134 = 0;
  v135 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_4;
  v136 = &unk_24DFFA308;
  v137 = v158;
  v25 = (id)MEMORY[0x220773A28](&v132);
  v160[3] = v25;
  v126 = v8;
  v127 = -1073741824;
  v128 = 0;
  v129 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_5;
  v130 = &unk_24DFFA308;
  v131 = v158;
  v24 = (id)MEMORY[0x220773A28](&v126);
  v160[4] = v24;
  v120 = v8;
  v121 = -1073741824;
  v122 = 0;
  v123 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_6;
  v124 = &unk_24DFFA308;
  v125 = v158;
  v23 = (id)MEMORY[0x220773A28](&v120);
  v160[5] = v23;
  v114 = v8;
  v115 = -1073741824;
  v116 = 0;
  v117 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_7;
  v118 = &unk_24DFFA308;
  v119 = v158;
  v22 = (id)MEMORY[0x220773A28](&v114);
  v160[6] = v22;
  v108 = v8;
  v109 = -1073741824;
  v110 = 0;
  v111 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_8;
  v112 = &unk_24DFFA308;
  v113 = v158;
  v21 = (id)MEMORY[0x220773A28](&v108);
  v160[7] = v21;
  v102 = v8;
  v103 = -1073741824;
  v104 = 0;
  v105 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_9;
  v106 = &unk_24DFFA308;
  v107 = v158;
  v20 = (id)MEMORY[0x220773A28](&v102);
  v160[8] = v20;
  v96 = v8;
  v97 = -1073741824;
  v98 = 0;
  v99 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_10;
  v100 = &unk_24DFFA308;
  v101 = v158;
  v19 = (id)MEMORY[0x220773A28](&v96);
  v160[9] = v19;
  v90 = v8;
  v91 = -1073741824;
  v92 = 0;
  v93 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_11;
  v94 = &unk_24DFFA308;
  v95 = v158;
  v18 = (id)MEMORY[0x220773A28](&v90);
  v160[10] = v18;
  v84 = v8;
  v85 = -1073741824;
  v86 = 0;
  v87 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_12;
  v88 = &unk_24DFFA308;
  v89 = v158;
  v17 = (id)MEMORY[0x220773A28](&v84);
  v160[11] = v17;
  v78 = v8;
  v79 = -1073741824;
  v80 = 0;
  v81 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_13;
  v82 = &unk_24DFFA308;
  v83 = v158;
  v16 = (id)MEMORY[0x220773A28](&v78);
  v160[12] = v16;
  v72 = v8;
  v73 = -1073741824;
  v74 = 0;
  v75 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_14;
  v76 = &unk_24DFFA308;
  v77 = v158;
  v15 = (id)MEMORY[0x220773A28](&v72);
  v160[13] = v15;
  v66 = v8;
  v67 = -1073741824;
  v68 = 0;
  v69 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_15;
  v70 = &unk_24DFFA308;
  v71 = v158;
  v14 = (id)MEMORY[0x220773A28](&v66);
  v160[14] = v14;
  v60 = v8;
  v61 = -1073741824;
  v62 = 0;
  v63 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_16;
  v64 = &unk_24DFFA308;
  v65 = v158;
  v13 = (id)MEMORY[0x220773A28](&v60);
  v160[15] = v13;
  v54 = v8;
  v55 = -1073741824;
  v56 = 0;
  v57 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_17;
  v58 = &unk_24DFFA308;
  v59 = v158;
  v12 = (id)MEMORY[0x220773A28](&v54);
  v160[16] = v12;
  v48 = v8;
  v49 = -1073741824;
  v50 = 0;
  v51 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_18;
  v52 = &unk_24DFFA308;
  v53 = v158;
  v11 = (id)MEMORY[0x220773A28](&v48);
  v160[17] = v11;
  v42 = v8;
  v43 = -1073741824;
  v44 = 0;
  v45 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_19;
  v46 = &unk_24DFFA308;
  v47 = v158;
  v10 = (id)MEMORY[0x220773A28](&v42);
  v160[18] = v10;
  v36 = v8;
  v37 = -1073741824;
  v38 = 0;
  v39 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_20;
  v40 = &unk_24DFFA308;
  v41 = v158;
  v9 = (id)MEMORY[0x220773A28](&v36);
  v160[19] = v9;
  v156 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 20);

  v35 = objc_msgSend(v158, "currentUIState");
  v34 = objc_msgSend(v158, "currentDescriptorState");
  memset(__b, 0, sizeof(__b));
  obj = v156;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v159, 16);
  if (v30)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v30;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v33 = *(_QWORD *)(__b[1] + 8 * v6);
      location = (id)(*(uint64_t (**)(void))(v33 + 16))();
      if (location)
        objc_msgSend(v157[0], "addObject:", location);
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v159, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v157[0];
  objc_storeStrong(&v156, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v95, 0);
  objc_storeStrong(&v101, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v119, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(&v131, 0);
  objc_storeStrong(&v137, 0);
  objc_storeStrong(&v143, 0);
  objc_storeStrong(&v149, 0);
  objc_storeStrong(&v155, 0);
  objc_storeStrong(v157, 0);
  return v3;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowComingSoonSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForComingSoonGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowComingSoonSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForComingSoonWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowAutomaticUpdatesSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForAutomaticUpdatesGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowAutomaticUpdatesSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForAutomaticUpdatesWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowBetaUpdatesCellSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForBetaUpdatesCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowScanGroupSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForScanHeaderGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowScanStatusSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForScanStatusWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowScanStatusSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForScanStatusCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowScanGroupSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForScanFooterGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowTitleGroupSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForTitleGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowTitleCellSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForTitleCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowUpdateOptionsCellSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForUpdateOptionsWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowProactiveSuggestionsSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowProactiveSuggestionsSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowProactiveSuggestionsPrimaryButtonSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionPrimaryButtonWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowProactiveSuggestionsSecondaryButtonSpecifierForUIState:descriptorState:", a2, a3) & 1) != 0)return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionSecondaryButtonWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowAlternateUpdateGroupForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForAlternateUpdateGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowAlternateUpdateCellForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForAlternateUpdateCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowNonPromotedGroupForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForNonPromotedPrimaryUpdateGroupWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowNonPromotedCellForUIState:descriptorState:", a2, a3) & 1) != 0)
    return (id)objc_msgSend(*(id *)(a1 + 32), "specifierForNonPromotedPrimaryUpdateCellWithUIState:descriptorState:", a2, a3);
  else
    return 0;
}

- (id)customCellsMapping
{
  id v3;
  PSTableCell *v4;
  PSTableCell *v5;
  PSTableCell *v6;
  PSTableCell *v7;
  SUSSoftwareUpdateProactiveSuggestionCell *v8;
  SUSSoftwareUpdateProactiveSuggestionCell *v9;
  SUSSoftwareUpdateUpdateOptionsCell *v10;
  SUSSoftwareUpdateUpdateOptionsCell *v11;
  SUSSoftwareUpdateComingSoonTipCell *v12;
  SUSSoftwareUpdateComingSoonTipCell *v13;
  SUSSoftwareUpdateScanCell *v14;
  SUSSoftwareUpdateScanCell *v15;
  SUSSoftwareUpdateTitleCell *v16;
  SUSSoftwareUpdateTitleCell *v17;
  PSTableCell *v18;
  PSTableCell *v19;
  PSTableCell *v20;
  PSTableCell *v21;
  id v22[2];
  SUSUISoftwareUpdateController *v23;

  v23 = self;
  v22[1] = (id)a2;
  v22[0] = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v23, "automaticUpdatesCell");

  if (v21)
  {
    v20 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v23, "automaticUpdatesCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v19 = -[SUSUISoftwareUpdateController betaUpdatesCell](v23, "betaUpdatesCell");

  if (v19)
  {
    v18 = -[SUSUISoftwareUpdateController betaUpdatesCell](v23, "betaUpdatesCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v17 = -[SUSUISoftwareUpdateController titleCell](v23, "titleCell");

  if (v17)
  {
    v16 = -[SUSUISoftwareUpdateController titleCell](v23, "titleCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v15 = -[SUSUISoftwareUpdateController scanCell](v23, "scanCell");

  if (v15)
  {
    v14 = -[SUSUISoftwareUpdateController scanCell](v23, "scanCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v13 = -[SUSUISoftwareUpdateController comingSoonCell](v23, "comingSoonCell");

  if (v13)
  {
    v12 = -[SUSUISoftwareUpdateController comingSoonCell](v23, "comingSoonCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v11 = -[SUSUISoftwareUpdateController updateOptionsCell](v23, "updateOptionsCell");

  if (v11)
  {
    v10 = -[SUSUISoftwareUpdateController updateOptionsCell](v23, "updateOptionsCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v9 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v23, "proactiveSuggestionCell");

  if (v9)
  {
    v8 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v23, "proactiveSuggestionCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v7 = -[SUSUISoftwareUpdateController alternateUpdateCell](v23, "alternateUpdateCell");

  if (v7)
  {
    v6 = -[SUSUISoftwareUpdateController alternateUpdateCell](v23, "alternateUpdateCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v5 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v23, "nonPromotedUpdateCell");

  if (v5)
  {
    v4 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v23, "nonPromotedUpdateCell");
    objc_msgSend(v22[0], "setObject:forKey:");

  }
  v3 = v22[0];
  objc_storeStrong(v22, 0);
  return v3;
}

- (void)reloadSpecifiers:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  uint64_t v12;
  BOOL v13;
  id location[2];
  SUSUISoftwareUpdateController *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  -[SUSUISoftwareUpdateController beginUpdates](v15, "beginUpdates");
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v6);
      -[SUSUISoftwareUpdateController reloadSpecifier:animated:](v15, "reloadSpecifier:animated:", v12, v13);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  -[SUSUISoftwareUpdateController endUpdates](v15, "endUpdates");
  objc_storeStrong(location, 0);
}

- (void)reloadUsingNewSpecifiers:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController reloadUsingNewSpecifiers:animated:](v4, "reloadUsingNewSpecifiers:animated:", location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)reloadUsingNewSpecifiers:(id)a3 animated:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id obj;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  _QWORD __b[8];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  BOOL v31;
  id location[2];
  SUSUISoftwareUpdateController *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  if (a4)
  {
    v29 = (id)-[SUSUISoftwareUpdateController specifiers](v33, "specifiers");
    v28 = (id)objc_msgSend(MEMORY[0x24BE755A0], "updatesByDiffingSpecifiers:withSpecifiers:changedBlock:", v29, location[0], &__block_literal_global_3);
    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v15 = (id)objc_msgSend(v28, "updates");
    v27 = (id)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v17 = (id)objc_msgSend(v28, "updates");
    v26 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v28, "updates");
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
    if (v19)
    {
      v11 = *(_QWORD *)__b[2];
      v12 = 0;
      v13 = v19;
      while (1)
      {
        v10 = v12;
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(obj);
        v25 = *(id *)(__b[1] + 8 * v12);
        if (objc_msgSend(v25, "operation") == 3)
          objc_msgSend(v27, "addObject:", v25);
        else
          objc_msgSend(v26, "addObject:", v25);
        ++v12;
        if (v10 + 1 >= v13)
        {
          v12 = 0;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
          if (!v13)
            break;
        }
      }
    }

    v4 = objc_alloc(MEMORY[0x24BE755A0]);
    v5 = (id)-[SUSUISoftwareUpdateController specifiers](v33, "specifiers");
    v23 = (id)objc_msgSend(v4, "initWithSpecifiers:applyUpdates:");

    v6 = (id)objc_msgSend(v23, "context");
    objc_msgSend(v6, "setAnimated:", v31);

    -[SUSUISoftwareUpdateController performSpecifierUpdates:](v33, "performSpecifierUpdates:", v23);
    v7 = objc_alloc(MEMORY[0x24BE755A0]);
    v8 = (id)-[SUSUISoftwareUpdateController specifiers](v33, "specifiers");
    v22 = (id)objc_msgSend(v7, "initWithSpecifiers:applyUpdates:");

    v9 = (id)objc_msgSend(v22, "context");
    objc_msgSend(v9, "setAnimated:", 0);

    -[SUSUISoftwareUpdateController performSpecifierUpdates:](v33, "performSpecifierUpdates:", v22);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    v30 = 0;
  }
  else
  {
    -[SUSUISoftwareUpdateController setSpecifiers:](v33, "setSpecifiers:", location[0]);
    v20 = (id)-[SUSUISoftwareUpdateController table](v33, "table");
    objc_msgSend(v20, "reloadData");

    v30 = 1;
  }
  objc_storeStrong(location, 0);
}

uint64_t __79__SUSUISoftwareUpdateController_Specifiers__reloadUsingNewSpecifiers_animated___block_invoke(void *a1, void *a2, void *a3)
{
  _QWORD *v4;
  id v7;
  char v8;
  id v9;
  id v10;
  int v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  id location[2];
  char v17;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15 = 0;
  objc_storeStrong(&v15, a3);
  v14 = a1;
  v7 = (id)objc_msgSend(location[0], "identifier");
  v12 = 0;
  v8 = 1;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUScanHeaderGroup")) & 1) == 0)
  {
    v13 = (id)objc_msgSend(location[0], "identifier");
    v12 = 1;
    v8 = objc_msgSend(v13, "isEqualToString:", CFSTR("SUScanFooterGroup"));
  }
  if ((v12 & 1) != 0)

  if ((v8 & 1) != 0)
  {
    v17 = 1;
    v11 = 1;
  }
  else if (objc_msgSend(location[0], "cellType"))
  {
    v17 = 0;
    v11 = 1;
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x24BE75A68];
    v10 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75A68]);
    v9 = (id)objc_msgSend(v15, "propertyForKey:", *v4);
    v17 = (objc_msgSend(v10, "isEqualToString:", v9) ^ 1) & 1;
    v11 = 1;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (BOOL)specifier:(id)a3 isEqualToSpecifier:(id)a4
{
  SUSUISoftwareUpdateController *v5;
  SUSUISoftwareUpdateController *v6;
  SUSUISoftwareUpdateController *v7;
  SUSUISoftwareUpdateController *v8;
  SUSUISoftwareUpdateController *v9;
  SUSUISoftwareUpdateController *v10;
  SUSUISoftwareUpdateController *v11;
  uint64_t v12;
  BOOL v13;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  id v43;
  id location[2];
  SUSUISoftwareUpdateController *v45;
  char v46;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  if ((objc_msgSend(location[0], "isEqual:", v43) & 1) != 0)
  {
    v46 = 1;
  }
  else
  {
    v12 = objc_opt_class();
    v41 = 0;
    v39 = 0;
    v37 = 0;
    v35 = 0;
    v33 = 0;
    v31 = 0;
    v29 = 0;
    v27 = 0;
    v25 = 0;
    v23 = 0;
    v21 = 0;
    v19 = 0;
    v17 = 0;
    v15 = 0;
    v13 = 0;
    if (v12 == objc_opt_class())
    {
      v11 = v45;
      v42 = (id)objc_msgSend(location[0], "name");
      v41 = 1;
      v40 = (id)objc_msgSend(v43, "name");
      v39 = 1;
      v13 = 0;
      if (-[SUSUISoftwareUpdateController specifierStringValue:IsEqualToSpecifierStringValue:](v11, "specifierStringValue:IsEqualToSpecifierStringValue:", v42))
      {
        v10 = v45;
        v38 = (id)objc_msgSend(location[0], "identifier");
        v37 = 1;
        v36 = (id)objc_msgSend(v43, "identifier");
        v35 = 1;
        v13 = 0;
        if (-[SUSUISoftwareUpdateController specifierStringValue:IsEqualToSpecifierStringValue:](v10, "specifierStringValue:IsEqualToSpecifierStringValue:", v38))
        {
          v13 = 0;
          if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x24BE75750]), *(_QWORD *)((char *)v43 + (int)*MEMORY[0x24BE75750])))
          {
            v13 = 0;
            if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x24BE75760]), *(_QWORD *)((char *)v43 + (int)*MEMORY[0x24BE75760])))
            {
              v13 = 0;
              if (-[SUSUISoftwareUpdateController specifierClassValue:IsEqualToSpecifierClassValue:](v45, "specifierClassValue:IsEqualToSpecifierClassValue:", *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x24BE75740]), *(_QWORD *)((char *)v43 + (int)*MEMORY[0x24BE75740])))
              {
                v13 = 0;
                if (-[SUSUISoftwareUpdateController specifierIntValue:IsEqualToSpecifierIntValue:](v45, "specifierIntValue:IsEqualToSpecifierIntValue:", *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x24BE75738]), *(_QWORD *)((char *)v43 + (int)*MEMORY[0x24BE75738])))
                {
                  v13 = 0;
                  if (-[SUSUISoftwareUpdateController specifierClassValue:IsEqualToSpecifierClassValue:](v45, "specifierClassValue:IsEqualToSpecifierClassValue:", *(_QWORD *)((char *)location[0] + (int)*MEMORY[0x24BE75748]), *(_QWORD *)((char *)v43 + (int)*MEMORY[0x24BE75748])))
                  {
                    v13 = 0;
                    if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", objc_msgSend(location[0], "confirmationAction"), objc_msgSend(v43, "confirmationAction")))
                    {
                      v13 = 0;
                      if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", objc_msgSend(location[0], "confirmationAlternateAction"), objc_msgSend(v43, "confirmationAlternateAction")))
                      {
                        v13 = 0;
                        if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", objc_msgSend(location[0], "confirmationCancelAction"), objc_msgSend(v43, "confirmationCancelAction")))
                        {
                          v13 = 0;
                          if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", objc_msgSend(location[0], "controllerLoadAction"), objc_msgSend(v43, "controllerLoadAction")))
                          {
                            v9 = v45;
                            v34 = (id)objc_msgSend(location[0], "properties");
                            v33 = 1;
                            v32 = (id)objc_msgSend(v43, "properties");
                            v31 = 1;
                            v13 = 0;
                            if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v9, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v34))
                            {
                              v8 = v45;
                              v30 = (id)objc_msgSend(location[0], "values");
                              v29 = 1;
                              v28 = (id)objc_msgSend(v43, "values");
                              v27 = 1;
                              v13 = 0;
                              if (-[SUSUISoftwareUpdateController specifierArrayValue:IsEqualToSpecifierArrayValue:](v8, "specifierArrayValue:IsEqualToSpecifierArrayValue:", v30))
                              {
                                v7 = v45;
                                v26 = (id)objc_msgSend(location[0], "titleDictionary");
                                v25 = 1;
                                v24 = (id)objc_msgSend(v43, "titleDictionary");
                                v23 = 1;
                                v13 = 0;
                                if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v7, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v26))
                                {
                                  v6 = v45;
                                  v22 = (id)objc_msgSend(location[0], "shortTitleDictionary");
                                  v21 = 1;
                                  v20 = (id)objc_msgSend(v43, "shortTitleDictionary");
                                  v19 = 1;
                                  v13 = 0;
                                  if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v6, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v22))
                                  {
                                    v5 = v45;
                                    v18 = (id)objc_msgSend(location[0], "userInfo");
                                    v17 = 1;
                                    v16 = (id)objc_msgSend(v43, "userInfo");
                                    v15 = 1;
                                    v13 = -[SUSUISoftwareUpdateController specifierIDValue:IsEqualToSpecifierIDValue:](v5, "specifierIDValue:IsEqualToSpecifierIDValue:", v18);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v46 = v13;
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v19 & 1) != 0)

    if ((v21 & 1) != 0)
    if ((v23 & 1) != 0)

    if ((v25 & 1) != 0)
    if ((v27 & 1) != 0)

    if ((v29 & 1) != 0)
    if ((v31 & 1) != 0)

    if ((v33 & 1) != 0)
    if ((v35 & 1) != 0)

    if ((v37 & 1) != 0)
    if ((v39 & 1) != 0)

    if ((v41 & 1) != 0)
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v46 & 1;
}

- (BOOL)specifierIntValue:(int64_t)a3 IsEqualToSpecifierIntValue:(int64_t)a4
{
  return a3 == a4;
}

- (BOOL)specifierStringValue:(id)a3 IsEqualToSpecifierStringValue:(id)a4
{
  char v5;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (v5 = 1, v7))
    v5 = objc_msgSend(location[0], "isEqualToString:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierDictionaryValue:(id)a3 IsEqualToSpecifierDictionaryValue:(id)a4
{
  char v5;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (v5 = 1, v7))
    v5 = objc_msgSend(location[0], "isEqualToDictionary:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierArrayValue:(id)a3 IsEqualToSpecifierArrayValue:(id)a4
{
  char v5;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (v5 = 1, v7))
    v5 = objc_msgSend(location[0], "isEqualToArray:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierSelectorValue:(SEL)a3 IsEqualToSpecifierSelectorValue:(SEL)a4
{
  BOOL v5;

  if (a3)
    return a3 == a4;
  v5 = 1;
  if (a4)
    return a3 == a4;
  return v5;
}

- (BOOL)specifierClassValue:(Class)a3 IsEqualToSpecifierClassValue:(Class)a4
{
  BOOL v5;

  if (a3)
    return a3 == a4;
  v5 = 1;
  if (a4)
    return a3 == a4;
  return v5;
}

- (BOOL)specifierIDValue:(id)a3 IsEqualToSpecifierIDValue:(id)a4
{
  char v5;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (v5 = 1, v7))
    v5 = objc_msgSend(location[0], "isEqual:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)fixCustomCellSpecifiers
{
  id v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id location;
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  id v14[2];
  SUSUISoftwareUpdateController *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = -[SUSUISoftwareUpdateController customCellsMapping](self, "customCellsMapping");
  memset(__b, 0, sizeof(__b));
  obj = v14[0];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v11 = -[SUSUISoftwareUpdateController specifierWithID:](v15, "specifierWithID:", v13);
      location = (id)objc_msgSend(v14[0], "objectForKeyedSubscript:", v13);
      v2 = (id)objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75D18]);
      v3 = v2 != 0;

      if (!v3)
        objc_msgSend(v11, "setProperty:forKey:", location, *MEMORY[0x24BE75D18]);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(v14, 0);
}

+ (id)visibleGroupSpecifiers
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&visibleGroupSpecifiers_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_239);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)visibleGroupSpecifiers_visibleGroupSpecifiers;
}

void __67__SUSUISoftwareUpdateController_Specifiers__visibleGroupSpecifiers__block_invoke()
{
  id v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("SUAutomaticUpdateGroup");
  v2[1] = CFSTR("SUTitleGroup");
  v2[2] = CFSTR("SUCancelAutomaticUpdateGroup");
  v2[3] = CFSTR("SUAlternateUpdateGroup");
  v0 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  v1 = (void *)visibleGroupSpecifiers_visibleGroupSpecifiers;
  visibleGroupSpecifiers_visibleGroupSpecifiers = (uint64_t)v0;

}

- (id)specifierForComingSoonGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6[5];

  v6[4] = self;
  v6[3] = (id)a2;
  v6[2] = (id)a3;
  v6[1] = (id)a4;
  v6[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUTipKitComingSoonGroup"));
  if (!v6[0])
  {
    v6[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v6[0], "setProperty:forKey:", CFSTR("SUTipKitComingSoonGroup"), *MEMORY[0x24BE75AC0]);
  }
  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)specifierForComingSoonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SUSSoftwareUpdateComingSoonTipCell *v4;
  id v6;
  SUSSoftwareUpdateComingSoonTipCell *v7;
  SUSSoftwareUpdateComingSoonTipCell *v8;
  SUSSoftwareUpdateComingSoonTipCell *v9;
  id v10;
  id v11;
  SUSSoftwareUpdateComingSoonTipCell *v12;
  BOOL v13;
  id v14[4];
  SUSUISoftwareUpdateController *v15;

  v15 = self;
  v14[3] = (id)a2;
  v14[2] = (id)a3;
  v14[1] = (id)a4;
  v14[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUTipKitComingSoonCell"));
  if (!v14[0])
  {
    v14[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);

    objc_msgSend(v14[0], "setProperty:forKey:", CFSTR("SUTipKitComingSoonCell"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v14[0], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    -[SUSUISoftwareUpdateController setComingSoonCell:](v15, "setComingSoonCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController comingSoonCell](v15, "comingSoonCell");
  v13 = v4 != 0;

  if (!v13)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEAEF08]), "initWithStyle:reuseIdentifier:specifier:", 3, 0);
    -[SUSUISoftwareUpdateController setComingSoonCell:](v15, "setComingSoonCell:");

    v12 = -[SUSUISoftwareUpdateController comingSoonCell](v15, "comingSoonCell");
    -[SUSSoftwareUpdateComingSoonTipCell setSpecifier:](v12, "setSpecifier:", v14[0]);

  }
  v6 = v14[0];
  v7 = -[SUSUISoftwareUpdateController comingSoonCell](v15, "comingSoonCell");
  objc_msgSend(v6, "setProperty:forKey:");

  v8 = -[SUSUISoftwareUpdateController comingSoonCell](v15, "comingSoonCell");
  -[SUSSoftwareUpdateComingSoonTipCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("SUTipKitComingSoonCell"));

  v9 = -[SUSUISoftwareUpdateController comingSoonCell](v15, "comingSoonCell");
  -[SUSSoftwareUpdateComingSoonTipCell setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", !-[SUSUISoftwareUpdateController isBusy](v15, "isBusy"));

  v10 = v14[0];
  objc_storeStrong(v14, 0);
  return v10;
}

- (id)specifierForAutomaticUpdatesGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSUInteger v12;
  objc_class *v13;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  NSString *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  SUCoreDDMDeclaration *v35;
  SUSettingsStatefulUIManager *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  SUDescriptor *v42;
  SUDownload *v43;
  SUSettingsStatefulUIManager *v44;
  id v45;
  SUDescriptor *v46;
  SUDownload *v47;
  SUSettingsStatefulUIManager *v48;
  id v49;
  id v50;
  SUDownload *v51;
  SUSettingsStatefulUIManager *v52;
  SUDescriptor *v53;
  SUCoreDDMDeclaration *v54;
  SUSettingsStatefulUIManager *v55;
  SUCoreDDMDeclaration *v56;
  SUSettingsStatefulUIManager *v57;
  SUCoreDDMDeclaration *v58;
  SUSettingsStatefulUIManager *v59;
  char v60;
  SUSettingsStatefulUIManager *v61;
  char v62;
  SUSettingsStatefulUIManager *v63;
  NSRange v64;
  id v65;
  id v66;
  id v67;
  id location;
  id v69;
  id v70;
  id v71;
  id v72;
  unint64_t v73;
  unint64_t v74;
  SEL v75;
  SUSUISoftwareUpdateController *v76;

  v76 = self;
  v75 = a2;
  v74 = a3;
  v73 = a4;
  v72 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUAutomaticUpdateGroup"));
  if (!v72)
  {
    v72 = (id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SUAutomaticUpdateGroup"));

  }
  if (-[SUSUISoftwareUpdateController shouldShowEnforcedUpdateForUIState:descriptorState:](v76, "shouldShowEnforcedUpdateForUIState:descriptorState:", v74, v73))
  {
    v55 = -[SUSUISoftwareUpdateController manager](v76, "manager");
    v54 = -[SUSettingsStatefulUIManager ddmDeclaration](v55, "ddmDeclaration");
    v71 = (id)-[SUCoreDDMDeclaration versionString](v54, "versionString");

    v57 = -[SUSUISoftwareUpdateController manager](v76, "manager");
    v56 = -[SUSettingsStatefulUIManager ddmDeclaration](v57, "ddmDeclaration");
    v70 = (id)-[SUCoreDDMDeclaration buildVersionString](v56, "buildVersionString");

    v59 = -[SUSUISoftwareUpdateController manager](v76, "manager");
    v58 = -[SUSettingsStatefulUIManager ddmDeclaration](v59, "ddmDeclaration");
    v69 = (id)-[SUCoreDDMDeclaration enforcedInstallDate](v58, "enforcedInstallDate");

    location = 0;
    v67 = (id)objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v69, 1);
    v52 = -[SUSUISoftwareUpdateController manager](v76, "manager");
    v51 = -[SUSettingsStatefulUIManager currentDownload](v52, "currentDownload");
    v53 = -[SUDownload descriptor](v51, "descriptor");

    if (v53)
    {
      v40 = (void *)MEMORY[0x24BDD17C8];
      v50 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v49 = (id)objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_24E0011F0, CFSTR("Software Update"));
      v48 = -[SUSUISoftwareUpdateController manager](v76, "manager");
      v47 = -[SUSettingsStatefulUIManager currentDownload](v48, "currentDownload");
      v46 = -[SUDownload descriptor](v47, "descriptor");
      v45 = (id)-[SUDescriptor productVersion](v46, "productVersion");
      v44 = -[SUSUISoftwareUpdateController manager](v76, "manager");
      v43 = -[SUSettingsStatefulUIManager currentDownload](v44, "currentDownload");
      v42 = -[SUDownload descriptor](v43, "descriptor");
      v41 = (id)-[SUDescriptor productBuildVersion](v42, "productBuildVersion");
      v4 = (id)objc_msgSend(v40, "stringWithFormat:", v49, v45, v41);
      v5 = location;
      location = v4;

    }
    else if (v71 && v70)
    {
      v37 = (void *)MEMORY[0x24BDD17C8];
      v39 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (id)objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_24E0011F0, CFSTR("Software Update"));
      v6 = (id)objc_msgSend(v37, "stringWithFormat:", v71, v70);
      v7 = location;
      location = v6;

    }
    else if (v71)
    {
      objc_storeStrong(&location, v71);
    }
    else
    {
      objc_storeStrong(&location, v70);
    }
    v28 = (void *)MEMORY[0x24BDD17C8];
    v31 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANAGED_DEVICE_ENFORCED_UPDATE_BODY"));
    v29 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:");
    v66 = (id)objc_msgSend(v28, "stringWithFormat:", location);

    v32 = (void *)MEMORY[0x24BDD17C8];
    v34 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (id)objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("MANAGED_DEVICE_ENFORCED_UPDATE_BODY_WITH_DATE"), &stru_24E0011F0, CFSTR("Software Update"));
    v8 = (id)objc_msgSend(v32, "stringWithFormat:", v66, v67);
    v9 = v66;
    v66 = v8;

    v36 = -[SUSUISoftwareUpdateController manager](v76, "manager");
    v35 = -[SUSettingsStatefulUIManager ddmDeclaration](v36, "ddmDeclaration");
    v65 = (id)-[SUCoreDDMDeclaration detailsURL](v35, "detailsURL");

    if (v65)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MANAGED_DEVICE_ENFORCED_UPDATE_BODY_WITH_URL"), &stru_24E0011F0, CFSTR("Software Update"));
      v10 = (id)objc_msgSend(v21, "stringWithFormat:", v66, v65);
      v11 = v66;
      v66 = v10;

      v64.location = objc_msgSend(v66, "rangeOfString:", v65);
      v64.length = v12;
      v24 = v72;
      v13 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v13);
      objc_msgSend(v24, "setProperty:forKey:");

      v26 = v72;
      v27 = NSStringFromRange(v64);
      objc_msgSend(v26, "setProperty:forKey:");

      objc_msgSend(v72, "setProperty:forKey:", v65, *MEMORY[0x24BE75A60]);
    }
    objc_msgSend(v72, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v72, "setProperty:forKey:", v66, *MEMORY[0x24BE75A68]);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    v62 = 0;
    v60 = 0;
    v20 = 0;
    if (v74 == 4)
    {
      v20 = 0;
      if (!-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](v76, "presentingStatefulDescriptorPromotedAsAlternate"))
      {
        v63 = -[SUSUISoftwareUpdateController manager](v76, "manager");
        v62 = 1;
        v19 = 1;
        if (!-[SUSettingsStatefulUIManager isDelayingUpdate](v63, "isDelayingUpdate"))
        {
          v61 = -[SUSUISoftwareUpdateController manager](v76, "manager");
          v60 = 1;
          v19 = -[SUSettingsStatefulUIManager hasSUPathRestrictions](v61, "hasSUPathRestrictions");
        }
        v20 = v19;
      }
    }
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v72, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANAGED_DEVICE_DELAY_EXPIRED_AVAILABLE"));
      v16 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:");
      objc_msgSend(v72, "setProperty:forKey:");

    }
    else
    {
      objc_msgSend(v72, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75868]);
      objc_msgSend(v72, "setProperty:forKey:", &stru_24E0011F0, *MEMORY[0x24BE75A68]);
    }
  }
  v15 = v72;
  objc_storeStrong(&v72, 0);
  return v15;
}

- (id)specifierForAutomaticUpdatesWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v4;
  id v5;
  PSTableCell *v6;
  id v7;
  id v9;
  PSTableCell *v10;
  id v11;
  id v12;
  id v13;
  PSTableCell *v14;
  PSTableCell *v15;
  PSTableCell *v16;
  PSTableCell *v17;
  BOOL v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  id v23;
  id location;
  char v25;
  id v26[4];
  SUSUISoftwareUpdateController *v27;

  v27 = self;
  v26[3] = (id)a2;
  v26[2] = (id)a3;
  v26[1] = (id)a4;
  v25 = 0;
  v26[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUAutomaticUpdateButton"));

  if (!v26[0])
  {
    v21 = (void *)MEMORY[0x24BE75590];
    v22 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
    objc_opt_class();
    v4 = (id)objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v27, 0);
    v5 = v26[0];
    v26[0] = v4;

    objc_msgSend(v26[0], "setProperty:forKey:", CFSTR("SUAutomaticUpdateButton"), *MEMORY[0x24BE75AC0]);
    -[SUSUISoftwareUpdateController setAutomaticUpdatesCell:](v27, "setAutomaticUpdatesCell:", 0);
  }
  v6 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
  v20 = v6 != 0;

  if (!v20)
  {
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE755E8]), "initWithStyle:reuseIdentifier:specifier:", 0, CFSTR("SUAutomaticUpdateButton"), v26[0]);
    -[SUSUISoftwareUpdateController setAutomaticUpdatesCell:](v27, "setAutomaticUpdatesCell:");

  }
  location = (id)objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  v12 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  objc_msgSend(location, "setText:");

  v13 = -[SUSUISoftwareUpdateController automaticUpdatesCellTitle](v27, "automaticUpdatesCellTitle");
  objc_msgSend(location, "setSecondaryText:");

  v14 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
  -[PSTableCell setContentConfiguration:](v14, "setContentConfiguration:", location);

  v15 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
  -[PSTableCell setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("SUAutomaticUpdateButton"));

  v16 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
  -[PSTableCell setAccessoryType:](v16, "setAccessoryType:", 1);

  v17 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
  -[PSTableCell setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", !-[SUSUISoftwareUpdateController isBusy](v27, "isBusy"));

  objc_msgSend(v26[0], "setProperty:forKey:", &unk_24E011700, *MEMORY[0x24BE75850]);
  v7 = (id)objc_msgSend(v26[0], "propertyForKey:", *MEMORY[0x24BE75D18]);
  v18 = v7 != 0;

  if (!v18)
  {
    v10 = -[SUSUISoftwareUpdateController automaticUpdatesCell](v27, "automaticUpdatesCell");
    objc_msgSend(v26[0], "setProperty:forKey:");

  }
  v9 = v26[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v26, 0);
  return v9;
}

- (id)specifierForBetaUpdatesCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  PSTableCell *v4;
  id v5;
  id v7;
  PSTableCell *v8;
  id v9;
  id v10;
  id v11;
  PSTableCell *v12;
  PSTableCell *v13;
  PSTableCell *v14;
  PSTableCell *v15;
  BOOL v16;
  id v17;
  BOOL v18;
  void *v19;
  id v20;
  id v21;
  id location;
  id v23[4];
  SUSUISoftwareUpdateController *v24;

  v24 = self;
  v23[3] = (id)a2;
  v23[2] = (id)a3;
  v23[1] = (id)a4;
  v23[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUGetBetaUpdatesButton"));
  if (!v23[0])
  {
    v19 = (void *)MEMORY[0x24BE75590];
    v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("GET_BETA_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
    objc_opt_class();
    v23[0] = (id)objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, v24, 0);

    objc_msgSend(v23[0], "setProperty:forKey:", CFSTR("SUGetBetaUpdatesButton"), *MEMORY[0x24BE75AC0]);
    -[SUSUISoftwareUpdateController setBetaUpdatesCell:](v24, "setBetaUpdatesCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
  v18 = v4 != 0;

  if (!v18)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE755E8]), "initWithStyle:reuseIdentifier:specifier:", 0, CFSTR("SUGetBetaUpdatesButton"), v23[0]);
    -[SUSUISoftwareUpdateController setBetaUpdatesCell:](v24, "setBetaUpdatesCell:");

  }
  location = (id)objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GET_BETA_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  objc_msgSend(location, "setText:");

  v11 = -[SUSUISoftwareUpdateController isBetaUpdatesEnabled](v24, "isBetaUpdatesEnabled");
  objc_msgSend(location, "setSecondaryText:");

  v12 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
  -[PSTableCell setContentConfiguration:](v12, "setContentConfiguration:", location);

  v13 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
  -[PSTableCell setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("SUGetBetaUpdatesButton"));

  v14 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
  -[PSTableCell setAccessoryType:](v14, "setAccessoryType:", 1);

  v15 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
  -[PSTableCell setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", !-[SUSUISoftwareUpdateController isBusy](v24, "isBusy"));

  objc_msgSend(v23[0], "setProperty:forKey:", &unk_24E011700, *MEMORY[0x24BE75850]);
  v5 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75D18]);
  v16 = v5 != 0;

  if (!v16)
  {
    v8 = -[SUSUISoftwareUpdateController betaUpdatesCell](v24, "betaUpdatesCell");
    objc_msgSend(v23[0], "setProperty:forKey:");

  }
  v7 = v23[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v23, 0);
  return v7;
}

- (id)specifierForScanHeaderGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  objc_class *v4;
  id v6;
  NSString *v7;
  id v8[5];

  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUScanHeaderGroup"));
  if (!v8[0])
  {
    v8[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v8[0], "setProperty:forKey:", CFSTR("SUScanHeaderGroup"), *MEMORY[0x24BE75AC0]);
    v4 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");

    objc_msgSend(v8[0], "setProperty:forKey:", &unk_24E011718, CFSTR("SUHeight"));
  }
  v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanFooterGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  objc_class *v4;
  id v6;
  NSString *v7;
  id v8[5];

  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUScanFooterGroup"));
  if (!v8[0])
  {
    v8[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v8[0], "setProperty:forKey:", CFSTR("SUScanFooterGroup"), *MEMORY[0x24BE75AC0]);
    v4 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");

    objc_msgSend(v8[0], "setProperty:forKey:", &unk_24E011718, CFSTR("SUHeight"));
  }
  v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanStatusWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  objc_class *v4;
  id v6;
  NSString *v7;
  id v8[5];

  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUScanStatusGroup"));
  if (!v8[0])
  {
    v8[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v8[0], "setProperty:forKey:", CFSTR("SUScanStatusGroup"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v8[0], "setProperty:forKey:", &unk_24E011778, CFSTR("SUHeight"));
    v4 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");

  }
  v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanStatusCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SUSSoftwareUpdateScanCell *v4;
  id v5;
  SUSUISoftwareUpdateController *v7;
  SUSSoftwareUpdateScanCell *v8;
  id v9;
  SUSSoftwareUpdateScanCell *v10;
  SUSSoftwareUpdateScanCell *v11;
  BOOL v12;
  void *v13;
  SUSSoftwareUpdateScanCell *v14;
  BOOL v15;
  id v16[4];
  SUSUISoftwareUpdateController *v17;

  v17 = self;
  v16[3] = (id)a2;
  v16[2] = (id)a3;
  v16[1] = (id)a4;
  v16[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUScanStatusCell"));
  if (!v16[0])
  {
    v16[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);

    objc_msgSend(v16[0], "setProperty:forKey:", CFSTR("SUScanStatusCell"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v16[0], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  }
  v4 = -[SUSUISoftwareUpdateController scanCell](v17, "scanCell");
  v15 = v4 != 0;

  if (!v15)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAEF20]), "initWithStyle:reuseIdentifier:specifier:", 3, 0);
    -[SUSUISoftwareUpdateController setScanCell:](v17, "setScanCell:");

    v14 = -[SUSUISoftwareUpdateController scanCell](v17, "scanCell");
    -[SUSSoftwareUpdateScanCell setSpecifier:](v14, "setSpecifier:", v16[0]);

  }
  v11 = -[SUSUISoftwareUpdateController scanCell](v17, "scanCell");
  -[SUSSoftwareUpdateScanCell setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:");

  objc_msgSend(v16[0], "setAccessibilityIdentifier:", CFSTR("SUScanStatusCell"));
  v5 = (id)objc_msgSend(v16[0], "propertyForKey:", *MEMORY[0x24BE75D18]);
  v12 = v5 != 0;

  if (!v12)
  {
    v10 = -[SUSUISoftwareUpdateController scanCell](v17, "scanCell");
    objc_msgSend(v16[0], "setProperty:forKey:");

  }
  v7 = v17;
  v8 = -[SUSUISoftwareUpdateController scanCell](v17, "scanCell");
  -[SUSUISoftwareUpdateController configureScanCell:withUIState:descriptorState:](v7, "configureScanCell:withUIState:descriptorState:");

  v9 = v16[0];
  objc_storeStrong(v16, 0);
  return v9;
}

- (id)specifierForTitleGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  char v20;
  id location;
  char v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  SEL v27;
  SUSUISoftwareUpdateController *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = a4;
  v24 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUTitleGroup"));
  if (!v24)
  {
    v24 = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v24, "setProperty:forKey:", CFSTR("SUTitleGroup"), *MEMORY[0x24BE75AC0]);
  }
  v22 = 0;
  v19 = 1;
  if (!-[SUSUISoftwareUpdateController shouldShowProactiveSuggestionsSpecifierForUIState:descriptorState:](v28, "shouldShowProactiveSuggestionsSpecifierForUIState:descriptorState:", v26, v25))
  {
    v23 = -[SUSUISoftwareUpdateController manager](v28, "manager");
    v22 = 1;
    v19 = -[SUSettingsStatefulUIManager isClearingSpaceForDownload](v23, "isClearingSpaceForDownload");
  }
  if ((v22 & 1) != 0)

  if ((v19 & 1) != 0)
    goto LABEL_24;
  if (v26 == 4 && v25 == 1)
  {
    location = &stru_24E0011F0;
    if (!-[SUSUISoftwareUpdateController _shouldHideTonightButton](v28, "_shouldHideTonightButton"))
    {
      objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UPDATE_OPTIONS_EXPLANATION_FOOTER_TEXT"));
      v4 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:");
      v5 = location;
      location = v4;

    }
    v15 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v16 = objc_msgSend(v15, "sf_isInternalInstall");

    if ((v16 & 1) != 0)
    {
      v13 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
      v14 = objc_msgSend(v13, "shouldBypassSystemRootWarning");

      if ((v14 & 1) == 0)
      {
        v20 = 0;
        system_root_status(0, &v20);
        if ((v20 & 1) != 0)
        {
          if (location)
          {
            v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), location, CFSTR("INTERNAL ONLY: Roots are installed. We recommend uninstalling all roots and restarting the device before doing an update."));
            v7 = location;
            location = v6;

          }
          else
          {
            objc_storeStrong(&location, CFSTR("INTERNAL ONLY: Roots are installed. We recommend uninstalling all roots and restarting the device before doing an update."));
          }
        }
      }
    }
    objc_msgSend(v24, "setProperty:forKey:", location, *MEMORY[0x24BE75A68]);
    objc_storeStrong(&location, 0);
    goto LABEL_25;
  }
  if (v26 != 4 || v25 != 4)
  {
LABEL_24:
    objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75868]);
    objc_msgSend(v24, "setProperty:forKey:", &stru_24E0011F0, *MEMORY[0x24BE75A68]);
    goto LABEL_25;
  }
  if (!-[SUSUISoftwareUpdateController _shouldHideTonightButton](v28, "_shouldHideTonightButton"))
  {
    objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    v12 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("INSTALL_OPTIONS_EXPLANATION_FOOTER_TEXT"));
    v10 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:");
    objc_msgSend(v24, "setProperty:forKey:");

  }
LABEL_25:
  v9 = v24;
  objc_storeStrong(&v24, 0);
  return v9;
}

- (id)specifierForTitleCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SUSSoftwareUpdateTitleCell *v4;
  id v5;
  NSObject *queue;
  id v8;
  SUSSoftwareUpdateTitleCell *v9;
  SUSSoftwareUpdateTitleCell *v10;
  id v11;
  id v12;
  SUSSoftwareUpdateTitleCell *v13;
  id v14;
  SUSSoftwareUpdateTitleCell *v15;
  SUSSoftwareUpdateTitleCell *v16;
  id v17;
  id v18;
  SUSSoftwareUpdateTitleCell *v19;
  BOOL v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void *v32;
  SUSUISoftwareUpdateController *v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  SEL v39;
  SUSUISoftwareUpdateController *v40;

  v40 = self;
  v39 = a2;
  v38 = a3;
  v37 = a4;
  v36 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUTitleCell"));
  v35 = -[SUSUISoftwareUpdateController presentingDescriptor](v40, "presentingDescriptor");
  if (!v36)
  {
    v36 = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);

    objc_msgSend(v36, "setProperty:forKey:", CFSTR("SUTitleCell"), *MEMORY[0x24BE75AC0]);
    -[SUSUISoftwareUpdateController setTitleCell:](v40, "setTitleCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  v27 = v4 != 0;

  if (!v27)
  {
    v21 = objc_alloc(MEMORY[0x24BEAEF30]);
    v26 = (id)objc_msgSend(v35, "documentation");
    v25 = (id)objc_msgSend(v26, "iconImage");
    v24 = (id)objc_msgSend(v35, "documentation");
    v23 = (id)objc_msgSend(v24, "releaseNotes");
    v22 = (void *)objc_msgSend(v21, "initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:", 3, 0, 0, v25, v23 != 0, objc_msgSend(v35, "isSplombo") & 1, v40);
    -[SUSUISoftwareUpdateController setTitleCell:](v40, "setTitleCell:");

  }
  v10 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  -[SUSSoftwareUpdateTitleCell setSpecifier:](v10, "setSpecifier:", v36);

  v13 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  v12 = (id)objc_msgSend(v35, "documentation");
  v11 = (id)objc_msgSend(v12, "releaseNotesSummary");
  -[SUSSoftwareUpdateTitleCell setReleaseNotesSummary:](v13, "setReleaseNotesSummary:");

  v15 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  v14 = (id)objc_msgSend(v35, "humanReadableUpdateName");
  -[SUSSoftwareUpdateTitleCell setUpdateName:](v15, "setUpdateName:");

  v16 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  -[SUSSoftwareUpdateTitleCell setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("SUTitleCell"));

  v19 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
  v18 = (id)objc_msgSend(v35, "documentation");
  v17 = (id)objc_msgSend(v18, "iconImage");
  -[SUSSoftwareUpdateTitleCell setUpdateIcon:](v19, "setUpdateIcon:");

  v5 = (id)objc_msgSend(v36, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v20 = v5 != 0;

  if (!v20)
  {
    v9 = -[SUSUISoftwareUpdateController titleCell](v40, "titleCell");
    objc_msgSend(v36, "setProperty:forKey:");

  }
  -[SUSUISoftwareUpdateController _setTitleCellSpecifierStatus:descriptorState:](v40, "_setTitleCellSpecifierStatus:descriptorState:", v36, v37);
  queue = MEMORY[0x24BDAC9B8];
  v28 = MEMORY[0x24BDAC760];
  v29 = -1073741824;
  v30 = 0;
  v31 = __94__SUSUISoftwareUpdateController_Specifiers__specifierForTitleCellWithUIState_descriptorState___block_invoke;
  v32 = &unk_24DFF7B80;
  v33 = v40;
  v34 = v35;
  dispatch_async(queue, &v28);

  v8 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  return v8;
}

void __94__SUSUISoftwareUpdateController_Specifiers__specifierForTitleCellWithUIState_descriptorState___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v4;
  id v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "titleCell");
  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "humanReadableUpdateName");
  objc_msgSend(v2, "setUpdateName:");

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "titleCell");
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "documentation");
  v4 = (id)objc_msgSend(v5, "iconImage");
  objc_msgSend(v6, "setUpdateIcon:");

}

- (id)specifierForUpdateOptionsWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SUSSoftwareUpdateUpdateOptionsCell *v4;
  id v5;
  id v6;
  SUSSoftwareUpdateUpdateOptionsCell *v8;
  char v9;
  SUSSoftwareUpdateUpdateOptionsCell *v10;
  id v11;
  SUSSoftwareUpdateUpdateOptionsCell *v12;
  SUSSoftwareUpdateUpdateOptionsCell *v13;
  BOOL v14;
  char v15;
  SUSSoftwareUpdateUpdateOptionsCell *v16;
  id location;
  unint64_t v18;
  unint64_t v19;
  SEL v20;
  SUSUISoftwareUpdateController *v21;
  id v22;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  location = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUSpecifierUpdateOptionsCell"));
  if (!location)
  {
    location = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);

    objc_msgSend(location, "setProperty:forKey:", CFSTR("SUSpecifierUpdateOptionsCell"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(location, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    -[SUSUISoftwareUpdateController setUpdateOptionsCell:](v21, "setUpdateOptionsCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
  v14 = v4 != 0;

  if (!v14)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEAEF38]), "initWithStyle:reuseIdentifier:specifier:", 0);
    -[SUSUISoftwareUpdateController setUpdateOptionsCell:](v21, "setUpdateOptionsCell:");

    v12 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setSpecifier:](v12, "setSpecifier:", location);

    v13 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("SUSpecifierUpdateOptionsCell"));

  }
  v10 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
  objc_msgSend(location, "setProperty:forKey:");

  v5 = -[SUSUISoftwareUpdateController _setInstallButtonButtonSpecifierState:forUIState:descriptorState:](v21, "_setInstallButtonButtonSpecifierState:forUIState:descriptorState:", location, v19, v18);
  v6 = location;
  location = v5;

  if (location)
  {
    v8 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
    v15 = 0;
    v9 = 0;
    if ((-[SUSSoftwareUpdateUpdateOptionsCell isPrimaryButtonHidden](v8, "isPrimaryButtonHidden") & 1) != 0)
    {
      v16 = -[SUSUISoftwareUpdateController updateOptionsCell](v21, "updateOptionsCell");
      v15 = 1;
      v9 = -[SUSSoftwareUpdateUpdateOptionsCell isSecondaryButtonHidden](v16, "isSecondaryButtonHidden");
    }
    if ((v15 & 1) != 0)

    if ((v9 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      if (v21->_currentActivityStyle)
        -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v21, "setBusyWithActivityStyle:", v21->_currentActivityStyle);
      v22 = location;
    }
  }
  else
  {
    v22 = 0;
  }
  objc_storeStrong(&location, 0);
  return v22;
}

- (id)specifierForProactiveSuggestionCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SUSSoftwareUpdateProactiveSuggestionCell *v4;
  id v5;
  id v7;
  id v8;
  SUSSoftwareUpdateProactiveSuggestionCell *v9;
  id v10;
  id v11;
  SUSSoftwareUpdateProactiveSuggestionCell *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SUSSoftwareUpdateProactiveSuggestionCell *v20;
  id v21;
  SUSSoftwareUpdateProactiveSuggestionCell *v22;
  id v23;
  id v24;
  SUSSoftwareUpdateProactiveSuggestionCell *v25;
  id v26;
  id v27;
  id v28;
  SUSSoftwareUpdateProactiveSuggestionCell *v29;
  id v30;
  SUSSoftwareUpdateProactiveSuggestionCell *v31;
  id v32;
  id v33;
  id v34;
  SUSettingsStatefulErrorContextProvider *v35;
  SUSettingsStatefulUIManager *v36;
  SUSSoftwareUpdateProactiveSuggestionCell *v37;
  id v38;
  id v39;
  id v40;
  SUSettingsStatefulErrorContextProvider *v41;
  SUSettingsStatefulUIManager *v42;
  SUSSoftwareUpdateProactiveSuggestionCell *v43;
  SUSSoftwareUpdateProactiveSuggestionCell *v44;
  SUSSoftwareUpdateProactiveSuggestionCell *v45;
  SUSSoftwareUpdateProactiveSuggestionCell *v46;
  SUSSoftwareUpdateProactiveSuggestionCell *v47;
  BOOL v48;
  void *v49;
  SUSSoftwareUpdateProactiveSuggestionCell *v50;
  BOOL v51;
  id location;
  unint64_t v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  SEL v57;
  SUSUISoftwareUpdateController *v58;
  uint8_t v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v58 = self;
  v57 = a2;
  v56 = a3;
  v55 = a4;
  v54 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUProactiveSuggestionCell"));
  if (!v54)
  {
    v54 = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);

    objc_msgSend(v54, "setProperty:forKey:", CFSTR("SUProactiveSuggestionCell"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v54, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    -[SUSUISoftwareUpdateController setProactiveSuggestionCell:](v58, "setProactiveSuggestionCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
  v51 = v4 != 0;

  if (!v51)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAEF10]), "initWithStyle:reuseIdentifier:specifier:", 0, CFSTR("SUProactiveSuggestionCell"), v54);
    -[SUSUISoftwareUpdateController setProactiveSuggestionCell:](v58, "setProactiveSuggestionCell:");

    v50 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
    -[SUSSoftwareUpdateProactiveSuggestionCell setSpecifier:](v50, "setSpecifier:", v54);

  }
  v5 = (id)objc_msgSend(v54, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v48 = v5 != 0;

  if (!v48)
  {
    v47 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
    objc_msgSend(v54, "setProperty:forKey:");

  }
  v53 = -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](v58, "proactiveSuggestionTypeForUIState:descriptorState:", v56, v55);
  v44 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
  -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v44, "setTitle:");

  v45 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
  -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v45, "setContent:", &stru_24E0011F0);

  v46 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
  -[SUSSoftwareUpdateProactiveSuggestionCell setAccessibilityIdentifier:](v46, "setAccessibilityIdentifier:", CFSTR("SUProactiveSuggestionCell"));

  switch(v53)
  {
    case 1uLL:
      v31 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v30 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v31, "setSystemIconNamed:withTintColor:", CFSTR("exclamationmark.triangle.fill"));

      v37 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v36 = -[SUSUISoftwareUpdateController manager](v58, "manager");
      v35 = -[SUSettingsStatefulUIManager errorContextProvider](v36, "errorContextProvider");
      v34 = -[SUSUISoftwareUpdateController presentingDescriptorError](v58, "presentingDescriptorError");
      v33 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v58, "presentingStatefulDescriptor");
      v32 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:](v35, "localizedTitleForError:statefulDescriptor:", v34);
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v37, "setTitle:");

      v43 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v42 = -[SUSUISoftwareUpdateController manager](v58, "manager");
      v41 = -[SUSettingsStatefulUIManager errorContextProvider](v42, "errorContextProvider");
      v40 = -[SUSUISoftwareUpdateController presentingDescriptorError](v58, "presentingDescriptorError");
      v39 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v58, "presentingStatefulDescriptor");
      v38 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:](v41, "localizedDescriptionForError:statefulDescriptor:", v40);
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v43, "setContent:");

      break;
    case 2uLL:
      v22 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v21 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v22, "setSystemIconNamed:withTintColor:", CFSTR("arrow.down.circle.fill"));

      v25 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v24 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_UPDATE_PROACTIVE_SUGGESTION_CELL_TITLE"));
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v25, "setTitle:");

      v29 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v28 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTOMATIC_UPDATE_PROACTIVE_SUGGESTION_CELL_CONTENT"));
      v26 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:");
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v29, "setContent:");

      break;
    case 3uLL:
      v9 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v8 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v9, "setSystemIconNamed:withTintColor:", CFSTR("checkmark.circle.fill"));

      v12 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UPDATE_SCHEDULED_TITLE"));
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v12, "setTitle:");

      v20 = -[SUSUISoftwareUpdateController proactiveSuggestionCell](v58, "proactiveSuggestionCell");
      v13 = (void *)MEMORY[0x24BDD17C8];
      v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UPDATE_SCHEDULED_CONTENT"));
      v17 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:");
      v16 = -[SUSUISoftwareUpdateController presentingDescriptor](v58, "presentingDescriptor");
      v15 = (id)objc_msgSend(v16, "humanReadableUpdateName");
      v14 = (id)objc_msgSend(v13, "stringWithFormat:", v17, v15);
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v20, "setContent:");

      break;
    default:
      location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v59, v53);
        _os_log_error_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support proactive cell for: %lu", v59, 0xCu);
      }
      objc_storeStrong(&location, 0);
      break;
  }
  v7 = v54;
  objc_storeStrong(&v54, 0);
  return v7;
}

- (id)specifierForProactiveSuggestionGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6[5];

  v6[4] = self;
  v6[3] = (id)a2;
  v6[2] = (id)a3;
  v6[1] = (id)a4;
  v6[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUProactiveSuggestionGroup"));
  if (!v6[0])
  {
    v6[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v6[0], "setProperty:forKey:", CFSTR("SUProactiveSuggestionGroup"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v6[0], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  }
  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)specifierForProactiveSuggestionPrimaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  int v17;
  os_log_type_t v18;
  id location;
  unint64_t v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  SEL v24;
  SUSUISoftwareUpdateController *v25;
  id v26;
  uint8_t v27[16];
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUProactiveSuggestionPrimaryButtonCell"));
  if (!v21)
  {
    v21 = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v25, 0, 0, 0, 13, 0);

  }
  v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !-[SUSUISoftwareUpdateController isBusy](v25, "isBusy"));
  objc_msgSend(v21, "setProperty:forKey:");

  objc_msgSend(v21, "setIdentifier:", CFSTR("SUProactiveSuggestionPrimaryButtonCell"));
  v20 = -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](v25, "proactiveSuggestionTypeForUIState:descriptorState:", v23, v22);
  if (v20 != 1)
  {
    if (v20 == 2)
    {
      v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INSTALL_ONCE_DOWNLOADED"), &stru_24E0011F0, CFSTR("Software Update"));
      objc_msgSend(v21, "setName:");

      objc_msgSend(v21, "setButtonAction:", sel_requestToPromoteTargetedUpdateToUserInitiatedStatus_);
      objc_msgSend(v21, "setTarget:", v25);
    }
    else if (v20 == 3)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UPDATE_NOW_INSTEAD_BUTTON"), &stru_24E0011F0, CFSTR("Software Update"));
      objc_msgSend(v21, "setName:");

      objc_msgSend(v21, "setButtonAction:", sel_install_);
      objc_msgSend(v21, "setTarget:", v25);
    }
    else
    {
      v16 = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v27, v20);
        _os_log_error_impl(&dword_21BF33000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support primary button for: %lu", v27, 0xCu);
      }
      objc_storeStrong(&v16, 0);
    }
    goto LABEL_17;
  }
  v13 = -[SUSUISoftwareUpdateController presentingDescriptorError](v25, "presentingDescriptorError");
  v14 = -[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](v25, "_errorIsInsufficientSpace:");

  if (v14)
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANAGE_STORAGE_BUTTON"));
    v10 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:");
    objc_msgSend(v21, "setName:");

    objc_msgSend(v21, "setButtonAction:", sel_openStorage);
    objc_msgSend(v21, "setTarget:", v25);
LABEL_17:
    v26 = v21;
    v17 = 1;
    goto LABEL_18;
  }
  location = _SUSUILoggingFacility();
  v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[SUSUISoftwareUpdateController presentingDescriptorError](v25, "presentingDescriptorError");
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v28, (uint64_t)"-[SUSUISoftwareUpdateController(Specifiers) specifierForProactiveSuggestionPrimaryButtonWithUIState:descriptorState:]", (uint64_t)v9);
    _os_log_impl(&dword_21BF33000, (os_log_t)location, v18, "%s: Can't create a button for an unknown error case: %@", v28, 0x16u);

  }
  objc_storeStrong(&location, 0);
  v26 = 0;
  v17 = 1;
LABEL_18:
  objc_storeStrong(&v21, 0);
  return v26;
}

- (id)specifierForProactiveSuggestionSecondaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location;
  unint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  SEL v14;
  SUSUISoftwareUpdateController *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  v11 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUProactiveSuggestionSecondaryButtonCell"));
  v10 = -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](v15, "proactiveSuggestionTypeForUIState:descriptorState:", v13, v12);
  if (!v11)
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BE75590], "deleteButtonSpecifierWithName:target:action:", 0, v15);

    objc_msgSend(v11, "setProperty:forKey:", &unk_24E011730, *MEMORY[0x24BE75860]);
  }
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !-[SUSUISoftwareUpdateController isBusy](v15, "isBusy"));
  objc_msgSend(v11, "setProperty:forKey:");

  objc_msgSend(v11, "setIdentifier:", CFSTR("SUProactiveSuggestionSecondaryButtonCell"));
  if (v10 == 3)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCEL_UPDATE_BUTTON"), &stru_24E0011F0, CFSTR("Software Update"));
    objc_msgSend(v11, "setName:");

    objc_msgSend(v11, "setButtonAction:", sel_autoInstallCancelPrompt_);
    objc_msgSend(v11, "setTarget:", v15);
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  }
  else
  {
    location = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v16, v10);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support primary button for: %lu", v16, 0xCu);
    }
    objc_storeStrong(&location, 0);
  }
  v5 = v11;
  objc_storeStrong(&v11, 0);
  return v5;
}

- (id)specifierForAlternateUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10[4];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  v10[3] = (id)a2;
  v10[2] = (id)a3;
  v10[1] = (id)a4;
  v10[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUAlternateUpdateGroup"));
  if (!v10[0])
  {
    v10[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

  }
  v6 = -[SUSUISoftwareUpdateController alsoAvailableGroupHeaderString](v11, "alsoAvailableGroupHeaderString", v10[0]);
  objc_msgSend(v5, "setName:");

  objc_msgSend(v10[0], "setProperty:forKey:", CFSTR("SUAlternateUpdateGroup"), *MEMORY[0x24BE75AC0]);
  v7 = v10[0];
  v8 = -[SUSUISoftwareUpdateController alternateUpdateFooterString](v11, "alternateUpdateFooterString");
  objc_msgSend(v7, "setProperty:forKey:");

  v9 = v10[0];
  objc_storeStrong(v10, 0);
  return v9;
}

- (id)specifierForAlternateUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  PSTableCell *v4;
  id v5;
  id v7;
  PSTableCell *v8;
  PSTableCell *v9;
  PSTableCell *v10;
  PSTableCell *v11;
  PSTableCell *v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  id location;
  id v22;
  id v23;
  id v24[4];
  SUSUISoftwareUpdateController *v25;

  v25 = self;
  v24[3] = (id)a2;
  v24[2] = (id)a3;
  v24[1] = (id)a4;
  v24[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUAlternateUpdateButton"));
  v23 = -[SUSUISoftwareUpdateController alternateUpdateButtonString](v25, "alternateUpdateButtonString");
  if (!v24[0])
  {
    v20 = (void *)MEMORY[0x24BE75590];
    objc_opt_class();
    v24[0] = (id)objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v25, 0);

    objc_msgSend(v24[0], "setProperty:forKey:", CFSTR("SUAlternateUpdateButton"), *MEMORY[0x24BE75AC0]);
    -[SUSUISoftwareUpdateController setAlternateUpdateCell:](v25, "setAlternateUpdateCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
  v19 = v4 != 0;

  if (!v19)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE755E8]), "initWithStyle:reuseIdentifier:specifier:", 0, CFSTR("SUAlternateUpdateButton"), v24[0]);
    -[SUSUISoftwareUpdateController setAlternateUpdateCell:](v25, "setAlternateUpdateCell:");

  }
  v22 = (id)objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  objc_msgSend(v22, "setText:", v23);
  v14 = -[SUSUISoftwareUpdateController alternateUpdateSubTextString](v25, "alternateUpdateSubTextString");
  objc_msgSend(v22, "setSecondaryText:");

  v17 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](v25, "presentingAlternateDescriptor");
  v16 = (id)objc_msgSend(v17, "documentation");
  v15 = (id)objc_msgSend(v16, "iconImage");
  location = -[SUSUISoftwareUpdateController tableCellImageForImage:](v25, "tableCellImageForImage:");

  if (location)
    objc_msgSend(v22, "setImage:", location);
  v9 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
  -[PSTableCell setContentConfiguration:](v9, "setContentConfiguration:", v22);

  v10 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
  -[PSTableCell setAccessoryType:](v10, "setAccessoryType:", 1);

  v11 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
  -[PSTableCell setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", !-[SUSUISoftwareUpdateController isBusy](v25, "isBusy"));

  objc_msgSend(v24[0], "setProperty:forKey:", &unk_24E011700, *MEMORY[0x24BE75850]);
  v12 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
  -[PSTableCell setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("SUAlternateUpdateButton"));

  v5 = (id)objc_msgSend(v24[0], "propertyForKey:", *MEMORY[0x24BE75D18]);
  v13 = v5 != 0;

  if (!v13)
  {
    v8 = -[SUSUISoftwareUpdateController alternateUpdateCell](v25, "alternateUpdateCell");
    objc_msgSend(v24[0], "setProperty:forKey:");

  }
  v7 = v24[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
  return v7;
}

- (id)specifierForNonPromotedPrimaryUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8[4];
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUNonPromotedUpdateHeaderGroup"));
  if (!v8[0])
  {
    v8[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");

    objc_msgSend(v8[0], "setProperty:forKey:", CFSTR("SUNonPromotedUpdateHeaderGroup"), *MEMORY[0x24BE75AC0]);
  }
  v6 = -[SUSUISoftwareUpdateController alsoAvailableGroupHeaderString](v9, "alsoAvailableGroupHeaderString", v8[0]);
  objc_msgSend(v5, "setName:");

  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)specifierForNonPromotedPrimaryUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  PSTableCell *v4;
  id v5;
  id v7;
  PSTableCell *v8;
  PSTableCell *v9;
  PSTableCell *v10;
  PSTableCell *v11;
  PSTableCell *v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id location;
  id v21;
  id v22;
  id v23[4];
  SUSUISoftwareUpdateController *v24;

  v24 = self;
  v23[3] = (id)a2;
  v23[2] = (id)a3;
  v23[1] = (id)a4;
  v23[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUNonPromotedUpdateButton"));
  v22 = -[SUSUISoftwareUpdateController nonPromotedPreferredUpdateButtonString](v24, "nonPromotedPreferredUpdateButtonString");
  if (!v23[0])
  {
    v23[0] = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, v24, 0, 0, objc_opt_class(), 2, 0);

    objc_msgSend(v23[0], "setIdentifier:");
    objc_msgSend(v23[0], "setProperty:forKey:", CFSTR("SUNonPromotedUpdateButton"), *MEMORY[0x24BE75AC0]);
    -[SUSUISoftwareUpdateController setNonPromotedUpdateCell:](v24, "setNonPromotedUpdateCell:", 0);
  }
  v4 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
  v19 = v4 != 0;

  if (!v19)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE755E8]), "initWithStyle:reuseIdentifier:specifier:", 0, CFSTR("SUNonPromotedUpdateButton"), v23[0]);
    -[SUSUISoftwareUpdateController setNonPromotedUpdateCell:](v24, "setNonPromotedUpdateCell:");

  }
  v21 = (id)objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  objc_msgSend(v21, "setText:", v22);
  v14 = -[SUSUISoftwareUpdateController alternateUpdateSubTextString](v24, "alternateUpdateSubTextString");
  objc_msgSend(v21, "setSecondaryText:");

  v17 = -[SUSUISoftwareUpdateController presentingDescriptor](v24, "presentingDescriptor");
  v16 = (id)objc_msgSend(v17, "documentation");
  v15 = (id)objc_msgSend(v16, "iconImage");
  location = -[SUSUISoftwareUpdateController tableCellImageForImage:](v24, "tableCellImageForImage:");

  if (location)
    objc_msgSend(v21, "setImage:", location);
  v9 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
  -[PSTableCell setContentConfiguration:](v9, "setContentConfiguration:", v21);

  v10 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
  -[PSTableCell setAccessoryType:](v10, "setAccessoryType:", 1);

  v11 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
  -[PSTableCell setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", !-[SUSUISoftwareUpdateController isBusy](v24, "isBusy"));

  objc_msgSend(v23[0], "setProperty:forKey:", &unk_24E011700, *MEMORY[0x24BE75850]);
  v12 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
  -[PSTableCell setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("SUNonPromotedUpdateButton"));

  v5 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75D18]);
  v13 = v5 != 0;

  if (!v13)
  {
    v8 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](v24, "nonPromotedUpdateCell");
    objc_msgSend(v23[0], "setProperty:forKey:");

  }
  v7 = v23[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  return v7;
}

- (BOOL)shouldShowComingSoonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;

  v5 = 0;
  if (a3 >= 3)
    return -[SUSUISoftwareUpdateController shouldShowComingSoonTip](self, "shouldShowComingSoonTip");
  return v5;
}

- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return a3 != 0;
}

- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  BOOL v6;

  if (a3 <= 1)
    return 0;
  if ((_os_feature_enabled_impl() & 1) == 0)
    return 0;
  v5 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v6 = objc_msgSend(v5, "canCurrentDeviceEnrollInBetaUpdates") & 1;

  return v6;
}

- (BOOL)shouldShowEnforcedUpdateForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v5;
  char v6;
  SUCoreDDMDeclaration *v7;
  char v8;
  SUSettingsStatefulUIManager *v9;

  v8 = 0;
  v6 = 0;
  v5 = 0;
  if (a3 == 4)
  {
    v5 = 0;
    if (!-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate"))
    {
      v9 = -[SUSUISoftwareUpdateController manager](self, "manager");
      v8 = 1;
      v7 = -[SUSettingsStatefulUIManager ddmDeclaration](v9, "ddmDeclaration");
      v6 = 1;
      v5 = -[SUCoreDDMDeclaration isValidDeclaration](v7, "isValidDeclaration");
    }
  }
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  return v5 & 1;
}

- (BOOL)shouldShowDeferredUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v5;
  char v6;
  char v7;
  SUSettingsStatefulUIManager *v8;
  char v9;
  SUSettingsStatefulUIManager *v10;

  v9 = 0;
  v7 = 0;
  v6 = 0;
  if (a3 == 4)
  {
    v6 = 0;
    if (!-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate"))
    {
      v10 = -[SUSUISoftwareUpdateController manager](self, "manager");
      v9 = 1;
      v5 = 1;
      if (!-[SUSettingsStatefulUIManager isDelayingUpdate](v10, "isDelayingUpdate"))
      {
        v8 = -[SUSUISoftwareUpdateController manager](self, "manager");
        v7 = 1;
        v5 = -[SUSettingsStatefulUIManager hasSUPathRestrictions](v8, "hasSUPathRestrictions");
      }
      v6 = v5;
    }
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  return v6 & 1;
}

- (BOOL)shouldShowScanGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;

  v5 = 1;
  if (a3 > 3)
    return -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
  return v5;
}

- (BOOL)shouldShowScanStatusSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;

  v5 = 1;
  if (a3 > 3)
    return -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
  return v5;
}

- (BOOL)shouldShowTitleGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  int v5;

  LOBYTE(v5) = 0;
  if (a3 == 4)
    v5 = !-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
  return v5 & 1;
}

- (BOOL)shouldShowTitleCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  int v5;

  LOBYTE(v5) = 0;
  if (a3 == 4)
    v5 = !-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
  return v5 & 1;
}

- (BOOL)shouldShowUpdateOptionsCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;
  id v6;
  int v7;
  char v8;
  SUSettingsStatefulUIManager *v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  SUSettingsStatefulErrorContextProvider *v15;
  char v16;
  SUSettingsStatefulUIManager *v17;

  if (a3 <= 3
    || -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate"))
  {
    return 0;
  }
  else
  {
    v6 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
    v16 = 0;
    v14 = 0;
    v12 = 0;
    v10 = 0;
    LOBYTE(v7) = 0;
    if (v6)
    {
      v17 = -[SUSUISoftwareUpdateController manager](self, "manager");
      v16 = 1;
      v15 = -[SUSettingsStatefulUIManager errorContextProvider](v17, "errorContextProvider");
      v14 = 1;
      v13 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
      v12 = 1;
      v11 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
      v10 = 1;
      v7 = !-[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:](v15, "shouldEnableUpdateButtonForError:statefulDescriptor:", v13);
    }
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    if ((v14 & 1) != 0)

    if ((v16 & 1) != 0)
    if ((v7 & 1) != 0)
    {
      return 0;
    }
    else
    {
      v8 = 0;
      v5 = 0;
      if (a4 == 4)
      {
        v5 = 0;
        if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](self, "presentingStatefulDescriptorIsTargetedUpdate"))
        {
          v9 = -[SUSUISoftwareUpdateController manager](self, "manager");
          v8 = 1;
          v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v9, "isTargetedUpdateScheduledForAutoInstall");
        }
      }
      if ((v8 & 1) != 0)

      return !v5;
    }
  }
}

- (BOOL)shouldShowProactiveSuggestionsSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](self, "proactiveSuggestionTypeForUIState:descriptorState:", a3, a4, a4, a3, a2, self) != 0;
}

- (BOOL)shouldShowProactiveSuggestionsPrimaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v5;
  BOOL v6;
  char v7;
  id v8;
  unint64_t v9;
  BOOL v11;

  v9 = -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](self, "proactiveSuggestionTypeForUIState:descriptorState:", a3, a4);
  if (v9 == 1)
  {
    v5 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
    v7 = 0;
    v6 = 0;
    if (v5)
    {
      v8 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
      v7 = 1;
      v6 = -[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](self, "_errorIsInsufficientSpace:");
    }
    v11 = v6;
    if ((v7 & 1) != 0)

  }
  else
  {
    return v9 != 0;
  }
  return v11;
}

- (BOOL)shouldShowProactiveSuggestionsSecondaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](self, "proactiveSuggestionTypeForUIState:descriptorState:", a3, a4, a4, a3, a2, self) == 3;
}

- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController shouldShowAlternateUpdateCellForUIState:descriptorState:](self, "shouldShowAlternateUpdateCellForUIState:descriptorState:", a3, a4, a4, a3, a2, self);
}

- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  int v5;
  id v6;
  int v7;
  char v8;
  SUDownloadOptions *v9;
  char v10;
  SUDownload *v11;
  char v12;
  SUSettingsStatefulUIManager *v13;
  char v16;

  v6 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
  v12 = 0;
  v10 = 0;
  v8 = 0;
  LOBYTE(v7) = 0;
  if ((unint64_t)objc_msgSend(v6, "currentState") >= 4)
  {
    v13 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v12 = 1;
    v11 = -[SUSettingsStatefulUIManager currentDownload](v13, "currentDownload");
    v10 = 1;
    v9 = -[SUDownload downloadOptions](v11, "downloadOptions");
    v8 = 1;
    v7 = -[SUDownloadOptions isAutoDownload](v9, "isAutoDownload") ^ 1;
  }
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v12 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
    if (-[SUSUISoftwareUpdateController hasAlternateUpdate](self, "hasAlternateUpdate"))
    {
      LOBYTE(v5) = 0;
      if (a3 == 4)
        v5 = !-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
    }
    v16 = v5 & 1;
  }
  return v16 & 1;
}

- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController shouldShowNonPromotedCellForUIState:descriptorState:](self, "shouldShowNonPromotedCellForUIState:descriptorState:", a3, a4, a4, a3, a2, self);
}

- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;

  v5 = 0;
  if (a3 == 4)
    return -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate");
  return v5;
}

- (id)_setInstallButtonButtonSpecifierState:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5
{
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  NSObject *log;
  os_log_type_t type;
  char v11;
  int v12;
  uint8_t v13[7];
  os_log_type_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  id location[2];
  SUSUISoftwareUpdateController *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = a5;
  if (location[0])
  {
    if (-[SUSUISoftwareUpdateController shouldShowUpdateOptionsCellSpecifierForUIState:descriptorState:](v19, "shouldShowUpdateOptionsCellSpecifierForUIState:descriptorState:", v17, v16))
    {
      v11 = 0;
      -[SUSUISoftwareUpdateController setupInstallButton:forUIState:descriptorState:shouldRemove:](v19, "setupInstallButton:forUIState:descriptorState:shouldRemove:", location[0], v17, v16, &v11);
      v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v19, "updateOptionsCell");
      -[SUSSoftwareUpdateUpdateOptionsCell setEnabled:](v6, "setEnabled:", !-[SUSUISoftwareUpdateController isBusy](v19, "isBusy"));

      if ((v11 & 1) != 0)
        objc_storeStrong(location, 0);
    }
    v20 = location[0];
    v12 = 1;
  }
  else
  {
    v15 = _SUSUILoggingFacility();
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_21BF33000, log, type, "Unable to set install button state on nil install button specifier", v13, 2u);
    }
    objc_storeStrong(&v15, 0);
    v20 = 0;
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v20;
}

- (void)clearInstallButton:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  SUSSoftwareUpdateUpdateOptionsCell *v4;
  SUSSoftwareUpdateUpdateOptionsCell *v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  SUSSoftwareUpdateUpdateOptionsCell *v7;
  SUSSoftwareUpdateUpdateOptionsCell *v8;
  SUSSoftwareUpdateUpdateOptionsCell *v9;
  SUSSoftwareUpdateUpdateOptionsCell *v10;
  id location[2];
  SUSUISoftwareUpdateController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setEnabled:](v3, "setEnabled:", 0);

  v4 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setHidden:](v4, "setHidden:", 1);

  v5 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setActivityIndicatorDisplayStyle:](v5, "setActivityIndicatorDisplayStyle:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  v7 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonText:](v7, "setSecondaryButtonText:", &stru_24E0011F0);

  v8 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonActionHandler:](v8, "setPrimaryButtonActionHandler:", 0);

  v9 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonLongTapActionHandler:](v9, "setPrimaryButtonLongTapActionHandler:", 0);

  v10 = -[SUSUISoftwareUpdateController updateOptionsCell](v12, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonActionHandler:](v10, "setSecondaryButtonActionHandler:", 0);

  objc_storeStrong(location, 0);
}

- (void)setupInstallButton:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5 shouldRemove:(BOOL *)a6
{
  int v6;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  SUSettingsStatefulErrorContextProvider *v15;
  char v16;
  SUSettingsStatefulUIManager *v17;
  char v18;
  id v19;
  id location[2];
  SUSUISoftwareUpdateController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController clearInstallButton:](v21, "clearInstallButton:", location[0]);
  if (a4 == 4)
  {
    if (a5 - 1 <= 4)
      __asm { BR              X8 }
    v18 = 0;
    v16 = 0;
    v14 = 0;
    v12 = 0;
    v10 = 0;
    LOBYTE(v6) = 0;
    if (a6)
    {
      v19 = -[SUSUISoftwareUpdateController presentingDescriptorError](v21, "presentingDescriptorError");
      v18 = 1;
      LOBYTE(v6) = 0;
      if (v19)
      {
        v17 = -[SUSUISoftwareUpdateController manager](v21, "manager");
        v16 = 1;
        v15 = -[SUSettingsStatefulUIManager errorContextProvider](v17, "errorContextProvider");
        v14 = 1;
        v13 = -[SUSUISoftwareUpdateController presentingDescriptorError](v21, "presentingDescriptorError");
        v12 = 1;
        v11 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v21, "presentingStatefulDescriptor");
        v10 = 1;
        v6 = !-[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:](v15, "shouldEnableUpdateButtonForError:statefulDescriptor:", v13);
      }
    }
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    if ((v14 & 1) != 0)

    if ((v16 & 1) != 0)
    if ((v18 & 1) != 0)

    if ((v6 & 1) != 0)
      *a6 = 1;
  }
  else
  {
    *a6 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)clientIsSUSettings
{
  id v3;
  char v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5[0] = (id)objc_msgSend(v3, "bundleIdentifier");

  v4 = objc_msgSend(v5[0], "isEqualToString:", CFSTR("com.apple.Preferences"));
  objc_storeStrong(v5, 0);
  return v4 & 1;
}

- (void)setInstallButtonStalled:(id)a3 shouldRemove:(BOOL *)a4
{
  SUDownloadOptions *v4;
  SUDownload *v5;
  SUSettingsStatefulUIManager *v6;
  char v7;
  BOOL v8;
  char v10;
  id v11;
  id location[2];
  SUSUISoftwareUpdateController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((PSIsRunningInAssistant() & 1) != 0)
  {
LABEL_2:
    -[SUSUISoftwareUpdateController setInstallButtonPaused:](v13, "setInstallButtonPaused:", location[0]);
    goto LABEL_14;
  }
  if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v13, "presentingStatefulDescriptorIsTargetedUpdate"))
  {
    v10 = 0;
    v8 = 1;
    if (-[SUSUISoftwareUpdateController clientIsSUSettings](v13, "clientIsSUSettings"))
    {
      v11 = -[SUSUISoftwareUpdateController presentingDescriptorError](v13, "presentingDescriptorError");
      v10 = 1;
      v8 = v11 != 0;
    }
    if ((v10 & 1) != 0)

    if (v8)
      goto LABEL_2;
    if (a4)
      *a4 = 1;
  }
  else
  {
    v6 = -[SUSUISoftwareUpdateController manager](v13, "manager");
    v5 = -[SUSettingsStatefulUIManager currentDownload](v6, "currentDownload");
    v4 = -[SUDownload downloadOptions](v5, "downloadOptions");
    v7 = -[SUDownloadOptions isAutoDownload](v4, "isAutoDownload");

    if ((v7 & 1) != 0)
      -[SUSUISoftwareUpdateController setInstallButtonDownloadAndInstall:](v13, "setInstallButtonDownloadAndInstall:", location[0]);
  }
LABEL_14:
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloading:(id)a3 shouldRemove:(BOOL *)a4
{
  char v4;
  SUOperationProgress *v6;
  SUDownload *v7;
  SUSettingsStatefulUIManager *v8;
  char v9;
  id v10;
  id v11;
  BOOL *v12;
  id location[2];
  SUSUISoftwareUpdateController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v8 = -[SUSUISoftwareUpdateController manager](v14, "manager");
  v7 = -[SUSettingsStatefulUIManager currentDownload](v8, "currentDownload");
  v6 = -[SUDownload progress](v7, "progress");
  v11 = (id)-[SUOperationProgress phase](v6, "phase");

  if ((PSIsRunningInAssistant() & 1) != 0)
  {
    -[SUSUISoftwareUpdateController downloadingButtonForSpecifier:](v14, "downloadingButtonForSpecifier:", location[0]);
  }
  else if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v14, "presentingStatefulDescriptorIsTargetedUpdate"))
  {
    v9 = 0;
    v4 = 1;
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAEE98]) & 1) == 0)
    {
      v10 = getkSUDownloadPhasePreparingForInstallation_0();
      v9 = 1;
      v4 = 1;
      if ((objc_msgSend(v11, "isEqualToString:") & 1) == 0)
      {
        v4 = 1;
        if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAEEA0]) & 1) == 0)
          v4 = -[SUSUISoftwareUpdateController waitingOnSUAssetDownload:](v14, "waitingOnSUAssetDownload:", v11);
      }
    }
    if ((v9 & 1) != 0)

    if ((v4 & 1) != 0 && v12)
      *v12 = 1;
  }
  else
  {
    -[SUSUISoftwareUpdateController setInstallButtonDownloadAndInstall:](v14, "setInstallButtonDownloadAndInstall:", location[0]);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonReadyToInstall:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v4, "presentingStatefulDescriptorIsTargetedUpdate")|| (PSIsRunningInAssistant() & 1) != 0)
  {
    -[SUSUISoftwareUpdateController setInstallButtonInstallNow:](v4, "setInstallButtonInstallNow:", location[0]);
  }
  else
  {
    -[SUSUISoftwareUpdateController setInstallButtonDownloadAndInstall:](v4, "setInstallButtonDownloadAndInstall:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstalling:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v4, "presentingStatefulDescriptorIsTargetedUpdate")|| (PSIsRunningInAssistant() & 1) != 0)
  {
    -[SUSUISoftwareUpdateController setInstallButtonInstallingForSpecifier:](v4, "setInstallButtonInstallingForSpecifier:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloadAndInstall:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController setInstallButtonDownloadAndInstall:shouldRemove:](v4, "setInstallButtonDownloadAndInstall:shouldRemove:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloadAndInstall:(id)a3 shouldRemove:(BOOL *)a4
{
  int v4;
  id v5;
  SUSUISoftwareUpdateController *v6;
  id v7;
  SUSSoftwareUpdateUpdateOptionsCell *v8;
  SUSSoftwareUpdateUpdateOptionsCell *v9;
  SUSSoftwareUpdateUpdateOptionsCell *v10;
  SUSSoftwareUpdateUpdateOptionsCell *v11;
  SUSSoftwareUpdateUpdateOptionsCell *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  SUSSoftwareUpdateUpdateOptionsCell *v25;
  id v26;
  id v27;
  SUSSoftwareUpdateUpdateOptionsCell *v28;
  SUSSoftwareUpdateUpdateOptionsCell *v29;
  id v30;
  id v31;
  SUSSoftwareUpdateUpdateOptionsCell *v32;
  SUSettingsStatefulUIManager *v33;
  BOOL v34;
  char v36;
  id v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(id *, void *);
  void *v42;
  id v43;
  uint64_t v44;
  int v45;
  int v46;
  void (*v47)(id *, void *);
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  void (*v54)(id *);
  void *v55;
  id v56;
  char v57;
  uint64_t v58;
  int v59;
  int v60;
  void (*v61)(id *);
  void *v62;
  id v63[3];
  id from;
  char v65;
  BOOL *v66;
  id location[2];
  SUSUISoftwareUpdateController *v68;
  _QWORD v69[3];

  v69[2] = *MEMORY[0x24BDAC8D0];
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v66 = a4;
  v65 = 0;
  objc_initWeak(&from, v68);
  v33 = -[SUSUISoftwareUpdateController manager](v68, "manager");
  v34 = -[SUSettingsStatefulUIManager isClearingSpaceForDownload](v33, "isClearingSpaceForDownload");

  if (v34)
  {
    v65 = 1;
  }
  else
  {
    v32 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
    v31 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("UPDATE_NOW"), &stru_24E0011F0, CFSTR("Software Update"));
    -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v32, "setPrimaryButtonText:");

    v29 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
    v58 = MEMORY[0x24BDAC760];
    v59 = -1073741824;
    v60 = 0;
    v61 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke;
    v62 = &unk_24DFFA390;
    objc_copyWeak(v63, &from);
    -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonActionHandler:](v29, "setPrimaryButtonActionHandler:", &v58);

    v57 = -[SUSUISoftwareUpdateController _shouldHideTonightButton](v68, "_shouldHideTonightButton");
    if (!v57)
    {
      v28 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
      v27 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (id)objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("UPDATE_TONIGHT"), &stru_24E0011F0, CFSTR("Software Update"));
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonText:](v28, "setSecondaryButtonText:");

      v25 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
      v51 = MEMORY[0x24BDAC760];
      v52 = -1073741824;
      v53 = 0;
      v54 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_2;
      v55 = &unk_24DFFA390;
      objc_copyWeak(&v56, &from);
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonActionHandler:](v25, "setSecondaryButtonActionHandler:", &v51);

      v23 = (void *)MEMORY[0x24BEBD748];
      v24 = (void *)MEMORY[0x24BEBD388];
      v22 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UPDATE_TONIGHT"), &stru_24E0011F0, CFSTR("Software Update"));
      v20 = (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("clock"));
      v44 = MEMORY[0x24BDAC760];
      v45 = -1073741824;
      v46 = 0;
      v47 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_3;
      v48 = &unk_24DFFA3B8;
      objc_copyWeak(&v49, &from);
      v18 = (id)objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v21, v20, CFSTR("SUUpdateTonight"), &v44);
      v69[0] = v18;
      v19 = (void *)MEMORY[0x24BEBD388];
      v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_ONLY"), &stru_24E0011F0, CFSTR("Software Update"));
      v15 = (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.down.circle"));
      v38 = MEMORY[0x24BDAC760];
      v39 = -1073741824;
      v40 = 0;
      v41 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_4;
      v42 = &unk_24DFFA3B8;
      objc_copyWeak(&v43, &from);
      v14 = (id)objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v16, v15, CFSTR("SUDownloadOnly"), &v38);
      v69[1] = v14;
      v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
      v50 = (id)objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", &stru_24E0011F0, 0, 0, 33);

      v12 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonMenu:](v12, "setSecondaryButtonMenu:", v50);

      objc_storeStrong(&v50, 0);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&v56);
    }
    v11 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setEnabled:](v11, "setEnabled:", 1);

    v10 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setHidden:](v10, "setHidden:", 0);

    if ((v57 & 1) != 0)
    {
      v9 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonEnabled:](v9, "setSecondaryButtonEnabled:", 0);

      v8 = -[SUSUISoftwareUpdateController updateOptionsCell](v68, "updateOptionsCell");
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonHidden:](v8, "setSecondaryButtonHidden:", 1);

    }
    v7 = -[SUSUISoftwareUpdateController presentingDescriptorError](v68, "presentingDescriptorError");

    if (v7)
    {
      v6 = v68;
      v36 = 0;
      v5 = -[SUSUISoftwareUpdateController presentingDescriptorError](v68, "presentingDescriptorError");
      LOBYTE(v4) = 1;
      if (!-[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](v6, "_errorIsInsufficientSpace:"))
      {
        v37 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v68, "presentingStatefulDescriptor");
        v36 = 1;
        v4 = objc_msgSend(v37, "updateDownloadable") ^ 1;
      }
      v65 = v4 & 1;
      if ((v36 & 1) != 0)

    }
    objc_destroyWeak(v63);
  }
  if (v66)
    *v66 = v65 & 1;
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke(id *a1)
{
  id v1;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    v1 = (id)objc_msgSend(location[0], "updateOptionsCell");
    objc_msgSend(location[0], "downloadAndInstall:");

  }
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_2(id *a1)
{
  id v1;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    v1 = (id)objc_msgSend(location[0], "updateOptionsCell");
    objc_msgSend(location[0], "downloadAndInstallTonight:");

  }
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_3(id *a1, void *a2)
{
  id v2;
  id v4[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (v4[0])
  {
    v2 = (id)objc_msgSend(v4[0], "updateOptionsCell");
    objc_msgSend(v4[0], "downloadAndInstallTonight:");

  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_4(id *a1, void *a2)
{
  id v2;
  id v4[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (v4[0])
  {
    v2 = (id)objc_msgSend(v4[0], "updateOptionsCell");
    objc_msgSend(v4[0], "downloadOnly:");

  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonPaused:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  id v4;
  id v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonHidden:](v3, "setPrimaryButtonHidden:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAUSED"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)downloadingButtonForSpecifier:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  id v4;
  id v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonHidden:](v3, "setPrimaryButtonHidden:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DOWNLOADING_IN_PROGRESS"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDeleted:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  id v4;
  id v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonHidden:](v3, "setPrimaryButtonHidden:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETED"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstallNow:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  SUSSoftwareUpdateUpdateOptionsCell *v4;
  SUSSoftwareUpdateUpdateOptionsCell *v5;
  id v6;
  char v7;
  SUSSoftwareUpdateUpdateOptionsCell *v8;
  SUSSoftwareUpdateUpdateOptionsCell *v9;
  id v10;
  id v11;
  SUSSoftwareUpdateUpdateOptionsCell *v12;
  SUSSoftwareUpdateUpdateOptionsCell *v13;
  id v14;
  id v15;
  SUSSoftwareUpdateUpdateOptionsCell *v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  SUSettingsStatefulErrorContextProvider *v22;
  char v23;
  SUSettingsStatefulUIManager *v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(id *);
  void *v29;
  id v30;
  char v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(id *);
  void *v36;
  id v37[3];
  id from;
  id location[2];
  SUSUISoftwareUpdateController *v40;

  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v40);
  v16 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
  v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INSTALL_NOW"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v16, "setPrimaryButtonText:");

  v13 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
  v32 = MEMORY[0x24BDAC760];
  v33 = -1073741824;
  v34 = 0;
  v35 = __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke;
  v36 = &unk_24DFFA390;
  objc_copyWeak(v37, &from);
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonActionHandler:](v13, "setPrimaryButtonActionHandler:", &v32);

  v31 = -[SUSUISoftwareUpdateController _shouldHideTonightButton](v40, "_shouldHideTonightButton");
  if (!v31)
  {
    v12 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INSTALL_TONIGHT"), &stru_24E0011F0, CFSTR("Software Update"));
    -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonText:](v12, "setSecondaryButtonText:");

    v9 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
    v25 = MEMORY[0x24BDAC760];
    v26 = -1073741824;
    v27 = 0;
    v28 = __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke_2;
    v29 = &unk_24DFFA390;
    objc_copyWeak(&v30, &from);
    -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonActionHandler:](v9, "setSecondaryButtonActionHandler:", &v25);

    objc_destroyWeak(&v30);
  }
  v8 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
  v23 = 0;
  v21 = 0;
  v19 = 0;
  v17 = 0;
  v6 = -[SUSUISoftwareUpdateController presentingDescriptorError](v40, "presentingDescriptorError");
  v7 = 1;
  if (!v6)
  {
    v24 = -[SUSUISoftwareUpdateController manager](v40, "manager");
    v23 = 1;
    v22 = -[SUSettingsStatefulUIManager errorContextProvider](v24, "errorContextProvider");
    v21 = 1;
    v20 = -[SUSUISoftwareUpdateController presentingDescriptorError](v40, "presentingDescriptorError");
    v19 = 1;
    v18 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v40, "presentingStatefulDescriptor");
    v17 = 1;
    v7 = -[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v22, "shouldIgnoreUpdateError:withStatefulDescriptor:", v20);
  }
  -[SUSSoftwareUpdateUpdateOptionsCell setEnabled:](v8, "setEnabled:", v7 & 1);
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  v5 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setHidden:](v5, "setHidden:", 0);

  if ((v31 & 1) != 0)
  {
    v4 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonEnabled:](v4, "setSecondaryButtonEnabled:", 0);

    v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v40, "updateOptionsCell");
    -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonHidden:](v3, "setSecondaryButtonHidden:", 1);

  }
  objc_destroyWeak(v37);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke(id *a1)
{
  id v1;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    v1 = (id)objc_msgSend(location[0], "updateOptionsCell");
    objc_msgSend(location[0], "install:");

  }
  objc_storeStrong(location, 0);
}

void __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke_2(id *a1)
{
  id v1;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    v1 = (id)objc_msgSend(location[0], "updateOptionsCell");
    objc_msgSend(location[0], "installTonight:");

  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstallingForSpecifier:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  id v4;
  id v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  SUSSoftwareUpdateUpdateOptionsCell *v7;
  id location[2];
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v9, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonHidden:](v3, "setPrimaryButtonHidden:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v9, "updateOptionsCell");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INSTALLING"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  v7 = -[SUSUISoftwareUpdateController updateOptionsCell](v9, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setActivityIndicatorDisplayStyle:](v7, "setActivityIndicatorDisplayStyle:", 1);

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstalledForSpecifier:(id)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  id v4;
  id v5;
  SUSSoftwareUpdateUpdateOptionsCell *v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonHidden:](v3, "setPrimaryButtonHidden:", 0);

  v6 = -[SUSUISoftwareUpdateController updateOptionsCell](v8, "updateOptionsCell");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INSTALLING"), &stru_24E0011F0, CFSTR("Software Update"));
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (id)alternateUpdateFooterString
{
  id v2;
  id v3;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  BOOL v19;
  id location;
  id v21;
  id v22[2];
  SUSUISoftwareUpdateController *v23;

  v23 = self;
  v22[1] = (id)a2;
  v22[0] = 0;
  v17 = -[SUSUISoftwareUpdateController presentingDescriptor](self, "presentingDescriptor");
  v21 = (id)objc_msgSend(v17, "productVersion");

  v18 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](v23, "presentingAlternateDescriptor");
  location = (id)objc_msgSend(v18, "productVersion");

  if (v21 && location)
  {
    v16 = objc_msgSend(location, "compare:options:", v21, 64);
    if (v16 == -1)
    {
      v19 = 0;
    }
    else if (v16)
    {
      v19 = v16 == 1;
    }
    else
    {
      v15 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](v23, "presentingAlternateDescriptor");
      v14 = (id)objc_msgSend(v15, "productBuildVersion");
      v13 = -[SUSUISoftwareUpdateController presentingDescriptor](v23, "presentingDescriptor");
      v12 = (id)objc_msgSend(v13, "productBuildVersion");
      v19 = objc_msgSend(v14, "compare:options:") == 1;

    }
    if (!v19)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ALTERNATE_UPDATE_FOOTER_NOT_LATEST"));
      v9 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:");
      v8 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v7 = (id)objc_msgSend(v8, "systemVersion");
      v2 = (id)objc_msgSend(v6, "stringWithFormat:", v9, v7);
      v3 = v22[0];
      v22[0] = v2;

    }
  }
  v5 = v22[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  return v5;
}

- (id)majorOSVersionString
{
  id v4;
  id v5;
  id v6;

  v5 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (id)objc_msgSend(v5, "systemVersion");
  v6 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");

  return v6;
}

- (id)majorOSVersionStringForBuildVersion:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("."));
    v3 = (id)objc_msgSend(v7, "firstObject");
    v4 = v8;
    v8 = v3;

  }
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)alternateUpdateButtonString
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;

  if (-[SUSUISoftwareUpdateController presentingAlternateDescriptorUpgradeType](self, "presentingAlternateDescriptorUpgradeType") != 2)return -[SUSUISoftwareUpdateController alternateUpdateVersionString](self, "alternateUpdateVersionString");
  v3 = (void *)MEMORY[0x24BDD17C8];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UPGRADE_TO"));
  v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  v6 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](self, "presentingAlternateDescriptor");
  v5 = (id)objc_msgSend(v6, "productVersion");
  v4 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");
  v11 = (id)objc_msgSend(v3, "stringWithFormat:", v7, v4);

  return v11;
}

- (id)alternateUpdateSubTextString
{
  id v3;
  id v4;
  SUOperationProgress *v5;
  SUDownload *v6;
  SUSettingsStatefulUIManager *v7;
  char v8;
  SUSettingsStatefulUIManager *v9;
  SUDownload *v10;
  BOOL v11;
  char v12;
  id v13;
  char v14;
  SUSettingsStatefulUIManager *v15;
  id v17;
  __CFString *v18;

  v9 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v10 = -[SUSettingsStatefulUIManager currentDownload](v9, "currentDownload");
  v14 = 0;
  v12 = 0;
  v11 = 0;
  if (v10)
  {
    v15 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v14 = 1;
    v13 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](self, "presentingAlternateStatefulDescriptor");
    v12 = 1;
    v11 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v15, "doesTargetedUpdateMatchDescriptor:");
  }
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if (v11)
  {
    v7 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v6 = -[SUSettingsStatefulUIManager currentDownload](v7, "currentDownload");
    v5 = -[SUDownload progress](v6, "progress");
    v8 = -[SUOperationProgress isDone](v5, "isDone");

    if ((v8 & 1) != 0)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DOWNLOADED"), &stru_24E0011F0, CFSTR("Software Update"));

      return v17;
    }
    v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (__CFString *)(id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DOWNLOADING"), &stru_24E0011F0, CFSTR("Software Update"));

  }
  else
  {
    v18 = &stru_24E0011F0;
  }
  return v18;
}

- (id)nonPromotedPreferredUpdateButtonString
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;

  if (-[SUSUISoftwareUpdateController presentingDescriptorUpgradeType](self, "presentingDescriptorUpgradeType") != 2)
    return -[SUSUISoftwareUpdateController preferredUpdateVersionString](self, "preferredUpdateVersionString");
  v3 = (void *)MEMORY[0x24BDD17C8];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UPGRADE_TO"));
  v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  v6 = -[SUSUISoftwareUpdateController presentingDescriptor](self, "presentingDescriptor");
  v5 = (id)objc_msgSend(v6, "productVersion");
  v4 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");
  v11 = (id)objc_msgSend(v3, "stringWithFormat:", v7, v4);

  return v11;
}

- (id)alsoAvailableGroupHeaderString
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALSO_AVAILABLE"), &stru_24E0011F0, CFSTR("Software Update"));

  return v4;
}

- (id)autoUpdateScheduledString
{
  __CFString *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10[2];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  v10[1] = (id)a2;
  if (-[SUSUISoftwareUpdateController presentingDescriptorUpgradeType](self, "presentingDescriptorUpgradeType") == 1)
    v2 = CFSTR("AUTOMATIC_UPDATES_INSTALL_TONIGHT_MINOR_");
  else
    v2 = CFSTR("AUTOMATIC_UPDATES_INSTALL_TONIGHT_MAJOR_");
  v10[0] = v2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", v10[0]);
  v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  v5 = -[SUSUISoftwareUpdateController installedOSVersionString](v11, "installedOSVersionString");
  v9 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  objc_storeStrong(v10, 0);
  return v9;
}

- (id)alternateUpdateVersionString
{
  id v4;
  id v5;

  v4 = -[SUSUISoftwareUpdateController presentingAlternateDescriptor](self, "presentingAlternateDescriptor");
  v5 = -[SUSUISoftwareUpdateController updateVersionString:](self, "updateVersionString:");

  return v5;
}

- (id)preferredUpdateVersionString
{
  id v4;
  id v5;

  v4 = -[SUSUISoftwareUpdateController presentingDescriptor](self, "presentingDescriptor");
  v5 = -[SUSUISoftwareUpdateController updateVersionString:](self, "updateVersionString:");

  return v5;
}

- (id)updateVersionString:(id)a3
{
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
  objc_storeStrong(location, 0);
  return v4;
}

- (id)installedOSVersionString
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE v15[12];
  SEL v16;
  SUSUISoftwareUpdateController *v17;

  v17 = self;
  v16 = a2;
  *(_DWORD *)&v15[8] = 0;
  v14 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  *(_QWORD *)v15 = objc_msgSend(v14, "sf_isiPad");

  if ((v15[0] & 1) != 0)
  {
    v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("iPadOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
    v3 = *(void **)&v15[4];
    *(_QWORD *)&v15[4] = v2;

  }
  else
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("iOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
    v5 = *(void **)&v15[4];
    *(_QWORD *)&v15[4] = v4;

  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  v7 = *(_QWORD *)&v15[4];
  v10 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (id)objc_msgSend(v10, "systemVersion");
  v11 = (id)objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), v9);

  objc_storeStrong((id *)&v15[4], 0);
  return v11;
}

- (id)tableCellImageForImage:(id)a3
{
  double v3;
  id v4;
  id v5;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  if (location[0])
  {
    v10 = 0.0;
    v8 = (id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    objc_msgSend(v8, "scale");
    v9 = v3;

    v10 = v9;
    objc_msgSend(MEMORY[0x24BEBD640], "_iconVariantForUIApplicationIconFormat:scale:", 0, &v10);
    objc_msgSend(objc_retainAutorelease(location[0]), "CGImage");
    v4 = (id)objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", LICreateIconForImage(), 0, v10);
    v5 = v11;
    v11 = v4;

  }
  v7 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (void)clearNonPromotedPrimaryUpdateGroup:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "removePropertyForKey:", *MEMORY[0x24BE75AA0]);
  objc_storeStrong(location, 0);
}

- (void)clearNonPromotedPrimaryUpdateHeaderGroup:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "removePropertyForKey:", *MEMORY[0x24BE75AA0]);
  objc_storeStrong(location, 0);
}

- (void)refreshBetaUpdatesButton
{
  id v2;
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUGetBetaUpdatesButton"));
  if (location[0])
  {
    v2 = (id)-[SUSUISoftwareUpdateController parentController](v4, "parentController");
    objc_msgSend(v2, "reloadSpecifier:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)refreshupdateAutoUpdateButton
{
  id location[2];
  SUSUISoftwareUpdateController *v3;

  v3 = self;
  location[1] = (id)a2;
  location[0] = -[SUSUISoftwareUpdateController specifierForAutomaticUpdatesWithUIState:descriptorState:](self, "specifierForAutomaticUpdatesWithUIState:descriptorState:", -[SUSUISoftwareUpdateController currentUIState](self, "currentUIState"), -[SUSUISoftwareUpdateController currentDescriptorState](self, "currentDescriptorState"));
  if (location[0])
    -[SUSUISoftwareUpdateController reloadSpecifier:](v3, "reloadSpecifier:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)configureScanCell:(id)a3 withUIState:(unint64_t)a4 descriptorState:(unint64_t)a5
{
  BOOL v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SUSettingsStatefulUIOptions *v20;
  SUSettingsStatefulUIManager *v21;
  BOOL v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  SUSettingsStatefulUIManager *v36;
  id v37;
  id v38;
  BOOL v39;
  SUSettingsStatefulUIManager *v40;
  BOOL v41;
  id v44;
  SUSettingsStatefulUIManager *v45;
  SUSettingsStatefulUIManager *v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(id *, void *);
  void *v51;
  SUSUISoftwareUpdateController *v52;
  id v53;
  id v54;
  id v55;
  unsigned int v56;
  unint64_t v57;
  unint64_t v58;
  id location[2];
  SUSUISoftwareUpdateController *v60;

  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = a4;
  v57 = a5;
  v44 = +[SUSettingsStatefulUIAdditions currentOSVersion](SUSettingsStatefulUIAdditions, "currentOSVersion");
  objc_msgSend(location[0], "setCurrentVersion:");

  v45 = -[SUSUISoftwareUpdateController manager](v60, "manager");
  v5 = -[SUSettingsStatefulUIManager isDelayingUpdate](v45, "isDelayingUpdate");
  objc_msgSend(location[0], "setUpdatesDeferred:", v5);

  v46 = -[SUSUISoftwareUpdateController manager](v60, "manager");
  v6 = -[SUSettingsStatefulUIManager hasSUPathRestrictions](v46, "hasSUPathRestrictions");
  objc_msgSend(location[0], "setSuPathsRestricted:", v6);

  v56 = 0;
  if (a4 == 1)
  {
    v56 = 1;
  }
  else if (v58 == 3)
  {
    v56 = 0;
  }
  else
  {
    v40 = -[SUSUISoftwareUpdateController manager](v60, "manager");
    v41 = -[SUSettingsStatefulUIManager isDelayingUpdate](v40, "isDelayingUpdate");

    if (v41)
    {
      v56 = 4;
    }
    else if (v58 == 4
           && -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](v60, "presentingStatefulDescriptorPromotedAsAlternate"))
    {
      v56 = 5;
    }
    else if (v58 == 2)
    {
      v56 = 2;
    }
    else
    {
      v56 = 3;
    }
  }
  if (v58 == 2)
  {
    v36 = -[SUSUISoftwareUpdateController manager](v60, "manager");
    v55 = -[SUSettingsStatefulUIManager scanError](v36, "scanError");

    v37 = (id)objc_msgSend(v55, "domain");
    v38 = getSUErrorDomain_1();
    v39 = 0;
    if ((objc_msgSend(v37, "isEqualToString:") & 1) != 0)
      v39 = objc_msgSend(v55, "code") == 26;

    if (v39)
    {
      v30 = location[0];
      v32 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (id)objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_CHECK_FOR_UPDATE"));
      objc_msgSend(v30, "setErrorTitle:");

      v33 = location[0];
      v35 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("NETWORK_SCAN_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
      objc_msgSend(v33, "setErrorMessage:");

    }
    else
    {
      v54 = 0;
      v28 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v29 = objc_msgSend(v28, "sf_isInternalInstall");

      if ((v29 & 1) != 0)
      {
        v27 = (id)objc_msgSend(v55, "userInfo");
        v53 = (id)objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BDD0FF0]);

        if (!v53)
          objc_storeStrong(&v53, CFSTR("Verify that you are connected to the Internal Network; trigger VPN manually if applicable."));
        v24 = (void *)MEMORY[0x24BDD17C8];
        v26 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("GENERIC_SCAN_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v7 = (id)objc_msgSend(v24, "stringWithFormat:", CFSTR("%@\n\n[Internal Only]\n%@"), v25, v53);
        v8 = v54;
        v54 = v7;

        objc_storeStrong(&v53, 0);
      }
      else
      {
        v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GENERIC_SCAN_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v10 = v54;
        v54 = v9;

      }
      v17 = location[0];
      v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_CHECK_FOR_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
      objc_msgSend(v17, "setErrorTitle:");

      objc_msgSend(location[0], "setErrorMessage:", v54);
      v21 = -[SUSUISoftwareUpdateController manager](v60, "manager");
      v20 = -[SUSettingsStatefulUIManager options](v21, "options");
      v22 = -[SUSettingsStatefulUIOptions clientIsBuddy](v20, "clientIsBuddy");

      if (!v22)
      {
        v11 = location[0];
        v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E0011F0, CFSTR("Software Update"));
        objc_msgSend(v11, "setErrorPrimaryButton:");

        v15 = location[0];
        v14 = (void *)MEMORY[0x24BEBD388];
        v47 = MEMORY[0x24BDAC760];
        v48 = -1073741824;
        v49 = 0;
        v50 = __91__SUSUISoftwareUpdateController_Specifiers__configureScanCell_withUIState_descriptorState___block_invoke;
        v51 = &unk_24DFFA3E0;
        v52 = v60;
        v16 = (id)objc_msgSend(v14, "actionWithHandler:", &v47);
        objc_msgSend(v15, "setErrorPrimaryButtonAction:");

        objc_storeStrong((id *)&v52, 0);
      }
      objc_storeStrong(&v54, 0);
    }
    objc_storeStrong(&v55, 0);
  }
  else
  {
    objc_msgSend(location[0], "setErrorTitle:");
    objc_msgSend(location[0], "setErrorMessage:", 0);
    objc_msgSend(location[0], "setErrorPrimaryButton:", 0);
    objc_msgSend(location[0], "setErrorPrimaryButtonAction:", 0);
  }
  objc_msgSend(location[0], "setState:", v56);
  objc_storeStrong(location, 0);
}

void __91__SUSUISoftwareUpdateController_Specifiers__configureScanCell_withUIState_descriptorState___block_invoke(id *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(a1[4], "manager");
  objc_msgSend(v3, "checkForAvailableUpdates");

  objc_storeStrong(location, 0);
}

- (unint64_t)proactiveSuggestionTypeForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5;
  char v6;
  int v7;
  char v8;
  SUSettingsStatefulUIManager *v9;
  char v10;
  SUDownloadOptions *v11;
  char v12;
  SUDownload *v13;
  char v14;
  SUSettingsStatefulUIManager *v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  SUSettingsStatefulErrorContextProvider *v21;
  char v22;
  SUSettingsStatefulUIManager *v23;
  char v24;
  id v25;

  v24 = 0;
  v22 = 0;
  v20 = 0;
  v18 = 0;
  v16 = 0;
  LOBYTE(v7) = 0;
  if (a3 == 4)
  {
    LOBYTE(v7) = 0;
    if (!-[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](self, "presentingStatefulDescriptorPromotedAsAlternate"))
    {
      v25 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
      v24 = 1;
      LOBYTE(v7) = 0;
      if (v25)
      {
        v23 = -[SUSUISoftwareUpdateController manager](self, "manager");
        v22 = 1;
        v21 = -[SUSettingsStatefulUIManager errorContextProvider](v23, "errorContextProvider");
        v20 = 1;
        v19 = -[SUSUISoftwareUpdateController presentingDescriptorError](self, "presentingDescriptorError");
        v18 = 1;
        v17 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](self, "presentingStatefulDescriptor");
        v16 = 1;
        v7 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v21, "shouldIgnoreUpdateError:withStatefulDescriptor:", v19);
      }
    }
  }
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  if ((v20 & 1) != 0)

  if ((v22 & 1) != 0)
  if ((v24 & 1) != 0)

  if ((v7 & 1) != 0)
    return 1;
  if (a3 != 4
    || !-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](self, "presentingStatefulDescriptorIsTargetedUpdate"))
  {
    return 0;
  }
  v14 = 0;
  v12 = 0;
  v10 = 0;
  if (a4 == 2 || (v6 = 0, a4 <= 3))
  {
    v15 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v14 = 1;
    v13 = -[SUSettingsStatefulUIManager currentDownload](v15, "currentDownload");
    v12 = 1;
    v11 = -[SUDownload downloadOptions](v13, "downloadOptions");
    v10 = 1;
    v6 = -[SUDownloadOptions isAutoDownload](v11, "isAutoDownload");
  }
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  if ((v14 & 1) != 0)

  if ((v6 & 1) != 0)
    return 2;
  v8 = 0;
  v5 = 0;
  if (a4 == 4)
  {
    v9 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v8 = 1;
    v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v9, "isTargetedUpdateScheduledForAutoInstall");
  }
  if ((v8 & 1) != 0)

  if (v5)
    return 3;
  else
    return 0;
}

- (void)refreshInstallButton
{
  id v2;

  v2 = -[SUSUISoftwareUpdateController specifierForUpdateOptionsWithUIState:descriptorState:](self, "specifierForUpdateOptionsWithUIState:descriptorState:", -[SUSUISoftwareUpdateController currentUIState](self, "currentUIState"), -[SUSUISoftwareUpdateController currentDescriptorState](self, "currentDescriptorState"));
}

- (void)_setTitleCellSpecifierStatus:(id)a3 descriptorState:(unint64_t)a4
{
  NSObject *queue;
  id v5;
  SUSSoftwareUpdateTitleCell *v6;
  SUSSoftwareUpdateTitleCell *v7;
  SUOperationProgress *v8;
  SUDownload *v9;
  SUSettingsStatefulUIManager *v10;
  SUSSoftwareUpdateTitleCell *v11;
  SUSSoftwareUpdateTitleCell *v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  SUSUISoftwareUpdateController *v20;
  id v21;
  unint64_t v22;
  id location[2];
  SUSUISoftwareUpdateController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = -[SUSUISoftwareUpdateController statusString](v24, "statusString");
  v13 = -[SUSUISoftwareUpdateController titleCell](v24, "titleCell");
  v14 = 0;
  if (a4 == 2)
    v14 = -[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v24, "presentingStatefulDescriptorIsTargetedUpdate");
  -[SUSSoftwareUpdateTitleCell setAnimatingGearView:](v13, "setAnimatingGearView:", v14);

  v6 = -[SUSUISoftwareUpdateController titleCell](v24, "titleCell");
  v5 = -[SUSUISoftwareUpdateController presentingDescriptorError](v24, "presentingDescriptorError");
  -[SUSSoftwareUpdateTitleCell setStatusMessage:symbolizingError:](v6, "setStatusMessage:symbolizingError:", v21, v5 != 0);

  v7 = -[SUSUISoftwareUpdateController titleCell](v24, "titleCell");
  -[SUSSoftwareUpdateTitleCell setProgressDisplayStyle:](v7, "setProgressDisplayStyle:", -[SUSUISoftwareUpdateController updateProgressStyleForDescriptorState:](v24, "updateProgressStyleForDescriptorState:", v22));

  v11 = -[SUSUISoftwareUpdateController titleCell](v24, "titleCell");
  v10 = -[SUSUISoftwareUpdateController manager](v24, "manager");
  v9 = -[SUSettingsStatefulUIManager currentDownload](v10, "currentDownload");
  v8 = -[SUDownload progress](v9, "progress");
  -[SUOperationProgress normalizedPercentComplete](v8, "normalizedPercentComplete");
  -[SUSSoftwareUpdateTitleCell setProgress:](v11, "setProgress:");

  if (v22 == 1)
  {
    queue = MEMORY[0x24BDAC9B8];
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __90__SUSUISoftwareUpdateController_Specifiers___setTitleCellSpecifierStatus_descriptorState___block_invoke;
    v19 = &unk_24DFF7B58;
    v20 = v24;
    dispatch_async(queue, &v15);

    objc_storeStrong((id *)&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __90__SUSUISoftwareUpdateController_Specifiers___setTitleCellSpecifierStatus_descriptorState___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "titleCell");
  v3 = (id)objc_msgSend(v4, "releaseNotesSummaryView");
  v2 = (id)objc_msgSend(v3, "webView");
  v1 = (id)objc_msgSend(v2, "scrollView");
  objc_msgSend(v1, "flashScrollIndicators");

}

- (id)isBetaUpdatesEnabled
{
  id v2;
  SUSettingsStatefulUIManager *v4;
  SDBetaProgram *v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  void *v11;

  v4 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v5 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v4, "enrolledBetaProgram");
  v6 = (id)-[SDBetaProgram title](v5, "title");
  v9 = 0;
  v7 = 0;
  if (v6)
  {
    v2 = v6;
  }
  else
  {
    v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = 1;
    v8 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24E0011F0, CFSTR("Software Update"));
    v7 = 1;
    v2 = v8;
  }
  v11 = v2;
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  return v11;
}

- (BOOL)_errorIsInsufficientSpace:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  id location[3];
  char v13;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)objc_msgSend(location[0], "domain");
  v9 = getSUErrorDomain_1();
  v11 = objc_msgSend(v10, "isEqualToString:");

  if ((v11 & 1) == 0)
    goto LABEL_8;
  v8 = objc_msgSend(location[0], "code");
  if (v8 != 6)
  {
    if (v8 == 20)
    {
      v6 = (id)objc_msgSend(location[0], "userInfo");
      v5 = getkSUInstallationConstraintsUnmetKey_0();
      v4 = (id)objc_msgSend(v6, "objectForKey:");
      v7 = objc_msgSend(v4, "unsignedIntegerValue");

      if ((v7 & 4) != 0)
      {
        v13 = 1;
        goto LABEL_9;
      }
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v13 = 1;
LABEL_9:
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (int)updateProgressStyleForDescriptorState:(unint64_t)a3
{
  float v3;
  int v4;
  int v5;
  id v7;
  char v8;
  int v9;
  SUDownload *v10;
  SUSettingsStatefulUIManager *v11;
  SUSettingsStatefulUIManager *v12;
  NSError *v13;
  char v14;
  char v15;
  int v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  SUSettingsStatefulErrorContextProvider *v24;
  char v25;
  SUSettingsStatefulUIManager *v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  float v32;
  id location;
  id v34;
  unint64_t v35;
  SEL v36;
  SUSUISoftwareUpdateController *v37;
  int v38;

  v37 = self;
  v36 = a2;
  v35 = a3;
  v11 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v10 = -[SUSettingsStatefulUIManager currentDownload](v11, "currentDownload");
  v34 = -[SUDownload progress](v10, "progress");

  location = (id)objc_msgSend(v34, "phase");
  objc_msgSend(v34, "percentComplete");
  v32 = v3;
  v31 = 0;
  v12 = -[SUSUISoftwareUpdateController manager](v37, "manager");
  v13 = -[SUSettingsStatefulUIManager scanError](v12, "scanError");
  v29 = 0;
  v27 = 0;
  v25 = 0;
  v23 = 0;
  v21 = 0;
  v19 = 0;
  v17 = 0;
  v14 = 1;
  if (!v13)
  {
    v30 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
    v29 = 1;
    v28 = (id)objc_msgSend(v30, "updateDownloadError");
    v27 = 1;
    LOBYTE(v9) = 0;
    if (v28)
    {
      v26 = -[SUSUISoftwareUpdateController manager](v37, "manager");
      v25 = 1;
      v24 = -[SUSettingsStatefulUIManager errorContextProvider](v26, "errorContextProvider");
      v23 = 1;
      v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
      v21 = 1;
      v20 = (id)objc_msgSend(v22, "updateDownloadError");
      v19 = 1;
      v18 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
      v17 = 1;
      v9 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v24, "shouldIgnoreUpdateError:withStatefulDescriptor:", v20);
    }
    v14 = v9;
  }
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  if ((v29 & 1) != 0)

  v31 = v14 & 1;
  if (v35 == 2)
  {
    v7 = getkSUDownloadPhasePreparingForInstallation_0();
    v8 = objc_msgSend(location, "isEqualToString:");

    if ((v8 & 1) != 0)
    {
      if ((v31 & 1) != 0)
        v4 = 2;
      else
        v4 = 1;
      v38 = v4;
      v16 = 1;
    }
    else if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v37, "presentingStatefulDescriptorIsTargetedUpdate")&& (v15 = 0, +[SUSettingsStatefulUIAdditions estimatedTimeRemainingForProgress:valid:](SUSettingsStatefulUIAdditions, "estimatedTimeRemainingForProgress:valid:", v34, &v15), v32 >= 0.005)&& (v15 & 1) != 0)
    {
      if ((v31 & 1) != 0)
        v5 = 2;
      else
        v5 = 1;
      v38 = v5;
      v16 = 1;
    }
    else
    {
      v38 = 0;
      v16 = 1;
    }
  }
  else if (v35 == 3)
  {
    if (-[SUSUISoftwareUpdateController presentingStatefulDescriptorIsTargetedUpdate](v37, "presentingStatefulDescriptorIsTargetedUpdate"))
    {
      v38 = 2;
    }
    else
    {
      v38 = 0;
    }
    v16 = 1;
  }
  else
  {
    v38 = 0;
    v16 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v34, 0);
  return v38;
}

- (BOOL)waitingOnSUAssetDownload:(id)a3
{
  char v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = 1;
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE90]) & 1) == 0)
  {
    v4 = 1;
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE68]) & 1) == 0)
    {
      v4 = 1;
      if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE70]) & 1) == 0)
      {
        v4 = 1;
        if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE78]) & 1) == 0)
        {
          v4 = 1;
          if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE80]) & 1) == 0)
          {
            v4 = 1;
            if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE88]) & 1) == 0)
              v4 = objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEE60]);
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_shouldHideTonightButton
{
  double v2;
  const __CFString *v3;
  id v5;
  double v6;
  SUSettingsStatefulUIManager *v7;
  os_log_t oslog;
  BOOL v9;
  double v10;
  int v11;
  os_log_type_t v12;
  id location;
  id v14[3];
  BOOL v15;
  uint8_t v16[32];
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14[2] = self;
  v14[1] = (id)a2;
  v7 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v14[0] = -[SUSettingsStatefulUIManager ddmDeclaration](v7, "ddmDeclaration");

  if (v14[0] && (objc_msgSend(v14[0], "isValidDeclaration") & 1) != 0)
  {
    v5 = (id)objc_msgSend(v14[0], "enforcedInstallDate");
    objc_msgSend(v5, "timeIntervalSinceNow");
    v6 = v2;

    v10 = v6;
    v9 = v6 < 86400.0;
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        v3 = &stru_24E0011F0;
      else
        v3 = CFSTR("don't ");
      __os_log_helper_16_2_3_8_0_8_64_8_64((uint64_t)v16, COERCE__INT64(v10 / 3600.0), (uint64_t)v14[0], (uint64_t)v3);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%lf hour(s) left for %@, %@hide the update/install tonight button", v16, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v15 = v9;
    v11 = 1;
  }
  else
  {
    location = _SUSUILoggingFacility();
    v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v14[0]);
      _os_log_impl(&dword_21BF33000, (os_log_t)location, v12, "No valid declaration available %@, don't hide the update/install tonight button", v17, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v15 = 0;
    v11 = 1;
  }
  objc_storeStrong(v14, 0);
  return v15;
}

- (id)automaticUpdatesCellTitle
{
  id v3;
  id v4;
  id v5;
  SUSettingsSUPreferencesManager *v6;
  SUSettingsStatefulUIManager *v7;
  BOOL v8;
  SUSettingsSUPreferencesManager *v9;
  SUSettingsStatefulUIManager *v10;
  BOOL v11;
  id v13;
  id v14;
  id v15;

  v7 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v6 = -[SUSettingsStatefulUIManager preferences](v7, "preferences");
  v8 = -[SUSettingsSUPreferencesManager isAutomaticDownloadEnabled](v6, "isAutomaticDownloadEnabled");

  v10 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v9 = -[SUSettingsStatefulUIManager preferences](v10, "preferences");
  v11 = -[SUSettingsSUPreferencesManager isAutomaticUpdateV2Enabled](v9, "isAutomaticUpdateV2Enabled");

  if (v8 && v11)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ON"), &stru_24E0011F0, CFSTR("Software Update"));

    return v13;
  }
  else if (v8)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_ONLY"), &stru_24E0011F0, CFSTR("Software Update"));

    return v14;
  }
  else
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24E0011F0, CFSTR("Software Update"));

    return v15;
  }
}

- (void)initUI
{
  -[SUSUISoftwareUpdateController setupTipsObserver](self, "setupTipsObserver");
  -[SUSUISoftwareUpdateController registerForFontChanges](self, "registerForFontChanges");
  self->_currentActivityStyle = 0;
}

- (id)specifierWithID:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v12;
  _QWORD __b[8];
  id v14;
  id v15;
  id location[2];
  SUSUISoftwareUpdateController *v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)-[SUSUISoftwareUpdateController specifiers](v17, "specifiers");
  memset(__b, 0, sizeof(__b));
  obj = v15;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v8);
      v4 = (id)objc_msgSend(v14, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v5 = objc_msgSend(v4, "isEqualToString:", location[0]);

      if ((v5 & 1) != 0)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v9)
          goto LABEL_9;
      }
    }
    v18 = v14;
    v12 = 1;
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  if (!v12)
    v18 = 0;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (void)refreshPane
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  SUSUISoftwareUpdateController *v8;
  BOOL v9;
  id v10;
  unint64_t v11;
  SEL v12;
  SUSUISoftwareUpdateController *v13;

  v13 = self;
  v12 = a2;
  v11 = -[SUSUISoftwareUpdateController currentUIState](self, "currentUIState");
  v10 = -[SUSUISoftwareUpdateController updatedSpecifiersArray](v13, "updatedSpecifiersArray");
  v9 = v11 <= 1;
  -[SUSUISoftwareUpdateController reloadUsingNewSpecifiers:animated:](v13, "reloadUsingNewSpecifiers:animated:", v10, v11 > 1);
  -[SUSUISoftwareUpdateController fixCustomCellSpecifiers](v13, "fixCustomCellSpecifiers");
  -[SUSUISoftwareUpdateController reloadCustomCells](v13, "reloadCustomCells");
  if (v11 == 3
    || v11 == 4
    && -[SUSUISoftwareUpdateController presentingStatefulDescriptorPromotedAsAlternate](v13, "presentingStatefulDescriptorPromotedAsAlternate"))
  {
    queue = MEMORY[0x24BDAC9B8];
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __48__SUSUISoftwareUpdateController_UI__refreshPane__block_invoke;
    v7 = &unk_24DFF7B58;
    v8 = v13;
    dispatch_async(queue, &v3);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
}

uint64_t __48__SUSUISoftwareUpdateController_UI__refreshPane__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadCustomCells", a1, a1);
}

- (void)reloadCustomCells
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  SUSUISoftwareUpdateController *v8;
  id v9;
  id v10[2];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  v9 = 0;
  -[SUSUISoftwareUpdateController reloadScanSpacerCells:](self, "reloadScanSpacerCells:", &v9);
  objc_storeStrong(v10, v9);
  -[SUSUISoftwareUpdateController reloadSpecifiers:animated:](v11, "reloadSpecifiers:animated:", v10[0], 0);
  -[SUSUISoftwareUpdateController fixCustomCellSpecifiers](v11, "fixCustomCellSpecifiers");
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __54__SUSUISoftwareUpdateController_UI__reloadCustomCells__block_invoke;
  v7 = &unk_24DFF7B58;
  v8 = v11;
  dispatch_async(queue, &v3);

  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(v10, 0);
}

uint64_t __54__SUSUISoftwareUpdateController_UI__reloadCustomCells__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fixCustomCellSpecifiers", a1, a1);
}

- (void)reloadScanSpacerCells:(id *)a3
{
  float v3;
  float v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  id v20;
  double v21;
  id v22;
  id v23;
  double v24;
  id location;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  id v38;
  id v39;
  id v40;
  id v41;
  double v42;
  double v43;
  id *v44;
  SEL v45;
  SUSUISoftwareUpdateController *v46;

  v46 = self;
  v45 = a2;
  v44 = a3;
  v43 = 0.0;
  v42 = 0.0;
  v41 = -[SUSUISoftwareUpdateController specifierWithID:](self, "specifierWithID:", CFSTR("SUScanHeaderGroup"));
  v40 = (id)objc_msgSend(v41, "propertyForKey:", CFSTR("SUHeight"));
  if (v40)
  {
    objc_msgSend(v40, "floatValue");
    v43 = v43 + v3;
  }
  v39 = -[SUSUISoftwareUpdateController specifierWithID:](v46, "specifierWithID:", CFSTR("SUScanFooterGroup"));
  v38 = (id)objc_msgSend(v39, "propertyForKey:", CFSTR("SUHeight"));
  if (v38)
  {
    objc_msgSend(v38, "floatValue");
    v43 = v43 + v4;
  }
  v17 = (id)-[SUSUISoftwareUpdateController table](v46, "table");
  objc_msgSend(v17, "layoutSubviews");

  v18 = (id)-[SUSUISoftwareUpdateController table](v46, "table");
  objc_msgSend(v18, "contentSize");
  v35 = v5;
  v36 = v6;
  v19 = v6;

  v37 = v19;
  +[SUSUISoftwareUpdateController windowSafeAreasSize](SUSUISoftwareUpdateController, "windowSafeAreasSize");
  v34 = v19 - v43 + v7;
  v23 = (id)-[SUSUISoftwareUpdateController table](v46, "table");
  objc_msgSend(v23, "visibleSize");
  v31 = v8;
  v32 = v9;
  v21 = v9;
  v22 = (id)-[SUSUISoftwareUpdateController navigationController](v46, "navigationController");
  v20 = (id)objc_msgSend(v22, "navigationBar");
  objc_msgSend(v20, "bounds");
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v30 = v13;
  v24 = v21 - v13;

  v33 = v24;
  if (v24 > v34)
    v42 = v33 - v34;
  v14 = v42 / 2.0;
  v26 = floorf(v14);
  location = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v41)
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
    objc_msgSend(v41, "setProperty:forKey:");

    objc_msgSend(location, "addObject:", v41);
  }
  if (v39)
  {
    v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
    objc_msgSend(v39, "setProperty:forKey:");

    objc_msgSend(location, "addObject:", v39);
  }
  if (v44)
    *v44 = objc_retainAutorelease(location);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
}

- (void)setBusyWithActivityStyle:(int64_t)a3
{
  SUSSoftwareUpdateUpdateOptionsCell *v3;
  SUSSoftwareUpdateUpdateOptionsCell *v4;
  PSTableCell *v5;
  PSTableCell *v6;
  PSTableCell *v7;
  PSTableCell *v8;
  char v9;

  v3 = -[SUSUISoftwareUpdateController updateOptionsCell](self, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setEnabled:](v3, "setEnabled:", a3 == 0);

  v4 = -[SUSUISoftwareUpdateController updateOptionsCell](self, "updateOptionsCell");
  -[SUSSoftwareUpdateUpdateOptionsCell setActivityIndicatorDisplayStyle:](v4, "setActivityIndicatorDisplayStyle:", a3);

  v9 = !-[SUSUISoftwareUpdateController isBusy](self, "isBusy");
  v5 = -[SUSUISoftwareUpdateController automaticUpdatesCell](self, "automaticUpdatesCell");
  -[PSTableCell setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", v9 & 1);

  v6 = -[SUSUISoftwareUpdateController betaUpdatesCell](self, "betaUpdatesCell");
  -[PSTableCell setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", v9 & 1);

  v7 = -[SUSUISoftwareUpdateController alternateUpdateCell](self, "alternateUpdateCell");
  -[PSTableCell setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", v9 & 1);

  v8 = -[SUSUISoftwareUpdateController nonPromotedUpdateCell](self, "nonPromotedUpdateCell");
  -[PSTableCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", v9 & 1);

}

+ (double)windowSafeAreasSize
{
  double v2;
  double v3;
  id v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id location;
  int v15;
  id v16[3];
  double v17;

  v16[2] = a1;
  v16[1] = (id)a2;
  if (*(double *)&windowSafeAreasSize_safeArea != 2.22507386e-308)
    return *(double *)&windowSafeAreasSize_safeArea;
  v13 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", *(double *)&windowSafeAreasSize_safeArea);
  v16[0] = (id)objc_msgSend(v13, "connectedScenes");

  if (objc_msgSend(v16[0], "count"))
  {
    v10 = (id)objc_msgSend(v16[0], "allObjects");
    location = (id)objc_msgSend(v10, "objectAtIndex:", 0);

    v11 = (id)objc_msgSend(location, "windows");
    v12 = objc_msgSend(v11, "count") != 0;

    if (v12)
    {
      v9 = (id)objc_msgSend(location, "windows");
      v8 = (id)objc_msgSend(v9, "objectAtIndex:");
      objc_msgSend(v8, "safeAreaInsets");
      v6 = v2;
      v7 = (id)objc_msgSend(location, "windows");
      v5 = (id)objc_msgSend(v7, "objectAtIndex:", 0);
      objc_msgSend(v5, "safeAreaInsets");
      v17 = v6 + v3;

    }
    else
    {
      v17 = 0.0;
    }
    v15 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v17 = 0.0;
    v15 = 1;
  }
  objc_storeStrong(v16, 0);
  return v17;
}

- (void)viewDidLoad
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  id v5;
  NSString *v6;
  SUSUISoftwareUpdateController *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v12;
  SUDownload *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  SUDescriptor *v16;
  SUDownload *v17;
  SUSettingsStatefulUIManager *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  NSString *v24;
  SUSUIServiceManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  UIRefreshControl *v30;
  SUSUISoftwareUpdateController *v31;
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  NSString *v36;
  os_log_type_t v37;
  id v38;
  objc_class *v39;
  objc_super v40;
  SEL v41;
  SUSUISoftwareUpdateController *v42;
  uint8_t v43[136];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController viewDidLoad](&v40, sel_viewDidLoad);
  v31 = v42;
  v32 = -[SUSUISoftwareUpdateController paneTitle](v42, "paneTitle");
  -[SUSUISoftwareUpdateController setTitle:](v31, "setTitle:");

  v33 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v33, "addObserver:selector:name:object:", v42, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  if (-[SUSUISoftwareUpdateController supportsPullToRefresh](v42, "supportsPullToRefresh"))
  {
    v29 = objc_alloc_init(MEMORY[0x24BEBD8B0]);
    -[SUSUISoftwareUpdateController setRefreshControl:](v42, "setRefreshControl:");

    v30 = -[SUSUISoftwareUpdateController refreshControl](v42, "refreshControl");
    -[UIRefreshControl addTarget:action:forControlEvents:](v30, "addTarget:action:forControlEvents:", v42, sel_performUpdateRescan_, 4096);

  }
  v25 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
  v39 = -[SUSUIServiceManager classForService:](v25, "classForService:", objc_opt_class());

  v26 = (id)-[objc_class sharedManager](v39, "sharedManager");
  objc_msgSend(v26, "setup");

  v28 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v27 = (id)-[objc_class sharedManager](v39, "sharedManager");
  objc_msgSend(v28, "addResponderDelegate:forServiceType:");

  v38 = _SUSUILoggingFacility();
  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    log = v38;
    type = v37;
    v2 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v2);
    v6 = v24;
    v36 = v6;
    v7 = v42;
    v23 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v42, "currentUIState"));
    v8 = v23;
    v35 = v8;
    v9 = -[SUSUISoftwareUpdateController currentUIState](v42, "currentUIState");
    v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v42, "presentingStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v42, "presentingStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v42, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v42, "presentingAlternateStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController manager](v42, "manager");
    v17 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v16 = -[SUDownload descriptor](v17, "descriptor");
    v15 = (id)-[SUDescriptor humanReadableUpdateName](v16, "humanReadableUpdateName");
    v5 = v15;
    v34 = v5;
    v14 = -[SUSUISoftwareUpdateController manager](v42, "manager");
    v13 = -[SUSettingsStatefulUIManager currentDownload](v14, "currentDownload");
    v12 = -[SUSUISoftwareUpdateController manager](v42, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v12, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v43, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewDidLoad]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v43, 0x7Au);

    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong((id *)&v36, 0);
  }
  objc_storeStrong(&v38, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  objc_class *v6;
  SUSettingsStatefulUIManager *v7;
  char v8;
  SUSettingsStatefulUIManager *v9;
  const __CFString *v10;
  NSString *v11;
  NSString *v12;
  SUSUISoftwareUpdateController *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SUSettingsStatefulUIManager *v21;
  SUDownload *v22;
  SUDescriptor *v23;
  id v24;
  id v25;
  SUSettingsStatefulUIManager *v26;
  SUDownload *v27;
  SUSettingsStatefulUIManager *v28;
  uint64_t v29;
  id v30;
  char v31;
  SUSettingsStatefulUIManagerDelegate *v32;
  char v33;
  SUSettingsStatefulUIManager *v34;
  char v35;
  NSString *v36;
  id location;
  id v38;
  id v39;
  os_log_type_t v40;
  id v41;
  id v42;
  objc_super v43;
  BOOL v44;
  SEL v45;
  SUSUISoftwareUpdateController *v46;
  uint8_t v47[136];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController viewWillAppear:](&v43, sel_viewWillAppear_, a3);
  v30 = (id)-[SUSUISoftwareUpdateController navigationController](v46, "navigationController");
  v42 = (id)objc_msgSend(v30, "topViewController");

  v41 = _SUSUILoggingFacility();
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v3);
    v12 = v11;
    v39 = v12;
    v13 = v46;
    v14 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v46, "currentUIState"));
    v15 = v14;
    v38 = v15;
    v16 = -[SUSUISoftwareUpdateController currentUIState](v46, "currentUIState");
    v17 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v46, "presentingStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v46, "presentingStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v46, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v46, "presentingAlternateStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v21, "currentDownload");
    v23 = -[SUDownload descriptor](v22, "descriptor");
    v24 = (id)-[SUDescriptor humanReadableUpdateName](v23, "humanReadableUpdateName");
    v25 = v24;
    location = v25;
    v26 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v27 = -[SUSettingsStatefulUIManager currentDownload](v26, "currentDownload");
    v28 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v28, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    v29 = (uint64_t)v5;
    v35 = 0;
    if (v42)
    {
      v6 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v6);
      v35 = 1;
      v10 = (const __CFString *)v36;
    }
    else
    {
      v10 = CFSTR("N/A");
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v47, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillAppear:]", (uint64_t)v12, (uint64_t)v13, (uint64_t)v15, v16, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v25, (uint64_t)v27, v29, (uint64_t)v10);
    _os_log_impl(&dword_21BF33000, (os_log_t)v41, v40, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v47, 0x84u);
    if ((v35 & 1) != 0)

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(&v41, 0);
  if (-[SUSUISoftwareUpdateController currentUIState](v46, "currentUIState"))
  {
    v33 = 0;
    v31 = 0;
    v8 = 0;
    if (!-[SUSUISoftwareUpdateController isBusy](v46, "isBusy"))
    {
      v34 = -[SUSUISoftwareUpdateController manager](v46, "manager");
      v33 = 1;
      v32 = -[SUSettingsStatefulUIManager delegate](v34, "delegate");
      v31 = 1;
      v8 = -[SUSettingsStatefulUIManagerDelegate isEqual:](v32, "isEqual:", v46);
    }
    if ((v31 & 1) != 0)

    if ((v33 & 1) != 0)
    if ((v8 & 1) != 0)
    {
      v7 = -[SUSUISoftwareUpdateController manager](v46, "manager");
      -[SUSettingsStatefulUIManager refreshState](v7, "refreshState");

    }
  }
  else
  {
    v9 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    -[SUSettingsStatefulUIManager checkForAvailableUpdates](v9, "checkForAvailableUpdates");

  }
  objc_storeStrong(&v42, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  char v3;
  id v4;
  id v5;
  id *v6;
  objc_class *v7;
  id v8;
  char v9;
  const char *v10;
  objc_class *v11;
  char v12;
  const char *v13;
  objc_class *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t *v18;
  const __CFString *v19;
  os_log_t v20;
  os_log_type_t v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  const char *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  const char *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  os_log_t log;
  os_log_type_t v56[4];
  uint8_t *buf;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id *location;
  id *v76;
  id *v77;
  id *v78;
  id *v79;
  id *v80;
  id *v81;
  id obj;
  _BOOL4 v83;
  int v84;
  const char *v85;
  uint64_t v86;
  SUSUISoftwareUpdateController *v87;
  id v88;
  id v89;
  id *v90;
  SUSUISoftwareUpdateController *v91;
  int v92;
  _BOOL4 v93;
  char v94;
  id v95;
  id v96;
  id v97;
  id v98;
  os_log_type_t v99;
  os_log_t v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  os_log_type_t type;
  os_log_t oslog;
  char v111;
  char v112;
  char v113;
  objc_super v114;
  BOOL v115;
  SEL v116;
  SUSUISoftwareUpdateController *v117;
  _BYTE v118[144];
  _BYTE v119[184];
  uint64_t v120;

  v90 = (id *)&v112;
  v85 = "-[SUSUISoftwareUpdateController(UI) viewDidAppear:]";
  v120 = *MEMORY[0x24BDAC8D0];
  v117 = self;
  v116 = a2;
  v92 = 1;
  v115 = a3;
  v114.receiver = self;
  v114.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController viewDidAppear:](&v114, sel_viewDidAppear_, a3);
  v87 = v117;
  v86 = MEMORY[0x24BDD1488];
  v89 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v88 = (id)objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
  -[PSListController addNavigationEventForSystemSettings:](v87, "addNavigationEventForSystemSettings:");

  v91 = v117;
  v3 = -[SUSUISoftwareUpdateController isMemberOfClass:](v117, "isMemberOfClass:", objc_opt_class());
  v113 = 0;
  v111 = 0;
  v93 = 0;
  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_msgSend(v90[7], "manager");
    v90[2] = v4;
    v84 = 1;
    v113 = 1;
    v5 = (id)objc_msgSend(v4, "delegate");
    v6 = v90;
    *v90 = v5;
    v111 = 1;
    v93 = v5 != v6[7];
  }
  v83 = v93;
  if ((v111 & 1) != 0)

  if ((v113 & 1) != 0)
  if (v83)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v56 = type;
      v7 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v7);
      v50 = v74;
      v81 = &v108;
      v108 = v50;
      v51 = v90[7];
      v73 = SUSettingsUIStateToString(objc_msgSend(v90[7], "currentUIState"));
      v52 = v73;
      v80 = &v107;
      v107 = v52;
      v53 = objc_msgSend(v90[7], "currentUIState");
      v72 = (id)objc_msgSend(v90[7], "presentingStatefulDescriptor");
      v71 = (id)objc_msgSend(v90[7], "presentingStatefulDescriptor");
      v8 = (id)objc_msgSend(v90[7], "presentingAlternateStatefulDescriptor");
      v70 = v8;
      v69 = (id)objc_msgSend(v90[7], "presentingAlternateStatefulDescriptor");
      v68 = (id)objc_msgSend(v90[7], "manager");
      v67 = (id)objc_msgSend(v68, "currentDownload");
      v66 = (id)objc_msgSend(v67, "descriptor");
      v65 = (id)objc_msgSend(v66, "humanReadableUpdateName");
      v44 = v65;
      v79 = &v106;
      v106 = v44;
      v64 = (id)objc_msgSend(v90[7], "manager");
      v63 = (id)objc_msgSend(v64, "currentDownload");
      v62 = (id)objc_msgSend(v90[7], "manager");
      v9 = objc_msgSend(v62, "isTargetedUpdateScheduledForAutoInstall");
      v10 = "YES";
      if ((v9 & 1) == 0)
        v10 = "NO";
      v45 = v10;
      v46 = (id)objc_opt_class();
      v78 = &v105;
      v105 = v46;
      v47 = (id)objc_opt_class();
      v77 = &v104;
      v104 = v47;
      v61 = (id)objc_msgSend(v90[7], "manager");
      v60 = (id)objc_msgSend(v61, "delegate");
      v59 = (id)objc_msgSend(v90[7], "manager");
      v58 = (id)objc_msgSend(v59, "delegate");
      v48 = (id)objc_opt_class();
      v76 = &v103;
      v103 = v48;
      v49 = v90[7];
      location = &v102;
      v102 = (id)objc_opt_class();
      v54 = &v15;
      buf = v119;
      __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66_8_0_8_66_8_0_8_66((uint64_t)v119, (uint64_t)v85, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, v53, (uint64_t)v72, (uint64_t)v71, (uint64_t)v8, (uint64_t)v69, (uint64_t)v44, (uint64_t)v63, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v60, (uint64_t)v48, (uint64_t)v49, (uint64_t)v102);
      _os_log_impl(&dword_21BF33000, log, v56[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nThe Stateful UI manager's delegate is pointing to another, non %{public}@ controller. Grabbing the pointer back to %{public}@. \tCurrent Pointer: %p (%{public}@)\n\tAssigned Pointer: %p (%{public}@)", buf, 0xB6u);

      obj = 0;
      objc_storeStrong(location, 0);
      objc_storeStrong(v76, obj);
      objc_storeStrong(v77, obj);
      objc_storeStrong(v78, obj);
      objc_storeStrong(v79, obj);
      objc_storeStrong(v80, obj);
      objc_storeStrong(v81, obj);
    }
    objc_storeStrong((id *)&oslog, 0);
    v42 = v90[7];
    v43 = (id)objc_msgSend(v90[7], "manager");
    objc_msgSend(v43, "setDelegate:", v42);

    objc_msgSend(v90[7], "refreshPane");
  }
  v41 = (id)objc_msgSend(v90[7], "navigationController");
  v101 = (id)objc_msgSend(v41, "topViewController");

  v100 = (os_log_t)_SUSUILoggingFacility();
  v99 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v100;
    *(_DWORD *)v21 = v99;
    v11 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v11);
    v23 = v22;
    v98 = v23;
    v24 = v90[7];
    v25 = SUSettingsUIStateToString(objc_msgSend(v90[7], "currentUIState"));
    v26 = v25;
    v97 = v26;
    v27 = objc_msgSend(v90[7], "currentUIState");
    v28 = (id)objc_msgSend(v90[7], "presentingStatefulDescriptor");
    v29 = (id)objc_msgSend(v90[7], "presentingStatefulDescriptor");
    v30 = (id)objc_msgSend(v90[7], "presentingAlternateStatefulDescriptor");
    v31 = (id)objc_msgSend(v90[7], "presentingAlternateStatefulDescriptor");
    v32 = (id)objc_msgSend(v90[7], "manager");
    v33 = (id)objc_msgSend(v32, "currentDownload");
    v34 = (id)objc_msgSend(v33, "descriptor");
    v35 = (id)objc_msgSend(v34, "humanReadableUpdateName");
    v36 = v35;
    v96 = v36;
    v37 = (id)objc_msgSend(v90[7], "manager");
    v38 = (id)objc_msgSend(v37, "currentDownload");
    v39 = (id)objc_msgSend(v90[7], "manager");
    v12 = objc_msgSend(v39, "isTargetedUpdateScheduledForAutoInstall");
    v13 = "YES";
    if ((v12 & 1) == 0)
      v13 = "NO";
    v40 = v13;
    v94 = 0;
    if (v101)
    {
      v14 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v14);
      v94 = 1;
      v19 = (const __CFString *)v95;
    }
    else
    {
      v19 = CFSTR("N/A");
    }
    v18 = v118;
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v118, (uint64_t)v85, (uint64_t)v23, (uint64_t)v24, (uint64_t)v26, v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v36, (uint64_t)v38, (uint64_t)v40, (uint64_t)v19);
    _os_log_impl(&dword_21BF33000, v20, v21[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v18, 0x84u);
    if ((v94 & 1) != 0)

    v17 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v17);
    objc_storeStrong(&v98, v17);
  }
  v16 = 0;
  objc_storeStrong((id *)&v100, 0);
  objc_storeStrong(&v101, v16);
}

- (void)loadView
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  id v5;
  NSString *v6;
  SUSUISoftwareUpdateController *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v12;
  SUDownload *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  SUDescriptor *v16;
  SUDownload *v17;
  SUSettingsStatefulUIManager *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  NSString *v24;
  id v25;
  __CFString *v26;
  NSString *v27;
  os_log_type_t v28;
  id v29;
  objc_super v30;
  SEL v31;
  SUSUISoftwareUpdateController *v32;
  uint8_t v33[136];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController loadView](&v30, sel_loadView);
  v29 = _SUSUILoggingFacility();
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    log = v29;
    type = v28;
    v2 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v2);
    v6 = v24;
    v27 = v6;
    v7 = v32;
    v23 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState"));
    v8 = v23;
    v26 = v8;
    v9 = -[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState");
    v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v17 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v16 = -[SUDownload descriptor](v17, "descriptor");
    v15 = (id)-[SUDescriptor humanReadableUpdateName](v16, "humanReadableUpdateName");
    v5 = v15;
    v25 = v5;
    v14 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v13 = -[SUSettingsStatefulUIManager currentDownload](v14, "currentDownload");
    v12 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v12, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(UI) loadView]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v26, 0);
    objc_storeStrong((id *)&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  -[SUSUISoftwareUpdateController initUI](v32, "initUI");
  objc_msgSend(*(id *)((char *)&v32->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "_setMarginWidth:", 15.0);
}

- (void)willEnterForeground
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(id *);
  void *v7;
  id v8[2];
  SUSUISoftwareUpdateController *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __56__SUSUISoftwareUpdateController_UI__willEnterForeground__block_invoke;
  v7 = &unk_24DFF7B58;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __56__SUSUISoftwareUpdateController_UI__willEnterForeground__block_invoke(id *a1)
{
  objc_class *v1;
  char v2;
  const char *v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSString *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *log;
  os_log_type_t type;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  id v30;
  __CFString *v31;
  NSString *v32;
  os_log_type_t v33;
  id v34[3];
  uint8_t v35[136];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34[2] = a1;
  v34[1] = a1;
  v34[0] = _SUSUILoggingFacility();
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v34[0];
    type = v33;
    v1 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v1);
    v10 = v28;
    v32 = v10;
    v11 = a1[4];
    v27 = SUSettingsUIStateToString(objc_msgSend(v11, "currentUIState"));
    v12 = v27;
    v31 = v12;
    v13 = objc_msgSend(a1[4], "currentUIState");
    v26 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v25 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v24 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v23 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "manager");
    v21 = (id)objc_msgSend(v22, "currentDownload");
    v20 = (id)objc_msgSend(v21, "descriptor");
    v19 = (id)objc_msgSend(v20, "humanReadableUpdateName");
    v9 = v19;
    v30 = v9;
    v18 = (id)objc_msgSend(a1[4], "manager");
    v17 = (id)objc_msgSend(v18, "currentDownload");
    v16 = (id)objc_msgSend(a1[4], "manager");
    v2 = objc_msgSend(v16, "isTargetedUpdateScheduledForAutoInstall");
    v3 = "YES";
    if ((v2 & 1) == 0)
      v3 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(UI) willEnterForeground]_block_invoke", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v32, 0);
  }
  objc_storeStrong(v34, 0);
  v5 = a1[4];
  v6 = (id)objc_msgSend(v5, "updatedSpecifiersArray");
  objc_msgSend(v5, "setSpecifiers:");

  v7 = a1[4];
  v8 = (id)objc_msgSend(v7, "paneTitle");
  objc_msgSend(v7, "setTitle:");

  return objc_msgSend(a1[4], "refreshPane");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  objc_class *v6;
  const __CFString *v7;
  NSString *v8;
  NSString *v9;
  SUSUISoftwareUpdateController *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SUSettingsStatefulUIManager *v18;
  SUDownload *v19;
  SUDescriptor *v20;
  id v21;
  id v22;
  SUSettingsStatefulUIManager *v23;
  SUDownload *v24;
  SUSettingsStatefulUIManager *v25;
  uint64_t v26;
  id v27;
  char v28;
  NSString *v29;
  id location;
  id v31;
  id v32;
  os_log_type_t v33;
  id v34;
  id v35;
  objc_super v36;
  BOOL v37;
  SEL v38;
  SUSUISoftwareUpdateController *v39;
  uint8_t v40[136];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  v38 = a2;
  v37 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController viewWillDisappear:](&v36, sel_viewWillDisappear_, a3);
  v27 = (id)-[SUSUISoftwareUpdateController navigationController](v39, "navigationController");
  v35 = (id)objc_msgSend(v27, "topViewController");

  v34 = _SUSUILoggingFacility();
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v3);
    v9 = v8;
    v32 = v9;
    v10 = v39;
    v11 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v39, "currentUIState"));
    v12 = v11;
    v31 = v12;
    v13 = -[SUSUISoftwareUpdateController currentUIState](v39, "currentUIState");
    v14 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v39, "presentingStatefulDescriptor");
    v15 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v39, "presentingStatefulDescriptor");
    v16 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v39, "presentingAlternateStatefulDescriptor");
    v17 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v39, "presentingAlternateStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v19 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v20 = -[SUDownload descriptor](v19, "descriptor");
    v21 = (id)-[SUDescriptor humanReadableUpdateName](v20, "humanReadableUpdateName");
    v22 = v21;
    location = v22;
    v23 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v24 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v25 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v25, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    v26 = (uint64_t)v5;
    v28 = 0;
    if (v35)
    {
      v6 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v6);
      v28 = 1;
      v7 = (const __CFString *)v29;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v40, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillDisappear:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v12, v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v22, (uint64_t)v24, v26, (uint64_t)v7);
    _os_log_impl(&dword_21BF33000, (os_log_t)v34, v33, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v40, 0x84u);
    if ((v28 & 1) != 0)

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  objc_class *v6;
  const __CFString *v7;
  NSString *v8;
  NSString *v9;
  SUSUISoftwareUpdateController *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SUSettingsStatefulUIManager *v18;
  SUDownload *v19;
  SUDescriptor *v20;
  id v21;
  id v22;
  SUSettingsStatefulUIManager *v23;
  SUDownload *v24;
  SUSettingsStatefulUIManager *v25;
  uint64_t v26;
  id v27;
  char v28;
  NSString *v29;
  id location;
  id v31;
  id v32;
  os_log_type_t v33;
  id v34;
  id v35;
  objc_super v36;
  BOOL v37;
  SEL v38;
  SUSUISoftwareUpdateController *v39;
  uint8_t v40[136];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  v38 = a2;
  v37 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController viewDidDisappear:](&v36, sel_viewDidDisappear_, a3);
  v27 = (id)-[SUSUISoftwareUpdateController navigationController](v39, "navigationController");
  v35 = (id)objc_msgSend(v27, "topViewController");

  v34 = _SUSUILoggingFacility();
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v3);
    v9 = v8;
    v32 = v9;
    v10 = v39;
    v11 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v39, "currentUIState"));
    v12 = v11;
    v31 = v12;
    v13 = -[SUSUISoftwareUpdateController currentUIState](v39, "currentUIState");
    v14 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v39, "presentingStatefulDescriptor");
    v15 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v39, "presentingStatefulDescriptor");
    v16 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v39, "presentingAlternateStatefulDescriptor");
    v17 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v39, "presentingAlternateStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v19 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v20 = -[SUDownload descriptor](v19, "descriptor");
    v21 = (id)-[SUDescriptor humanReadableUpdateName](v20, "humanReadableUpdateName");
    v22 = v21;
    location = v22;
    v23 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v24 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v25 = -[SUSUISoftwareUpdateController manager](v39, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v25, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    v26 = (uint64_t)v5;
    v28 = 0;
    if (v35)
    {
      v6 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v6);
      v28 = 1;
      v7 = (const __CFString *)v29;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v40, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewDidDisappear:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v12, v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v22, (uint64_t)v24, v26, (uint64_t)v7);
    _os_log_impl(&dword_21BF33000, (os_log_t)v34, v33, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v40, 0x84u);
    if ((v28 & 1) != 0)

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (BOOL)isTopViewController
{
  id v3;
  BOOL v4;
  char v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;
  BOOL v9;

  v8 = self;
  location[1] = (id)a2;
  v3 = (id)-[SUSUISoftwareUpdateController navigationController](self, "navigationController");
  location[0] = (id)objc_msgSend(v3, "topViewController");

  v5 = 0;
  v4 = 1;
  if (location[0] != v8)
  {
    v6 = (id)-[SUSUISoftwareUpdateController parentViewController](v8, "parentViewController");
    v5 = 1;
    v4 = location[0] == v6;
  }
  v9 = v4;
  if ((v5 & 1) != 0)

  objc_storeStrong(location, 0);
  return v9;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v7;
  id v8;
  BOOL v9;
  id location[2];
  SUSUISoftwareUpdateController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  objc_storeStrong(&v8, a5);
  if (-[SUSUISoftwareUpdateController isTopViewController](v11, "isTopViewController"))
  {
    v7.receiver = v11;
    v7.super_class = (Class)SUSUISoftwareUpdateController;
    -[SUSUISoftwareUpdateController presentViewController:animated:completion:](&v7, sel_presentViewController_animated_completion_, location[0], v9, v8);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  objc_class *v7;
  const char *v8;
  id v9;
  dispatch_time_t when;
  NSObject *queue;
  id v12;
  NSString *v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __CFString *v30;
  NSString *v31;
  id v32;
  NSString *v33;
  id v34;
  __CFString *v35;
  uint64_t v36;
  NSObject *log;
  os_log_type_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __CFString *v50;
  NSString *v51;
  BOOL v52;
  char v54;
  uint64_t v55;
  int v56;
  int v57;
  void (*v58)(uint64_t, void *);
  void *v59;
  id v60;
  id v61;
  id v62;
  os_log_type_t v63;
  os_log_t v64;
  uint64_t v65;
  int v66;
  int v67;
  void (*v68)(id *);
  void *v69;
  id v70;
  char v71;
  id v72;
  id v73;
  __CFString *v74;
  NSString *v75;
  os_log_type_t v76;
  os_log_t v77;
  int v78;
  id v79;
  __CFString *v80;
  NSString *v81;
  os_log_type_t type;
  os_log_t oslog;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  id v90;
  id location[2];
  id v92;
  uint8_t v93[16];
  uint8_t v94[144];
  uint8_t v95[136];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v92 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v90 = 0;
  objc_storeStrong(&v90, a4);
  v88 = 0;
  v86 = 0;
  v84 = 0;
  v54 = 1;
  if (location[0])
  {
    v89 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("ShowDefaultAudiencePane"));
    v88 = 1;
    v52 = 0;
    if (!v89)
    {
      v87 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("PerformAction"));
      v86 = 1;
      v52 = 0;
      if (!v87)
      {
        v85 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("path"));
        v84 = 1;
        v52 = v85 == 0;
      }
    }
    v54 = v52;
  }
  if ((v84 & 1) != 0)

  if ((v86 & 1) != 0)
  if ((v88 & 1) != 0)

  if ((v54 & 1) != 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v38 = type;
      v4 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v4);
      v33 = v51;
      v81 = v33;
      v34 = v92;
      v50 = SUSettingsUIStateToString(objc_msgSend(v92, "currentUIState"));
      v35 = v50;
      v80 = v35;
      v36 = objc_msgSend(v92, "currentUIState");
      v49 = (id)objc_msgSend(v92, "presentingStatefulDescriptor");
      v48 = (id)objc_msgSend(v92, "presentingStatefulDescriptor");
      v47 = (id)objc_msgSend(v92, "presentingAlternateStatefulDescriptor");
      v46 = (id)objc_msgSend(v92, "presentingAlternateStatefulDescriptor");
      v45 = (id)objc_msgSend(v92, "manager");
      v44 = (id)objc_msgSend(v45, "currentDownload");
      v43 = (id)objc_msgSend(v44, "descriptor");
      v42 = (id)objc_msgSend(v43, "humanReadableUpdateName");
      v32 = v42;
      v79 = v32;
      v41 = (id)objc_msgSend(v92, "manager");
      v40 = (id)objc_msgSend(v41, "currentDownload");
      v39 = (id)objc_msgSend(v92, "manager");
      v5 = objc_msgSend(v39, "isTargetedUpdateScheduledForAutoInstall");
      v6 = "YES";
      if ((v5 & 1) == 0)
        v6 = "NO";
      __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v95, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]", (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, (uint64_t)v49, (uint64_t)v48, (uint64_t)v47, (uint64_t)v46, (uint64_t)v32, (uint64_t)v40, (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, log, v38, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSoftwareUpdatePane invoked via URL but no supported option passed in. Nothing to do here. Available options: ShowDefaultAudiencePane, PerformAction", v95, 0x7Au);

      objc_storeStrong(&v79, 0);
      objc_storeStrong((id *)&v80, 0);
      objc_storeStrong((id *)&v81, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v78 = 1;
  }
  else
  {
    v77 = (os_log_t)_SUSUILoggingFacility();
    v76 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v77;
      v18 = v76;
      v7 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v7);
      v13 = v31;
      v75 = v13;
      v14 = v92;
      v30 = SUSettingsUIStateToString(objc_msgSend(v92, "currentUIState"));
      v15 = v30;
      v74 = v15;
      v16 = objc_msgSend(v92, "currentUIState");
      v29 = (id)objc_msgSend(v92, "presentingStatefulDescriptor");
      v28 = (id)objc_msgSend(v92, "presentingStatefulDescriptor");
      v27 = (id)objc_msgSend(v92, "presentingAlternateStatefulDescriptor");
      v26 = (id)objc_msgSend(v92, "presentingAlternateStatefulDescriptor");
      v25 = (id)objc_msgSend(v92, "manager");
      v24 = (id)objc_msgSend(v25, "currentDownload");
      v23 = (id)objc_msgSend(v24, "descriptor");
      v22 = (id)objc_msgSend(v23, "humanReadableUpdateName");
      v12 = v22;
      v73 = v12;
      v21 = (id)objc_msgSend(v92, "manager");
      v20 = (id)objc_msgSend(v21, "currentDownload");
      v19 = (id)objc_msgSend(v92, "manager");
      if ((objc_msgSend(v19, "isTargetedUpdateScheduledForAutoInstall") & 1) != 0)
        v8 = "YES";
      else
        v8 = "NO";
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v94, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]", (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v16, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, (uint64_t)v12, (uint64_t)v20, (uint64_t)v8, (uint64_t)location[0]);
      _os_log_impl(&dword_21BF33000, v17, v18, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSoftwareUpdatePane invoked via URL. Will attempt URL specific loading. Dictionary is %{public}@", v94, 0x84u);

      objc_storeStrong(&v73, 0);
      objc_storeStrong((id *)&v74, 0);
      objc_storeStrong((id *)&v75, 0);
    }
    objc_storeStrong((id *)&v77, 0);
    v72 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("path"));
    if (v72 && (objc_msgSend(v72, "isEqualToString:", CFSTR("SUAutomaticUpdateButton")) & 1) != 0)
    {
      v71 = 0;
      when = dispatch_time(0, 100000000);
      queue = MEMORY[0x24BDAC9B8];
      v65 = MEMORY[0x24BDAC760];
      v66 = -1073741824;
      v67 = 0;
      v68 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke;
      v69 = &unk_24DFF7B58;
      v70 = v92;
      dispatch_after(when, queue, &v65);

      v78 = 1;
      objc_storeStrong(&v70, 0);
    }
    else
    {
      v64 = (os_log_t)_SUSUILoggingFacility();
      v63 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v93, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]");
        _os_log_impl(&dword_21BF33000, v64, v63, "%s: Starting to wait for the scan to be finished", v93, 0xCu);
      }
      objc_storeStrong((id *)&v64, 0);
      v9 = v92;
      v55 = MEMORY[0x24BDAC760];
      v56 = -1073741824;
      v57 = 0;
      v58 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_259;
      v59 = &unk_24DFFBD18;
      v60 = v92;
      v61 = location[0];
      v62 = v72;
      objc_msgSend(v9, "waitForScanCompletionWithTimeout:currentAttempt:completionHandler:", 240, 0, &v55);
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v61, 0);
      objc_storeStrong(&v60, 0);
      v78 = 0;
    }
    objc_storeStrong(&v72, 0);
  }
  objc_storeStrong(&v90, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_alloc_init(SUSUISoftwareUpdateAutomaticUpdateController);
  objc_msgSend(v2[0], "setParentController:", a1[4]);
  objc_msgSend(a1[4], "showController:animate:", v2[0], 1);
  objc_storeStrong(v2, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_259(uint64_t a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  objc_class *v5;
  char v6;
  const char *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  __CFString *v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  char isKindOfClass;
  BOOL v25;
  dispatch_time_t when;
  NSObject *queue;
  id v28;
  NSString *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __CFString *v46;
  NSString *v47;
  id v48;
  id v49;
  char v50;
  id v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  __CFString *v55;
  uint64_t v56;
  NSObject *log;
  os_log_type_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __CFString *v71;
  NSString *v72;
  __CFString *v74;
  os_log_type_t v75;
  os_log_t v76;
  os_log_type_t v77;
  os_log_t v78;
  os_log_type_t v79;
  os_log_t v80;
  char v81;
  id v82;
  os_log_type_t v83;
  os_log_t v84;
  char v85;
  id v86;
  char v87;
  id v88;
  os_log_type_t v89;
  os_log_t v90;
  os_log_type_t v91;
  os_log_t v92;
  os_log_type_t v93;
  os_log_t v94;
  os_log_type_t v95;
  os_log_t v96;
  unint64_t v97;
  uint64_t v98;
  os_log_type_t v99;
  os_log_t v100;
  os_log_type_t v101;
  os_log_t v102;
  unint64_t v103;
  os_log_type_t v104;
  os_log_t v105;
  os_log_type_t v106;
  os_log_t v107;
  uint64_t v108;
  int v109;
  int v110;
  void (*v111)(id *);
  void *v112;
  id v113;
  id v114;
  __CFString *v115;
  NSString *v116;
  os_log_type_t v117;
  os_log_t v118;
  int v119;
  os_log_type_t v120;
  os_log_t v121;
  os_log_type_t v122;
  os_log_t v123;
  id v124;
  __CFString *v125;
  NSString *v126;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  uint8_t v130[32];
  uint8_t v131[16];
  uint8_t v132[32];
  uint8_t v133[32];
  uint8_t v134[16];
  uint8_t v135[16];
  uint8_t v136[16];
  uint8_t v137[16];
  uint8_t v138[16];
  uint8_t v139[32];
  uint8_t v140[16];
  uint8_t v141[32];
  uint8_t v142[128];
  uint8_t v143[32];
  uint8_t v144[32];
  uint8_t v145[136];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    v58 = type;
    v2 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v2);
    v53 = v72;
    v126 = v53;
    v54 = *(void **)(a1 + 32);
    v71 = SUSettingsUIStateToString(objc_msgSend(v54, "currentUIState"));
    v55 = v71;
    v125 = v55;
    v56 = objc_msgSend(*(id *)(a1 + 32), "currentUIState");
    v70 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
    v69 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
    v68 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
    v67 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
    v66 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v65 = (id)objc_msgSend(v66, "currentDownload");
    v64 = (id)objc_msgSend(v65, "descriptor");
    v63 = (id)objc_msgSend(v64, "humanReadableUpdateName");
    v51 = v63;
    v124 = v51;
    v62 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v61 = (id)objc_msgSend(v62, "currentDownload");
    v60 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = objc_msgSend(v60, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if ((v3 & 1) == 0)
      v4 = "NO";
    v52 = (uint64_t)v4;
    v59 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PerformAction"));
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v145, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, v56, (uint64_t)v70, (uint64_t)v69, (uint64_t)v68, (uint64_t)v67, (uint64_t)v51, (uint64_t)v61, v52, (uint64_t)v59);
    _os_log_impl(&dword_21BF33000, log, v58, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nFinished to wait for an update scan to finish. Performing: %{public}@", v145, 0x84u);

    objc_storeStrong(&v124, 0);
    objc_storeStrong((id *)&v125, 0);
    objc_storeStrong((id *)&v126, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0] && objc_msgSend(location[0], "code"))
  {
    if (objc_msgSend(location[0], "code") == 8)
    {
      v123 = (os_log_t)_SUSUILoggingFacility();
      v122 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v144, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 48));
        _os_log_impl(&dword_21BF33000, v123, v122, "%s: Timeout while performing scan for requested URL: %{public}@", v144, 0x16u);
      }
      objc_storeStrong((id *)&v123, 0);
    }
    else
    {
      v121 = (os_log_t)_SUSUILoggingFacility();
      v120 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_8_0_8_66((uint64_t)v143, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", objc_msgSend(location[0], "code"), *(_QWORD *)(a1 + 48));
        _os_log_impl(&dword_21BF33000, v121, v120, "%s: Error (code: %ld) while performing scan for requested URL: %{public}@", v143, 0x20u);
      }
      objc_storeStrong((id *)&v121, 0);
    }
    v119 = 1;
  }
  else if (*(_QWORD *)(a1 + 48)
         && (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("SUBetaUpdatesButton")) & 1) != 0)
  {
    v49 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
    v48 = (id)objc_msgSend(v49, "seedingBetaManager");
    v50 = objc_msgSend(v48, "canCurrentDeviceEnrollInBetaUpdates");

    if ((v50 & 1) != 0)
    {
      when = dispatch_time(0, 100000000);
      queue = MEMORY[0x24BDAC9B8];
      v108 = MEMORY[0x24BDAC760];
      v109 = -1073741824;
      v110 = 0;
      v111 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_260;
      v112 = &unk_24DFF7B58;
      v113 = *(id *)(a1 + 32);
      dispatch_after(when, queue, &v108);

      v119 = 1;
      objc_storeStrong(&v113, 0);
    }
    else
    {
      v118 = (os_log_t)_SUSUILoggingFacility();
      v117 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v118;
        v34 = v117;
        v5 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v5);
        v29 = v47;
        v116 = v29;
        v30 = *(void **)(a1 + 32);
        v46 = SUSettingsUIStateToString(objc_msgSend(v30, "currentUIState"));
        v31 = v46;
        v115 = v31;
        v32 = objc_msgSend(*(id *)(a1 + 32), "currentUIState");
        v45 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
        v44 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptor");
        v43 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
        v42 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateStatefulDescriptor");
        v41 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
        v40 = (id)objc_msgSend(v41, "currentDownload");
        v39 = (id)objc_msgSend(v40, "descriptor");
        v38 = (id)objc_msgSend(v39, "humanReadableUpdateName");
        v28 = v38;
        v114 = v28;
        v37 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
        v36 = (id)objc_msgSend(v37, "currentDownload");
        v35 = (id)objc_msgSend(*(id *)(a1 + 32), "manager");
        v6 = objc_msgSend(v35, "isTargetedUpdateScheduledForAutoInstall");
        v7 = "YES";
        if ((v6 & 1) == 0)
          v7 = "NO";
        __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v142, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, v32, (uint64_t)v45, (uint64_t)v44, (uint64_t)v43, (uint64_t)v42, (uint64_t)v28, (uint64_t)v36, (uint64_t)v7);
        _os_log_impl(&dword_21BF33000, v33, v34, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSeeding reports that the device is not enrolled to beta updates. Skipping request.", v142, 0x7Au);

        objc_storeStrong(&v114, 0);
        objc_storeStrong((id *)&v115, 0);
        objc_storeStrong((id *)&v116, 0);
      }
      objc_storeStrong((id *)&v118, 0);
      v119 = 1;
    }
  }
  else if (!*(_QWORD *)(a1 + 48) || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", &stru_24E0011F0) & 1) != 0)
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PerformAction"));
    v25 = v8 == 0;

    if (v25)
    {
      v100 = (os_log_t)_SUSUILoggingFacility();
      v99 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v138, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
        _os_log_impl(&dword_21BF33000, v100, v99, "%s: Attempting to show the update pane with the Default Audience asset", v138, 0xCu);
      }
      objc_storeStrong((id *)&v100, 0);
      v98 = 0;
      v98 = objc_msgSend(*(id *)(a1 + 32), "currentUIState");
      v97 = 0;
      v97 = objc_msgSend(*(id *)(a1 + 32), "currentDescriptorState");
      if (v98 == 3)
      {
        v96 = (os_log_t)_SUSUILoggingFacility();
        v95 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v137, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_21BF33000, v96, v95, "%s: Manager reported no update was found. Nothing more to do.", v137, 0xCu);
        }
        objc_storeStrong((id *)&v96, 0);
        v119 = 1;
      }
      else if (v98 == 2)
      {
        v94 = (os_log_t)_SUSUILoggingFacility();
        v93 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v136, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_21BF33000, v94, v93, "%s: Manager couldn't find an update - scan failed. Nothing more to do.", v136, 0xCu);
        }
        objc_storeStrong((id *)&v94, 0);
        v119 = 1;
      }
      else if (v97 < 4)
      {
        if (v98 == 4)
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "presentingStatefulDescriptorPromotedAsAlternate") & 1) == 0)
            goto LABEL_61;
          v90 = (os_log_t)_SUSUILoggingFacility();
          v89 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_32((uint64_t)v134, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
            _os_log_impl(&dword_21BF33000, v90, v89, "%s: presentingStatefulDescriptorPromotedAsAlternate reported true", v134, 0xCu);
          }
          objc_storeStrong((id *)&v90, 0);
          v18 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingDescriptor");
          v87 = 0;
          v19 = 0;
          if (v18)
          {
            v88 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingDescriptor");
            v87 = 1;
            v19 = objc_msgSend(v88, "audienceType") == 1;
          }
          if ((v87 & 1) != 0)

          if (v19)
          {
            objc_msgSend(*(id *)(a1 + 32), "showAlsoAvailaibleSUPane");
            v119 = 1;
          }
          else
          {
LABEL_61:
            v16 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingDescriptor");
            v85 = 0;
            v17 = 0;
            if (v16)
            {
              v86 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingDescriptor");
              v85 = 1;
              v17 = objc_msgSend(v86, "audienceType") == 1;
            }
            if ((v85 & 1) != 0)

            if (v17)
            {
              v84 = (os_log_t)_SUSUILoggingFacility();
              v83 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                v15 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingDescriptor");
                __os_log_helper_16_2_2_8_32_8_66((uint64_t)v133, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v15);
                _os_log_impl(&dword_21BF33000, v84, v83, "%s: DefaultAudience descriptor: %{public}@\nattached to primary pane. Nothing to do.", v133, 0x16u);

              }
              objc_storeStrong((id *)&v84, 0);
              v119 = 1;
            }
            else
            {
              v13 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateDescriptor");
              v81 = 0;
              v14 = 0;
              if (v13)
              {
                v82 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateDescriptor");
                v81 = 1;
                v14 = objc_msgSend(v82, "audienceType") == 1;
              }
              if ((v81 & 1) != 0)

              if (v14)
              {
                v80 = (os_log_t)_SUSUILoggingFacility();
                v79 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "presentingAlternateDescriptor");
                  __os_log_helper_16_2_2_8_32_8_66((uint64_t)v132, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v12);
                  _os_log_impl(&dword_21BF33000, v80, v79, "%s: DefaultAudience descriptor: %{public}@\nattached to 'Also Availaible' pane.", v132, 0x16u);

                }
                objc_storeStrong((id *)&v80, 0);
                objc_msgSend(*(id *)(a1 + 32), "showAlsoAvailaibleSUPane");
                v119 = 1;
              }
              else
              {
                v78 = (os_log_t)_SUSUILoggingFacility();
                v77 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_2_1_8_32((uint64_t)v131, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
                  _os_log_impl(&dword_21BF33000, v78, v77, "%s: No DefaultAudience updates found. Nothing to do.", v131, 0xCu);
                }
                objc_storeStrong((id *)&v78, 0);
                v119 = 1;
              }
            }
          }
        }
        else
        {
          v76 = (os_log_t)_SUSUILoggingFacility();
          v75 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v9 = v76;
            v10 = v75;
            v11 = SUSettingsUIStateToString(v98);
            v74 = v11;
            __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v130, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", v98, (uint64_t)v74);
            _os_log_impl(&dword_21BF33000, v9, v10, "%s: The state %ld (%@) isn't associated with any special handler. Nothing more to do.", v130, 0x20u);

            objc_storeStrong((id *)&v74, 0);
          }
          objc_storeStrong((id *)&v76, 0);
          v119 = 0;
        }
      }
      else
      {
        v92 = (os_log_t)_SUSUILoggingFacility();
        v91 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v135, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_21BF33000, v92, v91, "%s: The manager update state is past the \"ready to download\" phase (update already downloading/preparing/ready to install/installing). Nothing more to do.", v135, 0xCu);
        }
        objc_storeStrong((id *)&v92, 0);
        v119 = 1;
      }
    }
    else
    {
      v23 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PerformAction"));
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v105 = (os_log_t)_SUSUILoggingFacility();
        v104 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v140, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_21BF33000, v105, v104, "%s: Can't resolve \"PerformAction\" because it's not an NSString.", v140, 0xCu);
        }
        objc_storeStrong((id *)&v105, 0);
      }
      v103 = 0;
      v21 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PerformAction"));
      v22 = +[SUSUISoftwareUpdateController updateActionForString:](SUSUISoftwareUpdateController, "updateActionForString:");

      v103 = v22;
      v102 = (os_log_t)_SUSUILoggingFacility();
      v101 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PerformAction"));
        __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v139, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v20, v103);
        _os_log_impl(&dword_21BF33000, v102, v101, "%s: Resolving the \"PerformAction\" string '%{public}@' - %ld", v139, 0x20u);

      }
      objc_storeStrong((id *)&v102, 0);
      objc_msgSend(*(id *)(a1 + 32), "performDeepLinkAction:", v103);
      v119 = 1;
    }
  }
  else
  {
    v107 = (os_log_t)_SUSUILoggingFacility();
    v106 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v141, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke_2", *(_QWORD *)(a1 + 48));
      _os_log_impl(&dword_21BF33000, v107, v106, "%s: Can't resolve URL: %{public}@", v141, 0x16u);
    }
    objc_storeStrong((id *)&v107, 0);
    v119 = 1;
  }
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_260(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_alloc_init(SUSUISoftwareUpdateBetaUpdatesController);
  objc_msgSend(v2[0], "setParentController:", a1[4]);
  objc_msgSend(a1[4], "showController:animate:", v2[0], 1);
  objc_storeStrong(v2, 0);
}

- (BOOL)isBusy
{
  char v3;
  UIRefreshControl *v4;
  char v5;
  SUSettingsStatefulUIManager *v6;
  char v7;
  SUSSoftwareUpdateUpdateOptionsCell *v8;
  char v9;
  SUSSoftwareUpdateUpdateOptionsCell *v10;
  char v11;
  UIRefreshControl *v12;

  v4 = -[SUSUISoftwareUpdateController refreshControl](self, "refreshControl");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  if (!v4
    || (v12 = -[SUSUISoftwareUpdateController refreshControl](self, "refreshControl"),
        v11 = 1,
        v3 = 1,
        !-[UIRefreshControl isRefreshing](v12, "isRefreshing")))
  {
    v10 = -[SUSUISoftwareUpdateController updateOptionsCell](self, "updateOptionsCell");
    v9 = 1;
    if (!v10
      || (v8 = -[SUSUISoftwareUpdateController updateOptionsCell](self, "updateOptionsCell"),
          v7 = 1,
          v3 = 1,
          !-[SUSSoftwareUpdateUpdateOptionsCell activityIndicatorDisplayStyle](v8, "activityIndicatorDisplayStyle")))
    {
      v6 = -[SUSUISoftwareUpdateController manager](self, "manager");
      v5 = 1;
      v3 = -[SUSettingsStatefulUIManager isPerformingUpdate](v6, "isPerformingUpdate");
    }
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  return v3 & 1;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)_createGroupIndices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t i;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = objc_msgSend(location[0], "count");
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v9);
  for (i = 0; i < v9; ++i)
  {
    v7 = (id)objc_msgSend(location[0], "objectAtIndex:", i);
    if (!*(_QWORD *)((char *)v7 + (int)*MEMORY[0x24BE75738]))
    {
      v5 = v8;
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      objc_msgSend(v5, "addObject:");

    }
    objc_storeStrong(&v7, 0);
  }
  v4 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)specifierForSection:(int64_t)a3
{
  id v4;
  unint64_t v5;
  os_log_t v6;
  unint64_t v7;
  os_log_type_t v8;
  os_log_t v9;
  int v10;
  os_log_type_t type;
  os_log_t oslog;
  id location;
  id v14;
  unint64_t v15;
  SEL v16;
  SUSUISoftwareUpdateController *v17;
  id v18;
  uint8_t v19[64];
  uint8_t v20[64];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = (id)-[SUSUISoftwareUpdateController specifiers](self, "specifiers");
  location = -[SUSUISoftwareUpdateController _createGroupIndices:](v17, "_createGroupIndices:", v14);
  if (location)
  {
    if (objc_msgSend(location, "count") > v15)
    {
      v4 = (id)objc_msgSend(location, "objectAtIndex:", v15);
      v5 = objc_msgSend(v4, "integerValue");

      v7 = v5;
      if (v5 < objc_msgSend(*(id *)((char *)&v17->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"))
      {
        v18 = (id)objc_msgSend(v14, "objectAtIndex:", v7);
        v10 = 1;
      }
      else
      {
        v6 = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66((uint64_t)v19, v15, v7, objc_msgSend(v14, "count"), (uint64_t)location, (uint64_t)v14);
          _os_log_error_impl(&dword_21BF33000, v6, OS_LOG_TYPE_ERROR, "Failed to resolve the specifier for section %ld. The resolved index (%ld) >= the number of total specifiers (%ld) and will cause an overflow. Groups: %{public}@; Specifiers: %{public}@",
            v19,
            0x34u);
        }
        objc_storeStrong((id *)&v6, 0);
        v18 = 0;
        v10 = 1;
      }
    }
    else
    {
      v9 = (os_log_t)_SUSUILoggingFacility();
      v8 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66((uint64_t)v20, v15, objc_msgSend(location, "count"), v15, (uint64_t)location, (uint64_t)v14);
        _os_log_error_impl(&dword_21BF33000, v9, v8, "Failed to resolve the specifier for section %ld. The number of groups (%ld) <= the requested section (%ld) and will cause an overflow. Groups: %{public}@; Specifiers: %{public}@",
          v20,
          0x34u);
      }
      objc_storeStrong((id *)&v9, 0);
      v18 = 0;
      v10 = 1;
    }
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_0_8_66((uint64_t)v21, v15, (uint64_t)v14);
      _os_log_error_impl(&dword_21BF33000, oslog, type, "Failed to resolve the specifier for section %ld. The returned groups array is nil. Specifiers: %{public}@", v21, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v18 = 0;
    v10 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v18;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4;
  double v5;
  id v7;
  BOOL v8;
  BOOL v9;
  id v11;
  char v12;
  objc_super v13;
  int v14;
  char v15;
  id v16;
  id v17;
  int64_t v18;
  id location[2];
  SUSUISoftwareUpdateController *v20;
  double v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = -[SUSUISoftwareUpdateController specifierForSection:](v20, "specifierForSection:", a4);
  v11 = (id)objc_msgSend(v17, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v15 = 0;
  v12 = 0;
  if (v11)
  {
    v16 = (id)objc_msgSend(v17, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v15 = 1;
    v12 = objc_msgSend(v16, "isEqualToString:", CFSTR("SUScanStatusCell"));
  }
  if ((v15 & 1) != 0)

  if ((v12 & 1) != 0)
  {
    v21 = 2.22507386e-308;
    v14 = 1;
  }
  else
  {
    v4 = (id)objc_msgSend(v17, "propertyForKey:", CFSTR("SUHeight"));
    v9 = v4 == 0;

    if (v9
      || (v7 = (id)objc_msgSend(v17, "propertyForKey:", CFSTR("SUHeight")),
          v8 = objc_msgSend(v7, "integerValue") != 0,
          v7,
          v8))
    {
      v13.receiver = v20;
      v13.super_class = (Class)SUSUISoftwareUpdateController;
      -[SUSUISoftwareUpdateController tableView:heightForHeaderInSection:](&v13, sel_tableView_heightForHeaderInSection_, location[0], v18);
      v21 = v5;
      v14 = 1;
    }
    else
    {
      v21 = 2.22507386e-308;
      v14 = 1;
    }
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  BOOL v5;
  id v7;
  BOOL v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  id v23[2];
  id location[2];
  SUSUISoftwareUpdateController *v25;
  double v26;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23[1] = (id)a4;
  v23[0] = -[SUSUISoftwareUpdateController specifierForSection:](v25, "specifierForSection:", a4);
  v7 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v21 = 0;
  v19 = 0;
  v17 = 0;
  v15 = 0;
  v13 = 0;
  v11 = 0;
  v9 = 0;
  v8 = 0;
  if (v7)
  {
    v22 = +[SUSUISoftwareUpdateController visibleGroupSpecifiers](SUSUISoftwareUpdateController, "visibleGroupSpecifiers");
    v21 = 1;
    v20 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v19 = 1;
    v8 = 0;
    if ((objc_msgSend(v22, "containsObject:") & 1) != 0)
    {
      v18 = (id)objc_msgSend(v23[0], "name");
      v17 = 1;
      if (!v18
        || (v16 = (id)objc_msgSend(v23[0], "name"),
            v15 = 1,
            v5 = 1,
            (objc_msgSend(v16, "isEqualToString:", &stru_24E0011F0) & 1) != 0))
      {
        v14 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75A68]);
        v13 = 1;
        if (!v14
          || (v12 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75A68]),
              v11 = 1,
              v5 = 1,
              (objc_msgSend(v12, "isEqualToString:", &stru_24E0011F0) & 1) != 0))
        {
          v10 = (id)objc_msgSend(v23[0], "propertyForKey:", *MEMORY[0x24BE75A78]);
          v9 = 1;
          v5 = v10 != 0;
        }
      }
      v8 = v5;
    }
  }
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if ((v21 & 1) != 0)

  if (v8)
    v26 = *MEMORY[0x24BEBE770];
  else
    v26 = 2.22507386e-308;
  objc_storeStrong(v23, 0);
  objc_storeStrong(location, 0);
  return v26;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v6;
  char v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id v12[2];
  id location[2];
  SUSUISoftwareUpdateController *v14;
  double v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12[1] = (id)a4;
  v12[0] = -[SUSUISoftwareUpdateController specifierForSection:](v14, "specifierForSection:", a4);
  v6 = (id)objc_msgSend(v12[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v10 = 0;
  v8 = 0;
  v7 = 0;
  if (v6)
  {
    v11 = +[SUSUISoftwareUpdateController visibleGroupSpecifiers](SUSUISoftwareUpdateController, "visibleGroupSpecifiers");
    v10 = 1;
    v9 = (id)objc_msgSend(v12[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v8 = 1;
    v7 = objc_msgSend(v11, "containsObject:");
  }
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v7 & 1) != 0)
    v15 = *MEMORY[0x24BEBE770];
  else
    v15 = 2.22507386e-308;
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  id v7;
  BOOL v8;
  objc_super v9;
  int v10;
  char v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id location[2];
  SUSUISoftwareUpdateController *v20;
  double v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  -[SUSUISoftwareUpdateController fixCustomCellSpecifiers](v20, "fixCustomCellSpecifiers");
  v17 = -[SUSUISoftwareUpdateController indexForIndexPath:](v20, "indexForIndexPath:", v18);
  v16 = (id)-[SUSUISoftwareUpdateController specifierAtIndex:](v20, "specifierAtIndex:", v17);
  v15 = (id)objc_msgSend(v16, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (id)-[SUSUISoftwareUpdateController specifierForID:](v20, "specifierForID:", CFSTR("SUTitleCell"));
  v13 = 0;
  v11 = 0;
  v8 = 1;
  if (v16 != v7)
  {
    v14 = (id)-[SUSUISoftwareUpdateController specifierForID:](v20, "specifierForID:", CFSTR("SUScanStatusCell"));
    v13 = 1;
    v8 = 1;
    if (v16 != v14)
    {
      v12 = (id)-[SUSUISoftwareUpdateController specifierForID:](v20, "specifierForID:", CFSTR("SUTipKitComingSoonCell"));
      v11 = 1;
      v8 = v16 == v12;
    }
  }
  if ((v11 & 1) != 0)

  if ((v13 & 1) != 0)
  if (v8)
  {
    objc_msgSend(v15, "preferredHeightWithTable:", location[0]);
  }
  else
  {
    v9.receiver = v20;
    v9.super_class = (Class)SUSUISoftwareUpdateController;
    -[SUSUISoftwareUpdateController tableView:heightForRowAtIndexPath:](&v9, sel_tableView_heightForRowAtIndexPath_, location[0], v18);
  }
  v21 = v4;
  v10 = 1;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v18;
  uint64_t v19;
  objc_super v20;
  int v21;
  _QWORD __b[8];
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location[2];
  SUSUISoftwareUpdateController *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  -[SUSUISoftwareUpdateController fixCustomCellSpecifiers](v29, "fixCustomCellSpecifiers");
  v26 = 0;
  v25 = (id)-[SUSUISoftwareUpdateController specifierAtIndex:](v29, "specifierAtIndex:", -[SUSUISoftwareUpdateController indexForIndexPath:](v29, "indexForIndexPath:", v27));
  v24 = -[SUSUISoftwareUpdateController customCellsMapping](v29, "customCellsMapping");
  memset(__b, 0, sizeof(__b));
  v18 = v24;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v19)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v19;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(v18);
      v23 = *(_QWORD *)(__b[1] + 8 * v15);
      v11 = v25;
      v4 = (id)-[SUSUISoftwareUpdateController specifierForID:](v29, "specifierForID:", v23);
      v12 = v11 != v4;

      if (!v12)
        break;
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v16)
          goto LABEL_9;
      }
    }
    v5 = (id)objc_msgSend(v25, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v6 = v26;
    v26 = v5;

    v21 = 2;
  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  if (!v26)
  {
    v20.receiver = v29;
    v20.super_class = (Class)SUSUISoftwareUpdateController;
    v7 = -[SUSUISoftwareUpdateController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, location[0], v27);
    v8 = v26;
    v26 = v7;

  }
  objc_msgSend(v26, "setSeparatorInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v10 = v26;
  v21 = 1;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v6;
  int64_t v7;
  id location[2];
  SUSUISoftwareUpdateController *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  if (*(Class *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0])
    && objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"))
  {
    v6.receiver = v9;
    v6.super_class = (Class)SUSUISoftwareUpdateController;
    v10 = -[SUSUISoftwareUpdateController tableView:titleForFooterInSection:](&v6, sel_tableView_titleForFooterInSection_, location[0], v7);
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (void)titleCell:(id)a3 learnMoreButtonTapped:(id)a4
{
  id v4;
  id v5;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  SUSUISoftwareUpdateController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v7 = v21;
  v8 = -[SUSUISoftwareUpdateController learnMoreTappedString](v21, "learnMoreTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v7, "submitAnalyticsEvent:");

  v18 = objc_alloc_init(MEMORY[0x24BEAEF18]);
  v10 = v18;
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v14 = -[SUSUISoftwareUpdateController presentingDescriptor](v21, "presentingDescriptor");
  v13 = (id)objc_msgSend(v14, "documentation");
  v12 = (id)objc_msgSend(v13, "releaseNotes");
  v11 = (id)objc_msgSend(v9, "initWithData:encoding:");
  objc_msgSend(v10, "setReleaseNotes:");

  v4 = objc_alloc(MEMORY[0x24BEBD7A0]);
  v17 = (id)objc_msgSend(v4, "initWithRootViewController:", v18);
  objc_msgSend(v17, "setModalPresentationStyle:", 2);
  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  v16 = (id)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 0, v21, sel_detailedReleaseNotesDonePressed_);
  v15 = (id)objc_msgSend(v18, "navigationItem");
  objc_msgSend(v15, "setRightBarButtonItem:", v16);

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v21, "presentViewController:animated:completion:", v17, 1, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  *((_BYTE *)&v8->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 0;
  v5.receiver = v8;
  v5.super_class = (Class)SUSUISoftwareUpdateController;
  -[SUSUISoftwareUpdateController tableView:didSelectRowAtIndexPath:](&v5, sel_tableView_didSelectRowAtIndexPath_, location[0], v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)selectSpecifier:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  objc_class *v6;
  BOOL v7;
  const char *v8;
  objc_class *v9;
  BOOL v10;
  const char *v11;
  objc_class *v12;
  SUSettingsStatefulUIManager *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  NSString *v24;
  SUSUISoftwareUpdateController *v25;
  __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSString *v30;
  id v31;
  SUSettingsStatefulUIManager *v32;
  SUDownload *v33;
  SUSettingsStatefulUIManager *v34;
  id v35;
  SUDescriptor *v36;
  SUDownload *v37;
  SUSettingsStatefulUIManager *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __CFString *v43;
  NSString *v44;
  id v45;
  uint64_t v46;
  NSString *v47;
  SUSUISoftwareUpdateController *v48;
  __CFString *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  id v53;
  SUSettingsStatefulUIManager *v54;
  SUDownload *v55;
  SUSettingsStatefulUIManager *v56;
  id v57;
  SUDescriptor *v58;
  SUDownload *v59;
  SUSettingsStatefulUIManager *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  NSString *v66;
  id v67;
  NSString *v68;
  SUSUISoftwareUpdateController *v69;
  __CFString *v70;
  uint64_t v71;
  NSObject *log;
  os_log_type_t v73;
  SUSettingsStatefulUIManager *v74;
  SUDownload *v75;
  SUSettingsStatefulUIManager *v76;
  id v77;
  SUDescriptor *v78;
  SUDownload *v79;
  SUSettingsStatefulUIManager *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  __CFString *v85;
  NSString *v86;
  id v87;
  char v88;
  id v89;
  NSString *v90;
  id v91;
  id v92;
  __CFString *v93;
  NSString *v94;
  os_log_type_t v95;
  os_log_t v96;
  id v97;
  id v98;
  __CFString *v99;
  NSString *v100;
  os_log_type_t v101;
  os_log_t v102;
  objc_super v103;
  id v104;
  int v105;
  id v106;
  __CFString *v107;
  NSString *v108;
  os_log_type_t type;
  os_log_t oslog;
  id location[2];
  SUSUISoftwareUpdateController *v112;
  id v113;
  uint8_t v114[144];
  uint8_t v115[144];
  uint8_t v116[136];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v103.receiver = v112;
    v103.super_class = (Class)SUSUISoftwareUpdateController;
    v104 = -[SUSUISoftwareUpdateController selectSpecifier:](&v103, sel_selectSpecifier_, location[0]);
    if (v104)
    {
      v96 = (os_log_t)_SUSUILoggingFacility();
      v95 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v96;
        v29 = v95;
        v9 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v9);
        v24 = v44;
        v94 = v24;
        v25 = v112;
        v43 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState"));
        v26 = v43;
        v93 = v26;
        v27 = -[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState");
        v42 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
        v41 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
        v40 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
        v39 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
        v38 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v37 = -[SUSettingsStatefulUIManager currentDownload](v38, "currentDownload");
        v36 = -[SUDownload descriptor](v37, "descriptor");
        v35 = (id)-[SUDescriptor humanReadableUpdateName](v36, "humanReadableUpdateName");
        v21 = v35;
        v92 = v21;
        v34 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v33 = -[SUSettingsStatefulUIManager currentDownload](v34, "currentDownload");
        v32 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v10 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v32, "isTargetedUpdateScheduledForAutoInstall");
        v11 = "YES";
        if (!v10)
          v11 = "NO";
        v22 = (uint64_t)v11;
        v31 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
        v23 = v31;
        v91 = v23;
        v12 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v12);
        v90 = v30;
        __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66((uint64_t)v114, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27, (uint64_t)v42, (uint64_t)v41, (uint64_t)v40, (uint64_t)v39, (uint64_t)v21, (uint64_t)v33, v22, (uint64_t)v23, (uint64_t)v90);
        _os_log_impl(&dword_21BF33000, v28, v29, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier ID: %{public}@ -> %{public}@", v114, 0x8Eu);

        objc_storeStrong((id *)&v90, 0);
        objc_storeStrong(&v91, 0);
        objc_storeStrong(&v92, 0);
        objc_storeStrong((id *)&v93, 0);
        objc_storeStrong((id *)&v94, 0);
      }
      objc_storeStrong((id *)&v96, 0);
      v19 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v88 = 0;
      v20 = 1;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SUAlternateUpdateButton")) & 1) == 0)
      {
        v89 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
        v88 = 1;
        v20 = objc_msgSend(v89, "isEqualToString:", CFSTR("SUNonPromotedUpdateButton"));
      }
      if ((v88 & 1) != 0)

      if ((v20 & 1) != 0)
      {
        v87 = v104;
        v14 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        objc_msgSend(v87, "setManager:");

        v15 = v87;
        v16 = (id)objc_msgSend(v87, "manager");
        objc_msgSend(v16, "setDelegate:", v15);

        v17 = v87;
        v18 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
        objc_msgSend(v17, "setSlowRollUpdateType:", (objc_msgSend(v18, "isEqualToString:", CFSTR("SUAlternateUpdateButton")) & 1) == 0);

        objc_msgSend(v87, "setParentController:", v112);
        objc_msgSend(v87, "setDelegate:", v112);
        objc_storeStrong(&v87, 0);
      }
      -[SUSUISoftwareUpdateController showController:animate:](v112, "showController:animate:", v104, 1);
      v113 = 0;
      v105 = 1;
    }
    else
    {
      v102 = (os_log_t)_SUSUILoggingFacility();
      v101 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v102;
        v52 = v101;
        v6 = (objc_class *)objc_opt_class();
        v66 = NSStringFromClass(v6);
        v47 = v66;
        v100 = v47;
        v48 = v112;
        v65 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState"));
        v49 = v65;
        v99 = v49;
        v50 = -[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState");
        v64 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
        v63 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
        v62 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
        v61 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
        v60 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v59 = -[SUSettingsStatefulUIManager currentDownload](v60, "currentDownload");
        v58 = -[SUDownload descriptor](v59, "descriptor");
        v57 = (id)-[SUDescriptor humanReadableUpdateName](v58, "humanReadableUpdateName");
        v45 = v57;
        v98 = v45;
        v56 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v55 = -[SUSettingsStatefulUIManager currentDownload](v56, "currentDownload");
        v54 = -[SUSUISoftwareUpdateController manager](v112, "manager");
        v7 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v54, "isTargetedUpdateScheduledForAutoInstall");
        v8 = "YES";
        if (!v7)
          v8 = "NO";
        v46 = (uint64_t)v8;
        v53 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75AC0]);
        v97 = v53;
        __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v115, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, v50, (uint64_t)v64, (uint64_t)v63, (uint64_t)v62, (uint64_t)v61, (uint64_t)v45, (uint64_t)v55, v46, (uint64_t)v97);
        _os_log_impl(&dword_21BF33000, v51, v52, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier ID: %{public}@ -> No controller found. Skipping on pushing.", v115, 0x84u);

        objc_storeStrong(&v97, 0);
        objc_storeStrong(&v98, 0);
        objc_storeStrong((id *)&v99, 0);
        objc_storeStrong((id *)&v100, 0);
      }
      objc_storeStrong((id *)&v102, 0);
      v113 = 0;
      v105 = 1;
    }
    objc_storeStrong(&v104, 0);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v73 = type;
      v3 = (objc_class *)objc_opt_class();
      v86 = NSStringFromClass(v3);
      v68 = v86;
      v108 = v68;
      v69 = v112;
      v85 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState"));
      v70 = v85;
      v107 = v70;
      v71 = -[SUSUISoftwareUpdateController currentUIState](v112, "currentUIState");
      v84 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
      v83 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v112, "presentingStatefulDescriptor");
      v82 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
      v81 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v112, "presentingAlternateStatefulDescriptor");
      v80 = -[SUSUISoftwareUpdateController manager](v112, "manager");
      v79 = -[SUSettingsStatefulUIManager currentDownload](v80, "currentDownload");
      v78 = -[SUDownload descriptor](v79, "descriptor");
      v77 = (id)-[SUDescriptor humanReadableUpdateName](v78, "humanReadableUpdateName");
      v67 = v77;
      v106 = v67;
      v76 = -[SUSUISoftwareUpdateController manager](v112, "manager");
      v75 = -[SUSettingsStatefulUIManager currentDownload](v76, "currentDownload");
      v74 = -[SUSUISoftwareUpdateController manager](v112, "manager");
      v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v74, "isTargetedUpdateScheduledForAutoInstall");
      v5 = "YES";
      if (!v4)
        v5 = "NO";
      __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v116, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, v71, (uint64_t)v84, (uint64_t)v83, (uint64_t)v82, (uint64_t)v81, (uint64_t)v67, (uint64_t)v75, (uint64_t)v5);
      _os_log_impl(&dword_21BF33000, log, v73, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier is nil, return", v116, 0x7Au);

      objc_storeStrong(&v106, 0);
      objc_storeStrong((id *)&v107, 0);
      objc_storeStrong((id *)&v108, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v113 = 0;
    v105 = 1;
  }
  objc_storeStrong(location, 0);
  return v113;
}

- (void)openStorage
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  id v7;
  id v8;
  NSString *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v14;
  SUDownload *v15;
  SUSettingsStatefulUIManager *v16;
  id v17;
  SUDescriptor *v18;
  SUDownload *v19;
  SUSettingsStatefulUIManager *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v27;
  id v28;
  __CFString *v29;
  NSString *v30;
  os_log_type_t v31;
  id v32[2];
  SUSUISoftwareUpdateController *v33;
  uint8_t v34[136];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  v32[0] = _SUSUILoggingFacility();
  v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v32[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v32[0];
    type = v31;
    v2 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v2);
    v9 = v26;
    v30 = v9;
    v25 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v33, "currentUIState"));
    v10 = v25;
    v29 = v10;
    v11 = -[SUSUISoftwareUpdateController currentUIState](v33, "currentUIState");
    v24 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v33, "presentingStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v33, "presentingStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v33, "presentingAlternateStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v33, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController manager](v33, "manager");
    v19 = -[SUSettingsStatefulUIManager currentDownload](v20, "currentDownload");
    v18 = -[SUDownload descriptor](v19, "descriptor");
    v17 = (id)-[SUDescriptor humanReadableUpdateName](v18, "humanReadableUpdateName");
    v8 = v17;
    v28 = v8;
    v16 = -[SUSUISoftwareUpdateController manager](v33, "manager");
    v15 = -[SUSettingsStatefulUIManager currentDownload](v16, "currentDownload");
    v14 = -[SUSUISoftwareUpdateController manager](v33, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v14, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v34, (uint64_t)"-[SUSUISoftwareUpdateController(UI) openStorage]", (uint64_t)v9, (uint64_t)v33, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v34, 0x7Au);

    objc_storeStrong(&v28, 0);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v30, 0);
  }
  objc_storeStrong(v32, 0);
  v5 = v33;
  v6 = -[SUSUISoftwareUpdateController analyticsOpenStorageTappedString](v33, "analyticsOpenStorageTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  v27 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/STORAGE_MGMT"));
  v7 = (id)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v27, 0);

  objc_storeStrong(&v27, 0);
}

- (void)downloadOnly:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController beginUpdateDownloadOnlyOperation](v4, "beginUpdateDownloadOnlyOperation");
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstall:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController beginUpdateNowOperation](v4, "beginUpdateNowOperation");
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstallTonight:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController beginUpdateTonightOperation](v4, "beginUpdateTonightOperation");
  objc_storeStrong(location, 0);
}

- (void)installTonight:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController beginInstallTonightOperation](v4, "beginInstallTonightOperation");
  objc_storeStrong(location, 0);
}

- (void)install:(id)a3
{
  SUSUISoftwareUpdateController *v3;
  id v4;
  id location[2];
  SUSUISoftwareUpdateController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = -[SUSUISoftwareUpdateController installNowTappedString](v6, "installNowTappedString");
  -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v3, "recordAnalyticsEvent:");

  -[SUSUISoftwareUpdateController beginInstallOperation](v6, "beginInstallOperation");
  objc_storeStrong(location, 0);
}

- (void)requestToPromoteTargetedUpdateToUserInitiatedStatus:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController promoteTargetedUpdateToUserInitiatedStatus](v4, "promoteTargetedUpdateToUserInitiatedStatus");
  objc_storeStrong(location, 0);
}

- (void)autoInstallCancel:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController unscheduleTargetedUpdateAutomaticInstallation](v4, "unscheduleTargetedUpdateAutomaticInstallation");
  objc_storeStrong(location, 0);
}

- (void)detailedReleaseNotesDonePressed:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  id v6;
  NSString *v7;
  SUSUISoftwareUpdateController *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v13;
  SUDownload *v14;
  SUSettingsStatefulUIManager *v15;
  id v16;
  SUDescriptor *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  NSString *v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  os_log_type_t v29;
  id v30;
  id location[2];
  SUSUISoftwareUpdateController *v32;
  uint8_t v33[136];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = _SUSUILoggingFacility();
  v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    log = v30;
    type = v29;
    v3 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v3);
    v7 = v25;
    v28 = v7;
    v8 = v32;
    v24 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState"));
    v9 = v24;
    v27 = v9;
    v10 = -[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState");
    v23 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUDownload descriptor](v18, "descriptor");
    v16 = (id)-[SUDescriptor humanReadableUpdateName](v17, "humanReadableUpdateName");
    v6 = v16;
    v26 = v6;
    v15 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v14 = -[SUSettingsStatefulUIManager currentDownload](v15, "currentDownload");
    v13 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v13, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(UI) detailedReleaseNotesDonePressed:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  -[SUSUISoftwareUpdateController dismissViewControllerAnimated:completion:](v32, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_storeStrong(location, 0);
}

- (void)performUpdateRescan:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SUSettingsStatefulUIManager *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  NSString *v15;
  SUSUISoftwareUpdateController *v16;
  __CFString *v17;
  uint64_t v18;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  SUDescriptor *v25;
  SUDownload *v26;
  SUSettingsStatefulUIManager *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __CFString *v32;
  NSString *v33;
  uint8_t v34[7];
  char v35;
  id v36;
  id v37;
  __CFString *v38;
  NSString *v39;
  os_log_type_t v40;
  id v41;
  id location[2];
  SUSUISoftwareUpdateController *v43;
  uint8_t v44[136];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = _SUSUILoggingFacility();
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
  {
    log = v41;
    type = v40;
    v3 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v3);
    v15 = v33;
    v39 = v15;
    v16 = v43;
    v32 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v43, "currentUIState"));
    v17 = v32;
    v38 = v17;
    v18 = -[SUSUISoftwareUpdateController currentUIState](v43, "currentUIState");
    v31 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v43, "presentingStatefulDescriptor");
    v30 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v43, "presentingStatefulDescriptor");
    v29 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v43, "presentingAlternateStatefulDescriptor");
    v28 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v43, "presentingAlternateStatefulDescriptor");
    v27 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    v26 = -[SUSettingsStatefulUIManager currentDownload](v27, "currentDownload");
    v25 = -[SUDownload descriptor](v26, "descriptor");
    v24 = (id)-[SUDescriptor humanReadableUpdateName](v25, "humanReadableUpdateName");
    v14 = v24;
    v37 = v14;
    v23 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v21, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v44, (uint64_t)"-[SUSUISoftwareUpdateController(UI) performUpdateRescan:]", (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, v18, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, (uint64_t)v14, (uint64_t)v22, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v44, 0x7Au);

    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v38, 0);
    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(&v41, 0);
  if (-[SUSUISoftwareUpdateController supportsPullToRefresh](v43, "supportsPullToRefresh"))
  {
    objc_msgSend(location[0], "beginRefreshing");
    v7 = location[0];
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHECKING_FOR_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
    v8 = (id)objc_msgSend(v6, "initWithString:");
    objc_msgSend(v7, "setAttributedTitle:");

    -[SUSUISoftwareUpdateController refreshPane](v43, "refreshPane");
    v11 = -[SUSUISoftwareUpdateController manager](v43, "manager");
    -[SUSettingsStatefulUIManager checkForUpdatesInBackground](v11, "checkForUpdatesInBackground");

  }
  else
  {
    v36 = _SUSUILoggingFacility();
    v35 = 16;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      v12 = v36;
      v13 = v35;
      __os_log_helper_16_0_0(v34);
      _os_log_error_impl(&dword_21BF33000, v12, v13, "Could not perform a pull to refresh as it was disabled by the class instance.", v34, 2u);
    }
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)autoInstallCancelPrompt:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSString *v19;
  SUSUISoftwareUpdateController *v20;
  __CFString *v21;
  uint64_t v22;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v25;
  SUDownload *v26;
  SUSettingsStatefulUIManager *v27;
  id v28;
  SUDescriptor *v29;
  SUDownload *v30;
  SUSettingsStatefulUIManager *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __CFString *v36;
  NSString *v37;
  id v38;
  id v39;
  id v40;
  __CFString *v41;
  NSString *v42;
  os_log_type_t v43;
  id v44;
  id location[2];
  SUSUISoftwareUpdateController *v46;
  uint8_t v47[136];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = _SUSUILoggingFacility();
  v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    log = v44;
    type = v43;
    v3 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v3);
    v19 = v37;
    v42 = v19;
    v20 = v46;
    v36 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v46, "currentUIState"));
    v21 = v36;
    v41 = v21;
    v22 = -[SUSUISoftwareUpdateController currentUIState](v46, "currentUIState");
    v35 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v46, "presentingStatefulDescriptor");
    v34 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v46, "presentingStatefulDescriptor");
    v33 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v46, "presentingAlternateStatefulDescriptor");
    v32 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v46, "presentingAlternateStatefulDescriptor");
    v31 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v30 = -[SUSettingsStatefulUIManager currentDownload](v31, "currentDownload");
    v29 = -[SUDownload descriptor](v30, "descriptor");
    v28 = (id)-[SUDescriptor humanReadableUpdateName](v29, "humanReadableUpdateName");
    v18 = v28;
    v40 = v18;
    v27 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v26 = -[SUSettingsStatefulUIManager currentDownload](v27, "currentDownload");
    v25 = -[SUSUISoftwareUpdateController manager](v46, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v25, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v47, (uint64_t)"-[SUSUISoftwareUpdateController(UI) autoInstallCancelPrompt:]", (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, v22, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v18, (uint64_t)v26, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v47, 0x7Au);

    objc_storeStrong(&v40, 0);
    objc_storeStrong((id *)&v41, 0);
    objc_storeStrong((id *)&v42, 0);
  }
  objc_storeStrong(&v44, 0);
  v39 = (id)objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  v38 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = v38;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTO_INSTALL_CONFIRM_CANCEL"), &stru_24E0011F0);
  objc_msgSend(v6, "setObject:forKey:");

  v9 = v38;
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTO_INSTALL_CONFIRM_OK"), &stru_24E0011F0, CFSTR("Software Update"));
  objc_msgSend(v9, "setObject:forKey:");

  v12 = v38;
  v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTO_INSTALL_CONFIRM_PROMPT"), &stru_24E0011F0, CFSTR("Software Update"));
  objc_msgSend(v12, "setObject:forKey:");

  v15 = v38;
  v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AUTO_INSTALL_CONFIRM_TITLE"), &stru_24E0011F0, CFSTR("Software Update"));
  objc_msgSend(v15, "setObject:forKey:");

  objc_msgSend(v39, "setupWithDictionary:", v38);
  objc_msgSend(v39, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v39, "setConfirmationAction:", sel_autoInstallCancel_);
  objc_msgSend(v39, "setTarget:", v46);
  -[SUSUISoftwareUpdateController presentConfimationSpecifier:](v46, "presentConfimationSpecifier:", v39);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

- (void)presentConfimationSpecifier:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateController showConfirmationViewForSpecifier:](v4, "showConfirmationViewForSpecifier:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)preferredContentSizeChanged:(id)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  SUSUISoftwareUpdateController *v6;
  id v7;
  id v8;
  NSString *v9;
  SUSUISoftwareUpdateController *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v15;
  SUDownload *v16;
  SUSettingsStatefulUIManager *v17;
  id v18;
  SUDescriptor *v19;
  SUDownload *v20;
  SUSettingsStatefulUIManager *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __CFString *v26;
  NSString *v27;
  id v28;
  __CFString *v29;
  NSString *v30;
  os_log_type_t v31;
  id v32;
  id location[2];
  SUSUISoftwareUpdateController *v34;
  uint8_t v35[136];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = _SUSUILoggingFacility();
  v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
  {
    log = v32;
    type = v31;
    v3 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v3);
    v9 = v27;
    v30 = v9;
    v10 = v34;
    v26 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v34, "currentUIState"));
    v11 = v26;
    v29 = v11;
    v12 = -[SUSUISoftwareUpdateController currentUIState](v34, "currentUIState");
    v25 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v34, "presentingStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v34, "presentingStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v34, "presentingAlternateStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v34, "presentingAlternateStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController manager](v34, "manager");
    v20 = -[SUSettingsStatefulUIManager currentDownload](v21, "currentDownload");
    v19 = -[SUDownload descriptor](v20, "descriptor");
    v18 = (id)-[SUDescriptor humanReadableUpdateName](v19, "humanReadableUpdateName");
    v8 = v18;
    v28 = v8;
    v17 = -[SUSUISoftwareUpdateController manager](v34, "manager");
    v16 = -[SUSettingsStatefulUIManager currentDownload](v17, "currentDownload");
    v15 = -[SUSUISoftwareUpdateController manager](v34, "manager");
    v4 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v15, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if (!v4)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(UI) preferredContentSizeChanged:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, v12, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v8, (uint64_t)v16, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v28, 0);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v30, 0);
  }
  objc_storeStrong(&v32, 0);
  -[SUSUISoftwareUpdateController setTitleCell:](v34, "setTitleCell:", 0);
  -[SUSUISoftwareUpdateController setUpdateOptionsCell:](v34, "setUpdateOptionsCell:", 0);
  -[SUSUISoftwareUpdateController setProactiveSuggestionCell:](v34, "setProactiveSuggestionCell:", 0);
  -[SUSUISoftwareUpdateController reloadSpecifiers](v34, "reloadSpecifiers");
  v6 = v34;
  v7 = -[SUSUISoftwareUpdateController paneTitle](v34, "paneTitle");
  -[SUSUISoftwareUpdateController setTitle:](v6, "setTitle:");

  -[SUSUISoftwareUpdateController refreshPane](v34, "refreshPane");
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_class *v4;
  BOOL v5;
  const char *v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  NSString *v10;
  SUSUISoftwareUpdateController *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v16;
  SUDownload *v17;
  SUSettingsStatefulUIManager *v18;
  id v19;
  SUDescriptor *v20;
  SUDownload *v21;
  SUSettingsStatefulUIManager *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  id v29;
  __CFString *v30;
  NSString *v31;
  os_log_type_t v32;
  id v33;
  id location[2];
  SUSUISoftwareUpdateController *v35;
  CGSize v36;
  uint8_t v37[152];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v33 = _SUSUILoggingFacility();
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    log = v33;
    type = v32;
    v4 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v4);
    v10 = v28;
    v31 = v10;
    v11 = v35;
    v27 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v35, "currentUIState"));
    v12 = v27;
    v30 = v12;
    v13 = -[SUSUISoftwareUpdateController currentUIState](v35, "currentUIState");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v35, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v35, "presentingStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v35, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v35, "presentingAlternateStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController manager](v35, "manager");
    v21 = -[SUSettingsStatefulUIManager currentDownload](v22, "currentDownload");
    v20 = -[SUDownload descriptor](v21, "descriptor");
    v19 = (id)-[SUDescriptor humanReadableUpdateName](v20, "humanReadableUpdateName");
    v9 = v19;
    v29 = v9;
    v18 = -[SUSUISoftwareUpdateController manager](v35, "manager");
    v17 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v16 = -[SUSUISoftwareUpdateController manager](v35, "manager");
    v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v16, "isTargetedUpdateScheduledForAutoInstall");
    v6 = "NO";
    if (v5)
      v6 = "YES";
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0_8_0((uint64_t)v37, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillTransitionToSize:withTransitionCoordinator:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v6, *(uint64_t *)&v36.width, *(uint64_t *)&v36.height);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nNew size: [%f, %f]", v37, 0x8Eu);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(&v33, 0);
  -[SUSUISoftwareUpdateController reloadSpecifiers](v35, "reloadSpecifiers");
  v7 = v35;
  v8 = -[SUSUISoftwareUpdateController paneTitle](v35, "paneTitle");
  -[SUSUISoftwareUpdateController setTitle:](v7, "setTitle:");

  -[SUSUISoftwareUpdateController refreshPane](v35, "refreshPane");
  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  id v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  -[SUSUISoftwareUpdateController refreshPane](v10, "refreshPane");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)showAlsoAvailaibleSUPane
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  NSObject *queue;
  id v6;
  NSString *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v12;
  SUDownload *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  SUDescriptor *v16;
  SUDownload *v17;
  SUSettingsStatefulUIManager *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  NSString *v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(id *);
  void *v29;
  SUSUISoftwareUpdateController *v30;
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  NSString *v35;
  os_log_type_t v36;
  id v37[2];
  SUSUISoftwareUpdateController *v38;
  uint8_t v39[136];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v38 = self;
  v37[1] = (id)a2;
  v37[0] = _SUSUILoggingFacility();
  v36 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v37[0];
    type = v36;
    v2 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v2);
    v7 = v24;
    v35 = v7;
    v23 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v38, "currentUIState"));
    v8 = v23;
    v34 = v8;
    v9 = -[SUSUISoftwareUpdateController currentUIState](v38, "currentUIState");
    v22 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v38, "presentingStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v38, "presentingStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v38, "presentingAlternateStatefulDescriptor");
    v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v38, "presentingAlternateStatefulDescriptor");
    v18 = -[SUSUISoftwareUpdateController manager](v38, "manager");
    v17 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v16 = -[SUDownload descriptor](v17, "descriptor");
    v15 = (id)-[SUDescriptor humanReadableUpdateName](v16, "humanReadableUpdateName");
    v6 = v15;
    v33 = v6;
    v14 = -[SUSUISoftwareUpdateController manager](v38, "manager");
    v13 = -[SUSettingsStatefulUIManager currentDownload](v14, "currentDownload");
    v12 = -[SUSUISoftwareUpdateController manager](v38, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v12, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v39, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]", (uint64_t)v7, (uint64_t)v38, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v6, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v39, 0x7Au);

    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  objc_storeStrong(v37, 0);
  objc_initWeak(&v32, v38);
  queue = MEMORY[0x24BDAC9B8];
  v25 = MEMORY[0x24BDAC760];
  v26 = -1073741824;
  v27 = 0;
  v28 = __61__SUSUISoftwareUpdateController_UI__showAlsoAvailaibleSUPane__block_invoke;
  v29 = &unk_24DFFBD40;
  objc_copyWeak(&v31, &v32);
  v30 = v38;
  dispatch_async(queue, &v25);

  objc_storeStrong((id *)&v30, 0);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v32);
}

void __61__SUSUISoftwareUpdateController_UI__showAlsoAvailaibleSUPane__block_invoke(id *a1)
{
  NSObject *log;
  os_log_type_t v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  os_log_t v13;
  int v14;
  id v15;
  id v16;
  os_log_type_t type;
  os_log_t oslog;
  char v19;
  id v20;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24[3];
  uint8_t v25[16];
  uint8_t v26[24];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v24[2] = a1;
  v24[1] = a1;
  v24[0] = objc_loadWeakRetained(a1 + 5);
  if (!v24[0])
    goto LABEL_24;
  v23 = (id)objc_msgSend(v24[0], "specifiers");
  memset(__b, 0, sizeof(__b));
  obj = v23;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v22 = *(id *)(__b[1] + 8 * v8);
      v4 = (id)objc_msgSend(v22, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v19 = 0;
      v5 = 1;
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SUNonPromotedUpdateButton")) & 1) == 0)
      {
        v20 = (id)objc_msgSend(v22, "propertyForKey:", *MEMORY[0x24BE75AC0]);
        v19 = 1;
        v5 = objc_msgSend(v20, "isEqualToString:", CFSTR("SUAlternateUpdateButton"));
      }
      if ((v19 & 1) != 0)

      if ((v5 & 1) != 0)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v9)
          goto LABEL_18;
      }
    }
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v2 = type;
      v3 = (id)objc_msgSend(v22, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v16 = v3;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v26, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]_block_invoke", (uint64_t)v16);
      _os_log_impl(&dword_21BF33000, log, v2, "%s: Located specifier %@ for alternate update button", v26, 0x16u);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v15 = (id)objc_msgSend(v24[0], "selectSpecifier:", v22);
    if (v15)
      objc_msgSend(a1[4], "showController:animate:", v15, 1);
    v14 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
LABEL_18:
    v14 = 0;
  }

  if (!v14)
  {
    v13 = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v25, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]_block_invoke");
      _os_log_impl(&dword_21BF33000, v13, OS_LOG_TYPE_DEFAULT, "%s: Unable to locate 'Also Availaible' button specifier", v25, 0xCu);
    }
    objc_storeStrong((id *)&v13, 0);
    v14 = 0;
  }
  objc_storeStrong(&v23, 0);
  if (!v14)
LABEL_24:
    v14 = 0;
  objc_storeStrong(v24, 0);
}

- (void)registerForFontChanges
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "addObserver:selector:name:object:", self, sel_preferredContentSizeChanged_, *MEMORY[0x24BEBE088], 0);

}

- (void)registerForPreferencesChanges
{
  SUSettingsSUPreferencesManager *v2;
  SUSettingsStatefulUIManager *v3;

  v3 = -[SUSUISoftwareUpdateController manager](self, "manager");
  v2 = -[SUSettingsStatefulUIManager preferences](v3, "preferences");
  -[SUSettingsSUPreferencesManager addObserver:](v2, "addObserver:", self);

}

- (void)performDeepLinkAction:(unint64_t)a3
{
  objc_class *v3;
  const char *v4;
  id v5;
  NSString *v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v11;
  SUDownload *v12;
  SUSettingsStatefulUIManager *v13;
  id v14;
  SUDescriptor *v15;
  SUDownload *v16;
  SUSettingsStatefulUIManager *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  NSString *v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  os_log_type_t v27;
  id v28;
  unint64_t v29;
  SEL v30;
  SUSUISoftwareUpdateController *v31;
  uint8_t v32[136];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  v30 = a2;
  v29 = a3;
  if (a3 == 1)
  {
    -[SUSUISoftwareUpdateController beginUpdateNowOperation](v31, "beginUpdateNowOperation");
  }
  else if (a3 == 2)
  {
    -[SUSUISoftwareUpdateController beginUpdateTonightOperation](v31, "beginUpdateTonightOperation");
  }
  else
  {
    v28 = _SUSUILoggingFacility();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      log = v28;
      type = v27;
      v3 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v3);
      v6 = v23;
      v26 = v6;
      v22 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v31, "currentUIState"));
      v7 = v22;
      v25 = v7;
      v8 = -[SUSUISoftwareUpdateController currentUIState](v31, "currentUIState");
      v21 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v31, "presentingStatefulDescriptor");
      v20 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v31, "presentingStatefulDescriptor");
      v19 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v31, "presentingAlternateStatefulDescriptor");
      v18 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v31, "presentingAlternateStatefulDescriptor");
      v17 = -[SUSUISoftwareUpdateController manager](v31, "manager");
      v16 = -[SUSettingsStatefulUIManager currentDownload](v17, "currentDownload");
      v15 = -[SUDownload descriptor](v16, "descriptor");
      v14 = (id)-[SUDescriptor humanReadableUpdateName](v15, "humanReadableUpdateName");
      v5 = v14;
      v24 = v5;
      v13 = -[SUSUISoftwareUpdateController manager](v31, "manager");
      v12 = -[SUSettingsStatefulUIManager currentDownload](v13, "currentDownload");
      v11 = -[SUSUISoftwareUpdateController manager](v31, "manager");
      if (-[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v11, "isTargetedUpdateScheduledForAutoInstall"))
      {
        v4 = "YES";
      }
      else
      {
        v4 = "NO";
      }
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0((uint64_t)v32, (uint64_t)"-[SUSUISoftwareUpdateController(UI) performDeepLinkAction:]", (uint64_t)v6, (uint64_t)v31, (uint64_t)v7, v8, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v18, (uint64_t)v5, (uint64_t)v12, (uint64_t)v4, v29);
      _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nUnknown deep link update action %ld", v32, 0x84u);

      objc_storeStrong(&v24, 0);
      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong((id *)&v26, 0);
    }
    objc_storeStrong(&v28, 0);
  }
}

- (void)waitForScanCompletionWithTimeout:(unint64_t)a3 currentAttempt:(unint64_t)a4 completionHandler:(id)a5
{
  const char *v5;
  objc_class *v6;
  const char *v7;
  NSObject *v8;
  id v9;
  NSString *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  NSObject *v29;
  dispatch_time_t when;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  NSObject *v36;
  os_log_type_t v37;
  id v38;
  id v39;
  __CFString *v40;
  NSObject *v41;
  os_log_type_t v42;
  __CFString *v43;
  NSObject *v44;
  NSObject *v45;
  os_log_type_t v46;
  __CFString *v47;
  id v48;
  BOOL v49;
  NSObject *queue;
  NSObject *log;
  os_log_type_t v52;
  __CFString *v53;
  uint64_t v54;
  int v55;
  int v56;
  void (*v57)(uint64_t);
  void *v58;
  id v59;
  id v60;
  __CFString *v61;
  NSString *v62;
  os_log_type_t v63;
  os_log_t v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  id v70;
  id v71[3];
  __CFString *v72;
  os_log_type_t v73;
  os_log_t v74;
  __CFString *v75;
  os_log_type_t v76;
  os_log_t v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  id v83;
  __CFString *v84;
  os_log_type_t v85;
  os_log_t v86;
  char v87;
  id v88;
  int v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t (*v93)(uint64_t);
  void *v94;
  id v95;
  __CFString *v96;
  os_log_type_t type;
  os_log_t oslog;
  unint64_t v99;
  id location;
  void *v101;
  void *v102;
  SEL v103;
  id v104;
  uint8_t v105[144];
  uint8_t v106[96];
  uint8_t v107[32];
  uint8_t v108[32];
  uint8_t v109[40];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v104 = self;
  v103 = a2;
  v102 = (void *)a3;
  v101 = (void *)a4;
  location = 0;
  objc_storeStrong(&location, a5);
  if ((unint64_t)v101 >= 0xF0)
  {
    v64 = (os_log_t)_SUSUILoggingFacility();
    v63 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v64;
      v15 = v63;
      v6 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v6);
      v10 = v28;
      v62 = v10;
      v11 = v104;
      v27 = SUSettingsUIStateToString(objc_msgSend(v104, "currentUIState"));
      v12 = v27;
      v61 = v12;
      v13 = objc_msgSend(v104, "currentUIState");
      v26 = (id)objc_msgSend(v104, "presentingStatefulDescriptor");
      v25 = (id)objc_msgSend(v104, "presentingStatefulDescriptor");
      v24 = (id)objc_msgSend(v104, "presentingAlternateStatefulDescriptor");
      v23 = (id)objc_msgSend(v104, "presentingAlternateStatefulDescriptor");
      v22 = (id)objc_msgSend(v104, "manager");
      v21 = (id)objc_msgSend(v22, "currentDownload");
      v20 = (id)objc_msgSend(v21, "descriptor");
      v19 = (id)objc_msgSend(v20, "humanReadableUpdateName");
      v9 = v19;
      v60 = v9;
      v18 = (id)objc_msgSend(v104, "manager");
      v17 = (id)objc_msgSend(v18, "currentDownload");
      v16 = (id)objc_msgSend(v104, "manager");
      if ((objc_msgSend(v16, "isTargetedUpdateScheduledForAutoInstall") & 1) != 0)
        v7 = "YES";
      else
        v7 = "NO";
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0((uint64_t)v105, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v7, (uint64_t)v102);
      _os_log_impl(&dword_21BF33000, v14, v15, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nReached the handleURL scan timeout %lu. Stopping.", v105, 0x84u);

      objc_storeStrong(&v60, 0);
      objc_storeStrong((id *)&v61, 0);
      objc_storeStrong((id *)&v62, 0);
    }
    objc_storeStrong((id *)&v64, 0);
    v8 = MEMORY[0x24BDAC9B8];
    v54 = MEMORY[0x24BDAC760];
    v55 = -1073741824;
    v56 = 0;
    v57 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_306;
    v58 = &unk_24DFF7BA8;
    v59 = location;
    dispatch_async(v8, &v54);

    objc_storeStrong(&v59, 0);
    goto LABEL_30;
  }
  v99 = objc_msgSend(v104, "currentUIState");
  if (v99 > 1 && v99 <= 3)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v52 = type;
      v53 = SUSettingsUIStateToString(v99);
      v96 = v53;
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v109, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v96, v99);
      _os_log_impl(&dword_21BF33000, log, v52, "%s: Scan finished with no update found - state %{public}@ (%lu)", v109, 0x20u);

      objc_storeStrong((id *)&v96, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    queue = MEMORY[0x24BDAC9B8];
    v90 = MEMORY[0x24BDAC760];
    v91 = -1073741824;
    v92 = 0;
    v93 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke;
    v94 = &unk_24DFF7BA8;
    v95 = location;
    dispatch_async(queue, &v90);

    v89 = 1;
    objc_storeStrong(&v95, 0);
    goto LABEL_31;
  }
  if (v99 != 4)
  {
LABEL_19:
    v74 = (os_log_t)_SUSUILoggingFacility();
    v73 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v74;
      v37 = v73;
      v5 = "complete";
      if (v99 != 1)
        v5 = "begin";
      v31 = (uint64_t)v5;
      v32 = (uint64_t)v101;
      v33 = (uint64_t)v102;
      v34 = v99;
      v40 = SUSettingsUIStateToString(v99);
      v35 = v40;
      v72 = v35;
      v39 = (id)objc_msgSend(v104, "presentingDescriptor");
      v38 = (id)objc_msgSend(v104, "presentingAlternateDescriptor");
      __os_log_helper_16_2_8_8_32_8_34_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v106, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", v31, v32, v33, v34, (uint64_t)v35, (uint64_t)v39, (uint64_t)v38);
      _os_log_impl(&dword_21BF33000, v36, v37, "%s: waiting for scan to %{public}s (waited %ld seconds out of %ld) (current state: %ld (%{public}@), preferred update: %p, alternate update: %p)", v106, 0x52u);

      objc_storeStrong((id *)&v72, 0);
    }
    objc_storeStrong((id *)&v74, 0);
    when = dispatch_time(0, 1000000000);
    v29 = *((_QWORD *)v104 + 175);
    v65 = MEMORY[0x24BDAC760];
    v66 = -1073741824;
    v67 = 0;
    v68 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_305;
    v69 = &unk_24DFFBD68;
    v70 = v104;
    v71[1] = v102;
    v71[2] = v101;
    v71[0] = location;
    dispatch_after(when, v29, &v65);
    objc_storeStrong(v71, 0);
    objc_storeStrong(&v70, 0);
LABEL_30:
    v89 = 0;
    goto LABEL_31;
  }
  v48 = (id)objc_msgSend(v104, "presentingDescriptor");
  v87 = 0;
  v49 = 1;
  if (!v48)
  {
    v88 = (id)objc_msgSend(v104, "presentingAlternateDescriptor");
    v87 = 1;
    v49 = v88 != 0;
  }
  if ((v87 & 1) != 0)

  if (!v49)
  {
    v77 = (os_log_t)_SUSUILoggingFacility();
    v76 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v77;
      v42 = v76;
      v43 = SUSettingsUIStateToString(v99);
      v75 = v43;
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v107, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v75, v99);
      _os_log_impl(&dword_21BF33000, v41, v42, "%s: state is %{public}@ (%ld) and yet both the update descriptor and the alternate update descriptors are nil. Continues to wait.", v107, 0x20u);

      objc_storeStrong((id *)&v75, 0);
    }
    objc_storeStrong((id *)&v77, 0);
    goto LABEL_19;
  }
  v86 = (os_log_t)_SUSUILoggingFacility();
  v85 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v86;
    v46 = v85;
    v47 = SUSettingsUIStateToString(v99);
    v84 = v47;
    __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v108, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v84, v99);
    _os_log_impl(&dword_21BF33000, v45, v46, "%s: Scan finished with updates available - state %{public}@ (%lu)", v108, 0x20u);

    objc_storeStrong((id *)&v84, 0);
  }
  objc_storeStrong((id *)&v86, 0);
  v44 = MEMORY[0x24BDAC9B8];
  v78 = MEMORY[0x24BDAC760];
  v79 = -1073741824;
  v80 = 0;
  v81 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_302;
  v82 = &unk_24DFF7BA8;
  v83 = location;
  dispatch_async(v44, &v78);

  v89 = 1;
  objc_storeStrong(&v83, 0);
LABEL_31:
  objc_storeStrong(&location, 0);
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_302(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_305(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForScanCompletionWithTimeout:currentAttempt:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 40), a1, a1);
}

void __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_306(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = *(_QWORD *)(a1 + 32);
    v2 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 8, 0);
    (*(void (**)(void))(v1 + 16))();

  }
}

- (void)beginUpdateNowOperation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  SUDescriptor *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *, char, id, void *);
  void *v34;
  SUSUISoftwareUpdateController *v35;
  id v36;
  __CFString *v37;
  NSString *v38;
  os_log_type_t v39;
  id v40[2];
  SUSUISoftwareUpdateController *v41;
  uint8_t v42[136];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v40[0];
    type = v39;
    v2 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v2);
    v12 = v29;
    v38 = v12;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState"));
    v13 = v28;
    v37 = v13;
    v14 = -[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState");
    v27 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v11 = v20;
    v36 = v11;
    v19 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateNowOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 1;
  v5 = v41;
  v6 = -[SUSUISoftwareUpdateController analyticsDownloadAndInstallNowTappedString](v41, "analyticsDownloadAndInstallNowTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v41, "setBusyWithActivityStyle:", v41->_currentActivityStyle);
  v10 = -[SUSUISoftwareUpdateController manager](v41, "manager");
  v9 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
  v30 = MEMORY[0x24BDAC760];
  v31 = -1073741824;
  v32 = 0;
  v33 = __72__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateNowOperation__block_invoke;
  v34 = &unk_24DFFEB00;
  v35 = v41;
  v7 = v41;
  v8 = MEMORY[0x24BDAC9B8];
  -[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __72__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateNowOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  id v7;
  NSString *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v29;
  __CFString *v30;
  NSString *v31;
  os_log_type_t v32;
  id v33[2];
  id v34;
  id location;
  char v36;
  id *v37;
  uint8_t v38[136];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = a1;
  v36 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((_QWORD *)a1[4] + 176) = 0;
  objc_msgSend(a1[4], "setBusyWithActivityStyle:", *((_QWORD *)a1[4] + 176));
  v33[0] = _SUSUILoggingFacility();
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v33[0];
    type = v32;
    v4 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v4);
    v8 = v26;
    v31 = v8;
    v9 = a1[4];
    v25 = SUSettingsUIStateToString(objc_msgSend(v9, "currentUIState"));
    v10 = v25;
    v30 = v10;
    v11 = objc_msgSend(a1[4], "currentUIState");
    v24 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v23 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v21 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v20 = (id)objc_msgSend(a1[4], "manager");
    v19 = (id)objc_msgSend(v20, "currentDownload");
    v18 = (id)objc_msgSend(v19, "descriptor");
    v17 = (id)objc_msgSend(v18, "humanReadableUpdateName");
    v7 = v17;
    v29 = v7;
    v16 = (id)objc_msgSend(a1[4], "manager");
    v15 = (id)objc_msgSend(v16, "currentDownload");
    v14 = (id)objc_msgSend(a1[4], "manager");
    v5 = objc_msgSend(v14, "isTargetedUpdateScheduledForAutoInstall");
    v6 = "YES";
    if ((v5 & 1) == 0)
      v6 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateNowOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginUpdateDownloadOnlyOperation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  SUDescriptor *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *, char, id, void *);
  void *v34;
  SUSUISoftwareUpdateController *v35;
  id v36;
  __CFString *v37;
  NSString *v38;
  os_log_type_t v39;
  id v40[2];
  SUSUISoftwareUpdateController *v41;
  uint8_t v42[136];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v40[0];
    type = v39;
    v2 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v2);
    v12 = v29;
    v38 = v12;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState"));
    v13 = v28;
    v37 = v13;
    v14 = -[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState");
    v27 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v11 = v20;
    v36 = v11;
    v19 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateDownloadOnlyOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  v5 = v41;
  v6 = -[SUSUISoftwareUpdateController analyticsDownloadOnlyTappedString](v41, "analyticsDownloadOnlyTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v41, "setBusyWithActivityStyle:", v41->_currentActivityStyle);
  v10 = -[SUSUISoftwareUpdateController manager](v41, "manager");
  v9 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
  v30 = MEMORY[0x24BDAC760];
  v31 = -1073741824;
  v32 = 0;
  v33 = __81__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateDownloadOnlyOperation__block_invoke;
  v34 = &unk_24DFFEB00;
  v35 = v41;
  v7 = v41;
  v8 = MEMORY[0x24BDAC9B8];
  -[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __81__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateDownloadOnlyOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  id v7;
  NSString *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v29;
  __CFString *v30;
  NSString *v31;
  os_log_type_t v32;
  id v33[2];
  id v34;
  id location;
  char v36;
  id *v37;
  uint8_t v38[136];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = a1;
  v36 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((_QWORD *)a1[4] + 176) = 0;
  objc_msgSend(a1[4], "setBusyWithActivityStyle:", *((_QWORD *)a1[4] + 176));
  v33[0] = _SUSUILoggingFacility();
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v33[0];
    type = v32;
    v4 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v4);
    v8 = v26;
    v31 = v8;
    v9 = a1[4];
    v25 = SUSettingsUIStateToString(objc_msgSend(v9, "currentUIState"));
    v10 = v25;
    v30 = v10;
    v11 = objc_msgSend(a1[4], "currentUIState");
    v24 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v23 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v21 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v20 = (id)objc_msgSend(a1[4], "manager");
    v19 = (id)objc_msgSend(v20, "currentDownload");
    v18 = (id)objc_msgSend(v19, "descriptor");
    v17 = (id)objc_msgSend(v18, "humanReadableUpdateName");
    v7 = v17;
    v29 = v7;
    v16 = (id)objc_msgSend(a1[4], "manager");
    v15 = (id)objc_msgSend(v16, "currentDownload");
    v14 = (id)objc_msgSend(a1[4], "manager");
    v5 = objc_msgSend(v14, "isTargetedUpdateScheduledForAutoInstall");
    v6 = "YES";
    if ((v5 & 1) == 0)
      v6 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateDownloadOnlyOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginUpdateTonightOperation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  SUDescriptor *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *, char, id, char, void *, void *);
  void *v34;
  SUSUISoftwareUpdateController *v35;
  id v36;
  __CFString *v37;
  NSString *v38;
  os_log_type_t v39;
  id v40[2];
  SUSUISoftwareUpdateController *v41;
  uint8_t v42[136];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v40[0];
    type = v39;
    v2 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v2);
    v12 = v29;
    v38 = v12;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState"));
    v13 = v28;
    v37 = v13;
    v14 = -[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState");
    v27 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v11 = v20;
    v36 = v11;
    v19 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateTonightOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  v5 = v41;
  v6 = -[SUSUISoftwareUpdateController analyticsDownloadAndInstallTonightTappedString](v41, "analyticsDownloadAndInstallTonightTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v41, "setBusyWithActivityStyle:", v41->_currentActivityStyle);
  v10 = -[SUSUISoftwareUpdateController manager](v41, "manager");
  v9 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
  v30 = MEMORY[0x24BDAC760];
  v31 = -1073741824;
  v32 = 0;
  v33 = __76__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateTonightOperation__block_invoke;
  v34 = &unk_24DFFEB28;
  v35 = v41;
  v7 = v41;
  v8 = MEMORY[0x24BDAC9B8];
  -[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __76__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateTonightOperation__block_invoke(id *a1, char a2, id obj, char a4, void *a5, void *a6)
{
  objc_class *v6;
  char v7;
  const char *v8;
  id v9;
  NSString *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *log;
  os_log_type_t type;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  NSString *v28;
  id v33;
  __CFString *v34;
  NSString *v35;
  os_log_type_t v36;
  id v37[2];
  id v38;
  id v39;
  char v40;
  id location;
  char v42;
  id *v43;
  uint8_t v44[136];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43 = a1;
  v42 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v40 = a4 & 1;
  v39 = 0;
  objc_storeStrong(&v39, a5);
  v38 = 0;
  objc_storeStrong(&v38, a6);
  v37[1] = a1;
  *((_QWORD *)a1[4] + 176) = 0;
  objc_msgSend(a1[4], "setBusyWithActivityStyle:", *((_QWORD *)a1[4] + 176));
  v37[0] = _SUSUILoggingFacility();
  v36 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v37[0];
    type = v36;
    v6 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v6);
    v10 = v28;
    v35 = v10;
    v11 = a1[4];
    v27 = SUSettingsUIStateToString(objc_msgSend(v11, "currentUIState"));
    v12 = v27;
    v34 = v12;
    v13 = objc_msgSend(a1[4], "currentUIState");
    v26 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v25 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v24 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v23 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "manager");
    v21 = (id)objc_msgSend(v22, "currentDownload");
    v20 = (id)objc_msgSend(v21, "descriptor");
    v19 = (id)objc_msgSend(v20, "humanReadableUpdateName");
    v9 = v19;
    v33 = v9;
    v18 = (id)objc_msgSend(a1[4], "manager");
    v17 = (id)objc_msgSend(v18, "currentDownload");
    v16 = (id)objc_msgSend(a1[4], "manager");
    v7 = objc_msgSend(v16, "isTargetedUpdateScheduledForAutoInstall");
    v8 = "YES";
    if ((v7 & 1) == 0)
      v8 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v44, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateTonightOperation]_block_invoke", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v8);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v44, 0x7Au);

    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallOperation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  SUDescriptor *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *, char, id);
  void *v34;
  SUSUISoftwareUpdateController *v35;
  id v36;
  __CFString *v37;
  NSString *v38;
  os_log_type_t v39;
  id v40[2];
  SUSUISoftwareUpdateController *v41;
  uint8_t v42[136];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v40[0];
    type = v39;
    v2 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v2);
    v12 = v29;
    v38 = v12;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState"));
    v13 = v28;
    v37 = v13;
    v14 = -[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState");
    v27 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v11 = v20;
    v36 = v11;
    v19 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  v5 = v41;
  v6 = -[SUSUISoftwareUpdateController analyticsDownloadAndInstallTonightTappedString](v41, "analyticsDownloadAndInstallTonightTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v41, "setBusyWithActivityStyle:", v41->_currentActivityStyle);
  v10 = -[SUSUISoftwareUpdateController manager](v41, "manager");
  v9 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
  v30 = MEMORY[0x24BDAC760];
  v31 = -1073741824;
  v32 = 0;
  v33 = __70__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallOperation__block_invoke;
  v34 = &unk_24DFFC360;
  v35 = v41;
  v7 = v41;
  v8 = MEMORY[0x24BDAC9B8];
  -[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __70__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallOperation__block_invoke(id *a1, char a2, id obj)
{
  objc_class *v3;
  char v4;
  const char *v5;
  id v6;
  NSString *v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *log;
  os_log_type_t type;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  NSString *v25;
  id v27;
  __CFString *v28;
  NSString *v29;
  os_log_type_t v30;
  id v31[2];
  id location;
  char v33;
  id *v34;
  uint8_t v35[136];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = a1;
  v33 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v31[1] = a1;
  *((_QWORD *)a1[4] + 176) = 0;
  objc_msgSend(a1[4], "setBusyWithActivityStyle:", *((_QWORD *)a1[4] + 176));
  v31[0] = _SUSUILoggingFacility();
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v31[0];
    type = v30;
    v3 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v3);
    v7 = v25;
    v29 = v7;
    v8 = a1[4];
    v24 = SUSettingsUIStateToString(objc_msgSend(v8, "currentUIState"));
    v9 = v24;
    v28 = v9;
    v10 = objc_msgSend(a1[4], "currentUIState");
    v23 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v21 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v20 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v19 = (id)objc_msgSend(a1[4], "manager");
    v18 = (id)objc_msgSend(v19, "currentDownload");
    v17 = (id)objc_msgSend(v18, "descriptor");
    v16 = (id)objc_msgSend(v17, "humanReadableUpdateName");
    v6 = v16;
    v27 = v6;
    v15 = (id)objc_msgSend(a1[4], "manager");
    v14 = (id)objc_msgSend(v15, "currentDownload");
    v13 = (id)objc_msgSend(a1[4], "manager");
    v4 = objc_msgSend(v13, "isTargetedUpdateScheduledForAutoInstall");
    v5 = "YES";
    if ((v4 & 1) == 0)
      v5 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallOperation]_block_invoke", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallTonightOperation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSUISoftwareUpdateController *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v17;
  SUDownload *v18;
  SUSettingsStatefulUIManager *v19;
  id v20;
  SUDescriptor *v21;
  SUDownload *v22;
  SUSettingsStatefulUIManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *, char, id, void *);
  void *v34;
  SUSUISoftwareUpdateController *v35;
  id v36;
  __CFString *v37;
  NSString *v38;
  os_log_type_t v39;
  id v40[2];
  SUSUISoftwareUpdateController *v41;
  uint8_t v42[136];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v40[0];
    type = v39;
    v2 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v2);
    v12 = v29;
    v38 = v12;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState"));
    v13 = v28;
    v37 = v13;
    v14 = -[SUSUISoftwareUpdateController currentUIState](v41, "currentUIState");
    v27 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v41, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v11 = v20;
    v36 = v11;
    v19 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v41, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallTonightOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  v5 = v41;
  v6 = -[SUSUISoftwareUpdateController analyticsDownloadAndInstallTonightTappedString](v41, "analyticsDownloadAndInstallTonightTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  -[SUSUISoftwareUpdateController setBusyWithActivityStyle:](v41, "setBusyWithActivityStyle:", v41->_currentActivityStyle);
  v10 = -[SUSUISoftwareUpdateController manager](v41, "manager");
  v9 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v41, "presentingStatefulDescriptor");
  v30 = MEMORY[0x24BDAC760];
  v31 = -1073741824;
  v32 = 0;
  v33 = __77__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallTonightOperation__block_invoke;
  v34 = &unk_24DFFEB50;
  v35 = v41;
  v7 = v41;
  v8 = MEMORY[0x24BDAC9B8];
  -[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __77__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallTonightOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  id v7;
  NSString *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v29;
  __CFString *v30;
  NSString *v31;
  os_log_type_t v32;
  id v33[2];
  id v34;
  id location;
  char v36;
  id *v37;
  uint8_t v38[136];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = a1;
  v36 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((_QWORD *)a1[4] + 176) = 0;
  objc_msgSend(a1[4], "setBusyWithActivityStyle:", *((_QWORD *)a1[4] + 176));
  v33[0] = _SUSUILoggingFacility();
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v33[0];
    type = v32;
    v4 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v4);
    v8 = v26;
    v31 = v8;
    v9 = a1[4];
    v25 = SUSettingsUIStateToString(objc_msgSend(v9, "currentUIState"));
    v10 = v25;
    v30 = v10;
    v11 = objc_msgSend(a1[4], "currentUIState");
    v24 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v23 = (id)objc_msgSend(a1[4], "presentingStatefulDescriptor");
    v22 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v21 = (id)objc_msgSend(a1[4], "presentingAlternateStatefulDescriptor");
    v20 = (id)objc_msgSend(a1[4], "manager");
    v19 = (id)objc_msgSend(v20, "currentDownload");
    v18 = (id)objc_msgSend(v19, "descriptor");
    v17 = (id)objc_msgSend(v18, "humanReadableUpdateName");
    v7 = v17;
    v29 = v7;
    v16 = (id)objc_msgSend(a1[4], "manager");
    v15 = (id)objc_msgSend(v16, "currentDownload");
    v14 = (id)objc_msgSend(a1[4], "manager");
    v5 = objc_msgSend(v14, "isTargetedUpdateScheduledForAutoInstall");
    v6 = "YES";
    if ((v5 & 1) == 0)
      v6 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallTonightOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallNowOperation
{
  id v3;

  v3 = -[SUSUISoftwareUpdateController installNowTappedString](self, "installNowTappedString");
  -[SUSUISoftwareUpdateController recordAnalyticsEvent:](self, "recordAnalyticsEvent:");

}

- (void)promoteTargetedUpdateToUserInitiatedStatus
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSettingsStatefulUIManager *v7;
  id v8;
  NSString *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v14;
  SUDownload *v15;
  SUSettingsStatefulUIManager *v16;
  id v17;
  SUDescriptor *v18;
  SUDownload *v19;
  SUSettingsStatefulUIManager *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  os_log_type_t v30;
  id v31[2];
  SUSUISoftwareUpdateController *v32;
  uint8_t v33[136];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = _SUSUILoggingFacility();
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v31[0];
    type = v30;
    v2 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v2);
    v9 = v26;
    v29 = v9;
    v25 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState"));
    v10 = v25;
    v28 = v10;
    v11 = -[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState");
    v24 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v19 = -[SUSettingsStatefulUIManager currentDownload](v20, "currentDownload");
    v18 = -[SUDownload descriptor](v19, "descriptor");
    v17 = (id)-[SUDescriptor humanReadableUpdateName](v18, "humanReadableUpdateName");
    v8 = v17;
    v27 = v8;
    v16 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v15 = -[SUSettingsStatefulUIManager currentDownload](v16, "currentDownload");
    v14 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v14, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) promoteTargetedUpdateToUserInitiatedStatus]", (uint64_t)v9, (uint64_t)v32, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  v5 = v32;
  v6 = -[SUSUISoftwareUpdateController installLaterTappedString](v32, "installLaterTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  v7 = -[SUSUISoftwareUpdateController manager](v32, "manager");
  -[SUSettingsStatefulUIManager promoteTargetedUpdateToUserInitiatedStatus](v7, "promoteTargetedUpdateToUserInitiatedStatus");

}

- (void)unscheduleTargetedUpdateAutomaticInstallation
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  SUSUISoftwareUpdateController *v5;
  id v6;
  SUSettingsStatefulUIManager *v7;
  id v8;
  NSString *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  SUSettingsStatefulUIManager *v14;
  SUDownload *v15;
  SUSettingsStatefulUIManager *v16;
  id v17;
  SUDescriptor *v18;
  SUDownload *v19;
  SUSettingsStatefulUIManager *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  NSString *v26;
  id v27;
  __CFString *v28;
  NSString *v29;
  os_log_type_t v30;
  id v31[2];
  SUSUISoftwareUpdateController *v32;
  uint8_t v33[136];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = _SUSUILoggingFacility();
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v31[0];
    type = v30;
    v2 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v2);
    v9 = v26;
    v29 = v9;
    v25 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState"));
    v10 = v25;
    v28 = v10;
    v11 = -[SUSUISoftwareUpdateController currentUIState](v32, "currentUIState");
    v24 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController presentingStatefulDescriptor](v32, "presentingStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v21 = -[SUSUISoftwareUpdateController presentingAlternateStatefulDescriptor](v32, "presentingAlternateStatefulDescriptor");
    v20 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v19 = -[SUSettingsStatefulUIManager currentDownload](v20, "currentDownload");
    v18 = -[SUDownload descriptor](v19, "descriptor");
    v17 = (id)-[SUDescriptor humanReadableUpdateName](v18, "humanReadableUpdateName");
    v8 = v17;
    v27 = v8;
    v16 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v15 = -[SUSettingsStatefulUIManager currentDownload](v16, "currentDownload");
    v14 = -[SUSUISoftwareUpdateController manager](v32, "manager");
    v3 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v14, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v3)
      v4 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) unscheduleTargetedUpdateAutomaticInstallation]", (uint64_t)v9, (uint64_t)v32, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  v5 = v32;
  v6 = -[SUSUISoftwareUpdateController installLaterTappedString](v32, "installLaterTappedString");
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  v7 = -[SUSUISoftwareUpdateController manager](v32, "manager");
  -[SUSettingsStatefulUIManager unscheduleTargetedUpdateAutomaticInstallation](v7, "unscheduleTargetedUpdateAutomaticInstallation");

}

- (BOOL)shouldShowComingSoonTip
{
  SUSUISoftwareUpdateController *v3;

  swift_getObjectType();
  v3 = self;
  sub_21C019ADC();

  return sub_21C01CBA8() & 1;
}

- (void)setShouldShowComingSoonTip:(BOOL)a3
{
  SUSUISoftwareUpdateController *v4;

  swift_getObjectType();
  v4 = self;
  sub_21C01CBB4();
  sub_21C019E24();

}

- (void)setupTipsObserver
{
  SUSUISoftwareUpdateController *v3;

  swift_getObjectType();
  v3 = self;
  SUSUISoftwareUpdateController.setupTipsObserver()();

}

@end

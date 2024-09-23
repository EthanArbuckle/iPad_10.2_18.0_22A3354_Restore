@implementation SUSUISoftwareUpdateSlowRollController

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  SUSUISoftwareUpdateSlowRollController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
  -[SUSUISoftwareUpdateController viewDidLoad](&v2, sel_viewDidLoad);
  -[SUSUISoftwareUpdateController refreshPane](v4, "refreshPane");
}

- (id)navigationController
{
  id v3;
  id v4;
  char isKindOfClass;
  objc_super v6;
  int v7;
  id location;
  char v9;
  id v10;
  SEL v11;
  SUSUISoftwareUpdateSlowRollController *v12;
  id v13;

  v12 = self;
  v11 = a2;
  v4 = (id)-[SUSUISoftwareUpdateSlowRollController parentController](self, "parentController");
  v9 = 0;
  isKindOfClass = 0;
  if (v4)
  {
    v10 = (id)-[SUSUISoftwareUpdateSlowRollController parentController](v12, "parentController");
    v9 = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((v9 & 1) != 0)

  if ((isKindOfClass & 1) == 0
    || ((v3 = (id)-[SUSUISoftwareUpdateSlowRollController parentController](v12, "parentController"), location = (id)objc_msgSend(v3, "navigationController"), v3, !location)? (v7 = 0): (v13 = location, v7 = 1), objc_storeStrong(&location, 0), !v7))
  {
    v6.receiver = v12;
    v6.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
    v13 = -[SUSUISoftwareUpdateSlowRollController navigationController](&v6, sel_navigationController);
  }
  return v13;
}

- (id)paneTitle
{
  id v2;
  char v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  void *v12;

  v10 = 0;
  v8 = 0;
  v6 = 0;
  v4 = 0;
  if (self->_slowRollUpdateType)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
    v4 = 1;
    v2 = v5;
  }
  else
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = 1;
    v9 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AVAILABLE_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
    v8 = 1;
    v2 = v9;
  }
  v12 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  return v12;
}

- (id)presentingStatefulDescriptor
{
  SUSettingsStatefulDescriptor *v2;
  char v4;
  SUSettingsStatefulDescriptor *v5;
  char v6;
  SUSettingsStatefulUIManager *v7;
  char v8;
  SUSettingsStatefulDescriptor *v9;
  char v10;
  SUSettingsStatefulUIManager *v11;
  SUSettingsStatefulDescriptor *v12;

  v10 = 0;
  v8 = 0;
  v6 = 0;
  v4 = 0;
  if (self->_slowRollUpdateType)
  {
    v7 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v6 = 1;
    v5 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v7, "preferredStatefulDescriptor");
    v4 = 1;
    v2 = v5;
  }
  else
  {
    v11 = -[SUSUISoftwareUpdateController manager](self, "manager");
    v10 = 1;
    v9 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v11, "alternateStatefulDescriptor");
    v8 = 1;
    v2 = v9;
  }
  v12 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  return v12;
}

- (id)presentingAlternateStatefulDescriptor
{
  return 0;
}

- (BOOL)presentingStatefulDescriptorPromotedAsAlternate
{
  return 0;
}

- (BOOL)hasAlternateUpdate
{
  return 0;
}

- (BOOL)supportsPullToRefresh
{
  return 0;
}

- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4
{
  objc_class *v4;
  BOOL v5;
  const char *v6;
  id v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  BOOL v11;
  const char *v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  NSString *v18;
  SUSUISoftwareUpdateSlowRollController *v19;
  __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  SUSettingsStatefulUIManager *v24;
  SUDownload *v25;
  SUSettingsStatefulUIManager *v26;
  id v27;
  SUDescriptor *v28;
  SUDownload *v29;
  SUSettingsStatefulUIManager *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  NSString *v36;
  char v37;
  char v38;
  id v39;
  id v40;
  uint64_t v41;
  NSString *v42;
  SUSUISoftwareUpdateSlowRollController *v43;
  __CFString *v44;
  uint64_t v45;
  NSObject *log;
  os_log_type_t v47;
  SUSettingsStatefulUIManager *v48;
  SUDownload *v49;
  SUSettingsStatefulUIManager *v50;
  id v51;
  SUDescriptor *v52;
  SUDownload *v53;
  SUSettingsStatefulUIManager *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __CFString *v59;
  NSString *v60;
  id v62;
  BOOL v63;
  id v64;
  __CFString *v65;
  NSString *v66;
  os_log_type_t v67;
  os_log_t v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  int v83;
  id v84;
  id v85;
  __CFString *v86;
  NSString *v87;
  os_log_type_t type;
  os_log_t oslog;
  char v90;
  id v91;
  id v92;
  id location[2];
  SUSUISoftwareUpdateSlowRollController *v94;
  uint8_t v95[144];
  uint8_t v96[152];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v94 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v92 = 0;
  objc_storeStrong(&v92, a4);
  v62 = (id)objc_msgSend(v92, "preferredDescriptor");
  v90 = 0;
  v63 = 0;
  if (!v62)
  {
    v91 = (id)objc_msgSend(v92, "alternateDescriptor");
    v90 = 1;
    v63 = v91 == 0;
  }
  if ((v90 & 1) != 0)

  if (v63)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v47 = type;
      v4 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v4);
      v42 = v60;
      v87 = v42;
      v43 = v94;
      v59 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateSlowRollController currentUIState](v94, "currentUIState"));
      v44 = v59;
      v86 = v44;
      v45 = -[SUSUISoftwareUpdateSlowRollController currentUIState](v94, "currentUIState");
      v58 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
      v57 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
      v56 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v94, "presentingAlternateStatefulDescriptor");
      v55 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v94, "presentingAlternateStatefulDescriptor");
      v54 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v53 = -[SUSettingsStatefulUIManager currentDownload](v54, "currentDownload");
      v52 = -[SUDownload descriptor](v53, "descriptor");
      v51 = (id)-[SUDescriptor humanReadableUpdateName](v52, "humanReadableUpdateName");
      v40 = v51;
      v85 = v40;
      v50 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v49 = -[SUSettingsStatefulUIManager currentDownload](v50, "currentDownload");
      v48 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v48, "isTargetedUpdateScheduledForAutoInstall");
      v6 = "YES";
      if (!v5)
        v6 = "NO";
      v41 = (uint64_t)v6;
      v84 = (id)objc_opt_class();
      __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66((uint64_t)v96, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFinishScanningForUpdatesWithResults:]", (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, v45, (uint64_t)v58, (uint64_t)v57, (uint64_t)v56, (uint64_t)v55, (uint64_t)v40, (uint64_t)v49, v41, (uint64_t)v84, (uint64_t)v92);
      _os_log_impl(&dword_21BF33000, log, v47, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nA new scan results points to no new updates. Popping out %{public}@.\nSUSettingsFullScanResults: %{public}@", v96, 0x8Eu);

      objc_storeStrong(&v84, 0);
      objc_storeStrong(&v85, 0);
      objc_storeStrong((id *)&v86, 0);
      objc_storeStrong((id *)&v87, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v39 = -[SUSUISoftwareUpdateSlowRollController navigationController](v94, "navigationController");
    v7 = (id)objc_msgSend(v39, "popViewControllerAnimated:", 1);

    v83 = 1;
  }
  else
  {
    v82 = 0;
    v8 = v94->_slowRollUpdateType != 1;
    v80 = 0;
    v78 = 0;
    v76 = 0;
    v38 = 0;
    if (!v8)
    {
      v38 = 0;
      if ((objc_msgSend(location[0], "isPreferredUpdatePromotedAsAlternate") & 1) != 0)
      {
        v81 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
        v80 = 1;
        v79 = (id)objc_msgSend(location[0], "preferredStatefulDescriptor");
        v78 = 1;
        v77 = (id)objc_msgSend(v79, "descriptor");
        v76 = 1;
        v38 = objc_msgSend(v81, "isEqualToDescriptor:");
      }
    }
    if ((v76 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v80 & 1) != 0)

    v82 = v38 & 1;
    v75 = 0;
    v9 = v94->_slowRollUpdateType != 0;
    v73 = 0;
    v71 = 0;
    v69 = 0;
    v37 = 0;
    if (!v9)
    {
      v37 = 0;
      if ((objc_msgSend(location[0], "isPreferredUpdatePromotedAsAlternate") & 1) == 0)
      {
        v74 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
        v73 = 1;
        v72 = (id)objc_msgSend(location[0], "alternateStatefulDescriptor");
        v71 = 1;
        v70 = (id)objc_msgSend(v72, "descriptor");
        v69 = 1;
        v37 = objc_msgSend(v74, "isEqualToDescriptor:");
      }
    }
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    v75 = v37 & 1;
    v68 = (os_log_t)_SUSUILoggingFacility();
    v67 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v68;
      v23 = v67;
      v10 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v10);
      v18 = v36;
      v66 = v18;
      v19 = v94;
      v35 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateSlowRollController currentUIState](v94, "currentUIState"));
      v20 = v35;
      v65 = v20;
      v21 = -[SUSUISoftwareUpdateSlowRollController currentUIState](v94, "currentUIState");
      v34 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
      v33 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v94, "presentingStatefulDescriptor");
      v32 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v94, "presentingAlternateStatefulDescriptor");
      v31 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v94, "presentingAlternateStatefulDescriptor");
      v30 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v29 = -[SUSettingsStatefulUIManager currentDownload](v30, "currentDownload");
      v28 = -[SUDownload descriptor](v29, "descriptor");
      v27 = (id)-[SUDescriptor humanReadableUpdateName](v28, "humanReadableUpdateName");
      v17 = v27;
      v64 = v17;
      v26 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v25 = -[SUSettingsStatefulUIManager currentDownload](v26, "currentDownload");
      v24 = -[SUSUISoftwareUpdateController manager](v94, "manager");
      v11 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v24, "isTargetedUpdateScheduledForAutoInstall");
      v12 = "YES";
      if (v11)
        v13 = "YES";
      else
        v13 = "NO";
      if ((v82 & 1) != 0)
        v14 = "YES";
      else
        v14 = "NO";
      if ((v75 & 1) == 0)
        v12 = "NO";
      __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32((uint64_t)v95, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFinishScanningForUpdatesWithResults:]", (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, v21, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v17, (uint64_t)v25, (uint64_t)v13, (uint64_t)v14, (uint64_t)v12);
      _os_log_impl(&dword_21BF33000, v22, v23, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\ndoesShowUpToDateNonPromotedUpdate? %s, doesShowUpToDateAlternateUpdate? %s", v95, 0x8Eu);

      objc_storeStrong(&v64, 0);
      objc_storeStrong((id *)&v65, 0);
      objc_storeStrong((id *)&v66, 0);
    }
    objc_storeStrong((id *)&v68, 0);
    if ((v82 & 1) == 0 && (v75 & 1) == 0)
    {
      v16 = -[SUSUISoftwareUpdateSlowRollController navigationController](v94, "navigationController");
      v15 = (id)objc_msgSend(v16, "popViewControllerAnimated:", 1);

    }
    v83 = 0;
  }
  objc_storeStrong(&v92, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4
{
  objc_class *v4;
  BOOL v5;
  const char *v6;
  id v7;
  id v8;
  id v9;
  NSString *v10;
  SUSUISoftwareUpdateSlowRollController *v11;
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
  id v30;
  __CFString *v31;
  NSString *v32;
  os_log_type_t v33;
  id v34;
  id v35;
  id location[2];
  SUSUISoftwareUpdateSlowRollController *v37;
  uint8_t v38[136];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = _SUSUILoggingFacility();
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    log = v34;
    type = v33;
    v4 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v4);
    v10 = v28;
    v32 = v10;
    v11 = v37;
    v27 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateSlowRollController currentUIState](v37, "currentUIState"));
    v12 = v27;
    v31 = v12;
    v13 = -[SUSUISoftwareUpdateSlowRollController currentUIState](v37, "currentUIState");
    v26 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v37, "presentingStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v37, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v37, "presentingAlternateStatefulDescriptor");
    v22 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v21 = -[SUSettingsStatefulUIManager currentDownload](v22, "currentDownload");
    v20 = -[SUDownload descriptor](v21, "descriptor");
    v19 = (id)-[SUDescriptor humanReadableUpdateName](v20, "humanReadableUpdateName");
    v9 = v19;
    v30 = v9;
    v18 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v17 = -[SUSettingsStatefulUIManager currentDownload](v18, "currentDownload");
    v16 = -[SUSUISoftwareUpdateController manager](v37, "manager");
    v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v16, "isTargetedUpdateScheduledForAutoInstall");
    v6 = "YES";
    if (!v5)
      v6 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFailToScanForUpdatesWithError:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  v8 = -[SUSUISoftwareUpdateSlowRollController navigationController](v37, "navigationController");
  v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didStartDownloadForDescriptor:(id)a4 withDownload:(id)a5
{
  objc_class *v5;
  BOOL v6;
  const char *v7;
  id v8;
  id v9;
  id v10;
  NSString *v11;
  SUSUISoftwareUpdateSlowRollController *v12;
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
  id v32;
  __CFString *v33;
  NSString *v34;
  os_log_type_t v35;
  id v36;
  id v37;
  id v38;
  id location[2];
  SUSUISoftwareUpdateSlowRollController *v40;
  uint8_t v41[136];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = _SUSUILoggingFacility();
  v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
  {
    log = v36;
    type = v35;
    v5 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v5);
    v11 = v29;
    v34 = v11;
    v12 = v40;
    v28 = SUSettingsUIStateToString(-[SUSUISoftwareUpdateSlowRollController currentUIState](v40, "currentUIState"));
    v13 = v28;
    v33 = v13;
    v14 = -[SUSUISoftwareUpdateSlowRollController currentUIState](v40, "currentUIState");
    v27 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v40, "presentingStatefulDescriptor");
    v26 = -[SUSUISoftwareUpdateSlowRollController presentingStatefulDescriptor](v40, "presentingStatefulDescriptor");
    v25 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v40, "presentingAlternateStatefulDescriptor");
    v24 = -[SUSUISoftwareUpdateSlowRollController presentingAlternateStatefulDescriptor](v40, "presentingAlternateStatefulDescriptor");
    v23 = -[SUSUISoftwareUpdateController manager](v40, "manager");
    v22 = -[SUSettingsStatefulUIManager currentDownload](v23, "currentDownload");
    v21 = -[SUDownload descriptor](v22, "descriptor");
    v20 = (id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
    v10 = v20;
    v32 = v10;
    v19 = -[SUSUISoftwareUpdateController manager](v40, "manager");
    v18 = -[SUSettingsStatefulUIManager currentDownload](v19, "currentDownload");
    v17 = -[SUSUISoftwareUpdateController manager](v40, "manager");
    v6 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v17, "isTargetedUpdateScheduledForAutoInstall");
    v7 = "YES";
    if (!v6)
      v7 = "NO";
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v41, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didStartDownloadForDescriptor:withDownload:]", (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v10, (uint64_t)v18, (uint64_t)v7);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v41, 0x7Au);

    objc_storeStrong(&v32, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v36, 0);
  v9 = -[SUSUISoftwareUpdateSlowRollController navigationController](v40, "navigationController");
  v8 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6
{
  objc_super v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id location[2];
  SUSUISoftwareUpdateSlowRollController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = a5;
  v11 = a6;
  if (a5 == 1 && v11 >= 2)
  {
    v10 = 1;
  }
  else
  {
    v9.receiver = v15;
    v9.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
    -[SUSUISoftwareUpdateController statefulUIManager:descriptor:didTransitionFromDescriptorState:toState:](&v9, sel_statefulUIManager_descriptor_didTransitionFromDescriptorState_toState_, location[0], v13, v12, v11);
    v10 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 escriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (unint64_t)currentUIState
{
  return 4;
}

- (id)analyticsDownloadOnlyTappedString
{
  return (id)*MEMORY[0x24BEAEDE8];
}

- (id)analyticsDownloadAndInstallTonightTappedString
{
  return (id)*MEMORY[0x24BEAEDE0];
}

- (id)analyticsDownloadAndInstallNowTappedString
{
  return (id)*MEMORY[0x24BEAEDD8];
}

- (id)analyticsOpenStorageTappedString
{
  return (id)*MEMORY[0x24BEAEED8];
}

- (id)learnMoreTappedString
{
  return (id)*MEMORY[0x24BEAEE00];
}

- (id)installNowTappedString
{
  return (id)*MEMORY[0x24BEAEDF8];
}

- (id)installLaterTappedString
{
  return (id)*MEMORY[0x24BEAEDF0];
}

- (SUSUISoftwareUpdateSlowRollControllerDelegate)delegate
{
  return (SUSUISoftwareUpdateSlowRollControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)slowRollUpdateType
{
  return self->_slowRollUpdateType;
}

- (void)setSlowRollUpdateType:(unint64_t)a3
{
  self->_slowRollUpdateType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

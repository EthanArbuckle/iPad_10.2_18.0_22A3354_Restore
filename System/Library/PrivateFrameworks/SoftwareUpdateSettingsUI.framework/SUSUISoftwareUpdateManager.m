@implementation SUSUISoftwareUpdateManager

- (SUSUISoftwareUpdateManager)initWithDelegate:(id)a3 hostController:(id)a4
{
  SUSUISoftwareUpdateManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *concurrentQueue;
  uint64_t v7;
  SUSUISoftwareUpdateClientManager *suClient;
  SUManagerClient *v9;
  SUManagerClient *SUManager;
  int v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  SUSUIUpdateAgreementManager *v15;
  SUSUIUpdateAgreementManager *updateAgreementManager;
  SUSUISoftwareUpdateManager *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SUSUIServiceManager *v23;
  SUSUISoftwareUpdateManager *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  BOOL v29;
  id v31;
  Class v32;
  objc_super v33;
  id v34;
  id location[2];
  SUSUISoftwareUpdateManager *v36;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v4 = v36;
  v36 = 0;
  v33.receiver = v4;
  v33.super_class = (Class)SUSUISoftwareUpdateManager;
  v36 = -[SUSUISoftwareUpdateManager init](&v33, sel_init);
  objc_storeStrong((id *)&v36, v36);
  if (v36)
  {
    v5 = dispatch_queue_create("com.apple.softwareupdatesettings._concurrentqueue", 0);
    concurrentQueue = v36->_concurrentQueue;
    v36->_concurrentQueue = (OS_dispatch_queue *)v5;

    v23 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
    v32 = -[SUSUIServiceManager classForService:](v23, "classForService:", objc_opt_class());

    v25 = [v32 alloc];
    v24 = v36;
    v26 = MEMORY[0x24BDAC9B8];
    v7 = objc_msgSend(v25, "initWithDelegate:completionQueue:", v24);
    suClient = v36->_suClient;
    v36->_suClient = (SUSUISoftwareUpdateClientManager *)v7;

    v9 = -[SUSUISoftwareUpdateClientManager suManagerClient](v36->_suClient, "suManagerClient");
    SUManager = v36->_SUManager;
    v36->_SUManager = v9;

    objc_storeWeak((id *)&v36->_delegate, location[0]);
    objc_storeWeak((id *)&v36->_hostController, v34);
    v36->_clearingSpaceForDownload = 0;
    v31 = (id)objc_msgSend(getSUNetworkMonitorClass_0(), "sharedInstance");
    v11 = objc_msgSend(v31, "currentNetworkType");
    v36->_networkType = v11;
    objc_msgSend(v31, "addObserver:", v36);
    PSSetBatteryMonitoringEnabled();
    v27 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v28 = objc_msgSend(v27, "batteryState");

    v29 = 1;
    if (v28 != 2)
      v29 = v28 == 3;
    v36->_connectedToPowerSource = v29;
    v19 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    objc_msgSend(v19, "batteryLevel");
    v36->_batteryLevel = v12;

    v20 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v20, "addObserver:selector:name:object:", v36, sel__batteryStateChanged_, *MEMORY[0x24BEBE0F8]);

    v21 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v21, "addObserver:selector:name:object:", v36, sel__batteryLevelChanged_, *MEMORY[0x24BEBE0F0], 0);

    v22 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v22, "addObserver:selector:name:object:", v36, sel__didBecomeActive_, *MEMORY[0x24BEBDF88], 0);

    v13 = SBSSpringBoardServerPort();
    MEMORY[0x2207736EC](v13, &v36->_originalCellFlag, &v36->_originalWifiFlag);
    v14 = SBSSpringBoardServerPort();
    MEMORY[0x220773704](v14, 1);
    v36->_previousTimeRemaining = -1.0;
    v36->_hidingPreferredUpdate = 0;
    v36->_hidingAlternateUpdate = 0;
    v15 = objc_alloc_init(SUSUIUpdateAgreementManager);
    updateAgreementManager = v36->_updateAgreementManager;
    v36->_updateAgreementManager = v15;

    objc_storeStrong((id *)&v36->_enrolledBetaProgram, 0);
    objc_storeStrong((id *)&v36->_currentSeedingDevice, 0);
    objc_storeStrong(&v31, 0);
  }
  v18 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v36, 0);
  return v18;
}

- (void)dealloc
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id WeakRetained;
  id v7;
  objc_super v8;
  SEL v9;
  SUSUISoftwareUpdateManager *v10;

  v10 = self;
  v9 = a2;
  v2 = SBSSpringBoardServerPort();
  MEMORY[0x220773704](v2, v10->_originalCellFlag, v10->_originalWifiFlag);
  v4 = (id)objc_msgSend(getSUNetworkMonitorClass_0(), "sharedInstance");
  objc_msgSend(v4, "removeObserver:", v10);

  PSSetBatteryMonitoringEnabled();
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v10);

  WeakRetained = objc_loadWeakRetained((id *)&v10->_hostController);
  v7 = (id)objc_msgSend(WeakRetained, "presentedViewController");

  if (v7)
  {
    v3 = objc_loadWeakRetained((id *)&v10->_hostController);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v8.receiver = v10;
  v8.super_class = (Class)SUSUISoftwareUpdateManager;
  -[SUSUISoftwareUpdateManager dealloc](&v8, sel_dealloc);
}

- (void)setPreferredUpdateError:(id)a3
{
  id v3;
  id location[2];
  SUSUISoftwareUpdateManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_preferredUpdateError, location[0]);
  v3 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v5, "humanReadableDescriptionForError:enableButton:", location[0], 0);
  -[SUSUISoftwareUpdateManager setPreferredUpdateErrorDescription:](v5, "setPreferredUpdateErrorDescription:");

  objc_storeStrong(location, 0);
}

- (void)setAlternateUpdateError:(id)a3
{
  id v3;
  id location[2];
  SUSUISoftwareUpdateManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_alternateUpdateError, location[0]);
  v3 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v5, "humanReadableDescriptionForError:enableButton:", location[0], 0);
  -[SUSUISoftwareUpdateManager setAlternateUpdateErrorDescription:](v5, "setAlternateUpdateErrorDescription:");

  objc_storeStrong(location, 0);
}

+ (double)timeRemainingForProgress:(id)a3 isValid:(BOOL *)a4
{
  double v4;
  double v7;
  id location[3];
  double v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
    *a4 = 0;
  if (!location[0])
    goto LABEL_13;
  objc_msgSend(location[0], "timeRemaining");
  v7 = v4;
  if (v4 < 0.0)
    goto LABEL_13;
  if (v4 > 0.0 && v4 < 1.0)
    v7 = 1.0;
  if (v7 < (double)0x93A80uLL && v7 > 0.0)
  {
    if (a4)
      *a4 = 1;
    v9 = v7;
  }
  else
  {
LABEL_13:
    v9 = -1.0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)timeRemainingStringForProgress:(id)a3
{
  float v3;
  id v4;
  id v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SUDownload *v12;
  SUDescriptor *v13;
  SUDownload *v14;
  SUDescriptor *v15;
  BOOL v16;
  id v17;
  double v18;
  char v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  id v28;
  int v29;
  char v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  char v38;
  id v39;
  id location[2];
  SUSUISoftwareUpdateManager *v41;
  id v42;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  v16 = 0;
  if (location[0])
  {
    v39 = (id)objc_msgSend(location[0], "phase");
    v38 = 1;
    v16 = 0;
    if ((objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEAEE98]) & 1) != 0)
    {
      objc_msgSend(location[0], "percentComplete");
      v16 = v3 >= 1.0;
    }
  }
  if ((v38 & 1) != 0)

  if (v16)
  {
    v14 = -[SUSUISoftwareUpdateManager download](v41, "download");
    v15 = -[SUDownload descriptor](v14, "descriptor");
    v36 = 0;
    v34 = 0;
    v32 = 0;
    v30 = 0;
    if ((-[SUDescriptor isSplatOnly](v15, "isSplatOnly") & 1) != 0)
    {
      v37 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = 1;
      v35 = (id)objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PREPARING_RSR"), &stru_24E0011F0, CFSTR("Software Update"));
      v34 = 1;
      v4 = v35;
    }
    else
    {
      v33 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = 1;
      v31 = (id)objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PREPARING_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
      v30 = 1;
      v4 = v31;
    }
    v42 = v4;
    if ((v30 & 1) != 0)

    if ((v32 & 1) != 0)
    if ((v34 & 1) != 0)

    if ((v36 & 1) != 0)
    v29 = 1;
  }
  else
  {
    v12 = -[SUSUISoftwareUpdateManager download](v41, "download");
    v13 = -[SUDownload descriptor](v12, "descriptor");
    v26 = 0;
    v24 = 0;
    v22 = 0;
    v20 = 0;
    if ((-[SUDescriptor isSplatOnly](v13, "isSplatOnly") & 1) != 0)
    {
      v27 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = 1;
      v25 = (id)objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("RSR_REQUESTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v24 = 1;
      v5 = v25;
    }
    else
    {
      v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = 1;
      v21 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("UPDATE_REQUESTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v20 = 1;
      v5 = v21;
    }
    v28 = v5;
    if ((v20 & 1) != 0)

    if ((v22 & 1) != 0)
    if ((v24 & 1) != 0)

    if ((v26 & 1) != 0)
    v19 = 0;
    +[SUSUISoftwareUpdateManager timeRemainingForProgress:isValid:](SUSUISoftwareUpdateManager, "timeRemainingForProgress:isValid:", location[0], &v19);
    v18 = v6;
    if ((v19 & 1) != 0)
    {
      v17 = 0;
      v7 = objc_alloc_init(MEMORY[0x24BDD14F8]);
      v8 = v17;
      v17 = v7;

      objc_msgSend(v17, "setUnitsStyle:", 3);
      objc_msgSend(v17, "setAllowedUnits:", 240);
      objc_msgSend(v17, "setMaximumUnitCount:", 1);
      objc_msgSend(v17, "setIncludesApproximationPhrase:", 1);
      objc_msgSend(v17, "setIncludesTimeRemainingPhrase:", 1);
      objc_msgSend(v17, "setFormattingContext:", 2);
      v9 = (id)objc_msgSend(v17, "stringFromTimeInterval:", v18);
      v10 = v28;
      v28 = v9;

      objc_storeStrong(&v17, 0);
    }
    v42 = v28;
    v29 = 1;
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(location, 0);
  return v42;
}

- (id)statusStringForBuddy
{
  int v2;
  __CFString *v3;
  unint64_t v5;
  SUDownload *v6;
  SUDescriptor *v7;
  SUDescriptor *v8;
  SUDownload *v9;
  SUDescriptor *v10;
  SUDownload *v11;
  char v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  id location;
  char v22;
  int v23;
  id v24;
  id v25;
  unsigned int state;
  SEL v27;
  SUSUISoftwareUpdateManager *v28;
  __CFString *v29;

  v28 = self;
  v27 = a2;
  state = 0;
  state = self->_state;
  v9 = -[SUSUISoftwareUpdateManager download](self, "download");
  v25 = -[SUDownload progress](v9, "progress");

  v24 = (id)objc_msgSend(v25, "phase");
  objc_msgSend(v25, "percentComplete");
  v23 = v2;
  v11 = -[SUSUISoftwareUpdateManager download](v28, "download");
  v10 = -[SUDownload descriptor](v11, "descriptor");
  v12 = -[SUDescriptor isSplatOnly](v10, "isSplatOnly");

  v22 = v12 & 1;
  location = -[SUSUISoftwareUpdateManager preferredUpdateError](v28, "preferredUpdateError");
  if (!location || -[SUSUISoftwareUpdateManager shouldIgnoreUpdateError:](v28, "shouldIgnoreUpdateError:", location))
  {
    v5 = state - 6;
    if (v5 <= 8)
      __asm { BR              X8 }
    v29 = &stru_24E0011F0;
  }
  else
  {
    v6 = -[SUSUISoftwareUpdateManager download](v28, "download");
    v7 = -[SUDownload descriptor](v6, "descriptor");
    v8 = -[SUSUISoftwareUpdateManager preferredUpdate](v28, "preferredUpdate");
    v19 = 0;
    v17 = 0;
    v15 = 0;
    v13 = 0;
    if ((-[SUDescriptor isEqual:](v7, "isEqual:") & 1) != 0 && state >= 0xA)
    {
      v20 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = 1;
      v18 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_INSTALL"), &stru_24E0011F0, CFSTR("Software Update"));
      v17 = 1;
      v3 = (__CFString *)v18;
    }
    else
    {
      v16 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = 1;
      v14 = (id)objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_DOWNLOAD"), &stru_24E0011F0, CFSTR("Software Update"));
      v13 = 1;
      v3 = (__CFString *)v14;
    }
    v29 = v3;
    if ((v13 & 1) != 0)

    if ((v15 & 1) != 0)
    if ((v17 & 1) != 0)

    if ((v19 & 1) != 0)
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  return v29;
}

- (NSString)progressString
{
  os_log_t oslog;
  id v4[2];
  SUSUISoftwareUpdateManager *v5;
  NSString *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  v4[1] = (id)a2;
  if ((PSIsRunningInAssistant() & 1) != 0)
  {
    v4[0] = -[SUSUISoftwareUpdateManager statusStringForBuddy](v5, "statusStringForBuddy");
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v7, (uint64_t)"-[SUSUISoftwareUpdateManager progressString]", (uint64_t)v4[0]);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v7, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = (NSString *)v4[0];
    objc_storeStrong(v4, 0);
  }
  else
  {
    v6 = v5->_progressString;
  }
  return v6;
}

- (id)actionStringForBuddy
{
  unint64_t v3;

  v3 = (self->_state - 6);
  if (v3 <= 0xA)
    __asm { BR              X8 }
  return &stru_24E0011F0;
}

- (NSString)actionString
{
  os_log_t oslog;
  id v4[2];
  SUSUISoftwareUpdateManager *v5;
  NSString *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  v4[1] = (id)a2;
  if ((PSIsRunningInAssistant() & 1) != 0)
  {
    v4[0] = -[SUSUISoftwareUpdateManager actionStringForBuddy](v5, "actionStringForBuddy");
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v7, (uint64_t)"-[SUSUISoftwareUpdateManager actionString]", (uint64_t)v4[0]);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v7, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = (NSString *)v4[0];
    objc_storeStrong(v4, 0);
  }
  else
  {
    v6 = v5->_actionString;
  }
  return v6;
}

- (void)_setState:(int)a3 preferredUpdateError:(id)a4 alternateUpdateError:(id)a5
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  objc_class *v13;
  objc_class *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  id v31;
  const __CFString *v32;
  id v33;
  int v34;
  uint64_t *v35;
  uint8_t *v36;
  id v37;
  id v38;
  int v39;
  const __CFString *v40;
  const __CFString *v41;
  id v42;
  id v43;
  int v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  id v48;
  int v49;
  const __CFString *v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  os_log_t v60;
  os_log_type_t v61[4];
  id v62;
  id v63;
  int v64;
  id v65;
  const __CFString *v66;
  id v67;
  int v68;
  uint64_t *v69;
  uint8_t *buf;
  id v71;
  id v72;
  int v73;
  const __CFString *v74;
  const __CFString *v75;
  id v76;
  id v77;
  int v78;
  const __CFString *v79;
  const __CFString *v80;
  id WeakRetained;
  id v82;
  int v83;
  const __CFString *v84;
  const __CFString *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const __CFString *v89;
  const __CFString *v90;
  uint64_t v91;
  uint64_t v92;
  const __CFString *v93;
  os_log_t log;
  os_log_type_t v95[4];
  id v96;
  id v97;
  int v98;
  const char *v99;
  id obj;
  uint64_t v101;
  int v102;
  int v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void *v105;
  id v106;
  uint64_t v107;
  int v108;
  int v109;
  void (*v110)(uint64_t);
  void *v111;
  _QWORD v112[7];
  unsigned int v113;
  int v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  int v120;
  id v121;
  id v122;
  char v123;
  id v124;
  char v125;
  id v126;
  char v127;
  id v128;
  char v129;
  id v130;
  char v131;
  id v132;
  char v133;
  id v134;
  char v135;
  id v136;
  char v137;
  id v138;
  char v139;
  id v140;
  id v141;
  os_log_type_t v142;
  os_log_t v143;
  int v144;
  id v145;
  id v146;
  char v147;
  id v148;
  char v149;
  id v150;
  char v151;
  id v152;
  char v153;
  id v154;
  char v155;
  id v156;
  char v157;
  id v158;
  char v159;
  id v160;
  char v161;
  id v162;
  char v163;
  id v164;
  id v165;
  os_log_type_t type;
  os_log_t oslog;
  id v168;
  id location;
  unsigned int v170;
  SEL v171;
  id v172;
  _BYTE v173[208];
  _BYTE v174[184];
  uint64_t v175;

  obj = a5;
  v99 = "-[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:]";
  v175 = *MEMORY[0x24BDAC8D0];
  v172 = self;
  v171 = a2;
  v170 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v168 = 0;
  objc_storeStrong(&v168, obj);
  if ((*((_BYTE *)v172 + 51) & 1) != 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v95 = type;
      v96 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      v97 = v96;
      v165 = v97;
      v98 = *((_DWORD *)v172 + 22);
      v5 = *((_QWORD *)v172 + 15) == 0;
      v163 = 0;
      if (v5)
      {
        v93 = CFSTR("N/A");
      }
      else
      {
        v164 = (id)objc_msgSend(*((id *)v172 + 15), "humanReadableUpdateName");
        v163 = 1;
        v93 = (const __CFString *)v164;
      }
      v90 = v93;
      v91 = *((_QWORD *)v172 + 15);
      v92 = *((_QWORD *)v172 + 20);
      v6 = *((_QWORD *)v172 + 16) == 0;
      v161 = 0;
      if (v6)
      {
        v89 = CFSTR("N/A");
      }
      else
      {
        v162 = (id)objc_msgSend(*((id *)v172 + 16), "humanReadableUpdateName");
        v161 = 1;
        v89 = (const __CFString *)v162;
      }
      v85 = v89;
      v86 = *((_QWORD *)v172 + 16);
      v87 = *((_QWORD *)v172 + 21);
      v88 = *((_QWORD *)v172 + 1);
      v7 = *((_QWORD *)v172 + 1) == 0;
      v159 = 0;
      v157 = 0;
      v155 = 0;
      if (v7
        || (v160 = (id)objc_msgSend(*((id *)v172 + 1), "descriptor"), v159 = 1, !v160))
      {
        v84 = CFSTR("N/A");
      }
      else
      {
        v158 = (id)objc_msgSend(*((id *)v172 + 1), "descriptor");
        v83 = 1;
        v157 = 1;
        v156 = (id)objc_msgSend(v158, "humanReadableUpdateName");
        v155 = 1;
        v84 = (const __CFString *)v156;
      }
      v80 = v84;
      WeakRetained = objc_loadWeakRetained((id *)v172 + 13);
      v82 = objc_loadWeakRetained((id *)v172 + 13);
      v153 = 0;
      v151 = 0;
      if (v82)
      {
        v154 = objc_loadWeakRetained((id *)v172 + 13);
        v78 = 1;
        v153 = 1;
        v8 = (objc_class *)objc_opt_class();
        v152 = NSStringFromClass(v8);
        v151 = 1;
        v79 = (const __CFString *)v152;
      }
      else
      {
        v79 = CFSTR("N/A");
      }
      v75 = v79;
      v76 = objc_loadWeakRetained((id *)v172 + 14);
      v77 = objc_loadWeakRetained((id *)v172 + 14);
      v149 = 0;
      v147 = 0;
      if (v77)
      {
        v150 = objc_loadWeakRetained((id *)v172 + 14);
        v73 = 1;
        v149 = 1;
        v9 = (objc_class *)objc_opt_class();
        v148 = NSStringFromClass(v9);
        v147 = 1;
        v74 = (const __CFString *)v148;
      }
      else
      {
        v74 = CFSTR("N/A");
      }
      v66 = v74;
      v72 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      v67 = v72;
      v146 = v67;
      v68 = *((_DWORD *)v172 + 22);
      v71 = SUSUISoftwareUpdateStateToString(v170);
      v145 = v71;
      v69 = &v15;
      buf = v174;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0((uint64_t)v174, (uint64_t)v99, (uint64_t)v97, v98, (uint64_t)v90, v91, v92, (uint64_t)v85, v86, v87, v88, (uint64_t)v80, (uint64_t)WeakRetained, (uint64_t)v75, (uint64_t)v76, (uint64_t)v74, (uint64_t)v67, v68, (uint64_t)v145,
        v170);
      _os_log_impl(&dword_21BF33000, log, v95[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSkipping setting state due to initial scan. _state: %{public}@ (%d), new state: %{public}@ (%d)", buf, 0xB4u);

      if ((v147 & 1) != 0)
      if ((v149 & 1) != 0)

      if ((v151 & 1) != 0)
      if ((v153 & 1) != 0)

      if ((v155 & 1) != 0)
      if ((v157 & 1) != 0)

      if ((v159 & 1) != 0)
      if ((v161 & 1) != 0)

      if ((v163 & 1) != 0)
      v65 = 0;
      objc_storeStrong(&v145, 0);
      objc_storeStrong(&v146, v65);
      objc_storeStrong(&v165, v65);
    }
    objc_storeStrong((id *)&oslog, 0);
    v144 = 1;
  }
  else
  {
    v143 = (os_log_t)_SUSUILoggingFacility();
    v142 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      v60 = v143;
      *(_DWORD *)v61 = v142;
      v62 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      v63 = v62;
      v141 = v63;
      v64 = *((_DWORD *)v172 + 22);
      v10 = *((_QWORD *)v172 + 15) == 0;
      v139 = 0;
      if (v10)
      {
        v59 = CFSTR("N/A");
      }
      else
      {
        v140 = (id)objc_msgSend(*((id *)v172 + 15), "humanReadableUpdateName");
        v139 = 1;
        v59 = (const __CFString *)v140;
      }
      v56 = v59;
      v57 = *((_QWORD *)v172 + 15);
      v58 = *((_QWORD *)v172 + 20);
      v11 = *((_QWORD *)v172 + 16) == 0;
      v137 = 0;
      if (v11)
      {
        v55 = CFSTR("N/A");
      }
      else
      {
        v138 = (id)objc_msgSend(*((id *)v172 + 16), "humanReadableUpdateName");
        v137 = 1;
        v55 = (const __CFString *)v138;
      }
      v51 = v55;
      v52 = *((_QWORD *)v172 + 16);
      v53 = *((_QWORD *)v172 + 21);
      v54 = *((_QWORD *)v172 + 1);
      v12 = *((_QWORD *)v172 + 1) == 0;
      v135 = 0;
      v133 = 0;
      v131 = 0;
      if (v12
        || (v136 = (id)objc_msgSend(*((id *)v172 + 1), "descriptor"), v135 = 1, !v136))
      {
        v50 = CFSTR("N/A");
      }
      else
      {
        v134 = (id)objc_msgSend(*((id *)v172 + 1), "descriptor");
        v49 = 1;
        v133 = 1;
        v132 = (id)objc_msgSend(v134, "humanReadableUpdateName");
        v131 = 1;
        v50 = (const __CFString *)v132;
      }
      v46 = v50;
      v47 = objc_loadWeakRetained((id *)v172 + 13);
      v48 = objc_loadWeakRetained((id *)v172 + 13);
      v129 = 0;
      v127 = 0;
      if (v48)
      {
        v130 = objc_loadWeakRetained((id *)v172 + 13);
        v44 = 1;
        v129 = 1;
        v13 = (objc_class *)objc_opt_class();
        v128 = NSStringFromClass(v13);
        v127 = 1;
        v45 = (const __CFString *)v128;
      }
      else
      {
        v45 = CFSTR("N/A");
      }
      v41 = v45;
      v42 = objc_loadWeakRetained((id *)v172 + 14);
      v43 = objc_loadWeakRetained((id *)v172 + 14);
      v125 = 0;
      v123 = 0;
      if (v43)
      {
        v126 = objc_loadWeakRetained((id *)v172 + 14);
        v39 = 1;
        v125 = 1;
        v14 = (objc_class *)objc_opt_class();
        v124 = NSStringFromClass(v14);
        v123 = 1;
        v40 = (const __CFString *)v124;
      }
      else
      {
        v40 = CFSTR("N/A");
      }
      v32 = v40;
      v38 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      v33 = v38;
      v122 = v33;
      v34 = *((_DWORD *)v172 + 22);
      v37 = SUSUISoftwareUpdateStateToString(v170);
      v121 = v37;
      v35 = &v15;
      v36 = v173;
      __os_log_helper_16_2_21_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0_8_66_8_66((uint64_t)v173, (uint64_t)v99, (uint64_t)v63, v64, (uint64_t)v56, v57, v58, (uint64_t)v51, v52, v53, v54, (uint64_t)v46, (uint64_t)v47, (uint64_t)v41, (uint64_t)v42, (uint64_t)v40, (uint64_t)v33, v34, (uint64_t)v121,
        v170,
        (uint64_t)location,
        (uint64_t)v168);
      _os_log_impl(&dword_21BF33000, v60, v61[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAssigning new state: %{public}@ (%d) -> %{public}@ (%d). preferredUpdateError: %{public}@, alternateUpdateError: %{public}@", v36, 0xC8u);

      if ((v123 & 1) != 0)
      if ((v125 & 1) != 0)

      if ((v127 & 1) != 0)
      if ((v129 & 1) != 0)

      if ((v131 & 1) != 0)
      if ((v133 & 1) != 0)

      if ((v135 & 1) != 0)
      if ((v137 & 1) != 0)

      if ((v139 & 1) != 0)
      v31 = 0;
      objc_storeStrong(&v121, 0);
      objc_storeStrong(&v122, v31);
      objc_storeStrong(&v141, v31);
    }
    objc_storeStrong((id *)&v143, 0);
    v120 = 0;
    v120 = *((_DWORD *)v172 + 22);
    v119 = *((id *)v172 + 20);
    v118 = *((id *)v172 + 29);
    v117 = *((id *)v172 + 21);
    v116 = *((id *)v172 + 30);
    v30 = (id *)&v107;
    v107 = MEMORY[0x24BDAC760];
    v108 = -1073741824;
    v109 = 0;
    v110 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke;
    v111 = &unk_24DFFC860;
    v23 = (id *)v112;
    v112[0] = v172;
    v113 = v170;
    v24 = v30 + 5;
    v112[1] = v119;
    v25 = v30 + 6;
    v112[2] = v118;
    v26 = v30 + 7;
    v112[3] = v117;
    v27 = v30 + 8;
    v112[4] = v116;
    v28 = v30 + 9;
    v112[5] = location;
    v29 = v30 + 10;
    v112[6] = v168;
    v114 = v120;
    v115 = (id)MEMORY[0x220773A28](v30);
    if (v170 < 5)
    {
      (*((void (**)(void))v115 + 2))();
    }
    else
    {
      v21 = v172;
      v18 = location;
      v19 = v168;
      v20 = &v101;
      v101 = MEMORY[0x24BDAC760];
      v102 = -1073741824;
      v103 = 0;
      v104 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_2;
      v105 = &unk_24DFF7BA8;
      v22 = &v106;
      v106 = v115;
      objc_msgSend(v21, "refreshErrors:alternateError:completion:", v18, v19, v20);
      objc_storeStrong(v22, 0);
    }
    v17 = 0;
    objc_storeStrong(&v115, 0);
    objc_storeStrong(v29, v17);
    objc_storeStrong(v28, v17);
    objc_storeStrong(v27, v17);
    objc_storeStrong(v26, v17);
    objc_storeStrong(v25, v17);
    objc_storeStrong(v24, v17);
    objc_storeStrong(v23, v17);
    objc_storeStrong(&v116, v17);
    objc_storeStrong(&v117, v17);
    objc_storeStrong(&v118, v17);
    objc_storeStrong(&v119, v17);
    v144 = 0;
  }
  v16 = 0;
  objc_storeStrong(&v168, 0);
  objc_storeStrong(&location, v16);
}

void __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke(uint64_t a1)
{
  BOOL v1;
  BOOL v2;
  BOOL v3;
  objc_class *v4;
  objc_class *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_block_t v10[14];
  dispatch_queue_t queue;
  id *v12;
  id v13;
  int v14;
  id v15;
  id v16;
  int v17;
  unint64_t v18;
  id obj;
  const __CFString *v20;
  dispatch_block_t *v21;
  uint8_t *buf;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id v27;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  id WeakRetained;
  id v33;
  int v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  os_log_t log;
  os_log_type_t type[4];
  id v47;
  id v48;
  int v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  int v53;
  int v54;
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  int v58;
  int v59;
  id location;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  id v79;
  unsigned __int8 v80;
  id v81[3];
  _BYTE v82[184];
  uint64_t v83;

  v50 = a1;
  v51 = "-[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:]_block_invoke";
  v83 = *MEMORY[0x24BDAC8D0];
  v81[2] = (id)a1;
  v81[1] = (id)a1;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) == *(_DWORD *)(a1 + 88)
    && (objc_msgSend(*(id *)(v50 + 32), "errorsAreEqual:error2:oldDescription:", *(_QWORD *)(*(_QWORD *)(v50 + 32) + 160), *(_QWORD *)(v50 + 40), *(_QWORD *)(v50 + 48)) & 1) != 0&& (objc_msgSend(*(id *)(v50 + 32), "errorsAreEqual:error2:oldDescription:", *(_QWORD *)(*(_QWORD *)(v50 + 32) + 168), *(_QWORD *)(v50 + 56), *(_QWORD *)(v50 + 64)) & 1) != 0)
  {
    v81[0] = _SUSUILoggingFacility();
    v80 = 0;
    if (os_log_type_enabled((os_log_t)v81[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_t)v81[0];
      *(_DWORD *)type = v80;
      v47 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v50 + 32) + 88));
      v48 = v47;
      v79 = v48;
      v49 = *(_DWORD *)(*(_QWORD *)(v50 + 32) + 88);
      v1 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 120) == 0;
      v77 = 0;
      if (v1)
      {
        v44 = CFSTR("N/A");
      }
      else
      {
        v78 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v50 + 32) + 120), "humanReadableUpdateName");
        v77 = 1;
        v44 = (const __CFString *)v78;
      }
      v41 = v44;
      v42 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 120);
      v43 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 160);
      v2 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 128) == 0;
      v75 = 0;
      if (v2)
      {
        v40 = CFSTR("N/A");
      }
      else
      {
        v76 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v50 + 32) + 128), "humanReadableUpdateName");
        v75 = 1;
        v40 = (const __CFString *)v76;
      }
      v36 = v40;
      v37 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 128);
      v38 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 168);
      v39 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 8);
      v3 = *(_QWORD *)(*(_QWORD *)(v50 + 32) + 8) == 0;
      v73 = 0;
      v71 = 0;
      v69 = 0;
      if (v3
        || (v74 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v50 + 32) + 8), "descriptor"), v73 = 1, !v74))
      {
        v35 = CFSTR("N/A");
      }
      else
      {
        v72 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v50 + 32) + 8), "descriptor");
        v34 = 1;
        v71 = 1;
        v70 = (id)objc_msgSend(v72, "humanReadableUpdateName");
        v69 = 1;
        v35 = (const __CFString *)v70;
      }
      v31 = v35;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
      v33 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
      v67 = 0;
      v65 = 0;
      if (v33)
      {
        v68 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
        v29 = 1;
        v67 = 1;
        v4 = (objc_class *)objc_opt_class();
        v66 = NSStringFromClass(v4);
        v65 = 1;
        v30 = (const __CFString *)v66;
      }
      else
      {
        v30 = CFSTR("N/A");
      }
      v26 = v30;
      v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 112));
      v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 112));
      v63 = 0;
      v61 = 0;
      if (v28)
      {
        v64 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 112));
        v24 = 1;
        v63 = 1;
        v5 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v5);
        v61 = 1;
        v25 = (const __CFString *)v62;
      }
      else
      {
        v25 = CFSTR("N/A");
      }
      v20 = v25;
      v23 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v50 + 32) + 88));
      location = v23;
      v6 = *(_DWORD *)(*(_QWORD *)(v50 + 32) + 88);
      v7 = *(_QWORD *)(v50 + 72);
      v8 = *(_QWORD *)(v50 + 80);
      v21 = v10;
      buf = v82;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_8_66((uint64_t)v82, (uint64_t)v51, (uint64_t)v48, v49, (uint64_t)v41, v42, v43, (uint64_t)v36, v37, v38, v39, (uint64_t)v31, (uint64_t)WeakRetained, (uint64_t)v26, (uint64_t)v27, (uint64_t)v25, (uint64_t)location, v6, v7,
        v8);
      _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSkipping setting state due to same error. _state: %{public}@ (%d), preferredError: %{public}@ alternateError: %{public}@", buf, 0xB8u);

      if ((v61 & 1) != 0)
      if ((v63 & 1) != 0)

      if ((v65 & 1) != 0)
      if ((v67 & 1) != 0)

      if ((v69 & 1) != 0)
      if ((v71 & 1) != 0)

      if ((v73 & 1) != 0)
      if ((v75 & 1) != 0)

      if ((v77 & 1) != 0)
      obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v79, obj);
    }
    objc_storeStrong(v81, 0);
  }
  else
  {
    v9 = v50;
    *(_DWORD *)(*(_QWORD *)(v50 + 32) + 88) = *(_DWORD *)(v50 + 88);
    v18 = (*(_DWORD *)(*(_QWORD *)(v9 + 32) + 88) - 6);
    if (v18 <= 8)
      __asm { BR              X8 }
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
      objc_msgSend(v15, "manager:didTransitionToState:fromState:", *(_QWORD *)(v50 + 32), *(unsigned int *)(v50 + 88), *(unsigned int *)(v50 + 92));

    }
    else
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(v50 + 32) + 104));
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        queue = (dispatch_queue_t)MEMORY[0x24BDAC9B8];
        v10[13] = &v52;
        v52 = MEMORY[0x24BDAC760];
        v53 = -1073741824;
        v54 = 0;
        v55 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_278;
        v56 = &unk_24DFF7F18;
        v12 = &v57;
        v57 = *(id *)(v50 + 32);
        v58 = *(_DWORD *)(v50 + 88);
        v59 = *(_DWORD *)(v50 + 92);
        dispatch_async(queue, &v52);

        objc_storeStrong(&v57, 0);
      }
    }
  }
}

void __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_278(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(WeakRetained, "manager:didTransitionToState:fromState:error:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));

}

uint64_t __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

- (void)setState:(int)a3 withDownloadUpdateError:(id)a4
{
  SUDescriptor *v4;
  SUDownload *v5;
  char v6;
  SUDescriptor *v7;
  SUDownload *v8;
  char v9;
  id location;
  unsigned int v11;
  SEL v12;
  SUSUISoftwareUpdateManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v8 = -[SUSUISoftwareUpdateManager download](v13, "download");
  v7 = -[SUDownload descriptor](v8, "descriptor");
  v9 = -[SUDescriptor isEqual:](v7, "isEqual:", v13->_preferredUpdate);

  if ((v9 & 1) != 0)
  {
    -[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:](v13, "_setState:preferredUpdateError:alternateUpdateError:", v11, location, v13->_alternateUpdateError);
  }
  else
  {
    v5 = -[SUSUISoftwareUpdateManager download](v13, "download");
    v4 = -[SUDownload descriptor](v5, "descriptor");
    v6 = -[SUDescriptor isEqual:](v4, "isEqual:", v13->_alternateUpdate);

    if ((v6 & 1) != 0)
      -[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:](v13, "_setState:preferredUpdateError:alternateUpdateError:", v11, v13->_preferredUpdateError, location);
  }
  objc_storeStrong(&location, 0);
}

- (void)setState:(int)a3
{
  -[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:](self, "_setState:preferredUpdateError:alternateUpdateError:", a3, 0);
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSUISoftwareUpdateManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  SUSUISoftwareUpdateManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_concurrentQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __58__SUSUISoftwareUpdateManager_setClearingSpaceForDownload___block_invoke;
  v8 = &unk_24DFF7EA0;
  v9 = self;
  v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

void __58__SUSUISoftwareUpdateManager_setClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  BOOL v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  const __CFString *v10;
  uint8_t *v11[10];
  uint8_t *buf;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  id v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  id WeakRetained;
  id v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  os_log_t log;
  os_log_type_t type[4];
  id v36;
  uint64_t v37;
  int v38;
  os_log_t *v39;
  uint64_t v40;
  const char *v41;
  char v42;
  id v43;
  char v44;
  id v45;
  char v46;
  id v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  __CFString *v57;
  char v58;
  char v59;
  id location;
  unsigned __int8 v61;
  id v62[3];
  _BYTE v63[168];
  uint64_t v64;

  v39 = (os_log_t *)&v59;
  v40 = a1;
  v41 = "-[SUSUISoftwareUpdateManager setClearingSpaceForDownload:]_block_invoke";
  v64 = *MEMORY[0x24BDAC8D0];
  v62[2] = (id)a1;
  v62[1] = (id)a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 53) & 1) != (*(_BYTE *)(a1 + 40) & 1))
  {
    v1 = _SUSUILoggingFacility();
    v2 = v39;
    v39[3] = v1;
    v61 = 0;
    if (os_log_type_enabled(v2[3], OS_LOG_TYPE_DEFAULT))
    {
      log = v39[3];
      *(_DWORD *)type = v61;
      v36 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v40 + 32) + 88));
      v3 = v36;
      v4 = v40;
      v37 = (uint64_t)v3;
      v39[1] = v3;
      v38 = *(_DWORD *)(*(_QWORD *)(v4 + 32) + 88);
      LOBYTE(v4) = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 120) == 0;
      v58 = 0;
      if ((v4 & 1) != 0)
      {
        v33 = CFSTR("N/A");
      }
      else
      {
        v5 = (const __CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v40 + 32) + 120), "humanReadableUpdateName");
        *v39 = (os_log_t)v5;
        v58 = 1;
        v33 = v5;
      }
      v30 = v33;
      v31 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 120);
      v32 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 160);
      v6 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 128) == 0;
      v56 = 0;
      if (v6)
      {
        v29 = CFSTR("N/A");
      }
      else
      {
        v57 = (__CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v40 + 32) + 128), "humanReadableUpdateName");
        v56 = 1;
        v29 = v57;
      }
      v25 = v29;
      v26 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 128);
      v27 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 168);
      v28 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 8);
      v7 = *(_QWORD *)(*(_QWORD *)(v40 + 32) + 8) == 0;
      v54 = 0;
      v52 = 0;
      v50 = 0;
      if (v7
        || (v55 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v40 + 32) + 8), "descriptor"), v54 = 1, !v55))
      {
        v24 = CFSTR("N/A");
      }
      else
      {
        v53 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v40 + 32) + 8), "descriptor");
        v23 = 1;
        v52 = 1;
        v51 = (id)objc_msgSend(v53, "humanReadableUpdateName");
        v50 = 1;
        v24 = (const __CFString *)v51;
      }
      v20 = v24;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 104));
      v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 104));
      v48 = 0;
      v46 = 0;
      if (v22)
      {
        v49 = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 104));
        v18 = 1;
        v48 = 1;
        v8 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v8);
        v46 = 1;
        v19 = (const __CFString *)v47;
      }
      else
      {
        v19 = CFSTR("N/A");
      }
      v15 = v19;
      v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 112));
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 112));
      v44 = 0;
      v42 = 0;
      if (v17)
      {
        v45 = objc_loadWeakRetained((id *)(*(_QWORD *)(v40 + 32) + 112));
        v13 = 1;
        v44 = 1;
        v9 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v9);
        v42 = 1;
        v14 = (const __CFString *)v43;
      }
      else
      {
        v14 = CFSTR("N/A");
      }
      v10 = CFSTR("YES");
      if ((*(_BYTE *)(v40 + 40) & 1) == 0)
        v10 = CFSTR("NO");
      v11[9] = (uint8_t *)v11;
      buf = v63;
      __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v63, (uint64_t)v41, v37, v38, (uint64_t)v30, v31, v32, (uint64_t)v25, v26, v27, v28, (uint64_t)v20, (uint64_t)WeakRetained, (uint64_t)v15, (uint64_t)v16, (uint64_t)v14, (uint64_t)v10);
      _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdating _clearingSpaceForDownload to %{public}@", buf, 0x9Eu);
      if ((v42 & 1) != 0)

      if ((v44 & 1) != 0)
      if ((v46 & 1) != 0)

      if ((v48 & 1) != 0)
      if ((v50 & 1) != 0)

      if ((v52 & 1) != 0)
      if ((v54 & 1) != 0)

      if ((v56 & 1) != 0)
      if ((v58 & 1) != 0)

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(v62, 0);
    *(_BYTE *)(*(_QWORD *)(v40 + 32) + 53) = *(_BYTE *)(v40 + 40) & 1;
  }
}

- (BOOL)clearingSpaceForDownload
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  SUSUISoftwareUpdateManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = self->_concurrentQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __54__SUSUISoftwareUpdateManager_clearingSpaceForDownload__block_invoke;
  v9 = &unk_24DFFC3D8;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __54__SUSUISoftwareUpdateManager_clearingSpaceForDownload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 53) & 1;
  return result;
}

- (void)checkAndSetReadyToInstall
{
  uint64_t v2;
  id v3;
  SUSUISoftwareUpdateClientManager *suClient;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char, id);
  void *v9;
  SUSUISoftwareUpdateManager *v10;
  int v11;
  id v12;
  int state;
  SEL v14;
  SUSUISoftwareUpdateManager *v15;

  v15 = self;
  v14 = a2;
  state = 0;
  state = self->_state;
  v12 = objc_alloc_init(MEMORY[0x24BEAEC20]);
  v2 = -[SUSUISoftwareUpdateManager ignorableConstraints](v15, "ignorableConstraints");
  objc_msgSend(v12, "setIgnorableConstraints:", v2);
  suClient = v15->_suClient;
  v3 = v12;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __55__SUSUISoftwareUpdateManager_checkAndSetReadyToInstall__block_invoke;
  v9 = &unk_24DFFC888;
  v10 = v15;
  v11 = state;
  -[SUSUISoftwareUpdateClientManager isUpdateReadyForInstallationWithOptions:completion:](suClient, "isUpdateReadyForInstallationWithOptions:completion:", v3);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
}

void __55__SUSUISoftwareUpdateManager_checkAndSetReadyToInstall__block_invoke(uint64_t a1, char a2, id obj)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  int v11;
  uint64_t *v12;
  uint8_t *buf;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id WeakRetained;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  os_log_t log;
  os_log_type_t type[4];
  id v37;
  id v38;
  int v39;
  const char *v40;
  uint64_t v41;
  id obja;
  id v43;
  unsigned int v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  __CFString *v62;
  id v63;
  unsigned __int8 v64;
  id v65[2];
  id location;
  char v67;
  uint64_t v68;
  _BYTE v69[168];
  uint64_t v70;

  v41 = a1;
  v40 = "-[SUSUISoftwareUpdateManager checkAndSetReadyToInstall]_block_invoke";
  v70 = *MEMORY[0x24BDAC8D0];
  v68 = a1;
  v67 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v65[1] = (id)v41;
  v65[0] = _SUSUILoggingFacility();
  v64 = 0;
  if (os_log_type_enabled((os_log_t)v65[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v65[0];
    *(_DWORD *)type = v64;
    v37 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v41 + 32) + 88));
    v38 = v37;
    v63 = v38;
    v39 = *(_DWORD *)(*(_QWORD *)(v41 + 32) + 88);
    v3 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 120) == 0;
    v61 = 0;
    if (v3)
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v62 = (__CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v41 + 32) + 120), "humanReadableUpdateName");
      v61 = 1;
      v34 = v62;
    }
    v31 = v34;
    v32 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 120);
    v33 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 160);
    v4 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 128) == 0;
    v59 = 0;
    if (v4)
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v60 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v41 + 32) + 128), "humanReadableUpdateName");
      v59 = 1;
      v30 = (const __CFString *)v60;
    }
    v26 = v30;
    v27 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 128);
    v28 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 168);
    v29 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 8);
    v5 = *(_QWORD *)(*(_QWORD *)(v41 + 32) + 8) == 0;
    v57 = 0;
    v55 = 0;
    v53 = 0;
    if (v5
      || (v58 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v41 + 32) + 8), "descriptor"),
          v57 = 1,
          !v58))
    {
      v25 = CFSTR("N/A");
    }
    else
    {
      v56 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v41 + 32) + 8), "descriptor");
      v24 = 1;
      v55 = 1;
      v54 = (id)objc_msgSend(v56, "humanReadableUpdateName");
      v53 = 1;
      v25 = (const __CFString *)v54;
    }
    v21 = v25;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 104));
    v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 104));
    v51 = 0;
    v49 = 0;
    if (v23)
    {
      v52 = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 104));
      v19 = 1;
      v51 = 1;
      v6 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v6);
      v49 = 1;
      v20 = (const __CFString *)v50;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v16 = v20;
    v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 112));
    v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 112));
    v47 = 0;
    v45 = 0;
    if (v18)
    {
      v48 = objc_loadWeakRetained((id *)(*(_QWORD *)(v41 + 32) + 112));
      v14 = 1;
      v47 = 1;
      v7 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v7);
      v45 = 1;
      v15 = (const __CFString *)v46;
    }
    else
    {
      v15 = CFSTR("N/A");
    }
    v12 = &v9;
    buf = v69;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v69, (uint64_t)v40, (uint64_t)v38, v39, (uint64_t)v31, v32, v33, (uint64_t)v26, v27, v28, v29, (uint64_t)v21, (uint64_t)WeakRetained, (uint64_t)v16, (uint64_t)v17, (uint64_t)v15, v67 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisReady: %d; error: %{public}@",
      buf,
      0xA4u);
    if ((v45 & 1) != 0)

    if ((v47 & 1) != 0)
    if ((v49 & 1) != 0)

    if ((v51 & 1) != 0)
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    objc_storeStrong(&v63, 0);
  }
  objc_storeStrong(v65, 0);
  if (*(_DWORD *)(*(_QWORD *)(v41 + 32) + 88) == *(_DWORD *)(v41 + 40))
  {
    if (location)
    {
      v44 = 0;
      v10 = &v43;
      v43 = 0;
      v8 = *(void **)(v41 + 32);
      obja = 0;
      v11 = objc_msgSend(v8, "shouldSetStateForInstallError:outError:outState:", location, &obja, &v44);
      objc_storeStrong(v10, obja);
      if ((v11 & 1) != 0)
        objc_msgSend(*(id *)(v41 + 32), "setState:withDownloadUpdateError:", v44, v43);
      objc_storeStrong(&v43, 0);
    }
    else
    {
      objc_msgSend(*(id *)(v41 + 32), "setState:withDownloadUpdateError:", 10, 0);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)runEntryScan:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  -[SUSUISoftwareUpdateManager setState:](self, "setState:");
  self->_runningInitialScan = v3;
  self->_userInitiatedRescan = 0;
  -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](self, "scanForUpdatesCompletion:", 0);
}

- (void)refreshState
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t *v8;
  SUSUISoftwareUpdateClientManager *suClient;
  id *v10;
  os_log_t v11;
  os_log_type_t v12[4];
  uint8_t *v13;
  id v14;
  int v15;
  uint64_t *v16;
  uint8_t *buf;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id WeakRetained;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v34;
  const __CFString *v35;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v38;
  os_log_t log;
  os_log_type_t type[4];
  id v41;
  id v42;
  int state;
  const char *v44;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(id *, void *, void *);
  void *v49;
  SUSUISoftwareUpdateManager *v50;
  os_log_type_t v51;
  os_log_t oslog;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  __CFString *v68;
  char v69;
  __CFString *v70;
  id location;
  unsigned __int8 v72;
  id v73[2];
  SUSUISoftwareUpdateManager *v74;
  _BYTE v75[16];
  _BYTE v76[152];
  uint64_t v77;

  v44 = "-[SUSUISoftwareUpdateManager refreshState]";
  v77 = *MEMORY[0x24BDAC8D0];
  v74 = self;
  v73[1] = (id)a2;
  v73[0] = _SUSUILoggingFacility();
  v72 = 0;
  if (os_log_type_enabled((os_log_t)v73[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v73[0];
    *(_DWORD *)type = v72;
    v41 = SUSUISoftwareUpdateStateToString(v74->_state);
    v42 = v41;
    location = v42;
    state = v74->_state;
    v2 = v74->_preferredUpdate == 0;
    v69 = 0;
    if (v2)
    {
      v38 = CFSTR("N/A");
    }
    else
    {
      v70 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v74->_preferredUpdate, "humanReadableUpdateName");
      v69 = 1;
      v38 = v70;
    }
    v35 = v38;
    preferredUpdate = v74->_preferredUpdate;
    preferredUpdateError = v74->_preferredUpdateError;
    v3 = v74->_alternateUpdate == 0;
    v67 = 0;
    if (v3)
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v68 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v74->_alternateUpdate, "humanReadableUpdateName");
      v67 = 1;
      v34 = v68;
    }
    v30 = v34;
    alternateUpdate = v74->_alternateUpdate;
    alternateUpdateError = v74->_alternateUpdateError;
    download = v74->_download;
    v4 = v74->_download == 0;
    v65 = 0;
    v63 = 0;
    v61 = 0;
    if (v4
      || (v66 = -[SUDownload descriptor](v74->_download, "descriptor"), v65 = 1, !v66))
    {
      v29 = CFSTR("N/A");
    }
    else
    {
      v64 = -[SUDownload descriptor](v74->_download, "descriptor");
      v28 = 1;
      v63 = 1;
      v62 = (id)objc_msgSend(v64, "humanReadableUpdateName");
      v61 = 1;
      v29 = (const __CFString *)v62;
    }
    v25 = v29;
    WeakRetained = objc_loadWeakRetained((id *)&v74->_delegate);
    v27 = objc_loadWeakRetained((id *)&v74->_delegate);
    v59 = 0;
    v57 = 0;
    if (v27)
    {
      v60 = objc_loadWeakRetained((id *)&v74->_delegate);
      v23 = 1;
      v59 = 1;
      v5 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v5);
      v57 = 1;
      v24 = (const __CFString *)v58;
    }
    else
    {
      v24 = CFSTR("N/A");
    }
    v20 = v24;
    v21 = objc_loadWeakRetained((id *)&v74->_hostController);
    v22 = objc_loadWeakRetained((id *)&v74->_hostController);
    v55 = 0;
    v53 = 0;
    if (v22)
    {
      v56 = objc_loadWeakRetained((id *)&v74->_hostController);
      v18 = 1;
      v55 = 1;
      v6 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v6);
      v53 = 1;
      v19 = (const __CFString *)v54;
    }
    else
    {
      v19 = CFSTR("N/A");
    }
    v16 = &v7;
    buf = v76;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v76, (uint64_t)v44, (uint64_t)v42, state, (uint64_t)v35, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v30, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v73, 0);
  v14 = (id)objc_msgSend(MEMORY[0x24BEAEA40], "sharedDevice");
  v15 = objc_msgSend(v14, "hasSemiSplatActive");

  if ((v15 & 1) != 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v51 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      *(_DWORD *)v12 = v51;
      v13 = v75;
      __os_log_helper_16_2_1_8_32((uint64_t)v75, (uint64_t)v44);
      _os_log_impl(&dword_21BF33000, v11, v12[0], "%s: Rollback already applied, show the user an alert to reboot, and show no available updates", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[SUSUISoftwareUpdateManager clearPastScanResults](v74, "clearPastScanResults");
    -[SUSUISoftwareUpdateManager setState:](v74, "setState:", 3);
    -[SUSUISoftwareUpdateManager handleRollbackApplied](v74, "handleRollbackApplied");
  }
  else
  {
    if (!v74->_state)
      -[SUSUISoftwareUpdateManager setState:](v74, "setState:", 1);
    suClient = v74->_suClient;
    v8 = &v45;
    v45 = MEMORY[0x24BDAC760];
    v46 = -1073741824;
    v47 = 0;
    v48 = __42__SUSUISoftwareUpdateManager_refreshState__block_invoke;
    v49 = &unk_24DFFC8B0;
    v10 = (id *)&v50;
    v50 = v74;
    -[SUSUISoftwareUpdateClientManager download:](suClient, "download:", v8);
    objc_storeStrong(v10, 0);
  }
}

void __42__SUSUISoftwareUpdateManager_refreshState__block_invoke(id *a1, void *a2, void *a3)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  id *v11;
  id *v12;
  id *v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  id v25;
  uint64_t *v26;
  uint8_t *buf;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  id v32;
  id v33;
  int v34;
  const __CFString *v35;
  const __CFString *v36;
  id WeakRetained;
  id v38;
  int v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  os_log_t log;
  os_log_type_t type[4];
  id v52;
  id v53;
  int v54;
  const char *v55;
  id obj;
  id *v57;
  uint64_t v58;
  int v59;
  int v60;
  void (*v61)(id *, char, id);
  void *v62;
  _QWORD v63[2];
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  char v79;
  id v80;
  char v81;
  id v82;
  id v83;
  unsigned __int8 v84;
  id v85[2];
  id v86;
  id location[2];
  _BYTE v88[184];
  uint64_t v89;

  v57 = a1;
  obj = a3;
  v55 = "-[SUSUISoftwareUpdateManager refreshState]_block_invoke";
  v89 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v86 = 0;
  objc_storeStrong(&v86, obj);
  v85[1] = v57;
  v85[0] = _SUSUILoggingFacility();
  v84 = 0;
  if (os_log_type_enabled((os_log_t)v85[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v85[0];
    *(_DWORD *)type = v84;
    v52 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v57[4] + 22));
    v53 = v52;
    v83 = v53;
    v54 = *((_DWORD *)v57[4] + 22);
    v3 = *((_QWORD *)v57[4] + 15) == 0;
    v81 = 0;
    if (v3)
    {
      v49 = CFSTR("N/A");
    }
    else
    {
      v82 = (id)objc_msgSend(*((id *)v57[4] + 15), "humanReadableUpdateName");
      v81 = 1;
      v49 = (const __CFString *)v82;
    }
    v46 = v49;
    v47 = *((_QWORD *)v57[4] + 15);
    v48 = *((_QWORD *)v57[4] + 20);
    v4 = *((_QWORD *)v57[4] + 16) == 0;
    v79 = 0;
    if (v4)
    {
      v45 = CFSTR("N/A");
    }
    else
    {
      v80 = (id)objc_msgSend(*((id *)v57[4] + 16), "humanReadableUpdateName");
      v79 = 1;
      v45 = (const __CFString *)v80;
    }
    v41 = v45;
    v42 = *((_QWORD *)v57[4] + 16);
    v43 = *((_QWORD *)v57[4] + 21);
    v44 = *((_QWORD *)v57[4] + 1);
    v5 = *((_QWORD *)v57[4] + 1) == 0;
    v77 = 0;
    v75 = 0;
    v73 = 0;
    if (v5
      || (v78 = (id)objc_msgSend(*((id *)v57[4] + 1), "descriptor"), v77 = 1, !v78))
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v76 = (id)objc_msgSend(*((id *)v57[4] + 1), "descriptor");
      v39 = 1;
      v75 = 1;
      v74 = (id)objc_msgSend(v76, "humanReadableUpdateName");
      v73 = 1;
      v40 = (const __CFString *)v74;
    }
    v36 = v40;
    WeakRetained = objc_loadWeakRetained((id *)v57[4] + 13);
    v38 = objc_loadWeakRetained((id *)v57[4] + 13);
    v71 = 0;
    v69 = 0;
    if (v38)
    {
      v72 = objc_loadWeakRetained((id *)v57[4] + 13);
      v34 = 1;
      v71 = 1;
      v6 = (objc_class *)objc_opt_class();
      v70 = NSStringFromClass(v6);
      v69 = 1;
      v35 = (const __CFString *)v70;
    }
    else
    {
      v35 = CFSTR("N/A");
    }
    v31 = v35;
    v32 = objc_loadWeakRetained((id *)v57[4] + 14);
    v33 = objc_loadWeakRetained((id *)v57[4] + 14);
    v67 = 0;
    v65 = 0;
    if (v33)
    {
      v68 = objc_loadWeakRetained((id *)v57[4] + 14);
      v29 = 1;
      v67 = 1;
      v7 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v7);
      v65 = 1;
      v30 = (const __CFString *)v66;
    }
    else
    {
      v30 = CFSTR("N/A");
    }
    v24 = v30;
    v25 = location[0];
    v28 = (id)objc_msgSend(location[0], "descriptor");
    v64 = v28;
    v26 = &v8;
    buf = v88;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0_8_66((uint64_t)v88, (uint64_t)v55, (uint64_t)v53, v54, (uint64_t)v46, v47, v48, (uint64_t)v41, v42, v43, v44, (uint64_t)v36, (uint64_t)WeakRetained, (uint64_t)v31, (uint64_t)v32, (uint64_t)v30, (uint64_t)v25, (uint64_t)v64, (uint64_t)v86);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ndownload: %p (owner SUDescriptor: %p), error: %{public}@", buf, 0xB2u);

    if ((v65 & 1) != 0)
    if ((v67 & 1) != 0)

    if ((v69 & 1) != 0)
    if ((v71 & 1) != 0)

    if ((v73 & 1) != 0)
    if ((v75 & 1) != 0)

    if ((v77 & 1) != 0)
    if ((v79 & 1) != 0)

    if ((v81 & 1) != 0)
    v23 = 0;
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v83, v23);
  }
  objc_storeStrong(v85, 0);
  objc_msgSend(v57[4], "setDownload:", location[0]);
  if (location[0])
  {
    v16 = (id)*((_QWORD *)v57[4] + 8);
    v18 = (id)objc_msgSend(location[0], "downloadOptions");
    v15 = objc_msgSend(v18, "downloadFeeAgreementStatus");
    v17 = (id)objc_msgSend(location[0], "descriptor");
    objc_msgSend(v16, "setCellularFeeAgreementStatus:forUpdate:", v15);

    v20 = (id)*((_QWORD *)v57[4] + 8);
    v22 = (id)objc_msgSend(location[0], "downloadOptions");
    v19 = objc_msgSend(v22, "termsAndConditionsAgreementStatus");
    v21 = (id)objc_msgSend(location[0], "descriptor");
    objc_msgSend(v20, "setTermsAgreementStatus:forUpdate:", v19);

  }
  v10 = (id)*((_QWORD *)v57[4] + 7);
  v9 = &v58;
  v58 = MEMORY[0x24BDAC760];
  v59 = -1073741824;
  v60 = 0;
  v61 = __42__SUSUISoftwareUpdateManager_refreshState__block_invoke_287;
  v62 = &unk_24DFF7E00;
  v12 = (id *)v63;
  v63[0] = v57[4];
  v11 = (id *)(v9 + 5);
  v13 = location;
  v63[1] = location[0];
  objc_msgSend(v10, "isScanning:", v9);
  v14 = 0;
  objc_storeStrong(v11, 0);
  objc_storeStrong(v12, v14);
  objc_storeStrong(&v86, v14);
  objc_storeStrong(v13, v14);
}

void __42__SUSUISoftwareUpdateManager_refreshState__block_invoke_287(id *a1, char a2, id obj)
{
  id v3;
  id *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  const __CFString *v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id obja;
  id v18;
  int v19;
  int v20;
  id v21;
  int v22;
  id v23;
  int v24;
  int v25;
  uint64_t *v26;
  uint8_t *buf;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  id v31;
  id v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  id WeakRetained;
  id v37;
  int v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  os_log_t log;
  os_log_type_t type[4];
  id v51;
  uint64_t v52;
  int v53;
  const char *v54;
  id *v55;
  char *v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  id v80;
  unsigned __int8 v81;
  os_log_t v82[2];
  id location;
  char v84;
  id *v85;
  _BYTE v86[168];
  uint64_t v87;

  v56 = &v75;
  v55 = a1;
  v54 = "-[SUSUISoftwareUpdateManager refreshState]_block_invoke";
  v87 = *MEMORY[0x24BDAC8D0];
  v85 = a1;
  v84 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v82[1] = (os_log_t)v55;
  v82[0] = (os_log_t)_SUSUILoggingFacility();
  v81 = 0;
  if (os_log_type_enabled(v82[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v56 + 11);
    *(_DWORD *)type = v81;
    v51 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v55[4] + 22));
    v3 = v51;
    v4 = v55;
    v52 = (uint64_t)v3;
    *((_QWORD *)v56 + 9) = v3;
    v53 = *((_DWORD *)v4[4] + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4] + 15) == 0;
    v79 = 0;
    if ((v4 & 1) != 0)
    {
      v48 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*((id *)v55[4] + 15), "humanReadableUpdateName");
      *((_QWORD *)v56 + 8) = v5;
      v79 = 1;
      v48 = v5;
    }
    v45 = v48;
    v46 = *((_QWORD *)v55[4] + 15);
    v47 = *((_QWORD *)v55[4] + 20);
    v6 = *((_QWORD *)v55[4] + 16) == 0;
    v78 = 0;
    if (v6)
    {
      v44 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*((id *)v55[4] + 16), "humanReadableUpdateName");
      *((_QWORD *)v56 + 6) = v7;
      v78 = 1;
      v44 = v7;
    }
    v40 = v44;
    v41 = *((_QWORD *)v55[4] + 16);
    v42 = *((_QWORD *)v55[4] + 21);
    v43 = *((_QWORD *)v55[4] + 1);
    v8 = *((_QWORD *)v55[4] + 1) == 0;
    v77 = 0;
    v76 = 0;
    v74 = 0;
    if (v8
      || (v9 = (id)objc_msgSend(*((id *)v55[4] + 1), "descriptor"),
          *((_QWORD *)v56 + 4) = v9,
          v77 = 1,
          !v9))
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v10 = (id)objc_msgSend(*((id *)v55[4] + 1), "descriptor");
      *((_QWORD *)v56 + 2) = v10;
      v38 = 1;
      v76 = 1;
      v11 = (const __CFString *)(id)objc_msgSend(v10, "humanReadableUpdateName");
      *(_QWORD *)v56 = v11;
      v74 = 1;
      v39 = v11;
    }
    v35 = v39;
    WeakRetained = objc_loadWeakRetained((id *)v55[4] + 13);
    v37 = objc_loadWeakRetained((id *)v55[4] + 13);
    v72 = 0;
    v70 = 0;
    if (v37)
    {
      v73 = objc_loadWeakRetained((id *)v55[4] + 13);
      v33 = 1;
      v72 = 1;
      v12 = (objc_class *)objc_opt_class();
      v71 = NSStringFromClass(v12);
      v70 = 1;
      v34 = (const __CFString *)v71;
    }
    else
    {
      v34 = CFSTR("N/A");
    }
    v30 = v34;
    v31 = objc_loadWeakRetained((id *)v55[4] + 14);
    v32 = objc_loadWeakRetained((id *)v55[4] + 14);
    v68 = 0;
    v66 = 0;
    if (v32)
    {
      v69 = objc_loadWeakRetained((id *)v55[4] + 14);
      v28 = 1;
      v68 = 1;
      v13 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v13);
      v66 = 1;
      v29 = (const __CFString *)v67;
    }
    else
    {
      v29 = CFSTR("N/A");
    }
    v14 = *((_QWORD *)v56 + 13);
    v26 = &v16;
    buf = v86;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v86, (uint64_t)v54, v52, v53, (uint64_t)v45, v46, v47, (uint64_t)v40, v41, v42, v43, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v30, (uint64_t)v31, (uint64_t)v29, v84 & 1, v14);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisScanning: %d; error: %{public}@",
      buf,
      0xA4u);
    if ((v66 & 1) != 0)

    if ((v68 & 1) != 0)
    if ((v70 & 1) != 0)

    if ((v72 & 1) != 0)
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v77 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v79 & 1) != 0)

    objc_storeStrong(&v80, 0);
  }
  objc_storeStrong((id *)v82, 0);
  v65 = (id)objc_msgSend(v55[4], "download");
  if ((v84 & 1) != 0)
    goto LABEL_58;
  v63 = 0;
  v61 = 0;
  v59 = 0;
  v57 = 0;
  v25 = 0;
  if (v65)
  {
    v23 = (id)objc_msgSend(v55[5], "descriptor");
    v64 = v23;
    v22 = 1;
    v63 = 1;
    v62 = (id)objc_msgSend(v55[4], "preferredUpdate");
    v61 = v22 & 1;
    v15 = objc_msgSend(v23, "isEqual:");
    v24 = 1;
    if ((v15 & 1) == 0)
    {
      v21 = (id)objc_msgSend(v55[5], "descriptor");
      v60 = v21;
      v20 = 1;
      v59 = 1;
      v58 = (id)objc_msgSend(v55[4], "alternateUpdate");
      v57 = v20 & 1;
      v24 = objc_msgSend(v21, "isEqual:");
    }
    v25 = v24;
  }
  v19 = v25;
  if ((v57 & 1) != 0)

  if ((v59 & 1) != 0)
  if ((v61 & 1) != 0)

  if ((v63 & 1) != 0)
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v55[4], "updateStateFromDownload:", v65);
    goto LABEL_59;
  }
  if ((objc_msgSend(v55[4], "shouldShowPreferredUpdateAsAlternate") & 1) != 0)
  {
    objc_msgSend(v55[4], "setState:", 6);
    goto LABEL_59;
  }
  v18 = (id)objc_msgSend(v55[4], "preferredUpdate");

  if (v18)
  {
    objc_msgSend(v55[4], "setState:", 8);
    goto LABEL_59;
  }
  if (*((_DWORD *)v55[4] + 22) != 3 && *((_DWORD *)v55[4] + 22) != 4)
LABEL_58:
    objc_msgSend(v55[4], "scanForUpdatesCompletion:", 0);
LABEL_59:
  obja = 0;
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&location, obja);
}

- (SUDescriptor)update
{
  id v3;
  id v4[2];
  SUSUISoftwareUpdateManager *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEAEC80]), "initWithPreferredDescriptor:alternateDescriptor:", v5->_preferredUpdate, v5->_alternateUpdate);
  v3 = (id)objc_msgSend(v4[0], "latestUpdate");
  objc_storeStrong(v4, 0);
  return (SUDescriptor *)v3;
}

- (void)downloadAlternateHidePreferred
{
  -[SUSUISoftwareUpdateManager setState:](self, "setState:", 13, a2, self);
}

- (void)hidePreferredUpdate
{
  id v2[2];
  SUSUISoftwareUpdateManager *v3;

  v3 = self;
  v2[1] = (id)a2;
  objc_storeStrong((id *)&self->_hiddenPreferredUpdate, self->_preferredUpdate);
  objc_storeStrong((id *)&v3->_preferredUpdate, v3->_alternateUpdate);
  objc_storeStrong((id *)&v3->_alternateUpdate, 0);
  v2[0] = v3->_preferredUpdateError;
  -[SUSUISoftwareUpdateManager setPreferredUpdateError:](v3, "setPreferredUpdateError:", v3->_alternateUpdateError);
  -[SUSUISoftwareUpdateManager setAlternateUpdateError:](v3, "setAlternateUpdateError:", v2[0]);
  v3->_hidingPreferredUpdate = 1;
  objc_storeStrong(v2, 0);
}

- (void)revealHiddenPreferredUpdate
{
  id v2[2];
  SUSUISoftwareUpdateManager *v3;

  v3 = self;
  v2[1] = (id)a2;
  objc_storeStrong((id *)&self->_alternateUpdate, self->_preferredUpdate);
  objc_storeStrong((id *)&v3->_preferredUpdate, v3->_hiddenPreferredUpdate);
  objc_storeStrong((id *)&v3->_hiddenPreferredUpdate, 0);
  v2[0] = v3->_preferredUpdateError;
  -[SUSUISoftwareUpdateManager setPreferredUpdateError:](v3, "setPreferredUpdateError:", v3->_alternateUpdateError);
  -[SUSUISoftwareUpdateManager setAlternateUpdateError:](v3, "setAlternateUpdateError:", v2[0]);
  v3->_hidingPreferredUpdate = 0;
  objc_storeStrong(v2, 0);
}

- (void)hideAlternateUpdate
{
  objc_storeStrong((id *)&self->_hiddenAlternateUpdate, self->_alternateUpdate);
  objc_storeStrong((id *)&self->_alternateUpdate, 0);
  self->_hidingAlternateUpdate = 1;
}

- (void)revealHiddenAlteranteUpdate
{
  objc_storeStrong((id *)&self->_alternateUpdate, self->_hiddenAlternateUpdate);
  objc_storeStrong((id *)&self->_hiddenAlternateUpdate, 0);
  self->_hidingAlternateUpdate = 0;
}

- (void)refreshErrors:(id)a3 alternateError:(id)a4 completion:(id)a5
{
  id v5;
  id v6;
  id v9;
  id v10;
  SUSUISoftwareUpdateClientManager *suClient;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(NSObject *, char, char, id, void *);
  void *v16;
  SUSUISoftwareUpdateManager *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[2];
  SUSUISoftwareUpdateManager *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v5 = objc_alloc(MEMORY[0x24BEAEC18]);
  v22 = (id)objc_msgSend(v5, "initWithDescriptor:", v26->_preferredUpdate);
  objc_msgSend(v22, "setAllowUnrestrictedCellularDownload:", -[SUSUISoftwareUpdateManager allowCellularOverride](v26, "allowCellularOverride"));
  objc_msgSend(v22, "setDownloadFeeAgreementStatus:", -[SUSUIUpdateAgreementManager cellularFeeAgreementStatusForUpdate:](v26->_updateAgreementManager, "cellularFeeAgreementStatusForUpdate:", v26->_preferredUpdate));
  v6 = objc_alloc(MEMORY[0x24BEAEC18]);
  v21 = (id)objc_msgSend(v6, "initWithDescriptor:", v26->_alternateUpdate);
  objc_msgSend(v21, "setAllowUnrestrictedCellularDownload:", -[SUSUISoftwareUpdateManager allowCellularOverride](v26, "allowCellularOverride"));
  objc_msgSend(v21, "setDownloadFeeAgreementStatus:", -[SUSUIUpdateAgreementManager cellularFeeAgreementStatusForUpdate:](v26->_updateAgreementManager, "cellularFeeAgreementStatusForUpdate:", v26->_alternateUpdate));
  suClient = v26->_suClient;
  v9 = v22;
  v10 = v21;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __70__SUSUISoftwareUpdateManager_refreshErrors_alternateError_completion___block_invoke;
  v16 = &unk_24DFFC8D8;
  v17 = v26;
  v18 = location[0];
  v19 = v24;
  v20 = v23;
  -[SUSUISoftwareUpdateClientManager updatesDownloadable:alternateUpdate:completion:](suClient, "updatesDownloadable:alternateUpdate:completion:", v9, v10);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_refreshErrors_alternateError_completion___block_invoke(NSObject *a1, char a2, char a3, id obj, void *a5)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  Class v18;
  Class v19;
  uint64_t v20;
  Class isa;
  Class v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  int v33;
  uint64_t *v34;
  uint8_t *buf;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  id v39;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id WeakRetained;
  id v45;
  int v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  uint64_t v60;
  int v61;
  const char *v62;
  id obja;
  NSObject *v64;
  char *v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  char v83;
  id v84;
  os_log_type_t type;
  os_log_t v86[2];
  id v87;
  id location;
  char v89;
  char v90;
  NSObject *v91;
  _BYTE v92[184];
  uint64_t v93;

  v65 = &v83;
  v64 = a1;
  obja = a5;
  v62 = "-[SUSUISoftwareUpdateManager refreshErrors:alternateError:completion:]_block_invoke";
  v93 = *MEMORY[0x24BDAC8D0];
  v91 = a1;
  v90 = a2 & 1;
  v89 = a3 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v87 = 0;
  objc_storeStrong(&v87, obja);
  v86[1] = v64;
  v86[0] = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v86[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v65 + 3);
    *(_DWORD *)v58 = type;
    v59 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v64[4].isa + 22));
    v5 = v59;
    v6 = v64;
    v60 = (uint64_t)v5;
    *((_QWORD *)v65 + 1) = v5;
    v61 = *((_DWORD *)v6[4].isa + 22);
    LOBYTE(v6) = *((_QWORD *)v6[4].isa + 15) == 0;
    v82 = 0;
    if ((v6 & 1) != 0)
    {
      v56 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*((id *)v64[4].isa + 15), "humanReadableUpdateName");
      *(_QWORD *)v65 = v7;
      v82 = 1;
      v56 = v7;
    }
    v53 = v56;
    v54 = *((_QWORD *)v64[4].isa + 15);
    v55 = *((_QWORD *)v64[4].isa + 20);
    v8 = *((_QWORD *)v64[4].isa + 16) == 0;
    v80 = 0;
    if (v8)
    {
      v52 = CFSTR("N/A");
    }
    else
    {
      v81 = (id)objc_msgSend(*((id *)v64[4].isa + 16), "humanReadableUpdateName");
      v80 = 1;
      v52 = (const __CFString *)v81;
    }
    v48 = v52;
    v49 = *((_QWORD *)v64[4].isa + 16);
    v50 = *((_QWORD *)v64[4].isa + 21);
    v51 = *((_QWORD *)v64[4].isa + 1);
    v9 = *((_QWORD *)v64[4].isa + 1) == 0;
    v78 = 0;
    v76 = 0;
    v74 = 0;
    if (v9
      || (v79 = (id)objc_msgSend(*((id *)v64[4].isa + 1), "descriptor"),
          v78 = 1,
          !v79))
    {
      v47 = CFSTR("N/A");
    }
    else
    {
      v77 = (id)objc_msgSend(*((id *)v64[4].isa + 1), "descriptor");
      v46 = 1;
      v76 = 1;
      v75 = (id)objc_msgSend(v77, "humanReadableUpdateName");
      v74 = 1;
      v47 = (const __CFString *)v75;
    }
    v43 = v47;
    WeakRetained = objc_loadWeakRetained((id *)v64[4].isa + 13);
    v45 = objc_loadWeakRetained((id *)v64[4].isa + 13);
    v72 = 0;
    v70 = 0;
    if (v45)
    {
      v73 = objc_loadWeakRetained((id *)v64[4].isa + 13);
      v41 = 1;
      v72 = 1;
      v10 = (objc_class *)objc_opt_class();
      v71 = NSStringFromClass(v10);
      v70 = 1;
      v42 = (const __CFString *)v71;
    }
    else
    {
      v42 = CFSTR("N/A");
    }
    v38 = v42;
    v39 = objc_loadWeakRetained((id *)v64[4].isa + 14);
    v40 = objc_loadWeakRetained((id *)v64[4].isa + 14);
    v68 = 0;
    v66 = 0;
    if (v40)
    {
      v69 = objc_loadWeakRetained((id *)v64[4].isa + 14);
      v36 = 1;
      v68 = 1;
      v11 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v11);
      v66 = 1;
      v37 = (const __CFString *)v67;
    }
    else
    {
      v37 = CFSTR("N/A");
    }
    v12 = *((_QWORD *)v65 + 6);
    v13 = *((_QWORD *)v65 + 5);
    v34 = &v15;
    buf = v92;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66_4_0_8_66((uint64_t)v92, (uint64_t)v62, v60, v61, (uint64_t)v53, v54, v55, (uint64_t)v48, v49, v50, v51, (uint64_t)v43, (uint64_t)WeakRetained, (uint64_t)v38, (uint64_t)v39, (uint64_t)v37, v90 & 1, v12, v89 & 1,
      v13);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\npreferredDownloadable: %d, preferredError: %{public}@, alternateDownloadable: %d, alternateError: %{public}@", buf, 0xB4u);
    if ((v66 & 1) != 0)

    if ((v68 & 1) != 0)
    if ((v70 & 1) != 0)

    if ((v72 & 1) != 0)
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    objc_storeStrong(&v84, 0);
  }
  objc_storeStrong((id *)v86, 0);
  v14 = v64;
  *((_BYTE *)v64[4].isa + 48) = v90 & 1;
  *((_BYTE *)v14[4].isa + 49) = v89 & 1;
  v32 = (id)-[objc_class download](v14[4].isa, "download");
  v31 = (id)objc_msgSend(v32, "progress");
  v33 = objc_msgSend(v31, "isDone");

  if ((v33 & 1) != 0)
  {
    v29 = (id)-[objc_class download](v64[4].isa, "download");
    v28 = (id)objc_msgSend(v29, "descriptor");
    v27 = (id)-[objc_class preferredUpdate](v64[4].isa, "preferredUpdate");
    v30 = objc_msgSend(v28, "isEqual:");

    if ((v30 & 1) != 0)
    {
      objc_storeStrong(&location, 0);
    }
    else
    {
      v25 = (id)-[objc_class download](v64[4].isa, "download");
      v24 = (id)objc_msgSend(v25, "descriptor");
      v23 = (id)-[objc_class alternateUpdate](v64[4].isa, "alternateUpdate");
      v26 = objc_msgSend(v24, "isEqual:");

      if ((v26 & 1) != 0)
        objc_storeStrong(&v87, 0);
    }
  }
  isa = v64[4].isa;
  v22 = v64[5].isa;
  if (v22)
    v20 = (uint64_t)v22;
  else
    v20 = *((_QWORD *)v65 + 6);
  -[objc_class setPreferredUpdateError:](isa, "setPreferredUpdateError:", v20);
  v18 = v64[4].isa;
  v19 = v64[6].isa;
  if (v19)
    v17 = (uint64_t)v19;
  else
    v17 = *((_QWORD *)v65 + 5);
  -[objc_class setAlternateUpdateError:](v18, "setAlternateUpdateError:", v17);
  if (v64[7].isa)
    (*((void (**)(void))v64[7].isa + 2))();
  v16 = 0;
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&location, v16);
}

- (BOOL)errorsAreEqual:(id)a3 error2:(id)a4 oldDescription:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  id v12;
  id v13;
  char v14;
  char v15;
  int v16;
  id v17;
  __int128 v18;
  SEL v19;
  SUSUISoftwareUpdateManager *v20;
  BOOL v21;

  v20 = self;
  v19 = a2;
  *((_QWORD *)&v18 + 1) = 0;
  objc_storeStrong((id *)&v18 + 1, a3);
  *(_QWORD *)&v18 = 0;
  objc_storeStrong((id *)&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  if (v18 == 0)
  {
    v21 = 1;
    v16 = 1;
  }
  else
  {
    v7 = (id)objc_msgSend(*((id *)&v18 + 1), "domain");
    v8 = (id)objc_msgSend((id)v18, "domain");
    v9 = 1;
    if ((objc_msgSend(v7, "isEqualToString:") & 1) != 0)
    {
      v6 = objc_msgSend(*((id *)&v18 + 1), "code");
      v9 = v6 != objc_msgSend((id)v18, "code");
    }

    if (v9)
    {
      v21 = 0;
      v16 = 1;
    }
    else
    {
      v15 = 0;
      v14 = 0;
      v13 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v20, "humanReadableDescriptionForError:enableButton:", *((_QWORD *)&v18 + 1), &v15);
      v12 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v20, "humanReadableDescriptionForError:enableButton:", (_QWORD)v18, &v14);
      if ((v15 & 1) == (v14 & 1))
      {
        if (v13 || v12)
        {
          if (v12 && (objc_msgSend(v13, "isEqualToString:", v12) & 1) != 0)
          {
            v21 = (objc_msgSend(v17, "isEqualToString:", v13) & 1) != 0;
            v16 = 1;
          }
          else
          {
            v21 = 0;
            v16 = 1;
          }
        }
        else
        {
          v21 = v17 == 0;
          v16 = 1;
        }
      }
      else
      {
        v21 = 0;
        v16 = 1;
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v18 + 1, 0);
  return v21;
}

- (void)_requestLayoutSubviews
{
  id v2;
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v2 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v2, "manager:needsLayoutSubviewsForState:", self, self->_state);

  }
}

- (void)_batteryStateChanged:(id)a3
{
  id v3;
  os_log_t *v4;
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  int v12;
  id *v13;
  uint8_t *v14[10];
  uint8_t *buf;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  id v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id WeakRetained;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  os_log_t log;
  os_log_type_t type[4];
  id v39;
  uint64_t v40;
  int v41;
  const char *v42;
  id v43;
  uint64_t v44;
  char *v45;
  _BOOL4 v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  char v64;
  id v65;
  unsigned __int8 v66;
  id v67;
  BOOL v68;
  uint64_t v69;
  id location[3];
  _BYTE v71[168];
  uint64_t v72;

  v45 = &v64;
  v42 = "-[SUSUISoftwareUpdateManager _batteryStateChanged:]";
  v72 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  v43 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v44 = objc_msgSend(v43, "batteryState");

  v69 = v44;
  v68 = 0;
  v46 = 1;
  if (v44 != 2)
    v46 = *((_QWORD *)v45 + 5) == 3;
  v68 = v46;
  v3 = _SUSUILoggingFacility();
  v4 = (os_log_t *)v45;
  *((_QWORD *)v45 + 3) = v3;
  v66 = 0;
  if (os_log_type_enabled(v4[3], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v45 + 3);
    *(_DWORD *)type = v66;
    v39 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v45 + 8) + 88));
    v5 = v39;
    v6 = v45;
    v40 = (uint64_t)v5;
    *((_QWORD *)v45 + 1) = v5;
    v41 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v63 = 0;
    if ((v6 & 1) != 0)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v45 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v45 = v7;
      v63 = 1;
      v36 = v7;
    }
    v33 = v36;
    v34 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 120);
    v35 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 128) == 0;
    v61 = 0;
    if (v8)
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v45 + 8) + 128), "humanReadableUpdateName");
      v61 = 1;
      v32 = (const __CFString *)v62;
    }
    v28 = v32;
    v29 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 128);
    v30 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 168);
    v31 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v45 + 8) + 8) == 0;
    v59 = 0;
    v57 = 0;
    v55 = 0;
    if (v9
      || (v60 = (id)objc_msgSend(*(id *)(*((_QWORD *)v45 + 8) + 8), "descriptor"),
          v59 = 1,
          !v60))
    {
      v27 = CFSTR("N/A");
    }
    else
    {
      v58 = (id)objc_msgSend(*(id *)(*((_QWORD *)v45 + 8) + 8), "descriptor");
      v26 = 1;
      v57 = 1;
      v56 = (id)objc_msgSend(v58, "humanReadableUpdateName");
      v55 = 1;
      v27 = (const __CFString *)v56;
    }
    v23 = v27;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 104));
    v25 = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 104));
    v53 = 0;
    v51 = 0;
    if (v25)
    {
      v54 = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 104));
      v21 = 1;
      v53 = 1;
      v10 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v10);
      v51 = 1;
      v22 = (const __CFString *)v52;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v18 = v22;
    v19 = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 112));
    v20 = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 112));
    v49 = 0;
    v47 = 0;
    if (v20)
    {
      v50 = objc_loadWeakRetained((id *)(*((_QWORD *)v45 + 8) + 112));
      v16 = 1;
      v49 = 1;
      v11 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v11);
      v47 = 1;
      v17 = (const __CFString *)v48;
    }
    else
    {
      v17 = CFSTR("N/A");
    }
    v12 = *(_BYTE *)(*((_QWORD *)v45 + 8) + 24) & 1;
    v14[9] = (uint8_t *)v14;
    buf = v71;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_4_0((uint64_t)v71, (uint64_t)v42, v40, v41, (uint64_t)v33, v34, v35, (uint64_t)v28, v29, v30, v31, (uint64_t)v23, (uint64_t)WeakRetained, (uint64_t)v18, (uint64_t)v19, (uint64_t)v17, v12, v68);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBattery state changed: %d -> %d", buf, 0xA0u);
    if ((v47 & 1) != 0)

    if ((v49 & 1) != 0)
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    if ((v61 & 1) != 0)
    if ((v63 & 1) != 0)

    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&v67, 0);
  if ((*(_BYTE *)(*((_QWORD *)v45 + 8) + 24) & 1) != v68)
  {
    v13 = (id *)v45;
    *(_BYTE *)(*((_QWORD *)v45 + 8) + 24) = v68;
    objc_msgSend(v13[8], "refreshState");
  }
  objc_storeStrong(location, 0);
}

- (void)_batteryLevelChanged:(id)a3
{
  id v3;
  float v4;
  id v5;
  os_log_t *v6;
  id v7;
  char *v8;
  const __CFString *v9;
  BOOL v10;
  BOOL v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16[11];
  uint8_t *buf;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id WeakRetained;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  os_log_t log;
  os_log_type_t type[4];
  id v41;
  uint64_t v42;
  int v43;
  const char *v44;
  id v45;
  char *v46;
  float v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  char v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  float batteryLevel;
  float v70;
  int v71;
  id location[2];
  SUSUISoftwareUpdateManager *v73;
  _BYTE v74[168];
  uint64_t v75;

  v46 = &v65;
  v44 = "-[SUSUISoftwareUpdateManager _batteryLevelChanged:]";
  v75 = *MEMORY[0x24BDAC8D0];
  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = 0.2;
  v71 = 1045220557;
  v70 = 0.5;
  batteryLevel = 0.0;
  batteryLevel = v73->_batteryLevel;
  v45 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  objc_msgSend(v45, "batteryLevel");
  v3 = v45;
  v73->_batteryLevel = v4;

  if (*(float *)(*((_QWORD *)v46 + 8) + 28) < v47 && *((float *)v46 + 9) >= 0.2
    || *(float *)(*((_QWORD *)v46 + 8) + 28) >= 0.2 && *((float *)v46 + 9) < 0.2
    || *(float *)(*((_QWORD *)v46 + 8) + 28) < 0.5 && *((float *)v46 + 9) >= 0.5
    || *(float *)(*((_QWORD *)v46 + 8) + 28) >= 0.5 && *((float *)v46 + 9) < 0.5)
  {
    v5 = _SUSUILoggingFacility();
    v6 = (os_log_t *)v46;
    *((_QWORD *)v46 + 3) = v5;
    v67 = 0;
    if (os_log_type_enabled(v6[3], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_t)*((_QWORD *)v46 + 3);
      *(_DWORD *)type = v67;
      v41 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v46 + 8) + 88));
      v7 = v41;
      v8 = v46;
      v42 = (uint64_t)v7;
      *((_QWORD *)v46 + 1) = v7;
      v43 = *(_DWORD *)(*((_QWORD *)v8 + 8) + 88);
      LOBYTE(v8) = *(_QWORD *)(*((_QWORD *)v8 + 8) + 120) == 0;
      v64 = 0;
      if ((v8 & 1) != 0)
      {
        v38 = CFSTR("N/A");
      }
      else
      {
        v9 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 8) + 120), "humanReadableUpdateName");
        *(_QWORD *)v46 = v9;
        v64 = 1;
        v38 = v9;
      }
      v35 = v38;
      v36 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 120);
      v37 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 160);
      v10 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 128) == 0;
      v62 = 0;
      if (v10)
      {
        v34 = CFSTR("N/A");
      }
      else
      {
        v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 8) + 128), "humanReadableUpdateName");
        v62 = 1;
        v34 = (const __CFString *)v63;
      }
      v30 = v34;
      v31 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 128);
      v32 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 168);
      v33 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 8);
      v11 = *(_QWORD *)(*((_QWORD *)v46 + 8) + 8) == 0;
      v60 = 0;
      v58 = 0;
      v56 = 0;
      if (v11
        || (v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 8) + 8), "descriptor"),
            v60 = 1,
            !v61))
      {
        v29 = CFSTR("N/A");
      }
      else
      {
        v59 = (id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 8) + 8), "descriptor");
        v28 = 1;
        v58 = 1;
        v57 = (id)objc_msgSend(v59, "humanReadableUpdateName");
        v56 = 1;
        v29 = (const __CFString *)v57;
      }
      v25 = v29;
      WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 104));
      v27 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 104));
      v54 = 0;
      v52 = 0;
      if (v27)
      {
        v55 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 104));
        v23 = 1;
        v54 = 1;
        v12 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v12);
        v52 = 1;
        v24 = (const __CFString *)v53;
      }
      else
      {
        v24 = CFSTR("N/A");
      }
      v20 = v24;
      v21 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 112));
      v22 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 112));
      v50 = 0;
      v48 = 0;
      if (v22)
      {
        v51 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 8) + 112));
        v18 = 1;
        v50 = 1;
        v13 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v13);
        v48 = 1;
        v19 = (const __CFString *)v49;
      }
      else
      {
        v19 = CFSTR("N/A");
      }
      *(double *)&v14 = *((float *)v46 + 9);
      *(double *)&v15 = *(float *)(*((_QWORD *)v46 + 8) + 28);
      v16[10] = (uint8_t *)v16;
      buf = v74;
      __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0((uint64_t)v74, (uint64_t)v44, v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19, v14, v15);
      _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBattery level changed: %f -> %f", buf, 0xA8u);
      if ((v48 & 1) != 0)

      if ((v50 & 1) != 0)
      if ((v52 & 1) != 0)

      if ((v54 & 1) != 0)
      if ((v56 & 1) != 0)

      if ((v58 & 1) != 0)
      if ((v60 & 1) != 0)

      if ((v62 & 1) != 0)
      if ((v64 & 1) != 0)

      objc_storeStrong(&v66, 0);
    }
    objc_storeStrong(&v68, 0);
    objc_msgSend(*((id *)v46 + 8), "refreshState");
  }
  objc_storeStrong(location, 0);
}

- (void)_didBecomeActive:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_state != 1)
    -[SUSUISoftwareUpdateManager refreshState](v4, "refreshState");
  objc_storeStrong(location, 0);
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  SUSUISoftwareUpdateManager *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  SEL v15;
  SUSUISoftwareUpdateManager *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __74__SUSUISoftwareUpdateManager_networkChangedFromNetworkType_toNetworkType___block_invoke;
  v9 = &unk_24DFF7F18;
  v11 = v13;
  v10 = v16;
  v12 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __74__SUSUISoftwareUpdateManager_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t result)
{
  id v1;
  os_log_t *v2;
  id v3;
  uint64_t v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id obj;
  const __CFString *v18;
  id v19;
  int v20;
  uint64_t *v21;
  uint8_t *buf;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id v28;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  id WeakRetained;
  id v34;
  int v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  os_log_t log;
  os_log_type_t type[4];
  id v48;
  uint64_t v49;
  int v50;
  char *v51;
  uint64_t v52;
  const char *v53;
  char v54;
  id v55;
  id location;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  char v71;
  char v72;
  char v73;
  id v74;
  unsigned __int8 v75;
  id v76[3];
  _BYTE v77[184];
  uint64_t v78;

  v51 = &v71;
  v52 = result;
  v53 = "-[SUSUISoftwareUpdateManager networkChangedFromNetworkType:toNetworkType:]_block_invoke";
  v78 = *MEMORY[0x24BDAC8D0];
  v76[2] = (id)result;
  v76[1] = (id)result;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(*(_QWORD *)(result + 32) + 20))
  {
    v1 = _SUSUILoggingFacility();
    v2 = (os_log_t *)v51;
    *((_QWORD *)v51 + 7) = v1;
    v75 = 0;
    if (os_log_type_enabled(v2[7], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_t)*((_QWORD *)v51 + 7);
      *(_DWORD *)type = v75;
      v48 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v52 + 32) + 88));
      v3 = v48;
      v4 = v52;
      v49 = (uint64_t)v3;
      *((_QWORD *)v51 + 5) = v3;
      v50 = *(_DWORD *)(*(_QWORD *)(v4 + 32) + 88);
      LOBYTE(v4) = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 120) == 0;
      v73 = 0;
      if ((v4 & 1) != 0)
      {
        v45 = CFSTR("N/A");
      }
      else
      {
        v5 = (const __CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v52 + 32) + 120), "humanReadableUpdateName");
        *((_QWORD *)v51 + 4) = v5;
        v73 = 1;
        v45 = v5;
      }
      v42 = v45;
      v43 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 120);
      v44 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 160);
      v6 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 128) == 0;
      v72 = 0;
      if (v6)
      {
        v41 = CFSTR("N/A");
      }
      else
      {
        v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v52 + 32) + 128), "humanReadableUpdateName");
        *((_QWORD *)v51 + 2) = v7;
        v72 = 1;
        v41 = v7;
      }
      v37 = v41;
      v38 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 128);
      v39 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 168);
      v40 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 8);
      v8 = *(_QWORD *)(*(_QWORD *)(v52 + 32) + 8) == 0;
      v70 = 0;
      v68 = 0;
      v66 = 0;
      if (v8
        || (v9 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v52 + 32) + 8), "descriptor"),
            *(_QWORD *)v51 = v9,
            v70 = 1,
            !v9))
      {
        v36 = CFSTR("N/A");
      }
      else
      {
        v69 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v52 + 32) + 8), "descriptor");
        v35 = 1;
        v68 = 1;
        v67 = (id)objc_msgSend(v69, "humanReadableUpdateName");
        v66 = 1;
        v36 = (const __CFString *)v67;
      }
      v32 = v36;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 104));
      v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 104));
      v64 = 0;
      v62 = 0;
      if (v34)
      {
        v65 = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 104));
        v30 = 1;
        v64 = 1;
        v10 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v10);
        v62 = 1;
        v31 = (const __CFString *)v63;
      }
      else
      {
        v31 = CFSTR("N/A");
      }
      v27 = v31;
      v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 112));
      v29 = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 112));
      v60 = 0;
      v58 = 0;
      if (v29)
      {
        v61 = objc_loadWeakRetained((id *)(*(_QWORD *)(v52 + 32) + 112));
        v25 = 1;
        v60 = 1;
        v11 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v11);
        v58 = 1;
        v26 = (const __CFString *)v59;
      }
      else
      {
        v26 = CFSTR("N/A");
      }
      v18 = v26;
      v24 = (id)SUStringFromNetworkType();
      v19 = v24;
      v57 = v19;
      v20 = *(_DWORD *)(v52 + 44);
      v23 = (id)SUStringFromNetworkType();
      location = v23;
      v12 = *(_DWORD *)(v52 + 40);
      v21 = &v14;
      buf = v77;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0_8_66_4_0((uint64_t)v77, (uint64_t)v53, v49, v50, (uint64_t)v42, v43, v44, (uint64_t)v37, v38, v39, v40, (uint64_t)v32, (uint64_t)WeakRetained, (uint64_t)v27, (uint64_t)v28, (uint64_t)v26, (uint64_t)v19, v20, (uint64_t)location,
        v12);
      _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nChanged network type: %@ (%d) -> %{public}@ (%d)", buf, 0xB4u);

      if ((v58 & 1) != 0)
      if ((v60 & 1) != 0)

      if ((v62 & 1) != 0)
      if ((v64 & 1) != 0)

      if ((v66 & 1) != 0)
      if ((v68 & 1) != 0)

      if ((v70 & 1) != 0)
      if ((v72 & 1) != 0)

      if ((v73 & 1) != 0)
      obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v57, obj);
      objc_storeStrong(&v74, obj);
    }
    objc_storeStrong(v76, 0);
    v13 = v52;
    *(_DWORD *)(*(_QWORD *)(v52 + 32) + 20) = *(_DWORD *)(v52 + 40);
    LOBYTE(v13) = *(_DWORD *)(*(_QWORD *)(v13 + 32) + 20) == 0;
    v54 = 0;
    v16 = 0;
    if ((v13 & 1) == 0)
    {
      v55 = (id)objc_msgSend(*(id *)(v52 + 32), "preferredUpdate");
      v54 = 1;
      v16 = 0;
      if (!v55)
        v16 = *(_DWORD *)(*(_QWORD *)(v52 + 32) + 88) != 3;
    }
    v15 = v16;
    if ((v54 & 1) != 0)

    if (v15)
      return objc_msgSend(*(id *)(v52 + 32), "setState:", 0);
    else
      return objc_msgSend(*(id *)(v52 + 32), "refreshState");
  }
  return result;
}

- (NSString)prettyUpdateName
{
  id location[2];
  SUSUISoftwareUpdateManager *v4;
  id v5;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[SUSUISoftwareUpdateManager update](self, "update");
  if (location[0])
    v5 = -[SUSUISoftwareUpdateManager prettyNameForUpdate:](v4, "prettyNameForUpdate:", location[0]);
  else
    v5 = 0;
  objc_storeStrong(location, 0);
  return (NSString *)v5;
}

- (id)prettyNameForUpdate:(id)a3
{
  id v3;
  id v4;
  id v5;
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
  id v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id location[2];
  SUSUISoftwareUpdateManager *v38;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  if (location[0])
  {
    v3 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v4 = v36;
    v36 = v3;

  }
  if (!v36 || !objc_msgSend(v36, "length"))
  {
    v35 = 0;
    v27 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v28 = objc_msgSend(v27, "sf_isiPad");

    if ((v28 & 1) != 0)
    {
      v26 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("iPadOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
      v6 = v35;
      v35 = v5;

    }
    else
    {
      v25 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("iOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
      v8 = v35;
      v35 = v7;

    }
    v34 = 0;
    v32 = 0;
    v24 = 0;
    if (location[0])
    {
      v33 = (id)objc_msgSend(location[0], "productVersion");
      v32 = 1;
      v24 = v33 != 0;
    }
    if ((v32 & 1) != 0)

    if (v24)
    {
      v9 = (id)objc_msgSend(location[0], "productVersion");
      v10 = v34;
      v34 = v9;

    }
    else
    {
      v11 = -[SUSUISoftwareUpdateManager productVersionWithExtra](v38, "productVersionWithExtra");
      v12 = v34;
      v34 = v11;

      if (!v34)
      {
        v23 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v34 = (id)objc_msgSend(v23, "systemVersion");

      }
    }
    v13 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), v34);
    v14 = v36;
    v36 = v13;

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  v30 = 0;
  v22 = 0;
  if (!location[0])
  {
    v31 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v30 = 1;
    v22 = objc_msgSend(v31, "sf_isInternalInstall");
  }
  if ((v30 & 1) != 0)

  if ((v22 & 1) != 0)
  {
    v29 = -[SUSUISoftwareUpdateManager buildVersionIncludingRSR](v38, "buildVersionIncludingRSR");
    v19 = (void *)MEMORY[0x24BDD17C8];
    v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_24E0011F0, CFSTR("Software Update"));
    v15 = (id)objc_msgSend(v19, "stringWithFormat:", v36, v29);
    v16 = v36;
    v36 = v15;

    objc_storeStrong(&v29, 0);
  }
  v18 = v36;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)productVersionWithExtra
{
  id v2;
  id v3;
  id v5;
  id location;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    v2 = (id)objc_msgSend(location, "objectForKeyedSubscript:", *MEMORY[0x24BDBD208]);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

- (id)buildVersionIncludingRSR
{
  id v2;
  id v3;
  id v5;
  id location;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    v2 = (id)objc_msgSend(location, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

- (BOOL)readyToDownload
{
  BOOL v3;

  v3 = 1;
  if (!-[SUSUISoftwareUpdateManager readyToDownloadPreferredUpdate](self, "readyToDownloadPreferredUpdate"))
    return -[SUSUISoftwareUpdateManager readyToDownloadAlternateUpdate](self, "readyToDownloadAlternateUpdate");
  return v3;
}

- (BOOL)readyToDownloadPreferredUpdate
{
  return self->_readyToDownloadPreferred;
}

- (BOOL)readyToDownloadAlternateUpdate
{
  return self->_readyToDownloadAlternate;
}

- (BOOL)readyToResume
{
  return self->_readyToResume;
}

- (BOOL)canCancelAutoInstall
{
  SUInstallPolicy *v3;
  BOOL v4;

  v3 = -[SUSUISoftwareUpdateManager installPolicy](self, "installPolicy");
  v4 = -[SUInstallPolicy type](v3, "type") != 1;

  return v4;
}

- (void)purgeCurrentDownloadWithHandler:(id)a3
{
  SUSUISoftwareUpdateClientManager *suClient;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id);
  void *v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  suClient = v11->_suClient;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __62__SUSUISoftwareUpdateManager_purgeCurrentDownloadWithHandler___block_invoke;
  v8 = &unk_24DFFC900;
  v9 = location[0];
  -[SUSUISoftwareUpdateClientManager purgeDownload:](suClient, "purgeDownload:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateManager_purgeCurrentDownloadWithHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

- (SUDownload)download
{
  SUSUISoftwareUpdateManager *obj;
  SUDownload *v4;

  obj = self;
  objc_sync_enter(obj);
  v4 = self->_download;
  objc_sync_exit(obj);

  return v4;
}

- (void)setDownload:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t download;
  const __CFString *v10;
  SUSUISoftwareUpdateManager *obj;
  char v12;
  __CFString *v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  __CFString *v19;
  char v20;
  SUDescriptor *v21;
  char v22;
  SUDescriptor *v23;
  id v24;
  id location[2];
  SUSUISoftwareUpdateManager *v26;
  uint8_t v27[72];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = v26;
  objc_sync_enter(obj);
  if (location[0] != v26->_download || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v20 = 0;
      v18 = 0;
      if (v26->_download
        && (v23 = -[SUDownload descriptor](v26->_download, "descriptor"),
            v22 = 1,
            v23))
      {
        v21 = -[SUDownload descriptor](v26->_download, "descriptor");
        v20 = 1;
        v19 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v21, "humanReadableUpdateName");
        v18 = 1;
        v10 = v19;
      }
      else
      {
        v10 = CFSTR("N/A");
      }
      download = (uint64_t)v26->_download;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v3 = CFSTR("YES");
      if ((isKindOfClass & 1) == 0)
        v3 = CFSTR("NO");
      v7 = (uint64_t)v3;
      v16 = 0;
      v14 = 0;
      v12 = 0;
      if (location[0]
        && (v17 = (id)objc_msgSend(location[0], "descriptor"), v16 = 1, v17))
      {
        v15 = (id)objc_msgSend(location[0], "descriptor");
        v14 = 1;
        v13 = (__CFString *)(id)objc_msgSend(v15, "humanReadableUpdateName");
        v12 = 1;
        v6 = v13;
      }
      else
      {
        v6 = CFSTR("N/A");
      }
      v5 = location[0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66((uint64_t)v27, (uint64_t)"-[SUSUISoftwareUpdateManager setDownload:]", (uint64_t)v10, download, v7, (uint64_t)v6, (uint64_t)v5, (uint64_t)v4);
      _os_log_impl(&dword_21BF33000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%s: Replacing the current download object with a new one.\n\tCurrent: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n\tNew: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n", v27, 0x48u);
      if ((v12 & 1) != 0)

      if ((v14 & 1) != 0)
      if ((v16 & 1) != 0)

      if ((v18 & 1) != 0)
      if ((v20 & 1) != 0)

      if ((v22 & 1) != 0)
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v26->_download, location[0]);
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (void)_reallyDownloadAndInstall:(unint64_t)a3 update:(id)a4 AcceptingCellularFees:(int)a5 completion:(id)a6
{
  id v6;
  char *v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;
  BOOL v11;
  id v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  id *v16;
  uint64_t v17;
  id *v18;
  id *v19;
  uint64_t *v20;
  id v21;
  id v22;
  id *v23;
  id *v24;
  id *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  int v29;
  id SUDownloadPolicyFactoryClass_0;
  void *v31;
  id v32;
  uint64_t *v33;
  uint8_t *buf;
  id v35;
  const __CFString *v36;
  id v37;
  const __CFString *v38;
  id v39;
  Class v40;
  id v41;
  id v42;
  const __CFString *v43;
  id v44;
  const __CFString *v45;
  id v46;
  Class aClass;
  id v48;
  id v49;
  const __CFString *v50;
  id WeakRetained;
  const __CFString *v52;
  id v53;
  id v54;
  id v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const __CFString *v60;
  id v61;
  const __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  id v66;
  id v67;
  uint64_t v68;
  int v69;
  os_log_t log;
  os_log_type_t type[4];
  id updated;
  id v73;
  char *v74;
  int v75;
  id obj;
  const char *v77;
  uint64_t v78;
  int v79;
  int v80;
  void (*v81)(NSObject *, char, id);
  void *v82;
  id v83;
  _QWORD v84[4];
  id from;
  id v86;
  id v87;
  id v88;
  char v89;
  id v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  id v100;
  unsigned __int8 v101;
  id v102;
  id v103;
  unsigned int v104;
  id location[4];
  _BYTE v106[168];
  uint64_t v107;

  v74 = &v92;
  v75 = a5;
  obj = a6;
  v77 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]";
  v107 = *MEMORY[0x24BDAC8D0];
  location[3] = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v104 = v75;
  v103 = 0;
  objc_storeStrong(&v103, obj);
  v73 = _SUSUILoggingFacility();
  v102 = v73;
  v101 = 0;
  if (os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v74 + 17);
    *(_DWORD *)type = v101;
    updated = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v74 + 23) + 88));
    v67 = updated;
    v6 = v67;
    v7 = v74;
    v68 = (uint64_t)v6;
    *((_QWORD *)v74 + 15) = v6;
    v69 = *(_DWORD *)(*((_QWORD *)v7 + 23) + 88);
    LOBYTE(v7) = *(_QWORD *)(*((_QWORD *)v7 + 23) + 120) == 0;
    v99 = 0;
    if ((v7 & 1) != 0)
    {
      v65 = CFSTR("N/A");
    }
    else
    {
      v66 = (id)objc_msgSend(*(id *)(*((_QWORD *)v74 + 23) + 120), "humanReadableUpdateName");
      v8 = (const __CFString *)v66;
      *((_QWORD *)v74 + 14) = v8;
      v99 = 1;
      v65 = v8;
    }
    v62 = v65;
    v63 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 120);
    v64 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 160);
    v9 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 128) == 0;
    v98 = 0;
    if (v9)
    {
      v60 = CFSTR("N/A");
    }
    else
    {
      v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v74 + 23) + 128), "humanReadableUpdateName");
      v10 = (const __CFString *)v61;
      *((_QWORD *)v74 + 12) = v10;
      v98 = 1;
      v60 = v10;
    }
    v56 = v60;
    v57 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 128);
    v58 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 168);
    v59 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 8);
    v11 = *(_QWORD *)(*((_QWORD *)v74 + 23) + 8) == 0;
    v97 = 0;
    v96 = 0;
    v95 = 0;
    if (v11
      || (v55 = (id)objc_msgSend(*(id *)(*((_QWORD *)v74 + 23) + 8), "descriptor"),
          v12 = v55,
          *((_QWORD *)v74 + 10) = v12,
          v97 = 1,
          !v12))
    {
      v52 = CFSTR("N/A");
    }
    else
    {
      v54 = (id)objc_msgSend(*(id *)(*((_QWORD *)v74 + 23) + 8), "descriptor");
      v13 = v54;
      *((_QWORD *)v74 + 8) = v13;
      v96 = 1;
      v53 = (id)objc_msgSend(v13, "humanReadableUpdateName");
      v14 = (const __CFString *)v53;
      *((_QWORD *)v74 + 6) = v14;
      v95 = 1;
      v52 = v14;
    }
    v50 = v52;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 104));
    v49 = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 104));
    v94 = 0;
    v93 = 0;
    if (v49)
    {
      v48 = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 104));
      *((_QWORD *)v74 + 4) = v48;
      v94 = 1;
      aClass = (Class)objc_opt_class();
      v46 = NSStringFromClass(aClass);
      v15 = (const __CFString *)v46;
      *((_QWORD *)v74 + 2) = v15;
      v93 = 1;
      v45 = v15;
    }
    else
    {
      v45 = CFSTR("N/A");
    }
    v43 = v45;
    v44 = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 112));
    v42 = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 112));
    v91 = 0;
    v89 = 0;
    if (v42)
    {
      v41 = objc_loadWeakRetained((id *)(*((_QWORD *)v74 + 23) + 112));
      *(_QWORD *)v74 = v41;
      v91 = 1;
      v40 = (Class)objc_opt_class();
      v39 = NSStringFromClass(v40);
      v90 = v39;
      v89 = 1;
      v38 = (const __CFString *)v90;
    }
    else
    {
      v38 = CFSTR("N/A");
    }
    v36 = v38;
    v37 = (id)objc_msgSend(*((id *)v74 + 20), "humanReadableUpdateName");
    v35 = v37;
    v88 = v35;
    v33 = &v17;
    buf = v106;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0((uint64_t)v106, (uint64_t)v77, v68, v69, (uint64_t)v62, v63, v64, (uint64_t)v56, v57, v58, v59, (uint64_t)v50, (uint64_t)WeakRetained, (uint64_t)v43, (uint64_t)v44, (uint64_t)v38, (uint64_t)v88, v104);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nStarting the download and install of '%{public}@'. cellularFeeAcceptance: %d", buf, 0xA4u);

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    if ((v93 & 1) != 0)
    if ((v94 & 1) != 0)

    if ((v95 & 1) != 0)
    if ((v96 & 1) != 0)

    if ((v97 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v99 & 1) != 0)
    objc_storeStrong(&v88, 0);
    objc_storeStrong(&v100, 0);
  }
  objc_storeStrong(&v102, 0);
  v32 = objc_alloc(MEMORY[0x24BEAEC18]);
  v31 = (void *)objc_msgSend(v32, "initWithDescriptor:", *((_QWORD *)v74 + 20));
  v87 = v31;
  SUDownloadPolicyFactoryClass_0 = getSUDownloadPolicyFactoryClass_0();
  v28 = *((_QWORD *)v74 + 20);
  v29 = objc_msgSend(*((id *)v74 + 23), "allowCellularOverride");
  v27 = (id)objc_msgSend(SUDownloadPolicyFactoryClass_0, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v28, 0, v29 & 1);
  v86 = v27;
  v26 = *((_QWORD *)v74 + 21);
  if (!v26)
    goto LABEL_40;
  if (v26 == 2)
  {
    objc_msgSend(v87, "setUserUpdateTonight:", 1);
LABEL_40:
    objc_msgSend(v87, "setDownloadOnly:", 1);
  }
  objc_msgSend(v87, "setActiveDownloadPolicy:", v86);
  objc_msgSend(v87, "setDownloadFeeAgreementStatus:", v104);
  objc_msgSend(v87, "setTermsAndConditionsAgreementStatus:", 1);
  v16 = (id *)v74;
  *(double *)(*((_QWORD *)v74 + 23) + 40) = -1.0;
  objc_initWeak(&from, v16[23]);
  v21 = *(id *)(*((_QWORD *)v74 + 23) + 56);
  v22 = v87;
  v24 = (id *)&v78;
  v78 = MEMORY[0x24BDAC760];
  v79 = -1073741824;
  v80 = 0;
  v81 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke;
  v82 = &unk_24DFFC9A0;
  v23 = &v83;
  v83 = *((id *)v74 + 23);
  v25 = v24 + 7;
  objc_copyWeak(v24 + 7, &from);
  v20 = &v78;
  v18 = (id *)v84;
  v84[0] = *((id *)v74 + 20);
  v19 = (id *)(v20 + 6);
  v84[1] = *((id *)v74 + 18);
  v84[3] = *((_QWORD *)v74 + 21);
  objc_msgSend(v21, "startDownloadWithOptions:completion:", v22, v20);
  objc_storeStrong(v19, 0);
  objc_storeStrong(v18, 0);
  objc_destroyWeak(v25);
  objc_storeStrong(v23, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke(NSObject *a1, char a2, id obj)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id *v17;
  uint64_t *v18;
  id v19;
  id *v20;
  id *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int v26;
  id v27;
  id SUErrorDomain_3;
  id v29;
  uint64_t *v30;
  uint8_t *buf;
  const __CFString *v32;
  id v33;
  Class v34;
  id v35;
  id v36;
  const __CFString *v37;
  id v38;
  const __CFString *v39;
  id v40;
  Class aClass;
  id v42;
  id v43;
  const __CFString *v44;
  id WeakRetained;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const __CFString *v54;
  id v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  id v60;
  id v61;
  uint64_t v62;
  int v63;
  os_log_t log;
  os_log_type_t type[4];
  id updated;
  id v67;
  char *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  int v72;
  int v73;
  void (*v74)(id *, void *, void *);
  void *v75;
  objc_class *v76;
  _QWORD v77[5];
  char v78;
  char v79;
  id v80;
  char v81;
  id v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  id v91;
  unsigned __int8 v92;
  os_log_t v93[2];
  id location;
  char v95;
  NSObject *v96;
  _BYTE v97[168];
  uint64_t v98;

  v68 = &v84;
  v69 = a1;
  v70 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  v98 = *MEMORY[0x24BDAC8D0];
  v96 = a1;
  v95 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v93[1] = v69;
  v67 = _SUSUILoggingFacility();
  v93[0] = (os_log_t)v67;
  v92 = 0;
  if (os_log_type_enabled(v93[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v68 + 15);
    *(_DWORD *)type = v92;
    updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v69[4].isa + 22));
    v61 = updated;
    v3 = v61;
    v4 = v69;
    v62 = (uint64_t)v3;
    *((_QWORD *)v68 + 13) = v3;
    v63 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4].isa + 15) == 0;
    v90 = 0;
    if ((v4 & 1) != 0)
    {
      v59 = CFSTR("N/A");
    }
    else
    {
      v60 = (id)objc_msgSend(*((id *)v69[4].isa + 15), "humanReadableUpdateName");
      v5 = (const __CFString *)v60;
      *((_QWORD *)v68 + 12) = v5;
      v90 = 1;
      v59 = v5;
    }
    v56 = v59;
    v57 = *((_QWORD *)v69[4].isa + 15);
    v58 = *((_QWORD *)v69[4].isa + 20);
    v6 = *((_QWORD *)v69[4].isa + 16) == 0;
    v89 = 0;
    if (v6)
    {
      v54 = CFSTR("N/A");
    }
    else
    {
      v55 = (id)objc_msgSend(*((id *)v69[4].isa + 16), "humanReadableUpdateName");
      v7 = (const __CFString *)v55;
      *((_QWORD *)v68 + 10) = v7;
      v89 = 1;
      v54 = v7;
    }
    v50 = v54;
    v51 = *((_QWORD *)v69[4].isa + 16);
    v52 = *((_QWORD *)v69[4].isa + 21);
    v53 = *((_QWORD *)v69[4].isa + 1);
    v8 = *((_QWORD *)v69[4].isa + 1) == 0;
    v88 = 0;
    v87 = 0;
    v86 = 0;
    if (v8
      || (v49 = (id)objc_msgSend(*((id *)v69[4].isa + 1), "descriptor"),
          v9 = v49,
          *((_QWORD *)v68 + 8) = v9,
          v88 = 1,
          !v9))
    {
      v46 = CFSTR("N/A");
    }
    else
    {
      v48 = (id)objc_msgSend(*((id *)v69[4].isa + 1), "descriptor");
      v10 = v48;
      *((_QWORD *)v68 + 6) = v10;
      v87 = 1;
      v47 = (id)objc_msgSend(v10, "humanReadableUpdateName");
      v11 = (const __CFString *)v47;
      *((_QWORD *)v68 + 4) = v11;
      v86 = 1;
      v46 = v11;
    }
    v44 = v46;
    WeakRetained = objc_loadWeakRetained((id *)v69[4].isa + 13);
    v43 = objc_loadWeakRetained((id *)v69[4].isa + 13);
    v85 = 0;
    v83 = 0;
    if (v43)
    {
      v42 = objc_loadWeakRetained((id *)v69[4].isa + 13);
      *((_QWORD *)v68 + 2) = v42;
      v85 = 1;
      aClass = (Class)objc_opt_class();
      v40 = NSStringFromClass(aClass);
      v12 = (const __CFString *)v40;
      *(_QWORD *)v68 = v12;
      v83 = 1;
      v39 = v12;
    }
    else
    {
      v39 = CFSTR("N/A");
    }
    v37 = v39;
    v38 = objc_loadWeakRetained((id *)v69[4].isa + 14);
    v36 = objc_loadWeakRetained((id *)v69[4].isa + 14);
    v81 = 0;
    v79 = 0;
    if (v36)
    {
      v35 = objc_loadWeakRetained((id *)v69[4].isa + 14);
      v82 = v35;
      v81 = 1;
      v34 = (Class)objc_opt_class();
      v33 = NSStringFromClass(v34);
      v80 = v33;
      v79 = 1;
      v32 = (const __CFString *)v80;
    }
    else
    {
      v32 = CFSTR("N/A");
    }
    v13 = *((_QWORD *)v68 + 17);
    v30 = &v14;
    buf = v97;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v97, (uint64_t)v70, v62, v63, (uint64_t)v56, v57, v58, (uint64_t)v50, v51, v52, v53, (uint64_t)v44, (uint64_t)WeakRetained, (uint64_t)v37, (uint64_t)v38, (uint64_t)v32, v95 & 1, v13);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nstartDownloadWithOptions - successfullyStarted: %d; error: %{public}@",
      buf,
      0xA4u);
    if ((v79 & 1) != 0)

    if ((v81 & 1) != 0)
    if ((v83 & 1) != 0)

    if ((v85 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v88 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v90 & 1) != 0)

    objc_storeStrong(&v91, 0);
  }
  objc_storeStrong((id *)v93, 0);
  v29 = (id)objc_msgSend(*((id *)v68 + 17), "domain");
  v27 = v29;
  SUErrorDomain_3 = getSUErrorDomain_3();
  v25 = SUErrorDomain_3;
  v26 = objc_msgSend(v27, "isEqualToString:");

  if ((v26 & 1) != 0)
  {
    v24 = objc_msgSend(*((id *)v68 + 17), "code");
    if (v24 == 11 || (v23 = objc_msgSend(*((id *)v68 + 17), "code"), v23 == 41))
      v95 = 1;
  }
  v19 = (id)*((_QWORD *)v69[4].isa + 7);
  v21 = (id *)&v71;
  v71 = MEMORY[0x24BDAC760];
  v72 = -1073741824;
  v73 = 0;
  v74 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_303;
  v75 = &unk_24DFFC978;
  v20 = (id *)&v76;
  v76 = v69[4].isa;
  v22 = v21 + 8;
  objc_copyWeak(v21 + 8, (id *)&v69[7].isa);
  v18 = &v71;
  v15 = (id *)v77;
  v77[0] = v69[5].isa;
  v78 = v95 & 1;
  v16 = (id *)(v18 + 6);
  v77[1] = *((id *)v68 + 17);
  v17 = (id *)(v18 + 7);
  v77[2] = v69[6].isa;
  v77[4] = v69[8].isa;
  objc_msgSend(v19, "download:", v18);
  objc_storeStrong(v17, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(v15, 0);
  objc_destroyWeak(v22);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_303(id *a1, void *a2, void *a3)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  id *v7;
  id *v8;
  uint64_t *v9;
  id v10;
  os_log_t v11;
  os_log_type_t v12[4];
  uint8_t *v13;
  id v14;
  id *v15;
  id *v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  id *v21;
  id *v22;
  void *v23;
  id *v24;
  id v25;
  uint64_t *v26;
  uint8_t *buf;
  const __CFString *v28;
  id v29;
  Class v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  const __CFString *v35;
  id v36;
  Class aClass;
  id v38;
  id v39;
  const __CFString *v40;
  id WeakRetained;
  const __CFString *v42;
  id v43;
  id v44;
  id v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  id v51;
  const __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  id v56;
  id v57;
  id v58;
  int v59;
  os_log_t log;
  os_log_type_t type[4];
  id updated;
  id v63;
  id *v64;
  id obj;
  const char *v66;
  const char *v67;
  uint64_t v68;
  int v69;
  int v70;
  void (*v71)(NSObject *, char, id);
  void *v72;
  _QWORD v73[2];
  os_log_type_t v74;
  os_log_t oslog;
  uint64_t v76;
  int v77;
  int v78;
  void (*v79)(uint64_t);
  void *v80;
  _QWORD v81[7];
  id v82;
  char v83;
  id v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  id v104;
  unsigned __int8 v105;
  id v106[2];
  id v107;
  id location[2];
  _BYTE v109[16];
  _BYTE v110[168];
  uint64_t v111;

  v64 = a1;
  obj = a3;
  v66 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  v67 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke_3";
  v111 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v107 = 0;
  objc_storeStrong(&v107, obj);
  v106[1] = v64;
  v63 = _SUSUILoggingFacility();
  v106[0] = v63;
  v105 = 0;
  if (os_log_type_enabled((os_log_t)v106[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v106[0];
    *(_DWORD *)type = v105;
    updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v64[4] + 22));
    v57 = updated;
    v58 = v57;
    v104 = v58;
    v59 = *((_DWORD *)v64[4] + 22);
    v3 = *((_QWORD *)v64[4] + 15) == 0;
    v102 = 0;
    if (v3)
    {
      v55 = CFSTR("N/A");
    }
    else
    {
      v56 = (id)objc_msgSend(*((id *)v64[4] + 15), "humanReadableUpdateName");
      v103 = v56;
      v102 = 1;
      v55 = (const __CFString *)v103;
    }
    v52 = v55;
    v53 = *((_QWORD *)v64[4] + 15);
    v54 = *((_QWORD *)v64[4] + 20);
    v4 = *((_QWORD *)v64[4] + 16) == 0;
    v100 = 0;
    if (v4)
    {
      v50 = CFSTR("N/A");
    }
    else
    {
      v51 = (id)objc_msgSend(*((id *)v64[4] + 16), "humanReadableUpdateName");
      v101 = v51;
      v100 = 1;
      v50 = (const __CFString *)v101;
    }
    v46 = v50;
    v47 = *((_QWORD *)v64[4] + 16);
    v48 = *((_QWORD *)v64[4] + 21);
    v49 = *((_QWORD *)v64[4] + 1);
    v5 = *((_QWORD *)v64[4] + 1) == 0;
    v98 = 0;
    v96 = 0;
    v94 = 0;
    if (v5
      || (v45 = (id)objc_msgSend(*((id *)v64[4] + 1), "descriptor"),
          v99 = v45,
          v98 = 1,
          !v99))
    {
      v42 = CFSTR("N/A");
    }
    else
    {
      v44 = (id)objc_msgSend(*((id *)v64[4] + 1), "descriptor");
      v97 = v44;
      v96 = 1;
      v43 = (id)objc_msgSend(v97, "humanReadableUpdateName");
      v95 = v43;
      v94 = 1;
      v42 = (const __CFString *)v95;
    }
    v40 = v42;
    WeakRetained = objc_loadWeakRetained((id *)v64[4] + 13);
    v39 = objc_loadWeakRetained((id *)v64[4] + 13);
    v92 = 0;
    v90 = 0;
    if (v39)
    {
      v38 = objc_loadWeakRetained((id *)v64[4] + 13);
      v93 = v38;
      v92 = 1;
      aClass = (Class)objc_opt_class();
      v36 = NSStringFromClass(aClass);
      v91 = v36;
      v90 = 1;
      v35 = (const __CFString *)v91;
    }
    else
    {
      v35 = CFSTR("N/A");
    }
    v33 = v35;
    v34 = objc_loadWeakRetained((id *)v64[4] + 14);
    v32 = objc_loadWeakRetained((id *)v64[4] + 14);
    v88 = 0;
    v86 = 0;
    if (v32)
    {
      v31 = objc_loadWeakRetained((id *)v64[4] + 14);
      v89 = v31;
      v88 = 1;
      v30 = (Class)objc_opt_class();
      v29 = NSStringFromClass(v30);
      v87 = v29;
      v86 = 1;
      v28 = (const __CFString *)v87;
    }
    else
    {
      v28 = CFSTR("N/A");
    }
    v26 = &v6;
    buf = v110;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66((uint64_t)v110, (uint64_t)v66, (uint64_t)v58, v59, (uint64_t)v52, v53, v54, (uint64_t)v46, v47, v48, v49, (uint64_t)v40, (uint64_t)WeakRetained, (uint64_t)v33, (uint64_t)v34, (uint64_t)v28, (uint64_t)location[0], (uint64_t)v107);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ndownload fetched the initiated download object - download: %{public}@, downloadError: %{public}@", buf, 0xA8u);
    if ((v86 & 1) != 0)

    if ((v88 & 1) != 0)
    if ((v90 & 1) != 0)

    if ((v92 & 1) != 0)
    if ((v94 & 1) != 0)

    if ((v96 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v102 & 1) != 0)

    objc_storeStrong(&v104, 0);
  }
  objc_storeStrong(v106, 0);
  v25 = objc_loadWeakRetained(v64 + 8);
  v85 = v25;
  v76 = MEMORY[0x24BDAC760];
  v77 = -1073741824;
  v78 = 0;
  v79 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_304;
  v80 = &unk_24DFFC950;
  v24 = &v82;
  objc_copyWeak(&v82, v64 + 8);
  v22 = (id *)&v76;
  v15 = (id *)v81;
  v81[0] = v64[4];
  v16 = v22 + 5;
  v81[1] = v85;
  v17 = v22 + 6;
  v81[2] = v64[5];
  v18 = v22 + 7;
  v81[3] = location[0];
  v19 = v22 + 8;
  v81[4] = v107;
  v83 = (_BYTE)v64[10] & 1;
  v20 = v22 + 9;
  v81[5] = v64[6];
  v21 = v22 + 10;
  v81[6] = v64[7];
  v23 = (void *)MEMORY[0x220773A28](v22);
  v84 = v23;
  if (v64[9] == (id)2)
  {
    v14 = _SUSUILoggingFacility();
    oslog = (os_log_t)v14;
    v74 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      *(_DWORD *)v12 = v74;
      v13 = v109;
      __os_log_helper_16_2_1_8_32((uint64_t)v109, (uint64_t)v67);
      _os_log_impl(&dword_21BF33000, v11, v12[0], "%s: Attempts to schedule the download for auto-installation", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10 = v85;
    v9 = &v68;
    v68 = MEMORY[0x24BDAC760];
    v69 = -1073741824;
    v70 = 0;
    v71 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_307;
    v72 = &unk_24DFF9F30;
    v7 = (id *)v73;
    v73[0] = v64[4];
    v8 = (id *)(v9 + 5);
    v73[1] = v84;
    objc_msgSend(v10, "setAutoInstall:", v9);
    objc_storeStrong(v8, 0);
    objc_storeStrong(v7, 0);
  }
  else
  {
    (*((void (**)(void))v84 + 2))();
  }
  objc_storeStrong(&v84, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(v15, 0);
  objc_destroyWeak(v24);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_304(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  id WeakRetained;
  char v9;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;
  id v25;
  id v26[3];

  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v26[0] = objc_loadWeakRetained((id *)(a1 + 88));
  if (v26[0])
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    v24 = 0;
    v9 = 0;
    if (WeakRetained)
    {
      v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
      v24 = 1;
      v9 = objc_opt_respondsToSelector();
    }
    if ((v24 & 1) != 0)

    if ((v9 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
      v1 = *(_QWORD *)(a1 + 40);
      v2 = *(_QWORD *)(a1 + 48);
      v3 = *(_QWORD *)(a1 + 56);
      v4 = *(_QWORD *)(a1 + 64);
      v5 = *(_BYTE *)(a1 + 96);
      v6 = *(_QWORD *)(a1 + 72);
      v11 = MEMORY[0x24BDAC760];
      v12 = -1073741824;
      v13 = 0;
      v14 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_2;
      v15 = &unk_24DFFC928;
      objc_copyWeak(&v22, (id *)(a1 + 88));
      v16 = *(id *)(a1 + 40);
      v23 = *(_BYTE *)(a1 + 96) & 1;
      v17 = *(id *)(a1 + 72);
      v18 = *(id *)(a1 + 48);
      v19 = *(id *)(a1 + 56);
      v20 = *(id *)(a1 + 64);
      v21 = *(id *)(a1 + 80);
      objc_msgSend(v7, "manager:prepareToDownloadAndInstall:withDownload:andDownloadError:didSuccessfullyStart:withError:usingCompletionHandler:", v1, v2, v3, v4, v5 & 1, v6, &v11);

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_destroyWeak(&v22);
    }
    else
    {
      objc_msgSend(v26[0], "_reallyDownloadAndInstallDidFinishWithResult:andError:forUpdate:withDownload:andDownloadError:usingCompletionHandler:", *(_BYTE *)(a1 + 96) & 1, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
    }
  }
  objc_storeStrong(v26, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_2(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 80));
  if (location[0])
    objc_msgSend(*(id *)(a1 + 32), "_reallyDownloadAndInstallDidFinishWithResult:andError:forUpdate:withDownload:andDownloadError:usingCompletionHandler:", *(_BYTE *)(a1 + 88) & 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_307(NSObject *a1, char a2, id obj)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  BOOL v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  id obja;
  uint64_t *v14;
  uint8_t *buf;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  id v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id WeakRetained;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  os_log_t log;
  os_log_type_t type[4];
  id v39;
  uint64_t v40;
  int v41;
  const char *v42;
  NSObject *v43;
  char *v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  char v62;
  id v63;
  unsigned __int8 v64;
  os_log_t v65[2];
  id location;
  char v67;
  NSObject *v68;
  _BYTE v69[168];
  uint64_t v70;

  v44 = &v62;
  v43 = a1;
  v42 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  v70 = *MEMORY[0x24BDAC8D0];
  v68 = a1;
  v67 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v65[1] = v43;
  v65[0] = (os_log_t)_SUSUILoggingFacility();
  v64 = 0;
  if (os_log_type_enabled(v65[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v44 + 3);
    *(_DWORD *)type = v64;
    v39 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v43[4].isa + 22));
    v3 = v39;
    v4 = v43;
    v40 = (uint64_t)v3;
    *((_QWORD *)v44 + 1) = v3;
    v41 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4].isa + 15) == 0;
    v61 = 0;
    if ((v4 & 1) != 0)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*((id *)v43[4].isa + 15), "humanReadableUpdateName");
      *(_QWORD *)v44 = v5;
      v61 = 1;
      v36 = v5;
    }
    v33 = v36;
    v34 = *((_QWORD *)v43[4].isa + 15);
    v35 = *((_QWORD *)v43[4].isa + 20);
    v6 = *((_QWORD *)v43[4].isa + 16) == 0;
    v59 = 0;
    if (v6)
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v60 = (id)objc_msgSend(*((id *)v43[4].isa + 16), "humanReadableUpdateName");
      v59 = 1;
      v32 = (const __CFString *)v60;
    }
    v28 = v32;
    v29 = *((_QWORD *)v43[4].isa + 16);
    v30 = *((_QWORD *)v43[4].isa + 21);
    v31 = *((_QWORD *)v43[4].isa + 1);
    v7 = *((_QWORD *)v43[4].isa + 1) == 0;
    v57 = 0;
    v55 = 0;
    v53 = 0;
    if (v7
      || (v58 = (id)objc_msgSend(*((id *)v43[4].isa + 1), "descriptor"),
          v57 = 1,
          !v58))
    {
      v27 = CFSTR("N/A");
    }
    else
    {
      v56 = (id)objc_msgSend(*((id *)v43[4].isa + 1), "descriptor");
      v26 = 1;
      v55 = 1;
      v54 = (id)objc_msgSend(v56, "humanReadableUpdateName");
      v53 = 1;
      v27 = (const __CFString *)v54;
    }
    v23 = v27;
    WeakRetained = objc_loadWeakRetained((id *)v43[4].isa + 13);
    v25 = objc_loadWeakRetained((id *)v43[4].isa + 13);
    v51 = 0;
    v49 = 0;
    if (v25)
    {
      v52 = objc_loadWeakRetained((id *)v43[4].isa + 13);
      v21 = 1;
      v51 = 1;
      v8 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v8);
      v49 = 1;
      v22 = (const __CFString *)v50;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v18 = v22;
    v19 = objc_loadWeakRetained((id *)v43[4].isa + 14);
    v20 = objc_loadWeakRetained((id *)v43[4].isa + 14);
    v47 = 0;
    v45 = 0;
    if (v20)
    {
      v48 = objc_loadWeakRetained((id *)v43[4].isa + 14);
      v16 = 1;
      v47 = 1;
      v9 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v9);
      v45 = 1;
      v17 = (const __CFString *)v46;
    }
    else
    {
      v17 = CFSTR("N/A");
    }
    v10 = CFSTR("Failed to");
    if ((v67 & 1) != 0)
      v10 = CFSTR("Successfully");
    v11 = *((_QWORD *)v44 + 5);
    v14 = &v12;
    buf = v69;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v69, (uint64_t)v42, v40, v41, (uint64_t)v33, v34, v35, (uint64_t)v28, v29, v30, v31, (uint64_t)v23, (uint64_t)WeakRetained, (uint64_t)v18, (uint64_t)v19, (uint64_t)v17, (uint64_t)v10, v11);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n%@ setup auto install error: %@", buf, 0xA8u);
    if ((v45 & 1) != 0)

    if ((v47 & 1) != 0)
    if ((v49 & 1) != 0)

    if ((v51 & 1) != 0)
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    objc_storeStrong(&v63, 0);
  }
  obja = 0;
  objc_storeStrong((id *)v65, 0);
  (*((void (**)(void))v43[5].isa + 2))();
  objc_storeStrong(&location, obja);
}

- (void)_reallyDownloadAndInstallDidFinishWithResult:(BOOL)a3 andError:(id)a4 forUpdate:(id)a5 withDownload:(id)a6 andDownloadError:(id)a7 usingCompletionHandler:(id)a8
{
  id v8;
  char *v9;
  const __CFString *v10;
  BOOL v11;
  const __CFString *v12;
  BOOL v13;
  id v14;
  id v15;
  const __CFString *v16;
  objc_class *v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  SUSUIUninitializedDownload *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  os_log_t v31;
  os_log_type_t v32[4];
  uint8_t *v33;
  id v34;
  int v35;
  unsigned int v36;
  id v37;
  id v38;
  id v39;
  unsigned int v40;
  id v41;
  id v42;
  id v43;
  os_log_t v44;
  os_log_type_t v45[4];
  uint8_t *v46;
  _BOOL4 v47;
  int v48;
  id v49;
  _BOOL4 v50;
  id v51;
  const __CFString *v52;
  uint64_t *v53;
  uint8_t *buf;
  id v55;
  int v56;
  const __CFString *v57;
  const __CFString *v58;
  id v59;
  id v60;
  int v61;
  const __CFString *v62;
  const __CFString *v63;
  id WeakRetained;
  id v65;
  int v66;
  const __CFString *v67;
  const __CFString *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const __CFString *v72;
  const __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  const __CFString *v76;
  os_log_t log;
  os_log_type_t v78[4];
  id v79;
  uint64_t v80;
  int v81;
  const char *v82;
  id obj;
  id v84;
  id v85;
  id v86;
  char *v87;
  os_log_type_t v88;
  os_log_t v89;
  os_log_type_t v90;
  os_log_t oslog;
  char v92;
  id v93;
  char v94;
  id v95;
  id v96;
  char v97;
  id v98;
  char v99;
  id v100;
  char v101;
  id v102;
  char v103;
  id v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  id v111;
  os_log_type_t type;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id location;
  BOOL v119;
  SEL v120;
  SUSUISoftwareUpdateManager *v121;
  _BYTE v122[16];
  _BYTE v123[32];
  _BYTE v124[200];
  uint64_t v125;

  v87 = &v106;
  obj = a5;
  v84 = a6;
  v85 = a7;
  v86 = a8;
  v82 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstallDidFinishWithResult:andError:forUpdate:withDownload:andDow"
        "nloadError:usingCompletionHandler:]";
  v125 = *MEMORY[0x24BDAC8D0];
  v121 = self;
  v120 = a2;
  v119 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v117 = 0;
  objc_storeStrong(&v117, obj);
  v116 = 0;
  objc_storeStrong(&v116, v84);
  v115 = 0;
  objc_storeStrong(&v115, v85);
  v114 = 0;
  objc_storeStrong(&v114, v86);
  v113 = _SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v87 + 11);
    *(_DWORD *)v78 = type;
    v79 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v87 + 19) + 88));
    v8 = v79;
    v9 = v87;
    v80 = (uint64_t)v8;
    *((_QWORD *)v87 + 9) = v8;
    v81 = *(_DWORD *)(*((_QWORD *)v9 + 19) + 88);
    LOBYTE(v9) = *(_QWORD *)(*((_QWORD *)v9 + 19) + 120) == 0;
    v110 = 0;
    if ((v9 & 1) != 0)
    {
      v76 = CFSTR("N/A");
    }
    else
    {
      v10 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v87 + 19) + 120), "humanReadableUpdateName");
      *((_QWORD *)v87 + 8) = v10;
      v110 = 1;
      v76 = v10;
    }
    v73 = v76;
    v74 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 120);
    v75 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 160);
    v11 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 128) == 0;
    v109 = 0;
    if (v11)
    {
      v72 = CFSTR("N/A");
    }
    else
    {
      v12 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v87 + 19) + 128), "humanReadableUpdateName");
      *((_QWORD *)v87 + 6) = v12;
      v109 = 1;
      v72 = v12;
    }
    v68 = v72;
    v69 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 128);
    v70 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 168);
    v71 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 8);
    v13 = *(_QWORD *)(*((_QWORD *)v87 + 19) + 8) == 0;
    v108 = 0;
    v107 = 0;
    v105 = 0;
    if (v13
      || (v14 = (id)objc_msgSend(*(id *)(*((_QWORD *)v87 + 19) + 8), "descriptor"),
          *((_QWORD *)v87 + 4) = v14,
          v108 = 1,
          !v14))
    {
      v67 = CFSTR("N/A");
    }
    else
    {
      v15 = (id)objc_msgSend(*(id *)(*((_QWORD *)v87 + 19) + 8), "descriptor");
      *((_QWORD *)v87 + 2) = v15;
      v66 = 1;
      v107 = 1;
      v16 = (const __CFString *)(id)objc_msgSend(v15, "humanReadableUpdateName");
      *(_QWORD *)v87 = v16;
      v105 = 1;
      v67 = v16;
    }
    v63 = v67;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 104));
    v65 = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 104));
    v103 = 0;
    v101 = 0;
    if (v65)
    {
      v104 = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 104));
      v61 = 1;
      v103 = 1;
      v17 = (objc_class *)objc_opt_class();
      v102 = NSStringFromClass(v17);
      v101 = 1;
      v62 = (const __CFString *)v102;
    }
    else
    {
      v62 = CFSTR("N/A");
    }
    v58 = v62;
    v59 = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 112));
    v60 = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 112));
    v99 = 0;
    v97 = 0;
    if (v60)
    {
      v100 = objc_loadWeakRetained((id *)(*((_QWORD *)v87 + 19) + 112));
      v56 = 1;
      v99 = 1;
      v18 = (objc_class *)objc_opt_class();
      v98 = NSStringFromClass(v18);
      v97 = 1;
      v57 = (const __CFString *)v98;
    }
    else
    {
      v57 = CFSTR("N/A");
    }
    v52 = v57;
    v55 = (id)objc_msgSend(*((id *)v87 + 15), "humanReadableUpdateName");
    v96 = v55;
    v19 = *((_QWORD *)v87 + 16);
    v20 = *((_QWORD *)v87 + 14);
    v21 = *((_QWORD *)v87 + 13);
    v53 = &v29;
    buf = v124;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_66((uint64_t)v124, (uint64_t)v82, v80, v81, (uint64_t)v73, v74, v75, (uint64_t)v68, v69, v70, v71, (uint64_t)v63, (uint64_t)WeakRetained, (uint64_t)v58, (uint64_t)v59, (uint64_t)v57, (uint64_t)v96, v19, v20,
      v21);
    _os_log_impl(&dword_21BF33000, log, v78[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nupdate: %{public}@, error: %{public}@, download: %{public}@, downloadError: %{public}@", buf, 0xBCu);

    if ((v97 & 1) != 0)
    if ((v99 & 1) != 0)

    if ((v101 & 1) != 0)
    if ((v103 & 1) != 0)

    if ((v105 & 1) != 0)
    if ((v107 & 1) != 0)

    if ((v108 & 1) != 0)
    if ((v109 & 1) != 0)

    if ((v110 & 1) != 0)
    v51 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v111, v51);
  }
  objc_storeStrong(&v113, 0);
  v22 = *((_QWORD *)v87 + 14) != 0;
  v94 = 0;
  v92 = 0;
  v50 = 0;
  if (!v22)
  {
    v49 = (id)objc_msgSend(*((id *)v87 + 16), "domain");
    v95 = v49;
    v48 = 1;
    v94 = 1;
    v93 = getSUErrorDomain_3();
    v92 = v48 & 1;
    v23 = objc_msgSend(v49, "isEqualToString:");
    v50 = 0;
    if ((v23 & 1) != 0)
      v50 = objc_msgSend(*((id *)v87 + 16), "code") == 11;
  }
  v47 = v50;
  if ((v92 & 1) != 0)

  if ((v94 & 1) != 0)
  if (v47)
  {
    v24 = [SUSUIUninitializedDownload alloc];
    v25 = -[SUSUIUninitializedDownload initWithDescriptor:](v24, "initWithDescriptor:", *((_QWORD *)v87 + 15));
    v26 = (void *)*((_QWORD *)v87 + 14);
    *((_QWORD *)v87 + 14) = v25;

    oslog = (os_log_t)_SUSUILoggingFacility();
    v90 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v44 = oslog;
      *(_DWORD *)v45 = v90;
      v27 = *((_QWORD *)v87 + 16);
      v28 = *((_QWORD *)v87 + 14);
      v46 = v123;
      __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v123, (uint64_t)v82, v27, v28);
      _os_log_impl(&dword_21BF33000, v44, v45[0], "%s: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v46, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_msgSend(*((id *)v87 + 19), "setDownload:", *((_QWORD *)v87 + 14));
  if (*((_QWORD *)v87 + 14))
  {
    v37 = *(id *)(*((_QWORD *)v87 + 19) + 64);
    v39 = (id)objc_msgSend(*((id *)v87 + 14), "downloadOptions");
    v36 = objc_msgSend(v39, "downloadFeeAgreementStatus");
    v38 = (id)objc_msgSend(*((id *)v87 + 14), "descriptor");
    objc_msgSend(v37, "setCellularFeeAgreementStatus:forUpdate:", v36);

    v41 = *(id *)(*((_QWORD *)v87 + 19) + 64);
    v43 = (id)objc_msgSend(*((id *)v87 + 14), "downloadOptions");
    v40 = objc_msgSend(v43, "termsAndConditionsAgreementStatus");
    v42 = (id)objc_msgSend(*((id *)v87 + 14), "descriptor");
    objc_msgSend(v41, "setTermsAgreementStatus:forUpdate:", v40);

  }
  if (v119)
  {
    v34 = (id)objc_msgSend(*((id *)v87 + 14), "progress");
    v35 = objc_msgSend(v34, "isDone");

    if ((v35 & 1) != 0)
      objc_msgSend(*((id *)v87 + 19), "setState:", 10);
    else
      objc_msgSend(*((id *)v87 + 19), "setState:", 12);
  }
  else
  {
    v89 = (os_log_t)_SUSUILoggingFacility();
    v88 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v89;
      *(_DWORD *)v32 = v88;
      v33 = v122;
      __os_log_helper_16_2_1_8_32((uint64_t)v122, (uint64_t)v82);
      _os_log_impl(&dword_21BF33000, v31, v32[0], "%s: failed to start download successfuly, calling destroyInstallationKeybag", v33, 0xCu);
    }
    objc_storeStrong((id *)&v89, 0);
    objc_msgSend(*(id *)(*((_QWORD *)v87 + 19) + 96), "destroyInstallationKeybag");
  }
  if (*((_QWORD *)v87 + 12))
    (*(void (**)(void))(*((_QWORD *)v87 + 12) + 16))();
  if (!v119)
    objc_msgSend(*((id *)v87 + 19), "handleDownloadError:", *((_QWORD *)v87 + 16));
  v30 = 0;
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, v30);
  objc_storeStrong(&v116, v30);
  objc_storeStrong(&v117, v30);
  objc_storeStrong(&location, v30);
}

- (void)startDownloadAndInstall:(unint64_t)a3 withHandler:(id)a4
{
  unint64_t v4;
  SUSUISoftwareUpdateManager *v5;
  SUDescriptor *v6;
  id location;
  unint64_t v8;
  SEL v9;
  SUSUISoftwareUpdateManager *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v5 = v10;
  v4 = v8;
  v6 = -[SUSUISoftwareUpdateManager update](v10, "update");
  -[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:](v5, "startDownloadAndInstall:update:withHandler:", v4);

  objc_storeStrong(&location, 0);
}

- (void)startDownloadAndInstall:(unint64_t)a3 update:(id)a4 withHandler:(id)a5
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t *v13;
  SUSUISoftwareUpdateManager *v14;
  id *v15;
  id *v16;
  id *v17;
  id *v18;
  id *p_location;
  id v20;
  _BOOL4 v21;
  id v22;
  const __CFString *v23;
  id v24;
  unint64_t v25;
  uint64_t *v26;
  uint8_t *buf;
  id v28;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  id v33;
  id v34;
  int v35;
  const __CFString *v36;
  const __CFString *v37;
  id WeakRetained;
  id v39;
  int v40;
  const __CFString *v41;
  const __CFString *v42;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v46;
  const __CFString *v47;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v50;
  os_log_t log;
  os_log_type_t v52[4];
  id v53;
  id v54;
  int state;
  const char *v56;
  id obj;
  uint64_t v58;
  int v59;
  int v60;
  void (*v61)(uint64_t, char, id);
  void *v62;
  _QWORD v63[4];
  char v64;
  BOOL v65;
  id v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  id v86;
  os_log_type_t type;
  os_log_t oslog;
  id v89;
  id location;
  unint64_t v91;
  SEL v92;
  SUSUISoftwareUpdateManager *v93;
  _BYTE v94[200];
  uint64_t v95;

  obj = a5;
  v56 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]";
  v95 = *MEMORY[0x24BDAC8D0];
  v93 = self;
  v92 = a2;
  v91 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v89 = 0;
  objc_storeStrong(&v89, obj);
  oslog = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v52 = type;
    v53 = SUSUISoftwareUpdateStateToString(v93->_state);
    v54 = v53;
    v86 = v54;
    state = v93->_state;
    v5 = v93->_preferredUpdate == 0;
    v84 = 0;
    if (v5)
    {
      v50 = CFSTR("N/A");
    }
    else
    {
      v85 = (id)-[SUDescriptor humanReadableUpdateName](v93->_preferredUpdate, "humanReadableUpdateName");
      v84 = 1;
      v50 = (const __CFString *)v85;
    }
    v47 = v50;
    preferredUpdate = v93->_preferredUpdate;
    preferredUpdateError = v93->_preferredUpdateError;
    v6 = v93->_alternateUpdate == 0;
    v82 = 0;
    if (v6)
    {
      v46 = CFSTR("N/A");
    }
    else
    {
      v83 = (id)-[SUDescriptor humanReadableUpdateName](v93->_alternateUpdate, "humanReadableUpdateName");
      v82 = 1;
      v46 = (const __CFString *)v83;
    }
    v42 = v46;
    alternateUpdate = v93->_alternateUpdate;
    alternateUpdateError = v93->_alternateUpdateError;
    download = v93->_download;
    v7 = v93->_download == 0;
    v80 = 0;
    v78 = 0;
    v76 = 0;
    if (v7
      || (v81 = -[SUDownload descriptor](v93->_download, "descriptor"), v80 = 1, !v81))
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v79 = -[SUDownload descriptor](v93->_download, "descriptor");
      v40 = 1;
      v78 = 1;
      v77 = (id)objc_msgSend(v79, "humanReadableUpdateName");
      v76 = 1;
      v41 = (const __CFString *)v77;
    }
    v37 = v41;
    WeakRetained = objc_loadWeakRetained((id *)&v93->_delegate);
    v39 = objc_loadWeakRetained((id *)&v93->_delegate);
    v74 = 0;
    v72 = 0;
    if (v39)
    {
      v75 = objc_loadWeakRetained((id *)&v93->_delegate);
      v35 = 1;
      v74 = 1;
      v8 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v8);
      v72 = 1;
      v36 = (const __CFString *)v73;
    }
    else
    {
      v36 = CFSTR("N/A");
    }
    v32 = v36;
    v33 = objc_loadWeakRetained((id *)&v93->_hostController);
    v34 = objc_loadWeakRetained((id *)&v93->_hostController);
    v70 = 0;
    v68 = 0;
    if (v34)
    {
      v71 = objc_loadWeakRetained((id *)&v93->_hostController);
      v30 = 1;
      v70 = 1;
      v9 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v9);
      v68 = 1;
      v31 = (const __CFString *)v69;
    }
    else
    {
      v31 = CFSTR("N/A");
    }
    v23 = v31;
    v29 = SUInstallationTypeToString(v91);
    v24 = v29;
    v67 = v24;
    v25 = v91;
    v28 = (id)objc_msgSend(location, "humanReadableUpdateName");
    v66 = v28;
    v26 = &v10;
    buf = v94;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_0_8_64_8_0((uint64_t)v94, (uint64_t)v56, (uint64_t)v54, state, (uint64_t)v47, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v42, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v37, (uint64_t)WeakRetained, (uint64_t)v32, (uint64_t)v33, (uint64_t)v31, (uint64_t)v24, v25, (uint64_t)v66,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v52[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ninstallationType: %@ (%lu), update: %@ (%p)", buf, 0xBCu);

    if ((v68 & 1) != 0)
    if ((v70 & 1) != 0)

    if ((v72 & 1) != 0)
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    v22 = 0;
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, v22);
    objc_storeStrong(&v86, v22);
  }
  objc_storeStrong((id *)&oslog, 0);
  v65 = 0;
  v21 = 1;
  if (v91 != 2)
    v21 = v91 == 1;
  v11 = 1;
  v65 = v21;
  v14 = v93;
  p_location = &location;
  v12 = location;
  v13 = &v58;
  v58 = MEMORY[0x24BDAC760];
  v59 = -1073741824;
  v60 = 0;
  v61 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke;
  v62 = &unk_24DFFCA18;
  v17 = (id *)v63;
  v63[0] = v93;
  v16 = (id *)(v13 + 5);
  v63[1] = location;
  v64 = v65 & v11;
  v63[3] = v91;
  v15 = (id *)(v13 + 6);
  v18 = &v89;
  v63[2] = v89;
  -[SUSUISoftwareUpdateManager cancelOrPurgeIfNecessaryWithUpdate:completion:](v14, "cancelOrPurgeIfNecessaryWithUpdate:completion:", v12, v13);
  v20 = 0;
  objc_storeStrong(v15, 0);
  objc_storeStrong(v16, v20);
  objc_storeStrong(v17, v20);
  objc_storeStrong(v18, v20);
  objc_storeStrong(p_location, v20);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t v5;
  char v6;
  void *v7;
  os_log_t oslog;
  uint8_t v10[7];
  os_log_type_t v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(NSObject *, char, id);
  void *v17;
  id v18;
  id v19;
  id v20[3];
  id location;
  char v22;
  uint64_t v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = a1;
  v22 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v20[2] = (id)a1;
  if ((v22 & 1) == 0 || location)
  {
    if ((v22 & 1) != 0)
    {
      if (location)
      {
        oslog = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location);
          _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "Error canceling update: %@", v24, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    else
    {
      v12 = _SUSUILoggingFacility();
      v11 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        log = v12;
        type = v11;
        __os_log_helper_16_0_0(v10);
        _os_log_impl(&dword_21BF33000, log, type, "User denied canceling update", v10, 2u);
      }
      objc_storeStrong(&v12, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_BYTE *)(a1 + 64);
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_2;
    v17 = &unk_24DFFC9F0;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v20[1] = *(id *)(a1 + 56);
    v20[0] = *(id *)(a1 + 48);
    objc_msgSend(v7, "promptForDevicePasscodeForDescriptor:unattendedInstall:completion:", v5, v6 & 1, &v13);
    objc_storeStrong(v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&location, 0);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_2(NSObject *a1, char a2, id obj)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  const __CFString *v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  Class isa;
  id *v25;
  id *v26;
  id *v27;
  id obja;
  uint64_t *v29;
  uint8_t *buf;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  id v34;
  id v35;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  id WeakRetained;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  os_log_t log;
  os_log_type_t type[4];
  id v54;
  uint64_t v55;
  int v56;
  const char *v57;
  NSObject *v58;
  char *v59;
  char v60;
  id v61;
  uint64_t v62;
  int v63;
  int v64;
  void (*v65)(uint64_t, char, id);
  void *v66;
  _QWORD v67[4];
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  id v81;
  unsigned __int8 v82;
  os_log_t v83[2];
  id location;
  char v85;
  NSObject *v86;
  _BYTE v87[168];
  uint64_t v88;

  v59 = &v75;
  v58 = a1;
  v57 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke_2";
  v88 = *MEMORY[0x24BDAC8D0];
  v86 = a1;
  v85 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v83[1] = v58;
  v83[0] = (os_log_t)_SUSUILoggingFacility();
  v82 = 0;
  if (os_log_type_enabled(v83[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v59 + 13);
    *(_DWORD *)type = v82;
    v54 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v58[4].isa + 22));
    v3 = v54;
    v4 = v58;
    v55 = (uint64_t)v3;
    *((_QWORD *)v59 + 11) = v3;
    v56 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4].isa + 15) == 0;
    v80 = 0;
    if ((v4 & 1) != 0)
    {
      v51 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*((id *)v58[4].isa + 15), "humanReadableUpdateName");
      *((_QWORD *)v59 + 10) = v5;
      v80 = 1;
      v51 = v5;
    }
    v48 = v51;
    v49 = *((_QWORD *)v58[4].isa + 15);
    v50 = *((_QWORD *)v58[4].isa + 20);
    v6 = *((_QWORD *)v58[4].isa + 16) == 0;
    v79 = 0;
    if (v6)
    {
      v47 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*((id *)v58[4].isa + 16), "humanReadableUpdateName");
      *((_QWORD *)v59 + 8) = v7;
      v79 = 1;
      v47 = v7;
    }
    v43 = v47;
    v44 = *((_QWORD *)v58[4].isa + 16);
    v45 = *((_QWORD *)v58[4].isa + 21);
    v46 = *((_QWORD *)v58[4].isa + 1);
    v8 = *((_QWORD *)v58[4].isa + 1) == 0;
    v78 = 0;
    v77 = 0;
    v76 = 0;
    if (v8
      || (v9 = (id)objc_msgSend(*((id *)v58[4].isa + 1), "descriptor"),
          *((_QWORD *)v59 + 6) = v9,
          v78 = 1,
          !v9))
    {
      v42 = CFSTR("N/A");
    }
    else
    {
      v10 = (id)objc_msgSend(*((id *)v58[4].isa + 1), "descriptor");
      *((_QWORD *)v59 + 4) = v10;
      v41 = 1;
      v77 = 1;
      v11 = (const __CFString *)(id)objc_msgSend(v10, "humanReadableUpdateName");
      *((_QWORD *)v59 + 2) = v11;
      v76 = 1;
      v42 = v11;
    }
    v38 = v42;
    WeakRetained = objc_loadWeakRetained((id *)v58[4].isa + 13);
    v40 = objc_loadWeakRetained((id *)v58[4].isa + 13);
    v74 = 0;
    v72 = 0;
    if (v40)
    {
      *(_QWORD *)v59 = objc_loadWeakRetained((id *)v58[4].isa + 13);
      v36 = 1;
      v74 = 1;
      v12 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v12);
      v72 = 1;
      v37 = (const __CFString *)v73;
    }
    else
    {
      v37 = CFSTR("N/A");
    }
    v33 = v37;
    v34 = objc_loadWeakRetained((id *)v58[4].isa + 14);
    v35 = objc_loadWeakRetained((id *)v58[4].isa + 14);
    v70 = 0;
    v68 = 0;
    if (v35)
    {
      v71 = objc_loadWeakRetained((id *)v58[4].isa + 14);
      v31 = 1;
      v70 = 1;
      v13 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v13);
      v68 = 1;
      v32 = (const __CFString *)v69;
    }
    else
    {
      v32 = CFSTR("N/A");
    }
    v14 = *((_QWORD *)v59 + 15);
    v29 = &v16;
    buf = v87;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v87, (uint64_t)v57, v55, v56, (uint64_t)v48, v49, v50, (uint64_t)v43, v44, v45, v46, (uint64_t)v38, (uint64_t)WeakRetained, (uint64_t)v33, (uint64_t)v34, (uint64_t)v32, v85 & 1, v14);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nsuccess: %d, passcodeError: %@", buf, 0xA4u);
    if ((v68 & 1) != 0)

    if ((v70 & 1) != 0)
    if ((v72 & 1) != 0)

    if ((v74 & 1) != 0)
    if ((v76 & 1) != 0)

    if ((v77 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v79 & 1) != 0)
    if ((v80 & 1) != 0)

    objc_storeStrong(&v81, 0);
  }
  objc_storeStrong((id *)v83, 0);
  if ((v85 & 1) != 0)
  {
    isa = v58[4].isa;
    v22 = (uint64_t)v58[5].isa;
    v23 = &v62;
    v62 = MEMORY[0x24BDAC760];
    v63 = -1073741824;
    v64 = 0;
    v65 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_312;
    v66 = &unk_24DFFC9F0;
    v27 = (id *)v67;
    v67[0] = v58[4].isa;
    v26 = (id *)(v23 + 5);
    v67[1] = v58[5].isa;
    v67[3] = v58[7].isa;
    v25 = (id *)(v23 + 6);
    v67[2] = v58[6].isa;
    -[objc_class presentTermsIfNecessaryForUpdate:completion:](isa, "presentTermsIfNecessaryForUpdate:completion:", v22, v23);
    obja = 0;
    objc_storeStrong(v25, 0);
    objc_storeStrong(v26, obja);
    objc_storeStrong(v27, obja);
  }
  else
  {
    v15 = *((_QWORD *)v59 + 15) == 0;
    v60 = 0;
    v21 = 0;
    if (!v15)
    {
      v61 = (id)-[objc_class delegate](v58[4].isa, "delegate");
      v60 = 1;
      v21 = objc_opt_respondsToSelector();
    }
    v20 = v21;
    if ((v60 & 1) != 0)

    if ((v20 & 1) != 0)
    {
      v19 = (id)-[objc_class delegate](v58[4].isa, "delegate");
      v17 = (uint64_t)v58[4].isa;
      v18 = (id)-[objc_class download](v58[4].isa, "download");
      objc_msgSend(v19, "manager:download:failedWithError:", v17);

    }
    if (v58[6].isa)
      (*((void (**)(void))v58[6].isa + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_312(uint64_t a1, char a2, id obj)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  id *v12;
  id *v13;
  id v14;
  os_log_t v15;
  os_log_type_t v16[4];
  uint8_t *v17;
  uint64_t *v18;
  id v19;
  id *v20;
  id *v21;
  id *v22;
  id obja;
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t *buf;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  id v31;
  id v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  id WeakRetained;
  id v37;
  int v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  os_log_t log;
  os_log_type_t type[4];
  id v51;
  id v52;
  int v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  void (*v60)(uint64_t, char, id);
  void *v61;
  id v62;
  id v63;
  os_log_type_t v64;
  os_log_t oslog;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t (*v69)(uint64_t, unsigned int);
  void *v70;
  _QWORD v71[4];
  unsigned int v72;
  unsigned int v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  id v92;
  unsigned __int8 v93;
  id v94[2];
  id location;
  char v96;
  uint64_t v97;
  _BYTE v98[16];
  _BYTE v99[168];
  uint64_t v100;

  v56 = a1;
  v54 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke";
  v55 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke_2";
  v100 = *MEMORY[0x24BDAC8D0];
  v97 = a1;
  v96 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v94[1] = (id)v56;
  v94[0] = _SUSUILoggingFacility();
  v93 = 0;
  if (os_log_type_enabled((os_log_t)v94[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v94[0];
    *(_DWORD *)type = v93;
    v51 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v56 + 32) + 88));
    v52 = v51;
    v92 = v52;
    v53 = *(_DWORD *)(*(_QWORD *)(v56 + 32) + 88);
    v3 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 120) == 0;
    v90 = 0;
    if (v3)
    {
      v48 = CFSTR("N/A");
    }
    else
    {
      v91 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v56 + 32) + 120), "humanReadableUpdateName");
      v90 = 1;
      v48 = (const __CFString *)v91;
    }
    v45 = v48;
    v46 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 120);
    v47 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 160);
    v4 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 128) == 0;
    v88 = 0;
    if (v4)
    {
      v44 = CFSTR("N/A");
    }
    else
    {
      v89 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v56 + 32) + 128), "humanReadableUpdateName");
      v88 = 1;
      v44 = (const __CFString *)v89;
    }
    v40 = v44;
    v41 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 128);
    v42 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 168);
    v43 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 8);
    v5 = *(_QWORD *)(*(_QWORD *)(v56 + 32) + 8) == 0;
    v86 = 0;
    v84 = 0;
    v82 = 0;
    if (v5
      || (v87 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v56 + 32) + 8), "descriptor"),
          v86 = 1,
          !v87))
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v85 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v56 + 32) + 8), "descriptor");
      v38 = 1;
      v84 = 1;
      v83 = (id)objc_msgSend(v85, "humanReadableUpdateName");
      v82 = 1;
      v39 = (const __CFString *)v83;
    }
    v35 = v39;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 104));
    v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 104));
    v80 = 0;
    v78 = 0;
    if (v37)
    {
      v81 = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 104));
      v33 = 1;
      v80 = 1;
      v6 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v6);
      v78 = 1;
      v34 = (const __CFString *)v79;
    }
    else
    {
      v34 = CFSTR("N/A");
    }
    v30 = v34;
    v31 = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 112));
    v32 = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 112));
    v76 = 0;
    v74 = 0;
    if (v32)
    {
      v77 = objc_loadWeakRetained((id *)(*(_QWORD *)(v56 + 32) + 112));
      v28 = 1;
      v76 = 1;
      v7 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v7);
      v74 = 1;
      v29 = (const __CFString *)v75;
    }
    else
    {
      v29 = CFSTR("N/A");
    }
    v26 = &v9;
    buf = v99;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v99, (uint64_t)v54, (uint64_t)v52, v53, (uint64_t)v45, v46, v47, (uint64_t)v40, v41, v42, v43, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v30, (uint64_t)v31, (uint64_t)v29, v96 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ntermsAccepted: %d, termsError: %@", buf, 0xA4u);
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v88 & 1) != 0)
    if ((v90 & 1) != 0)

    objc_storeStrong(&v92, 0);
  }
  objc_storeStrong(v94, 0);
  v73 = 0;
  if ((v96 & 1) != 0)
    v8 = 1;
  else
    v8 = 2;
  v73 = v8;
  v25 = (id)objc_msgSend(*(id *)(v56 + 32), "download");
  v24 = (id)objc_msgSend(v25, "downloadOptions");
  objc_msgSend(v24, "setTermsAndConditionsAgreementStatus:", v73);

  if ((v96 & 1) != 0)
  {
    v19 = *(id *)(v56 + 32);
    v18 = &v66;
    v66 = MEMORY[0x24BDAC760];
    v67 = -1073741824;
    v68 = 0;
    v69 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_313;
    v70 = &unk_24DFFC9C8;
    v22 = (id *)v71;
    v71[0] = *(id *)(v56 + 32);
    v21 = (id *)(v18 + 5);
    v71[1] = *(id *)(v56 + 40);
    v72 = v73;
    v71[3] = *(_QWORD *)(v56 + 56);
    v20 = (id *)(v18 + 6);
    v71[2] = *(id *)(v56 + 48);
    objc_msgSend(v19, "_alertForDownloadConstraintsWithCompletion:", v18);
    obja = 0;
    objc_storeStrong(v20, 0);
    objc_storeStrong(v21, obja);
    objc_storeStrong(v22, obja);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = oslog;
      *(_DWORD *)v16 = v64;
      v17 = v98;
      __os_log_helper_16_2_1_8_32((uint64_t)v98, (uint64_t)v55);
      _os_log_impl(&dword_21BF33000, v15, v16[0], "%s: terms not accepted, calling destroyInstallationKeybag", v17, 0xCu);
    }
    v14 = 0;
    objc_storeStrong((id *)&oslog, 0);
    v11 = *(id *)(*(_QWORD *)(v56 + 32) + 56);
    v10 = &v57;
    v57 = MEMORY[0x24BDAC760];
    v58 = -1073741824;
    v59 = 0;
    v60 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_315;
    v61 = &unk_24DFFAB58;
    v13 = &v63;
    v63 = *(id *)(v56 + 48);
    v12 = (id *)(v10 + 4);
    v62 = location;
    objc_msgSend(v11, "destroyInstallationKeybag:", v10);
    objc_storeStrong(v12, v14);
    objc_storeStrong(v13, v14);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_313(uint64_t a1, unsigned int a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setCellularFeeAgreementStatus:forUpdate:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTermsAgreementStatus:forUpdate:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reallyDownloadAndInstall:update:AcceptingCellularFees:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_315(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)_reallyResumeDownloadAcceptingCellularFees:(int)a3
{
  SUDownloadOptions *v3;
  SUManagerClient *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, char, id);
  void *v9;
  SUSUISoftwareUpdateManager *v10;
  os_log_type_t v11;
  id location;
  id v13;
  SUDownload *v14;
  unsigned int v15;
  SEL v16;
  SUSUISoftwareUpdateManager *v17;
  uint8_t v18[8];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = -[SUSUISoftwareUpdateManager download](self, "download");
  v13 = -[SUDownload downloadOptions](v14, "downloadOptions");
  objc_msgSend(v13, "setDownloadFeeAgreementStatus:", v15);
  location = _SUSUILoggingFacility();
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v18, v15);
    _os_log_impl(&dword_21BF33000, (os_log_t)location, v11, "Resuming SU download with cellular fee acceptance state: %d", v18, 8u);
  }
  objc_storeStrong(&location, 0);
  v4 = -[SUSUISoftwareUpdateManager SUManager](v17, "SUManager");
  v3 = -[SUDownload downloadOptions](v14, "downloadOptions");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __73__SUSUISoftwareUpdateManager__reallyResumeDownloadAcceptingCellularFees___block_invoke;
  v9 = &unk_24DFFC360;
  v10 = v17;
  -[SUManagerClient updateDownloadOptions:withResult:](v4, "updateDownloadOptions:withResult:", v3, &v5);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
}

void __73__SUSUISoftwareUpdateManager__reallyResumeDownloadAcceptingCellularFees___block_invoke(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[40];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateManager _reallyResumeDownloadAcceptingCellularFees:]_block_invoke", v6 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s - resumeSuccessful: %d; error: %{public}@",
      v8,
      0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v6 & 1) != 0)
    -[objc_class refreshState](a1[4].isa, "refreshState");
  else
    -[objc_class handleDownloadError:](a1[4].isa, "handleDownloadError:", location);
  objc_storeStrong(&location, 0);
}

- (void)resumeDownload
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t, unsigned int);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __44__SUSUISoftwareUpdateManager_resumeDownload__block_invoke;
  v7 = &unk_24DFFCA40;
  v8[0] = self;
  -[SUSUISoftwareUpdateManager _alertForDownloadConstraintsWithCompletion:](self, "_alertForDownloadConstraintsWithCompletion:");
  objc_storeStrong(v8, 0);
}

uint64_t __44__SUSUISoftwareUpdateManager_resumeDownload__block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyResumeDownloadAcceptingCellularFees:", a2);
}

- (void)_updateDownloadProgressWithDownload:(id)a3 stateFromDownload:(int *)a4
{
  float v4;
  float v5;
  uint64_t v6;
  SUDescriptor *v7;
  double v8;
  double v9;
  SUSUISoftwareUpdateManagerDelegate *v10;
  char v11;
  id v12;
  id v13;
  char v14;
  BOOL v15;
  BOOL v16;
  int v17;
  os_log_t oslog;
  os_log_type_t v20;
  id v21;
  id v22;
  float v23;
  float v24;
  unsigned int v25;
  id v26;
  int *v27;
  id location[2];
  SUSUISoftwareUpdateManager *v29;
  uint8_t v30[16];
  uint8_t v31[72];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = (id)objc_msgSend(location[0], "progress");
  v25 = 0;
  objc_msgSend(v26, "normalizedPercentComplete");
  v24 = v4;
  objc_msgSend(v26, "percentComplete");
  v23 = v5;
  v22 = (id)objc_msgSend(v26, "phase");
  if (a4)
    *v27 = v29->_state;
  v21 = _SUSUILoggingFacility();
  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    v17 = -[SUSUISoftwareUpdateManager state](v29, "state");
    objc_msgSend(v26, "timeRemaining");
    __os_log_helper_16_2_6_8_32_8_0_8_64_8_0_4_0_8_0((uint64_t)v31, (uint64_t)"-[SUSUISoftwareUpdateManager _updateDownloadProgressWithDownload:stateFromDownload:]", COERCE__INT64(v23), (uint64_t)v22, COERCE__INT64(v24), v17, v6);
    _os_log_impl(&dword_21BF33000, (os_log_t)v21, v20, "%s - progress: %.02f; phase: %@; totalProgress: %.02f; state: %d; time remaining: %f",
      v31,
      0x3Au);
  }
  objc_storeStrong(&v21, 0);
  v7 = -[SUSUISoftwareUpdateManager preferredUpdate](v29, "preferredUpdate");
  v16 = v7 != 0;

  if (v16)
  {
    if ((SUPrefsDownloadPhaseIsStalled_0(v22) & 1) != 0)
    {
      if (v27)
        *v27 = 14;
      v25 = 2;
    }
    else if (-[SUSUISoftwareUpdateManager _SUDownloadPhaseIsQueued:](v29, "_SUDownloadPhaseIsQueued:", v22))
    {
      if (v27)
        *v27 = 5;
    }
    else if ((objc_msgSend(v26, "isDone") & 1) == 0)
    {
      objc_msgSend(v26, "timeRemaining");
      v15 = 0;
      if (v8 < 604800.0)
      {
        objc_msgSend(v26, "timeRemaining");
        v15 = v9 > 0.0;
      }
      v12 = v22;
      v13 = getkSUDownloadPhasePreparingForInstallation_1();
      v14 = 1;
      if ((objc_msgSend(v12, "isEqualToString:") & 1) == 0)
      {
        v11 = 0;
        if (v23 >= 0.005)
          v11 = v15;
        v14 = v11;
      }

      if ((v14 & 1) != 0)
        v25 = 1;
      if (v27)
      {
        if (v29->_state == 13)
          *v27 = 13;
        else
          *v27 = 12;
      }
    }
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v30, (uint64_t)"-[SUSUISoftwareUpdateManager _updateDownloadProgressWithDownload:stateFromDownload:]");
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s - no preferred update yet, ignoring progress update", v30, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v10 = -[SUSUISoftwareUpdateManager delegate](v29, "delegate");
  -[SUSUISoftwareUpdateManagerDelegate manager:downloadProgressChanged:displayStyle:](v10, "manager:downloadProgressChanged:displayStyle:", v29, location[0], v25);

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)upgradeDownloadToUserInitiated
{
  SUDownload *v2;
  id v3[2];
  SUSUISoftwareUpdateManager *v4;

  v4 = self;
  v3[1] = (id)a2;
  v2 = -[SUSUISoftwareUpdateManager download](self, "download");
  v3[0] = -[SUDownload downloadOptions](v2, "downloadOptions");

  objc_msgSend(v3[0], "setAutoDownload:", 0);
  -[SUSUISoftwareUpdateClientManager updateDownloadOptions:completion:](v4->_suClient, "updateDownloadOptions:completion:", v3[0], &__block_literal_global_5);
  objc_storeStrong(v3, 0);
}

void __60__SUSUISoftwareUpdateManager_upgradeDownloadToUserInitiated__block_invoke(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)location);
      _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "Failed to update download options: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)setAutoInstall:(id)a3
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t *v9;
  SUSUISoftwareUpdateManager *v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  id *v15;
  id obj;
  uint64_t *v17;
  uint8_t *buf;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v35;
  const __CFString *v36;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v39;
  os_log_t log;
  os_log_type_t type[4];
  id v42;
  id v43;
  int state;
  const char *v45;
  uint64_t v46;
  int v47;
  int v48;
  void (*v49)(id *, char, id);
  void *v50;
  _QWORD v51[2];
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  __CFString *v67;
  char v68;
  __CFString *v69;
  id v70;
  unsigned __int8 v71;
  id v72;
  id location[2];
  SUSUISoftwareUpdateManager *v74;
  _BYTE v75[152];
  uint64_t v76;

  v45 = "-[SUSUISoftwareUpdateManager setAutoInstall:]";
  v76 = *MEMORY[0x24BDAC8D0];
  v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = _SUSUILoggingFacility();
  v71 = 0;
  if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v72;
    *(_DWORD *)type = v71;
    v42 = SUSUISoftwareUpdateStateToString(v74->_state);
    v43 = v42;
    v70 = v43;
    state = v74->_state;
    v3 = v74->_preferredUpdate == 0;
    v68 = 0;
    if (v3)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v69 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v74->_preferredUpdate, "humanReadableUpdateName");
      v68 = 1;
      v39 = v69;
    }
    v36 = v39;
    preferredUpdate = v74->_preferredUpdate;
    preferredUpdateError = v74->_preferredUpdateError;
    v4 = v74->_alternateUpdate == 0;
    v66 = 0;
    if (v4)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v67 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v74->_alternateUpdate, "humanReadableUpdateName");
      v66 = 1;
      v35 = v67;
    }
    v31 = v35;
    alternateUpdate = v74->_alternateUpdate;
    alternateUpdateError = v74->_alternateUpdateError;
    download = v74->_download;
    v5 = v74->_download == 0;
    v64 = 0;
    v62 = 0;
    v60 = 0;
    if (v5
      || (v65 = -[SUDownload descriptor](v74->_download, "descriptor"), v64 = 1, !v65))
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v63 = -[SUDownload descriptor](v74->_download, "descriptor");
      v29 = 1;
      v62 = 1;
      v61 = (id)objc_msgSend(v63, "humanReadableUpdateName");
      v60 = 1;
      v30 = (const __CFString *)v61;
    }
    v26 = v30;
    WeakRetained = objc_loadWeakRetained((id *)&v74->_delegate);
    v28 = objc_loadWeakRetained((id *)&v74->_delegate);
    v58 = 0;
    v56 = 0;
    if (v28)
    {
      v59 = objc_loadWeakRetained((id *)&v74->_delegate);
      v24 = 1;
      v58 = 1;
      v6 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v6);
      v56 = 1;
      v25 = (const __CFString *)v57;
    }
    else
    {
      v25 = CFSTR("N/A");
    }
    v21 = v25;
    v22 = objc_loadWeakRetained((id *)&v74->_hostController);
    v23 = objc_loadWeakRetained((id *)&v74->_hostController);
    v54 = 0;
    v52 = 0;
    if (v23)
    {
      v55 = objc_loadWeakRetained((id *)&v74->_hostController);
      v19 = 1;
      v54 = 1;
      v7 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v7);
      v52 = 1;
      v20 = (const __CFString *)v53;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v17 = &v8;
    buf = v75;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v75, (uint64_t)v45, (uint64_t)v43, state, (uint64_t)v36, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v31, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    objc_storeStrong(&v70, 0);
  }
  obj = 0;
  objc_storeStrong(&v72, 0);
  v10 = v74;
  v12 = -[SUSUISoftwareUpdateManager download](v74, "download");
  v11 = (id)objc_msgSend(v12, "descriptor");
  v9 = &v46;
  v46 = MEMORY[0x24BDAC760];
  v47 = -1073741824;
  v48 = 0;
  v49 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke;
  v50 = &unk_24DFF9F30;
  v14 = (id *)v51;
  v51[0] = v74;
  v13 = (id *)(v9 + 5);
  v15 = location;
  v51[1] = location[0];
  -[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:](v10, "promptForDevicePasscodeForDescriptor:unattendedInstall:completion:", v11, 1, v9);

  objc_storeStrong(v13, obj);
  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke(id *a1, char a2, id obj)
{
  id v3;
  id v4;
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, char, id);
  void *v11;
  id v12;
  id v13[2];
  id location;
  char v15;
  id *v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13[1] = a1;
  if ((v15 & 1) != 0)
  {
    v3 = a1[4];
    v5 = (id)objc_msgSend(v3, "download");
    v4 = (id)objc_msgSend(v5, "descriptor");
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_2;
    v11 = &unk_24DFF9F30;
    v12 = a1[4];
    v13[0] = a1[5];
    objc_msgSend(v3, "presentTermsIfNecessaryForUpdate:completion:", v4, &v7);

    objc_storeStrong(v13, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_2(NSObject *a1, char a2, id obj)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  objc_class *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_t v15;
  os_log_type_t v16[4];
  uint8_t *v17;
  uint64_t *v18;
  id v19;
  id *v20;
  uint64_t *v21;
  uint8_t *buf;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  id WeakRetained;
  id v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  os_log_t log;
  os_log_type_t type[4];
  id v46;
  uint64_t v47;
  int v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  char *v52;
  os_log_type_t v53;
  os_log_t oslog;
  uint64_t v55;
  int v56;
  int v57;
  void (*v58)(_QWORD *, void *, void *);
  void *v59;
  objc_class *v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  id v76;
  unsigned __int8 v77;
  os_log_t v78[2];
  id location;
  char v80;
  NSObject *v81;
  _BYTE v82[16];
  _BYTE v83[168];
  uint64_t v84;

  v52 = &v72;
  v51 = a1;
  v49 = "-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke_2";
  v50 = "-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke";
  v84 = *MEMORY[0x24BDAC8D0];
  v81 = a1;
  v80 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v78[1] = v51;
  v78[0] = (os_log_t)_SUSUILoggingFacility();
  v77 = 0;
  if (os_log_type_enabled(v78[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v52 + 9);
    *(_DWORD *)type = v77;
    v46 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v51[4].isa + 22));
    v3 = v46;
    v4 = v51;
    v47 = (uint64_t)v3;
    *((_QWORD *)v52 + 7) = v3;
    v48 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4].isa + 15) == 0;
    v75 = 0;
    if ((v4 & 1) != 0)
    {
      v43 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*((id *)v51[4].isa + 15), "humanReadableUpdateName");
      *((_QWORD *)v52 + 6) = v5;
      v75 = 1;
      v43 = v5;
    }
    v40 = v43;
    v41 = *((_QWORD *)v51[4].isa + 15);
    v42 = *((_QWORD *)v51[4].isa + 20);
    v6 = *((_QWORD *)v51[4].isa + 16) == 0;
    v74 = 0;
    if (v6)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*((id *)v51[4].isa + 16), "humanReadableUpdateName");
      *((_QWORD *)v52 + 4) = v7;
      v74 = 1;
      v39 = v7;
    }
    v35 = v39;
    v36 = *((_QWORD *)v51[4].isa + 16);
    v37 = *((_QWORD *)v51[4].isa + 21);
    v38 = *((_QWORD *)v51[4].isa + 1);
    v8 = *((_QWORD *)v51[4].isa + 1) == 0;
    v73 = 0;
    v71 = 0;
    v69 = 0;
    if (v8
      || (v9 = (id)objc_msgSend(*((id *)v51[4].isa + 1), "descriptor"),
          *((_QWORD *)v52 + 2) = v9,
          v73 = 1,
          !v9))
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v10 = (id)objc_msgSend(*((id *)v51[4].isa + 1), "descriptor");
      *(_QWORD *)v52 = v10;
      v33 = 1;
      v71 = 1;
      v70 = (id)objc_msgSend(v10, "humanReadableUpdateName");
      v69 = 1;
      v34 = (const __CFString *)v70;
    }
    v30 = v34;
    WeakRetained = objc_loadWeakRetained((id *)v51[4].isa + 13);
    v32 = objc_loadWeakRetained((id *)v51[4].isa + 13);
    v67 = 0;
    v65 = 0;
    if (v32)
    {
      v68 = objc_loadWeakRetained((id *)v51[4].isa + 13);
      v28 = 1;
      v67 = 1;
      v11 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v11);
      v65 = 1;
      v29 = (const __CFString *)v66;
    }
    else
    {
      v29 = CFSTR("N/A");
    }
    v25 = v29;
    v26 = objc_loadWeakRetained((id *)v51[4].isa + 14);
    v27 = objc_loadWeakRetained((id *)v51[4].isa + 14);
    v63 = 0;
    v61 = 0;
    if (v27)
    {
      v64 = objc_loadWeakRetained((id *)v51[4].isa + 14);
      v23 = 1;
      v63 = 1;
      v12 = (objc_class *)objc_opt_class();
      v62 = NSStringFromClass(v12);
      v61 = 1;
      v24 = (const __CFString *)v62;
    }
    else
    {
      v24 = CFSTR("N/A");
    }
    v13 = *((_QWORD *)v52 + 11);
    v21 = &v14;
    buf = v83;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v83, (uint64_t)v49, v47, v48, (uint64_t)v40, v41, v42, (uint64_t)v35, v36, v37, v38, (uint64_t)v30, (uint64_t)WeakRetained, (uint64_t)v25, (uint64_t)v26, (uint64_t)v24, v80 & 1, v13);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\naccepted: %d, error: %@", buf, 0xA4u);
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    if ((v74 & 1) != 0)
    if ((v75 & 1) != 0)

    objc_storeStrong(&v76, 0);
  }
  objc_storeStrong((id *)v78, 0);
  if ((v80 & 1) != 0)
  {
    v19 = (id)*((_QWORD *)v51[4].isa + 7);
    v18 = &v55;
    v55 = MEMORY[0x24BDAC760];
    v56 = -1073741824;
    v57 = 0;
    v58 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_318;
    v59 = &unk_24DFFCAA8;
    v20 = (id *)&v60;
    v60 = v51[5].isa;
    objc_msgSend(v19, "currentAutoInstallOperation:completion:", 1, v18);
    objc_storeStrong(v20, 0);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = oslog;
      *(_DWORD *)v16 = v53;
      v17 = v82;
      __os_log_helper_16_2_1_8_32((uint64_t)v82, (uint64_t)v50);
      _os_log_impl(&dword_21BF33000, v15, v16[0], "%s: Auto install failed (T&C not accepted)", v17, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v51[5].isa)
      (*((void (**)(void))v51[5].isa + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_318(_QWORD *a1, void *a2, void *a3)
{
  int v3;
  os_log_t oslog;
  char v7;
  _QWORD *v8;
  id v9;
  id location[2];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8 = a1;
  if (a1[4])
  {
    v7 = 0;
    LOBYTE(v3) = 0;
    if (objc_msgSend(location[0], "agreementStatus") == 1)
      v3 = objc_msgSend(location[0], "isCanceled") ^ 1;
    v7 = v3 & 1;
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke", v7 & 1);
      _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Auto install started successfully - %d", v11, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)checkAutoInstall
{
  uint64_t v2;
  SUOperationProgress *v3;
  SUDownload *v4;
  char v5;

  v4 = -[SUSUISoftwareUpdateManager download](self, "download");
  v3 = -[SUDownload progress](v4, "progress");
  v5 = -[SUOperationProgress isDone](v3, "isDone");

  if ((v5 & 1) != 0)
  {
    if (-[SUSUISoftwareUpdateClientManager isAutoUpdateArmedAndReady](self->_suClient, "isAutoUpdateArmedAndReady"))
      v2 = 11;
    else
      v2 = 10;
    -[SUSUISoftwareUpdateManager setState:](self, "setState:", v2);
  }
}

- (BOOL)isAutoInstallArmedAndReady
{
  return -[SUSUISoftwareUpdateClientManager isAutoUpdateArmedAndReady](self->_suClient, "isAutoUpdateArmedAndReady", a2, self);
}

- (void)cancelAutoInstall
{
  -[SUSUISoftwareUpdateClientManager cancelAutoInstall](self->_suClient, "cancelAutoInstall");
  -[SUSUISoftwareUpdateManager checkAndSetReadyToInstall](self, "checkAndSetReadyToInstall");
}

- (BOOL)automaticUpdateScheduled
{
  return -[SUSUISoftwareUpdateClientManager isAutoUpdateScheduled](self->_suClient, "isAutoUpdateScheduled", a2, self);
}

- (BOOL)automaticUpdateEnabled:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager isAutoInstallEnabled](self->_suClient, "isAutoInstallEnabled");
}

- (void)setAutomaticUpdateEnabled:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager enableAutoInstall:](self->_suClient, "enableAutoInstall:", a3);
}

- (BOOL)automaticUpdatePreviousUserSpecifiedStatus:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager isAutoInstallPreviousUserSettingsEnabled](self->_suClient, "isAutoInstallPreviousUserSettingsEnabled");
}

- (void)setPreviousUserSpecifiedAutomaticUpdateStatus:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager enableAutoInstallPreviousUserSettings:](self->_suClient, "enableAutoInstallPreviousUserSettings:", a3);
}

- (BOOL)automaticDownloadEnabled:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager isAutoDownloadEnabled](self->_suClient, "isAutoDownloadEnabled");
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager enableAutoDownload:](self->_suClient, "enableAutoDownload:", a3);
}

- (BOOL)securityResponseStatus:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager isSecurityResponseEnabled](self->_suClient, "isSecurityResponseEnabled");
}

- (void)setSecurityResponseStatus:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager setSecurityResponseEnabled:](self->_suClient, "setSecurityResponseEnabled:", a3);
}

- (BOOL)previousUserSpecifiedSecurityResponseStatus:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager previousUserSpecifiedSecurityResponseEnabled](self->_suClient, "previousUserSpecifiedSecurityResponseEnabled");
}

- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager setPreviousUserSpecifiedSecurityResponseStatus:](self->_suClient, "setPreviousUserSpecifiedSecurityResponseStatus:", a3);
}

- (BOOL)automaticInstallSystemDataFilesStatusEnabled:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return -[SUSUISoftwareUpdateClientManager isAutomaticInstallSystemDataFilesEnabled](self->_suClient, "isAutomaticInstallSystemDataFilesEnabled");
}

- (void)setAutomaticInstallSystemDataFilesStatusEnabled:(BOOL)a3
{
  -[SUSUISoftwareUpdateClientManager enableAutomaticInstallSystemDataFiles:](self->_suClient, "enableAutomaticInstallSystemDataFiles:", a3);
}

- (BOOL)isRollingBack
{
  return -[SUSUISoftwareUpdateClientManager isRollingBack](self->_suClient, "isRollingBack", a2, self);
}

- (id)eligibleRollback
{
  return -[SUSUISoftwareUpdateClientManager eligibleRollback](self->_suClient, "eligibleRollback", a2, self);
}

- (void)startRollbackWithOptions:(id)a3 withHandler:(id)a4
{
  id v5;
  id location[2];
  SUSUISoftwareUpdateManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSUISoftwareUpdateClientManager rollbackUpdateWithOptions:completion:](v7->_suClient, "rollbackUpdateWithOptions:completion:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startInstallWithHandler:(id)a3
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  SUSUISoftwareUpdateManager *v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  id *v16;
  id obj;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v36;
  const __CFString *v37;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  id v44;
  int state;
  const char *v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(id *, char, id);
  void *v51;
  _QWORD v52[2];
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  __CFString *v68;
  char v69;
  __CFString *v70;
  id v71;
  unsigned __int8 v72;
  id v73;
  id location[2];
  SUSUISoftwareUpdateManager *v75;
  _BYTE v76[152];
  uint64_t v77;

  v46 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]";
  v77 = *MEMORY[0x24BDAC8D0];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = _SUSUILoggingFacility();
  v72 = 0;
  if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v73;
    *(_DWORD *)type = v72;
    v43 = SUSUISoftwareUpdateStateToString(v75->_state);
    v44 = v43;
    v71 = v44;
    state = v75->_state;
    v3 = v75->_preferredUpdate == 0;
    v69 = 0;
    if (v3)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v70 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v75->_preferredUpdate, "humanReadableUpdateName");
      v69 = 1;
      v40 = v70;
    }
    v37 = v40;
    preferredUpdate = v75->_preferredUpdate;
    preferredUpdateError = v75->_preferredUpdateError;
    v4 = v75->_alternateUpdate == 0;
    v67 = 0;
    if (v4)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v68 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v75->_alternateUpdate, "humanReadableUpdateName");
      v67 = 1;
      v36 = v68;
    }
    v32 = v36;
    alternateUpdate = v75->_alternateUpdate;
    alternateUpdateError = v75->_alternateUpdateError;
    download = v75->_download;
    v5 = v75->_download == 0;
    v65 = 0;
    v63 = 0;
    v61 = 0;
    if (v5
      || (v66 = -[SUDownload descriptor](v75->_download, "descriptor"), v65 = 1, !v66))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v64 = -[SUDownload descriptor](v75->_download, "descriptor");
      v30 = 1;
      v63 = 1;
      v62 = (id)objc_msgSend(v64, "humanReadableUpdateName");
      v61 = 1;
      v31 = (const __CFString *)v62;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)&v75->_delegate);
    v29 = objc_loadWeakRetained((id *)&v75->_delegate);
    v59 = 0;
    v57 = 0;
    if (v29)
    {
      v60 = objc_loadWeakRetained((id *)&v75->_delegate);
      v25 = 1;
      v59 = 1;
      v6 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v6);
      v57 = 1;
      v26 = (const __CFString *)v58;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)&v75->_hostController);
    v24 = objc_loadWeakRetained((id *)&v75->_hostController);
    v55 = 0;
    v53 = 0;
    if (v24)
    {
      v56 = objc_loadWeakRetained((id *)&v75->_hostController);
      v20 = 1;
      v55 = 1;
      v7 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v7);
      v53 = 1;
      v21 = (const __CFString *)v54;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v18 = &v8;
    buf = v76;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v76, (uint64_t)v46, (uint64_t)v44, state, (uint64_t)v37, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v32, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    objc_storeStrong(&v71, 0);
  }
  obj = 0;
  objc_storeStrong(&v73, 0);
  v11 = v75;
  v13 = -[SUSUISoftwareUpdateManager download](v75, "download");
  v12 = (id)objc_msgSend(v13, "descriptor");
  v10 = &v47;
  v47 = MEMORY[0x24BDAC760];
  v48 = -1073741824;
  v9 = 0;
  v49 = 0;
  v50 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke;
  v51 = &unk_24DFF9F30;
  v15 = (id *)v52;
  v52[0] = v75;
  v14 = (id *)(v10 + 5);
  v16 = location;
  v52[1] = location[0];
  -[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:](v11, "promptForDevicePasscodeForDescriptor:unattendedInstall:completion:", v12, v9 & 1, v10);

  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
  objc_storeStrong(v16, obj);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke(id *a1, char a2, id obj)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  id obja;
  uint64_t *v16;
  uint8_t *buf;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id WeakRetained;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  os_log_t log;
  os_log_type_t type[4];
  id v41;
  id v42;
  int v43;
  const char *v44;
  id *v45;
  uint64_t v46;
  int v47;
  int v48;
  void (*v49)(id *, char, id);
  void *v50;
  _QWORD v51[2];
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  __CFString *v69;
  id v70;
  unsigned __int8 v71;
  id v72[2];
  id location;
  char v74;
  id *v75;
  _BYTE v76[168];
  uint64_t v77;

  v45 = a1;
  v44 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]_block_invoke";
  v77 = *MEMORY[0x24BDAC8D0];
  v75 = a1;
  v74 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v72[1] = v45;
  v72[0] = _SUSUILoggingFacility();
  v71 = 0;
  if (os_log_type_enabled((os_log_t)v72[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v72[0];
    *(_DWORD *)type = v71;
    v41 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v45[4] + 22));
    v42 = v41;
    v70 = v42;
    v43 = *((_DWORD *)v45[4] + 22);
    v3 = *((_QWORD *)v45[4] + 15) == 0;
    v68 = 0;
    if (v3)
    {
      v38 = CFSTR("N/A");
    }
    else
    {
      v69 = (__CFString *)(id)objc_msgSend(*((id *)v45[4] + 15), "humanReadableUpdateName");
      v68 = 1;
      v38 = v69;
    }
    v35 = v38;
    v36 = *((_QWORD *)v45[4] + 15);
    v37 = *((_QWORD *)v45[4] + 20);
    v4 = *((_QWORD *)v45[4] + 16) == 0;
    v66 = 0;
    if (v4)
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v67 = (id)objc_msgSend(*((id *)v45[4] + 16), "humanReadableUpdateName");
      v66 = 1;
      v34 = (const __CFString *)v67;
    }
    v30 = v34;
    v31 = *((_QWORD *)v45[4] + 16);
    v32 = *((_QWORD *)v45[4] + 21);
    v33 = *((_QWORD *)v45[4] + 1);
    v5 = *((_QWORD *)v45[4] + 1) == 0;
    v64 = 0;
    v62 = 0;
    v60 = 0;
    if (v5
      || (v65 = (id)objc_msgSend(*((id *)v45[4] + 1), "descriptor"), v64 = 1, !v65))
    {
      v29 = CFSTR("N/A");
    }
    else
    {
      v63 = (id)objc_msgSend(*((id *)v45[4] + 1), "descriptor");
      v28 = 1;
      v62 = 1;
      v61 = (id)objc_msgSend(v63, "humanReadableUpdateName");
      v60 = 1;
      v29 = (const __CFString *)v61;
    }
    v25 = v29;
    WeakRetained = objc_loadWeakRetained((id *)v45[4] + 13);
    v27 = objc_loadWeakRetained((id *)v45[4] + 13);
    v58 = 0;
    v56 = 0;
    if (v27)
    {
      v59 = objc_loadWeakRetained((id *)v45[4] + 13);
      v23 = 1;
      v58 = 1;
      v6 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v6);
      v56 = 1;
      v24 = (const __CFString *)v57;
    }
    else
    {
      v24 = CFSTR("N/A");
    }
    v20 = v24;
    v21 = objc_loadWeakRetained((id *)v45[4] + 14);
    v22 = objc_loadWeakRetained((id *)v45[4] + 14);
    v54 = 0;
    v52 = 0;
    if (v22)
    {
      v55 = objc_loadWeakRetained((id *)v45[4] + 14);
      v18 = 1;
      v54 = 1;
      v7 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v7);
      v52 = 1;
      v19 = (const __CFString *)v53;
    }
    else
    {
      v19 = CFSTR("N/A");
    }
    v16 = &v8;
    buf = v76;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v76, (uint64_t)v44, (uint64_t)v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19, v74 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nsuccess; %d, passcodeError: %@",
      buf,
      0xA4u);
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    objc_storeStrong(&v70, 0);
  }
  objc_storeStrong(v72, 0);
  if ((v74 & 1) != 0)
  {
    v10 = v45[4];
    v12 = (id)objc_msgSend(v45[4], "download");
    v11 = (id)objc_msgSend(v12, "descriptor");
    v9 = &v46;
    v46 = MEMORY[0x24BDAC760];
    v47 = -1073741824;
    v48 = 0;
    v49 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_320;
    v50 = &unk_24DFF9F30;
    v14 = (id *)v51;
    v51[0] = v45[4];
    v13 = (id *)(v9 + 5);
    v51[1] = v45[5];
    objc_msgSend(v10, "presentTermsIfNecessaryForUpdate:completion:", v11, v9);

    obja = 0;
    objc_storeStrong(v13, 0);
    objc_storeStrong(v14, obja);
  }
  else
  {
    (*((void (**)(void))v45[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_320(id *a1, char a2, id obj)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t *v12;
  id v13;
  id *v14;
  id *v15;
  id *v16;
  id obja;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  id v44;
  int v45;
  const char *v46;
  id *v47;
  uint64_t v48;
  int v49;
  int v50;
  void (*v51)(uint64_t, char, id);
  void *v52;
  id v53;
  id v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  __CFString *v73;
  id v74;
  unsigned __int8 v75;
  id v76[2];
  id location;
  char v78;
  id *v79;
  _BYTE v80[168];
  uint64_t v81;

  v47 = a1;
  v46 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]_block_invoke";
  v81 = *MEMORY[0x24BDAC8D0];
  v79 = a1;
  v78 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v76[1] = v47;
  v76[0] = _SUSUILoggingFacility();
  v75 = 0;
  if (os_log_type_enabled((os_log_t)v76[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v76[0];
    *(_DWORD *)type = v75;
    v43 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v47[4] + 22));
    v44 = v43;
    v74 = v44;
    v45 = *((_DWORD *)v47[4] + 22);
    v3 = *((_QWORD *)v47[4] + 15) == 0;
    v72 = 0;
    if (v3)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v73 = (__CFString *)(id)objc_msgSend(*((id *)v47[4] + 15), "humanReadableUpdateName");
      v72 = 1;
      v40 = v73;
    }
    v37 = v40;
    v38 = *((_QWORD *)v47[4] + 15);
    v39 = *((_QWORD *)v47[4] + 20);
    v4 = *((_QWORD *)v47[4] + 16) == 0;
    v70 = 0;
    if (v4)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v71 = (id)objc_msgSend(*((id *)v47[4] + 16), "humanReadableUpdateName");
      v70 = 1;
      v36 = (const __CFString *)v71;
    }
    v32 = v36;
    v33 = *((_QWORD *)v47[4] + 16);
    v34 = *((_QWORD *)v47[4] + 21);
    v35 = *((_QWORD *)v47[4] + 1);
    v5 = *((_QWORD *)v47[4] + 1) == 0;
    v68 = 0;
    v66 = 0;
    v64 = 0;
    if (v5
      || (v69 = (id)objc_msgSend(*((id *)v47[4] + 1), "descriptor"), v68 = 1, !v69))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v67 = (id)objc_msgSend(*((id *)v47[4] + 1), "descriptor");
      v30 = 1;
      v66 = 1;
      v65 = (id)objc_msgSend(v67, "humanReadableUpdateName");
      v64 = 1;
      v31 = (const __CFString *)v65;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)v47[4] + 13);
    v29 = objc_loadWeakRetained((id *)v47[4] + 13);
    v62 = 0;
    v60 = 0;
    if (v29)
    {
      v63 = objc_loadWeakRetained((id *)v47[4] + 13);
      v25 = 1;
      v62 = 1;
      v6 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v6);
      v60 = 1;
      v26 = (const __CFString *)v61;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)v47[4] + 14);
    v24 = objc_loadWeakRetained((id *)v47[4] + 14);
    v58 = 0;
    v56 = 0;
    if (v24)
    {
      v59 = objc_loadWeakRetained((id *)v47[4] + 14);
      v20 = 1;
      v58 = 1;
      v7 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v7);
      v56 = 1;
      v21 = (const __CFString *)v57;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v18 = &v10;
    buf = v80;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v80, (uint64_t)v46, (uint64_t)v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v78 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\naccepted: %d, error: %@", buf, 0xA4u);
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    if ((v70 & 1) != 0)
    if ((v72 & 1) != 0)

    objc_storeStrong(&v74, 0);
  }
  objc_storeStrong(v76, 0);
  if ((v78 & 1) != 0)
  {
    objc_msgSend(v47[4], "setState:", 15);
    v8 = objc_alloc_init(MEMORY[0x24BEAEC20]);
    v16 = &v55;
    v55 = v8;
    v9 = objc_msgSend(v47[4], "ignorableConstraints");
    objc_msgSend(v55, "setIgnorableConstraints:", v9);
    v13 = (id)*((_QWORD *)v47[4] + 7);
    v11 = v55;
    v12 = &v48;
    v48 = MEMORY[0x24BDAC760];
    v49 = -1073741824;
    v50 = 0;
    v51 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_321;
    v52 = &unk_24DFFAB58;
    v15 = &v54;
    v54 = v47[5];
    v14 = (id *)(v12 + 4);
    v53 = v47[4];
    objc_msgSend(v13, "installUpdateWithOptions:completion:", v11, v12);
    obja = 0;
    objc_storeStrong(v14, 0);
    objc_storeStrong(v15, obja);
    objc_storeStrong(v16, obja);
  }
  else if (v47[5])
  {
    (*((void (**)(void))v47[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_321(uint64_t a1, char a2, id obj)
{
  void *v3;
  char v4;
  id obja;
  id v7;
  unsigned int v8;
  uint64_t v9;
  id location;
  char v11;
  uint64_t v12;

  v12 = a1;
  v11 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v9 = a1;
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((v11 & 1) == 0)
  {
    v8 = 0;
    v7 = 0;
    v3 = *(void **)(a1 + 32);
    obja = 0;
    v4 = objc_msgSend(v3, "shouldSetStateForInstallError:outError:outState:", location, &obja, &v8);
    objc_storeStrong(&v7, obja);
    if ((v4 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setState:withDownloadUpdateError:", v8, v7);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&location, 0);
}

- (unint64_t)ignorableConstraints
{
  return 3072;
}

- (void)_notifyScanFailed:(id)a3
{
  SUSUISoftwareUpdateManagerDelegate *v3;
  SUSUISoftwareUpdateManagerDelegate *v4;
  char v5;
  id location[2];
  SUSUISoftwareUpdateManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_scanError, location[0]);
  v4 = -[SUSUISoftwareUpdateManager delegate](v7, "delegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[SUSUISoftwareUpdateManager delegate](v7, "delegate");
    -[SUSUISoftwareUpdateManagerDelegate manager:scanFoundUpdates:error:](v3, "manager:scanFoundUpdates:error:", v7, 0, location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)handleScanError:(id)a3
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  const __CFString *v33;
  const __CFString *v34;
  id *v35;
  id *v36;
  uint64_t v37;
  uint64_t *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id *v50;
  id v51;
  id v52;
  int v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  unint64_t v62;
  id v63;
  const __CFString *v64;
  const __CFString *v65;
  uint64_t v66;
  uint64_t *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id *v74;
  id *v75;
  id *v76;
  id obj;
  _BOOL4 v78;
  id v79;
  id v80;
  _BOOL4 v81;
  const __CFString *v82;
  id v83;
  uint64_t *v84;
  uint8_t *v85;
  int v86;
  const __CFString *v87;
  const __CFString *v88;
  id v89;
  id v90;
  int v91;
  const __CFString *v92;
  const __CFString *v93;
  id v94;
  id v95;
  int v96;
  const __CFString *v97;
  const __CFString *v98;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v102;
  const __CFString *v103;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v106;
  os_log_t v107;
  os_log_type_t v108[4];
  id v109;
  id v110;
  int state;
  os_log_t log;
  os_log_type_t v113[4];
  uint8_t *buf;
  id v115;
  int v116;
  int v117;
  int v118;
  id v119;
  int v120;
  const char *v121;
  int v122;
  uint64_t v123;
  int v124;
  int v125;
  void (*v126)(id *, void *);
  void *v127;
  SUSUISoftwareUpdateManager *v128;
  uint64_t v129;
  int v130;
  int v131;
  void (*v132)(uint64_t, void *);
  void *v133;
  _QWORD v134[2];
  id v135;
  id v136;
  id v137;
  uint64_t v138;
  int v139;
  int v140;
  void (*v141)(uint64_t, void *);
  void *v142;
  _QWORD v143[2];
  id v144;
  char v145;
  id v146;
  char v147;
  id v148;
  char v149;
  id v150;
  char v151;
  id v152;
  char v153;
  id v154;
  char v155;
  id v156;
  char v157;
  id v158;
  char v159;
  id v160;
  char v161;
  id v162;
  id v163;
  os_log_type_t v164;
  os_log_t v165;
  os_log_type_t type;
  os_log_t oslog;
  char v168;
  id v169;
  int v170;
  char v171;
  id v172;
  char v173;
  id WeakRetained;
  id location[2];
  SUSUISoftwareUpdateManager *v176;
  _BYTE v177[176];
  uint8_t v178[24];
  uint64_t v179;

  v121 = "-[SUSUISoftwareUpdateManager handleScanError:]";
  v179 = *MEMORY[0x24BDAC8D0];
  v176 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v173 = 0;
  v171 = 0;
  v122 = 0;
  if (!-[SUSUISoftwareUpdateManager clientIsBuddy](v176, "clientIsBuddy"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v176->_delegate);
    v173 = 1;
    v122 = 0;
    if (WeakRetained)
    {
      v172 = -[SUSUISoftwareUpdateManager delegate](v176, "delegate");
      v171 = 1;
      v122 = objc_opt_respondsToSelector();
    }
  }
  v120 = v122;
  if ((v171 & 1) != 0)

  if ((v173 & 1) != 0)
  if ((v120 & 1) != 0)
  {
    objc_storeStrong((id *)&v176->_scanError, location[0]);
    v119 = -[SUSUISoftwareUpdateManager delegate](v176, "delegate");
    objc_msgSend(v119, "manager:scanFailedWithError:", v176, location[0]);

    v170 = 1;
  }
  else
  {
    v168 = 0;
    v118 = 0;
    if (-[SUSUISoftwareUpdateManager clientIsBuddy](v176, "clientIsBuddy"))
    {
      v169 = -[SUSUISoftwareUpdateManager delegate](v176, "delegate");
      v168 = 1;
      v118 = objc_opt_respondsToSelector();
    }
    v117 = v118;
    if ((v168 & 1) != 0)

    if ((v117 & 1) == 0
      || (v115 = -[SUSUISoftwareUpdateManager delegate](v176, "delegate"),
          v116 = objc_msgSend(v115, "manager:shouldShowAlertForScanError:", v176, location[0]),
          v115,
          (v116 & 1) != 0))
    {
      v165 = (os_log_t)_SUSUILoggingFacility();
      v164 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
      {
        v107 = v165;
        *(_DWORD *)v108 = v164;
        v109 = SUSUISoftwareUpdateStateToString(v176->_state);
        v110 = v109;
        v163 = v110;
        state = v176->_state;
        v3 = v176->_preferredUpdate == 0;
        v161 = 0;
        if (v3)
        {
          v106 = CFSTR("N/A");
        }
        else
        {
          v162 = (id)-[SUDescriptor humanReadableUpdateName](v176->_preferredUpdate, "humanReadableUpdateName");
          v161 = 1;
          v106 = (const __CFString *)v162;
        }
        v103 = v106;
        preferredUpdate = v176->_preferredUpdate;
        preferredUpdateError = v176->_preferredUpdateError;
        v4 = v176->_alternateUpdate == 0;
        v159 = 0;
        if (v4)
        {
          v102 = CFSTR("N/A");
        }
        else
        {
          v160 = (id)-[SUDescriptor humanReadableUpdateName](v176->_alternateUpdate, "humanReadableUpdateName");
          v159 = 1;
          v102 = (const __CFString *)v160;
        }
        v98 = v102;
        alternateUpdate = v176->_alternateUpdate;
        alternateUpdateError = v176->_alternateUpdateError;
        download = v176->_download;
        v5 = v176->_download == 0;
        v157 = 0;
        v155 = 0;
        v153 = 0;
        if (v5
          || (v158 = -[SUDownload descriptor](v176->_download, "descriptor"),
              v157 = 1,
              !v158))
        {
          v97 = CFSTR("N/A");
        }
        else
        {
          v156 = -[SUDownload descriptor](v176->_download, "descriptor");
          v96 = 1;
          v155 = 1;
          v154 = (id)objc_msgSend(v156, "humanReadableUpdateName");
          v153 = 1;
          v97 = (const __CFString *)v154;
        }
        v93 = v97;
        v94 = objc_loadWeakRetained((id *)&v176->_delegate);
        v95 = objc_loadWeakRetained((id *)&v176->_delegate);
        v151 = 0;
        v149 = 0;
        if (v95)
        {
          v152 = objc_loadWeakRetained((id *)&v176->_delegate);
          v91 = 1;
          v151 = 1;
          v6 = (objc_class *)objc_opt_class();
          v150 = NSStringFromClass(v6);
          v149 = 1;
          v92 = (const __CFString *)v150;
        }
        else
        {
          v92 = CFSTR("N/A");
        }
        v88 = v92;
        v89 = objc_loadWeakRetained((id *)&v176->_hostController);
        v90 = objc_loadWeakRetained((id *)&v176->_hostController);
        v147 = 0;
        v145 = 0;
        if (v90)
        {
          v148 = objc_loadWeakRetained((id *)&v176->_hostController);
          v86 = 1;
          v147 = 1;
          v7 = (objc_class *)objc_opt_class();
          v146 = NSStringFromClass(v7);
          v145 = 1;
          v87 = (const __CFString *)v146;
        }
        else
        {
          v87 = CFSTR("N/A");
        }
        v82 = v87;
        v83 = location[0];
        v84 = &v14;
        v85 = v177;
        __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0((uint64_t)v177, (uint64_t)v121, (uint64_t)v110, state, (uint64_t)v103, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v98, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v93, (uint64_t)v94, (uint64_t)v88, (uint64_t)v89, (uint64_t)v87, (uint64_t)location[0], -[SUSUISoftwareUpdateManager state](v176, "state"));
        _os_log_impl(&dword_21BF33000, v107, v108[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nScan error: %@; state: %d",
          v85,
          0xA4u);
        if ((v145 & 1) != 0)

        if ((v147 & 1) != 0)
        if ((v149 & 1) != 0)

        if ((v151 & 1) != 0)
        if ((v153 & 1) != 0)

        if ((v155 & 1) != 0)
        if ((v157 & 1) != 0)

        if ((v159 & 1) != 0)
        if ((v161 & 1) != 0)

        objc_storeStrong(&v163, 0);
      }
      objc_storeStrong((id *)&v165, 0);
      v79 = (id)objc_msgSend(location[0], "domain");
      v80 = getSUErrorDomain_3();
      v8 = objc_msgSend(v79, "isEqualToString:");
      v81 = 0;
      if ((v8 & 1) != 0)
        v81 = objc_msgSend(location[0], "code") == 26;
      v78 = v81;

      if (v78)
      {
        v56 = (id)MEMORY[0x24BEBD3B0];
        v61 = 0x24BDD1000uLL;
        v54 = MEMORY[0x24BDD1488];
        v62 = 0x24BEAE000uLL;
        v60 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v64 = &stru_24E0011F0;
        v65 = CFSTR("Software Update");
        v59 = (id)objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_CHECK_FOR_UPDATE"));
        v55 = *(id *)(v61 + 1160);
        v58 = (id)objc_msgSend(v55, "bundleForClass:", objc_opt_class());
        v57 = (id)objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("NETWORK_SCAN_ERROR"), v64, v65);
        v66 = 1;
        v9 = (id)objc_msgSend(v56, "alertControllerWithTitle:message:preferredStyle:", v59);
        v76 = &v144;
        v144 = v9;

        v69 = v144;
        v68 = (id)MEMORY[0x24BEBD3A8];
        v63 = *(id *)(v61 + 1160);
        v72 = (id)objc_msgSend(v63, "bundleForClass:", objc_opt_class());
        v71 = (id)objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("CANCEL"), v64, v65);
        v67 = &v138;
        v138 = MEMORY[0x24BDAC760];
        v139 = -1073741824;
        v140 = 0;
        v141 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke;
        v142 = &unk_24DFFCAD0;
        v75 = (id *)v143;
        v143[0] = v176;
        v74 = (id *)(v67 + 5);
        v143[1] = location[0];
        v70 = (id)objc_msgSend(v68, "actionWithTitle:style:handler:", v71, v66, v67);
        objc_msgSend(v69, "addAction:");

        v73 = objc_loadWeakRetained((id *)&v176->_hostController);
        obj = 0;
        objc_msgSend(v73, "presentViewController:animated:completion:", v144, 1);

        objc_storeStrong(v74, obj);
        objc_storeStrong(v75, obj);
        objc_storeStrong(v76, obj);
      }
      else
      {
        v137 = 0;
        v52 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v53 = objc_msgSend(v52, "sf_isInternalInstall");

        if ((v53 & 1) != 0)
        {
          v51 = (id)objc_msgSend(location[0], "userInfo");
          v136 = (id)objc_msgSend(v51, "objectForKey:", *MEMORY[0x24BDD0FF0]);

          if (!v136)
            objc_storeStrong(&v136, CFSTR("Verify that you are connected to the Internal Network; trigger VPN manually if applicable."));
          v47 = (id)MEMORY[0x24BDD17C8];
          v46 = MEMORY[0x24BDD1488];
          v49 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v48 = (id)objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("GENERIC_SCAN_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v50 = &v136;
          v10 = (id)objc_msgSend(v47, "stringWithFormat:", CFSTR("%@\n\n[Internal Only]\n%@"), v48, v136);
          v11 = v137;
          v137 = v10;

          objc_storeStrong(v50, 0);
        }
        else
        {
          v44 = MEMORY[0x24BDD1488];
          v45 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v12 = (id)objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("GENERIC_SCAN_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v13 = v137;
          v137 = v12;

        }
        v27 = (id)MEMORY[0x24BEBD3B0];
        v30 = 0x24BDD1000uLL;
        v26 = MEMORY[0x24BDD1488];
        v31 = 0x24BEAE000uLL;
        v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v33 = &stru_24E0011F0;
        v34 = CFSTR("Software Update");
        v28 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_CHECK_FOR_UPDATE"));
        v37 = 1;
        v135 = (id)objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:");

        v40 = v135;
        v39 = (id)MEMORY[0x24BEBD3A8];
        v32 = *(id *)(v30 + 1160);
        v43 = (id)objc_msgSend(v32, "bundleForClass:", objc_opt_class());
        v42 = (id)objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("CANCEL"), v33, v34);
        v38 = &v129;
        v129 = MEMORY[0x24BDAC760];
        v130 = -1073741824;
        v131 = 0;
        v132 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_2;
        v133 = &unk_24DFFCAD0;
        v35 = (id *)v134;
        v134[0] = v176;
        v36 = (id *)(v38 + 5);
        v134[1] = location[0];
        v41 = (id)objc_msgSend(v39, "actionWithTitle:style:handler:", v42, v37, v38);
        objc_msgSend(v40, "addAction:");

        if (!-[SUSUISoftwareUpdateManager clientIsBuddy](v176, "clientIsBuddy"))
        {
          v21 = v135;
          v20 = (id)MEMORY[0x24BEBD3A8];
          v18 = MEMORY[0x24BDD1488];
          v24 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E0011F0, CFSTR("Software Update"));
          v19 = &v123;
          v123 = MEMORY[0x24BDAC760];
          v124 = -1073741824;
          v125 = 0;
          v126 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_3;
          v127 = &unk_24DFF77E8;
          v25 = (id *)&v128;
          v128 = v176;
          v22 = (id)objc_msgSend(v20, "actionWithTitle:style:handler:", v23, 0, v19);
          objc_msgSend(v21, "addAction:");

          objc_storeStrong(v25, 0);
        }
        v15 = objc_loadWeakRetained((id *)&v176->_hostController);
        v16 = &v135;
        v17 = 0;
        objc_msgSend(v15, "presentViewController:animated:completion:", v135, 1);

        objc_storeStrong(v36, v17);
        objc_storeStrong(v35, v17);
        objc_storeStrong(v16, v17);
        objc_storeStrong(&v137, v17);
      }
      v170 = 0;
    }
    else
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        *(_DWORD *)v113 = type;
        buf = v178;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v178, (uint64_t)v121, (uint64_t)location[0]);
        _os_log_impl(&dword_21BF33000, oslog, type, "%s: Buddy: don't show the alert for %@", v178, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[SUSUISoftwareUpdateManager _notifyScanFailed:](v176, "_notifyScanFailed:", location[0]);
      v170 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyScanFailed:", *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyScanFailed:", *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_3(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "setState:", 0);
  objc_storeStrong(location, 0);
}

- (void)handleRollbackApplied
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  objc_class *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9[9];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  const __CFString *v27;
  const __CFString *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id *v36;
  id *v37;
  id obj;
  id *v39;
  uint8_t *buf;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id v44;
  id v45;
  int v46;
  const __CFString *v47;
  const __CFString *v48;
  id WeakRetained;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v57;
  const __CFString *v58;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v61;
  os_log_t log;
  os_log_type_t type[4];
  id v64;
  id v65;
  int state;
  const char *v67;
  uint64_t v68;
  int v69;
  int v70;
  void (*v71)(id *, void *);
  void *v72;
  SUSUISoftwareUpdateManager *v73;
  id v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  SUDescriptor *v89;
  char v90;
  __CFString *v91;
  char v92;
  __CFString *v93;
  id location;
  unsigned __int8 v95;
  id v96[2];
  SUSUISoftwareUpdateManager *v97;
  _BYTE v98[152];
  uint64_t v99;

  v67 = "-[SUSUISoftwareUpdateManager handleRollbackApplied]";
  v99 = *MEMORY[0x24BDAC8D0];
  v97 = self;
  v96[1] = (id)a2;
  v96[0] = _SUSUILoggingFacility();
  v95 = 0;
  if (os_log_type_enabled((os_log_t)v96[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v96[0];
    *(_DWORD *)type = v95;
    v64 = SUSUISoftwareUpdateStateToString(v97->_state);
    v65 = v64;
    location = v65;
    state = v97->_state;
    v2 = v97->_preferredUpdate == 0;
    v92 = 0;
    if (v2)
    {
      v61 = CFSTR("N/A");
    }
    else
    {
      v93 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v97->_preferredUpdate, "humanReadableUpdateName");
      v92 = 1;
      v61 = v93;
    }
    v58 = v61;
    preferredUpdate = v97->_preferredUpdate;
    preferredUpdateError = v97->_preferredUpdateError;
    v3 = v97->_alternateUpdate == 0;
    v90 = 0;
    if (v3)
    {
      v57 = CFSTR("N/A");
    }
    else
    {
      v91 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v97->_alternateUpdate, "humanReadableUpdateName");
      v90 = 1;
      v57 = v91;
    }
    v53 = v57;
    alternateUpdate = v97->_alternateUpdate;
    alternateUpdateError = v97->_alternateUpdateError;
    download = v97->_download;
    v4 = v97->_download == 0;
    v88 = 0;
    v86 = 0;
    v84 = 0;
    if (v4
      || (v89 = -[SUDownload descriptor](v97->_download, "descriptor"), v88 = 1, !v89))
    {
      v52 = CFSTR("N/A");
    }
    else
    {
      v87 = -[SUDownload descriptor](v97->_download, "descriptor");
      v51 = 1;
      v86 = 1;
      v85 = (id)objc_msgSend(v87, "humanReadableUpdateName");
      v84 = 1;
      v52 = (const __CFString *)v85;
    }
    v48 = v52;
    WeakRetained = objc_loadWeakRetained((id *)&v97->_delegate);
    v50 = objc_loadWeakRetained((id *)&v97->_delegate);
    v82 = 0;
    v80 = 0;
    if (v50)
    {
      v83 = objc_loadWeakRetained((id *)&v97->_delegate);
      v46 = 1;
      v82 = 1;
      v5 = (objc_class *)objc_opt_class();
      v81 = NSStringFromClass(v5);
      v80 = 1;
      v47 = (const __CFString *)v81;
    }
    else
    {
      v47 = CFSTR("N/A");
    }
    v43 = v47;
    v44 = objc_loadWeakRetained((id *)&v97->_hostController);
    v45 = objc_loadWeakRetained((id *)&v97->_hostController);
    v78 = 0;
    v76 = 0;
    if (v45)
    {
      v79 = objc_loadWeakRetained((id *)&v97->_hostController);
      v41 = 1;
      v78 = 1;
      v6 = (objc_class *)objc_opt_class();
      v77 = NSStringFromClass(v6);
      v76 = 1;
      v42 = (const __CFString *)v77;
    }
    else
    {
      v42 = CFSTR("N/A");
    }
    v39 = v9;
    buf = v98;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v98, (uint64_t)v67, (uint64_t)v65, state, (uint64_t)v58, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v53, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v48, (uint64_t)WeakRetained, (uint64_t)v43, (uint64_t)v44, (uint64_t)v42);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nHandle rollback already applied", buf, 0x94u);
    if ((v76 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v80 & 1) != 0)

    if ((v82 & 1) != 0)
    if ((v84 & 1) != 0)

    if ((v86 & 1) != 0)
    if ((v88 & 1) != 0)

    if ((v90 & 1) != 0)
    if ((v92 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  obj = 0;
  objc_storeStrong(v96, 0);
  v24 = 0x24BDD1000uLL;
  v9[8] = (id)MEMORY[0x24BDD1488];
  v25 = 0x24BEAE000uLL;
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = &stru_24E0011F0;
  v28 = CFSTR("Software Update");
  v7 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_BODY"));
  v37 = &v75;
  v75 = v7;

  v12 = (id)MEMORY[0x24BEBD3B0];
  v11 = *(id *)(v24 + 1160);
  v14 = (id)objc_msgSend(v11, "bundleForClass:", objc_opt_class());
  v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_TITLE"), v27, v28);
  v16 = 1;
  v8 = (id)objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:");
  v36 = &v74;
  v74 = v8;

  v19 = v74;
  v23 = 0x24BEBD000uLL;
  v18 = (id)MEMORY[0x24BEBD3A8];
  v15 = *(id *)(v24 + 1160);
  v22 = (id)objc_msgSend(v15, "bundleForClass:", objc_opt_class());
  v21 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), v27, v28);
  v17 = &v68;
  v68 = MEMORY[0x24BDAC760];
  v69 = -1073741824;
  v70 = 0;
  v71 = __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke;
  v72 = &unk_24DFF77E8;
  v35 = (id *)&v73;
  v73 = v97;
  v20 = (id)objc_msgSend(v18, "actionWithTitle:style:handler:", v21, v16, v17);
  objc_msgSend(v19, "addAction:");

  v30 = v74;
  v29 = *(id *)(v23 + 936);
  v26 = *(id *)(v24 + 1160);
  v33 = (id)objc_msgSend(v26, "bundleForClass:", objc_opt_class());
  v32 = (id)objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ROLLBACK_APPLIED_ALERT_BUTTON_REBOOT_NOW"), v27, v28);
  v31 = (id)objc_msgSend(v29, "actionWithTitle:style:handler:");
  objc_msgSend(v30, "addAction:");

  v34 = objc_loadWeakRetained((id *)&v97->_hostController);
  objc_msgSend(v34, "presentViewController:animated:completion:", v74, 1, obj);

  objc_storeStrong(v35, obj);
  objc_storeStrong(v36, obj);
  objc_storeStrong(v37, obj);
}

void __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "_notifyScanFailed:", 0);
  objc_storeStrong(location, 0);
}

void __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke_2(void *a1, void *a2)
{
  id v3;
  id v4[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38500]), "initWithReason:", CFSTR("Reboot for rollback apply"));
  objc_msgSend(v4[0], "setRebootType:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BE38508]);
  objc_msgSend(v3, "shutdownWithOptions:", v4[0]);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (void)handleDownloadError:(id)a3
{
  id v3;
  char *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  const __CFString *v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  int v20;
  uint64_t *v21;
  uint8_t *buf;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  id WeakRetained;
  id v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  os_log_t log;
  os_log_type_t type[4];
  id v46;
  uint64_t v47;
  int v48;
  const char *v49;
  char *v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  id v61;
  unsigned __int8 v62;
  id v63;
  id location[3];
  _BYTE v65[168];
  uint64_t v66;

  v50 = &v51;
  v49 = "-[SUSUISoftwareUpdateManager handleDownloadError:]";
  v66 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v63 = _SUSUILoggingFacility();
  v62 = 0;
  if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v50 + 53);
    *(_DWORD *)type = v62;
    v46 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v50 + 56) + 88));
    v3 = v46;
    v4 = v50;
    v47 = (uint64_t)v3;
    *((_QWORD *)v50 + 51) = v3;
    v48 = *(_DWORD *)(*((_QWORD *)v4 + 56) + 88);
    LOBYTE(v4) = *(_QWORD *)(*((_QWORD *)v4 + 56) + 120) == 0;
    v60 = 0;
    if ((v4 & 1) != 0)
    {
      v43 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 56) + 120), "humanReadableUpdateName");
      *((_QWORD *)v50 + 50) = v5;
      v60 = 1;
      v43 = v5;
    }
    v40 = v43;
    v41 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 120);
    v42 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 160);
    v6 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 128) == 0;
    v59 = 0;
    if (v6)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 56) + 128), "humanReadableUpdateName");
      *((_QWORD *)v50 + 48) = v7;
      v59 = 1;
      v39 = v7;
    }
    v35 = v39;
    v36 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 128);
    v37 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 168);
    v38 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 8);
    v8 = *(_QWORD *)(*((_QWORD *)v50 + 56) + 8) == 0;
    v58 = 0;
    v57 = 0;
    v56 = 0;
    if (v8
      || (v9 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 56) + 8), "descriptor"),
          *((_QWORD *)v50 + 46) = v9,
          v58 = 1,
          !v9))
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v10 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 56) + 8), "descriptor");
      *((_QWORD *)v50 + 44) = v10;
      v33 = 1;
      v57 = 1;
      v11 = (const __CFString *)(id)objc_msgSend(v10, "humanReadableUpdateName");
      *((_QWORD *)v50 + 42) = v11;
      v56 = 1;
      v34 = v11;
    }
    v30 = v34;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 104));
    v32 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 104));
    v55 = 0;
    v54 = 0;
    if (v32)
    {
      *((_QWORD *)v50 + 40) = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 104));
      v28 = 1;
      v55 = 1;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *((_QWORD *)v50 + 38) = v13;
      v54 = 1;
      v29 = (const __CFString *)v13;
    }
    else
    {
      v29 = CFSTR("N/A");
    }
    v25 = v29;
    v26 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 112));
    v27 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 112));
    v53 = 0;
    v52 = 0;
    if (v27)
    {
      *((_QWORD *)v50 + 36) = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 56) + 112));
      v23 = 1;
      v53 = 1;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *((_QWORD *)v50 + 34) = v15;
      v52 = 1;
      v24 = v15;
    }
    else
    {
      v24 = CFSTR("N/A");
    }
    v16 = *((_QWORD *)v50 + 54);
    v21 = &v17;
    buf = v65;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v65, (uint64_t)v49, v47, v48, (uint64_t)v40, v41, v42, (uint64_t)v35, v36, v37, v38, (uint64_t)v30, (uint64_t)WeakRetained, (uint64_t)v25, (uint64_t)v26, (uint64_t)v24, v16);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nError: %@", buf, 0x9Eu);
    if ((v52 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v54 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v58 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v60 & 1) != 0)

    objc_storeStrong(&v61, 0);
  }
  objc_storeStrong(&v63, 0);
  v19 = (id)objc_msgSend(*((id *)v50 + 54), "domain");
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BEAED98]);

  if ((v20 & 1) != 0)
  {
    v18 = objc_msgSend(*((id *)v50 + 54), "code") - 1;
    if (v18 <= 0x36)
      __asm { BR              X8 }
    if (objc_msgSend(*((id *)v50 + 56), "state") != 8
      && objc_msgSend(*((id *)v50 + 56), "state") != 6
      && objc_msgSend(*((id *)v50 + 56), "state") != 14)
    {
      objc_msgSend(*((id *)v50 + 56), "setState:withDownloadUpdateError:", 8, *((_QWORD *)v50 + 54));
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldIgnoreUpdateError:(id)a3
{
  BOOL v3;
  float v4;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  SUOperationProgress *v17;
  int v18;
  uint64_t v19;
  id location[2];
  SUSUISoftwareUpdateManager *v21;
  char v22;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = objc_msgSend(location[0], "code");
  v12 = (id)objc_msgSend(location[0], "domain");
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEAED98]);

  if ((v13 & 1) != 0)
  {
    if (v19 == 3 || v19 == 11 || v19 == 13)
    {
      v22 = 1;
      v18 = 1;
      goto LABEL_36;
    }
    v3 = v21->_download == 0;
    v16 = 0;
    v11 = 0;
    if (!v3)
    {
      v17 = -[SUDownload progress](v21->_download, "progress");
      v16 = 1;
      v11 = 0;
      if (v17)
      {
        v10 = 1;
        if (v21->_state != 12)
          v10 = v21->_state == 13;
        v11 = v10;
      }
    }
    if ((v16 & 1) != 0)

    if (!v11)
    {
LABEL_35:
      v22 = 0;
      v18 = 1;
      goto LABEL_36;
    }
    v15 = -[SUDownload progress](v21->_download, "progress");
    v8 = (id)objc_msgSend(v15, "phase");
    v9 = 0;
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEAEE98]) & 1) != 0)
    {
      objc_msgSend(v15, "percentComplete");
      v9 = v4 >= 1.0;
    }

    if (!v9)
      goto LABEL_33;
    if (v19 == 33 || v19 == 34 || v19 == 8 || v19 == 31 || v19 == 9 || v19 == 83)
    {
      v22 = 1;
      v18 = 1;
      goto LABEL_34;
    }
    if (v19 == 6)
    {
      v22 = 1;
      v18 = 1;
      goto LABEL_34;
    }
    if (v19 != 20)
      goto LABEL_33;
    v7 = (id)objc_msgSend(location[0], "userInfo");
    v6 = getkSUInstallationConstraintsUnmetKey_1();
    v14 = (id)objc_msgSend(v7, "objectForKey:");

    if (v14 && objc_msgSend(v14, "unsignedIntegerValue") == 4)
    {
      v22 = 1;
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    objc_storeStrong(&v14, 0);
    if (!v18)
LABEL_33:
      v18 = 0;
LABEL_34:
    objc_storeStrong(&v15, 0);
    if (v18)
      goto LABEL_36;
    goto LABEL_35;
  }
  v22 = 0;
  v18 = 1;
LABEL_36:
  objc_storeStrong(location, 0);
  return v22 & 1;
}

- (BOOL)shouldSetStateForInstallError:(id)a3 outError:(id *)a4 outState:(int *)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  BOOL v10;
  id v11;
  id v12;
  const __CFString *v13;
  objc_class *v14;
  objc_class *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v20;
  os_log_t v21;
  os_log_type_t v22[4];
  uint8_t *v23;
  unint64_t v24;
  uint64_t *v25;
  uint8_t *buf;
  int v27;
  const __CFString *v28;
  const __CFString *v29;
  id v30;
  id v31;
  int v32;
  const __CFString *v33;
  const __CFString *v34;
  id WeakRetained;
  id v36;
  int v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  os_log_t log;
  os_log_type_t v49[4];
  id v50;
  uint64_t v51;
  int v52;
  const char *v53;
  id *v54;
  int *v55;
  char *v56;
  os_log_type_t v57;
  os_log_t oslog;
  int v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  id v73;
  os_log_type_t type;
  os_log_t v75[3];
  id location[3];
  char v77;
  _BYTE v78[32];
  _BYTE v79[168];
  uint64_t v80;

  v56 = &v67;
  v54 = a4;
  v55 = a5;
  v53 = "-[SUSUISoftwareUpdateManager shouldSetStateForInstallError:outError:outState:]";
  v80 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v75[2] = (os_log_t)v54;
  v75[1] = (os_log_t)v55;
  v75[0] = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v75[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v56 + 13);
    *(_DWORD *)v49 = type;
    v50 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v56 + 18) + 88));
    v5 = v50;
    v6 = v56;
    v51 = (uint64_t)v5;
    *((_QWORD *)v56 + 11) = v5;
    v52 = *(_DWORD *)(*((_QWORD *)v6 + 18) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 18) + 120) == 0;
    v72 = 0;
    if ((v6 & 1) != 0)
    {
      v47 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v56 + 18) + 120), "humanReadableUpdateName");
      *((_QWORD *)v56 + 10) = v7;
      v72 = 1;
      v47 = v7;
    }
    v44 = v47;
    v45 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 120);
    v46 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 128) == 0;
    v71 = 0;
    if (v8)
    {
      v43 = CFSTR("N/A");
    }
    else
    {
      v9 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v56 + 18) + 128), "humanReadableUpdateName");
      *((_QWORD *)v56 + 8) = v9;
      v71 = 1;
      v43 = v9;
    }
    v39 = v43;
    v40 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 128);
    v41 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 168);
    v42 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 8);
    v10 = *(_QWORD *)(*((_QWORD *)v56 + 18) + 8) == 0;
    v70 = 0;
    v69 = 0;
    v68 = 0;
    if (v10
      || (v11 = (id)objc_msgSend(*(id *)(*((_QWORD *)v56 + 18) + 8), "descriptor"),
          *((_QWORD *)v56 + 6) = v11,
          v70 = 1,
          !v11))
    {
      v38 = CFSTR("N/A");
    }
    else
    {
      v12 = (id)objc_msgSend(*(id *)(*((_QWORD *)v56 + 18) + 8), "descriptor");
      *((_QWORD *)v56 + 4) = v12;
      v37 = 1;
      v69 = 1;
      v13 = (const __CFString *)(id)objc_msgSend(v12, "humanReadableUpdateName");
      *((_QWORD *)v56 + 2) = v13;
      v68 = 1;
      v38 = v13;
    }
    v34 = v38;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 104));
    v36 = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 104));
    v66 = 0;
    v64 = 0;
    if (v36)
    {
      *(_QWORD *)v56 = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 104));
      v32 = 1;
      v66 = 1;
      v14 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v14);
      v64 = 1;
      v33 = (const __CFString *)v65;
    }
    else
    {
      v33 = CFSTR("N/A");
    }
    v29 = v33;
    v30 = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 112));
    v31 = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 112));
    v62 = 0;
    v60 = 0;
    if (v31)
    {
      v63 = objc_loadWeakRetained((id *)(*((_QWORD *)v56 + 18) + 112));
      v27 = 1;
      v62 = 1;
      v15 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v15);
      v60 = 1;
      v28 = (const __CFString *)v61;
    }
    else
    {
      v28 = CFSTR("N/A");
    }
    v16 = *((_QWORD *)v56 + 16);
    v25 = &v20;
    buf = v79;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v79, (uint64_t)v53, v51, v52, (uint64_t)v44, v45, v46, (uint64_t)v39, v40, v41, v42, (uint64_t)v34, (uint64_t)WeakRetained, (uint64_t)v29, (uint64_t)v30, (uint64_t)v28, v16);
    _os_log_impl(&dword_21BF33000, log, v49[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nerror: %@", buf, 0x9Eu);
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    if ((v69 & 1) != 0)
    if ((v70 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v72 & 1) != 0)

    objc_storeStrong(&v73, 0);
  }
  objc_storeStrong((id *)v75, 0);
  if (*((_QWORD *)v56 + 15))
  {
    v17 = objc_retainAutorelease(*((id *)v56 + 16));
    **((_QWORD **)v56 + 15) = v17;
  }
  if (*((_QWORD *)v56 + 14))
    **((_DWORD **)v56 + 14) = 10;
  v24 = objc_msgSend(*((id *)v56 + 16), "code") - 3;
  if (v24 <= 0x27)
    __asm { BR              X8 }
  oslog = (os_log_t)_SUSUILoggingFacility();
  v57 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v21 = oslog;
    *(_DWORD *)v22 = v57;
    v18 = *((_QWORD *)v56 + 16);
    v23 = v78;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v78, (uint64_t)v53, v18);
    _os_log_impl(&dword_21BF33000, v21, v22[0], "%s: Couldn't resolve the installation error: %@", v23, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v77 = 1;
  v59 = 1;
  objc_storeStrong(location, 0);
  return v77 & 1;
}

void __78__SUSUISoftwareUpdateManager_shouldSetStateForInstallError_outError_outState___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  if (v5)
    objc_msgSend(a1[4], "handleScanError:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4
{
  id *v5;
  id v6;
  id location[2];
  SUSUISoftwareUpdateManager *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
    *a4 = -[SUSUISoftwareUpdateManager enableUpdateButtonForError:](v9, "enableUpdateButtonForError:", location[0]);
  v6 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:](v9, "humanReadableDescriptionForError:", location[0], location);
  objc_storeStrong(v5, 0);
  return v6;
}

- (BOOL)enableUpdateButtonForError:(id)a3
{
  id v3;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  os_log_t oslog;
  id obj;
  id v16;
  os_log_type_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  id location[2];
  SUSUISoftwareUpdateManager *v27;
  char v28;
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[SUSUISoftwareUpdateManager shouldIgnoreUpdateError:](v27, "shouldIgnoreUpdateError:", location[0]))
  {
    v12 = (id)objc_msgSend(location[0], "domain");
    v11 = getSUErrorDomain_3();
    v13 = objc_msgSend(v12, "isEqualToString:");

    if ((v13 & 1) != 0)
    {
      v24 = objc_msgSend(location[0], "code");
      if ((unint64_t)(v24 - 33) > 1 || -[SUSUISoftwareUpdateManager state](v27, "state") != 14)
        goto LABEL_23;
      v23 = 0;
      v8 = objc_alloc(MEMORY[0x24BDC2810]);
      v9 = dispatch_get_global_queue(33, 0);
      v22 = (id)objc_msgSend(v8, "initWithQueue:");

      v21 = 0;
      v19 = 0;
      v10 = (id)objc_msgSend(v22, "getPreferredDataSubscriptionContextSync:", &v19);
      objc_storeStrong(&v21, v19);
      v20 = v10;
      if (v10)
      {
        v16 = 0;
        obj = 0;
        v6 = (void *)objc_msgSend(v22, "copyRegistrationStatus:error:", v20, &obj);
        objc_storeStrong(&v16, obj);
        v3 = v23;
        v23 = v6;

        if (!v23)
        {
          oslog = (os_log_t)_SUSUILoggingFacility();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v5 = (id)objc_msgSend(v16, "description");
            __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v5);
            _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "Failed to copyRegistrationStatus from CoreTelephony. %@", v29, 0xCu);

          }
          objc_storeStrong((id *)&oslog, 0);
        }
        objc_storeStrong(&v16, 0);
      }
      else
      {
        v18 = _SUSUILoggingFacility();
        v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          v7 = (id)objc_msgSend(v21, "description");
          __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v7);
          _os_log_impl(&dword_21BF33000, (os_log_t)v18, v17, "Failed to get preferred CTXPCServiceSubscriptionContext. %@", v30, 0xCu);

        }
        objc_storeStrong(&v18, 0);
      }
      if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDC2C68]) & 1) != 0)
      {
        if ((PSIsDataRoamingEnabled() & 1) != 0)
        {
          v28 = 1;
          v25 = 1;
        }
        else
        {
          v25 = 2;
        }
      }
      else
      {
        v25 = 0;
      }
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      if (!v25)
      {
LABEL_23:
        v28 = 0;
        v25 = 1;
        goto LABEL_25;
      }
      if (v25 != 2)
        goto LABEL_25;
    }
    v28 = 0;
    v25 = 1;
    goto LABEL_25;
  }
  v28 = 0;
  v25 = 1;
LABEL_25:
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (id)humanReadableTitleForError:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  id location[2];
  SUSUISoftwareUpdateManager *v15;
  id v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  if (-[SUSUISoftwareUpdateManager shouldIgnoreUpdateError:](v15, "shouldIgnoreUpdateError:", location[0]))
  {
    v16 = 0;
    v12 = 1;
  }
  else
  {
    v8 = (id)objc_msgSend(location[0], "domain");
    v7 = getSUErrorDomain_3();
    v9 = objc_msgSend(v8, "isEqualToString:");

    if ((v9 & 1) != 0)
    {
      v11 = objc_msgSend(location[0], "code");
      if ((unint64_t)(v11 - 6) <= 0x64)
        __asm { BR              X8 }
    }
    v10 = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)location[0]);
      _os_log_impl(&dword_21BF33000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "SU generic title for error: %@", v17, 0xCu);
    }
    objc_storeStrong(&v10, 0);
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UPDATE_ERROR_TITLE_GENERAL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
    v4 = v13;
    v13 = v3;

    v16 = v13;
    v12 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)humanReadableDescriptionForError:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id v13;
  char v14;
  char v15;
  id v16;
  os_log_t oslog;
  uint64_t v18;
  int v19;
  id v20;
  id location[2];
  SUSUISoftwareUpdateManager *v22;
  id v23;
  uint8_t v24[16];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  if (-[SUSUISoftwareUpdateManager shouldIgnoreUpdateError:](v22, "shouldIgnoreUpdateError:", location[0]))
  {
    v23 = 0;
    v19 = 1;
  }
  else
  {
    v13 = (id)objc_msgSend(location[0], "domain");
    v12 = getSUErrorDomain_3();
    v14 = objc_msgSend(v13, "isEqualToString:");

    if ((v14 & 1) != 0)
    {
      v18 = objc_msgSend(location[0], "code");
      if ((unint64_t)(v18 - 6) <= 0x64)
        __asm { BR              X8 }
    }
    else
    {
      v10 = (id)objc_msgSend(location[0], "domain");
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.preferences.softwareupdate"));

      if ((v11 & 1) != 0 && objc_msgSend(location[0], "code") == 1)
      {
        v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UPDATE_REQUESTED_EXPLANATION"), &stru_24E0011F0, CFSTR("Software Update"));
        v4 = v20;
        v20 = v3;

      }
    }
    if (location[0] && !v20)
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location[0]);
        _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "SU generic error: %@", v24, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v20, &stru_24E0011F0);
    }
    v15 = 0;
    v8 = 0;
    if (location[0])
    {
      v8 = 0;
      if ((objc_msgSend(v20, "isEqualToString:", &stru_24E0011F0) & 1) != 0)
      {
        v16 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v15 = 1;
        v8 = objc_msgSend(v16, "sf_isInternalInstall");
      }
    }
    if ((v15 & 1) != 0)

    if ((v8 & 1) != 0)
    {
      v5 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Internal Only] An unresolvable error has occurred, please file a radar. Error Code: %ld."), objc_msgSend(location[0], "code"));
      v6 = v20;
      v20 = v5;

    }
    v23 = v20;
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4 showAsButtonFooter:(BOOL *)a5
{
  id v6;
  id location[2];
  SUSUISoftwareUpdateManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a5)
    *a5 = 0;
  v6 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v10, "humanReadableDescriptionForError:enableButton:", location[0], a4);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)promptForDevicePasscodeForDescriptor:(id)a3 unattendedInstall:(BOOL)a4 completion:(id)a5
{
  id v7;
  SUSUISoftwareUpdateClientManager *suClient;
  SUSUISoftwareUpdateManager *v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  BOOL v14;
  id location[2];
  SUSUISoftwareUpdateManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = 0;
  objc_storeStrong(&v13, a5);
  suClient = v16->_suClient;
  v7 = location[0];
  v9 = v16;
  v10 = location[0];
  v12 = v14;
  v11 = v13;
  -[SUSUISoftwareUpdateClientManager isInstallationKeybagRequiredForDescriptor:result:](suClient, "isInstallationKeybagRequiredForDescriptor:result:", v7);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  id v9;
  id v10;
  const __CFString *v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  const __CFString *v15;
  char v16;
  id v17;
  uint64_t v18;
  os_log_t v19;
  os_log_type_t v20[4];
  uint8_t *v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  id *v25;
  id *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  id *v31;
  id *v32;
  id obja;
  id v34;
  int v35;
  os_log_t v36;
  os_log_type_t v37[4];
  uint8_t *v38;
  int v39;
  int v40;
  uint64_t *v41;
  uint8_t *buf;
  int v43;
  const __CFString *v44;
  const __CFString *v45;
  id v46;
  id v47;
  int v48;
  const __CFString *v49;
  const __CFString *v50;
  id WeakRetained;
  id v52;
  int v53;
  const __CFString *v54;
  const __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  os_log_t log;
  os_log_type_t v65[4];
  id v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  char *v71;
  os_log_type_t v72;
  os_log_t v73;
  uint64_t v74;
  int v75;
  int v76;
  void (*v77)(uint64_t, void *, void *);
  void *v78;
  _QWORD v79[2];
  char v80;
  char v81;
  uint64_t v82;
  int v83;
  int v84;
  void (*v85)(uint64_t, void *, void *);
  void *v86;
  _QWORD v87[2];
  char v88;
  char v89;
  os_log_type_t v90;
  os_log_t oslog;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  id v104;
  os_log_type_t type;
  os_log_t v106[2];
  id location;
  char v108;
  uint64_t v109;
  _BYTE v110[16];
  _BYTE v111[16];
  _BYTE v112[168];
  uint64_t v113;

  v71 = &v93;
  v70 = a1;
  v69 = "-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke";
  v113 = *MEMORY[0x24BDAC8D0];
  v109 = a1;
  v108 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v106[1] = (os_log_t)v70;
  v106[0] = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v106[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v71 + 21);
    *(_DWORD *)v65 = type;
    v66 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v70 + 32) + 88));
    v3 = v66;
    v4 = v70;
    v67 = (uint64_t)v3;
    *((_QWORD *)v71 + 19) = v3;
    v68 = *(_DWORD *)(*(_QWORD *)(v4 + 32) + 88);
    LOBYTE(v4) = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 120) == 0;
    v103 = 0;
    if ((v4 & 1) != 0)
    {
      v63 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v70 + 32) + 120), "humanReadableUpdateName");
      *((_QWORD *)v71 + 18) = v5;
      v103 = 1;
      v63 = v5;
    }
    v60 = v63;
    v61 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 120);
    v62 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 160);
    v6 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 128) == 0;
    v102 = 0;
    if (v6)
    {
      v59 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*(_QWORD *)(v70 + 32) + 128), "humanReadableUpdateName");
      *((_QWORD *)v71 + 16) = v7;
      v102 = 1;
      v59 = v7;
    }
    v55 = v59;
    v56 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 128);
    v57 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 168);
    v58 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 8);
    v8 = *(_QWORD *)(*(_QWORD *)(v70 + 32) + 8) == 0;
    v101 = 0;
    v100 = 0;
    v99 = 0;
    if (v8
      || (v9 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v70 + 32) + 8), "descriptor"),
          *((_QWORD *)v71 + 14) = v9,
          v101 = 1,
          !v9))
    {
      v54 = CFSTR("N/A");
    }
    else
    {
      v10 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v70 + 32) + 8), "descriptor");
      *((_QWORD *)v71 + 12) = v10;
      v53 = 1;
      v100 = 1;
      v11 = (const __CFString *)(id)objc_msgSend(v10, "humanReadableUpdateName");
      *((_QWORD *)v71 + 10) = v11;
      v99 = 1;
      v54 = v11;
    }
    v50 = v54;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 104));
    v52 = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 104));
    v98 = 0;
    v97 = 0;
    if (v52)
    {
      *((_QWORD *)v71 + 8) = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 104));
      v48 = 1;
      v98 = 1;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *((_QWORD *)v71 + 6) = v13;
      v97 = 1;
      v49 = (const __CFString *)v13;
    }
    else
    {
      v49 = CFSTR("N/A");
    }
    v45 = v49;
    v46 = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 112));
    v47 = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 112));
    v96 = 0;
    v95 = 0;
    if (v47)
    {
      *((_QWORD *)v71 + 4) = objc_loadWeakRetained((id *)(*(_QWORD *)(v70 + 32) + 112));
      v43 = 1;
      v96 = 1;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *((_QWORD *)v71 + 2) = v15;
      v95 = 1;
      v44 = v15;
    }
    else
    {
      v44 = CFSTR("N/A");
    }
    v41 = &v18;
    buf = v112;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v112, (uint64_t)v69, v67, v68, (uint64_t)v60, v61, v62, (uint64_t)v55, v56, v57, v58, (uint64_t)v50, (uint64_t)WeakRetained, (uint64_t)v45, (uint64_t)v46, (uint64_t)v44, v108 & 1);
    _os_log_impl(&dword_21BF33000, log, v65[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisKeybagRequired: %d", buf, 0x9Au);
    if ((v95 & 1) != 0)

    if ((v96 & 1) != 0)
    if ((v97 & 1) != 0)

    if ((v98 & 1) != 0)
    if ((v99 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v101 & 1) != 0)

    if ((v102 & 1) != 0)
    if ((v103 & 1) != 0)

    objc_storeStrong(&v104, 0);
  }
  objc_storeStrong((id *)v106, 0);
  v94 = v108 & 1;
  v92 = 0;
  v40 = 0;
  if ((v108 & 1) == 0)
  {
    v16 = objc_msgSend(*(id *)(v70 + 40), "isSplatOnly");
    v40 = 0;
    if ((v16 & 1) != 0)
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BEAEC28], "sharedInstance");
      *(_QWORD *)v71 = v17;
      v92 = 1;
      v40 = objc_msgSend(v17, "hasPasscodeSet");
    }
  }
  v39 = v40;
  if ((v92 & 1) != 0)

  if ((v39 & 1) != 0)
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v90 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v36 = oslog;
      *(_DWORD *)v37 = v90;
      v38 = v111;
      __os_log_helper_16_2_1_8_32((uint64_t)v111, (uint64_t)v69);
      _os_log_impl(&dword_21BF33000, v36, v37[0], "%s: prompting for passcode for splat-only update, but not generating an installation keybag", v38, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v94 = 1;
  }
  if ((v94 & 1) != 0)
  {
    v34 = (id)objc_msgSend(*(id *)(v70 + 32), "delegate");
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      v30 = (id)objc_msgSend(*(id *)(v70 + 32), "delegate");
      v28 = *(_QWORD *)(v70 + 32);
      v29 = &v82;
      v82 = MEMORY[0x24BDAC760];
      v83 = -1073741824;
      v84 = 0;
      v85 = __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_492;
      v86 = &unk_24DFFCB40;
      v88 = v108 & 1;
      v89 = *(_BYTE *)(v70 + 56) & 1;
      v32 = (id *)v87;
      v87[0] = *(id *)(v70 + 32);
      v31 = (id *)(v29 + 5);
      v87[1] = *(id *)(v70 + 48);
      objc_msgSend(v30, "manager:promptForDeviceLAContextWithDescriptorCompletion:", v28, v29);

      obja = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, obja);
    }
    else
    {
      v24 = (id)objc_msgSend(*(id *)(v70 + 32), "delegate");
      v22 = *(_QWORD *)(v70 + 32);
      v23 = &v74;
      v74 = MEMORY[0x24BDAC760];
      v75 = -1073741824;
      v76 = 0;
      v77 = __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_495;
      v78 = &unk_24DFFCB68;
      v80 = v108 & 1;
      v81 = *(_BYTE *)(v70 + 56) & 1;
      v26 = (id *)v79;
      v79[0] = *(id *)(v70 + 32);
      v25 = (id *)(v23 + 5);
      v79[1] = *(id *)(v70 + 48);
      objc_msgSend(v24, "manager:promptForDevicePasscodeWithDescriptorCompletion:", v22, v23);

      v27 = 0;
      objc_storeStrong(v25, 0);
      objc_storeStrong(v26, v27);
    }
  }
  else if (*(_QWORD *)(v70 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(v70 + 48) + 16))();
  }
  else
  {
    v73 = (os_log_t)_SUSUILoggingFacility();
    v72 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v73;
      *(_DWORD *)v20 = v72;
      v21 = v110;
      __os_log_helper_16_2_1_8_32((uint64_t)v110, (uint64_t)v69);
      _os_log_impl(&dword_21BF33000, v19, v20[0], "%s: No completion callback has been supplied.", v21, 0xCu);
    }
    objc_storeStrong((id *)&v73, 0);
  }
  objc_storeStrong(&location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_492(uint64_t a1, void *a2, void *a3)
{
  os_log_t oslog;
  id v6;
  os_log_type_t v7;
  id v8[2];
  id v9;
  id location[2];
  uint8_t v11[16];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = (id)a1;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if (location[0])
    {
      v8[0] = _SUSUILoggingFacility();
      v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke", *(_BYTE *)(a1 + 49) & 1);
        _os_log_impl(&dword_21BF33000, (os_log_t)v8[0], v7, "%s: asynchronously creating installation keybag - forUnattendedInstall:%d", v12, 0x12u);
      }
      objc_storeStrong(v8, 0);
      v6 = objc_alloc_init(MEMORY[0x24BEAEC30]);
      objc_msgSend(v6, "setLaContext:", location[0]);
      objc_msgSend(v6, "setDescriptor:", v9);
      objc_msgSend(v6, "setKeybagType:", (*(_BYTE *)(a1 + 49) & 1) != 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "createInstallationKeybagWithOptions:completion:", v6, *(_QWORD *)(a1 + 40));
      objc_storeStrong(&v6, 0);
    }
    else
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke");
        _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: failed to get user passcode", v11, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), location[0] != 0, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_495(uint64_t a1, void *a2, void *a3)
{
  os_log_t oslog;
  id v6;
  os_log_type_t v7;
  id v8[2];
  id v9;
  id location[2];
  uint8_t v11[16];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = (id)a1;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if (location[0])
    {
      v8[0] = _SUSUILoggingFacility();
      v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke", *(_BYTE *)(a1 + 49) & 1);
        _os_log_impl(&dword_21BF33000, (os_log_t)v8[0], v7, "%s: asynchronously creating installation keybag - forUnattendedInstall:%d", v12, 0x12u);
      }
      objc_storeStrong(v8, 0);
      v6 = objc_alloc_init(MEMORY[0x24BEAEC30]);
      objc_msgSend(v6, "setPasscode:", location[0]);
      objc_msgSend(v6, "setDescriptor:", v9);
      objc_msgSend(v6, "setKeybagType:", (*(_BYTE *)(a1 + 49) & 1) != 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "createInstallationKeybagWithOptions:completion:", v6, *(_QWORD *)(a1 + 40));
      objc_storeStrong(&v6, 0);
    }
    else
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke");
        _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: failed to get user passcode", v11, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), location[0] != 0, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_alertForDownloadConstraintsWithCompletion:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;
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
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id WeakRetained;
  char v26;
  const __CFString *v27;
  char v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  NSObject *v40;
  os_log_type_t v41;
  id SUDownloadPolicyFactoryClass_0;
  id v43;
  SUDownloadOptions *v44;
  SUDownload *v45;
  SUDescriptor *v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(uint64_t, void *);
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  int v55;
  int v56;
  void (*v57)(uint64_t, void *);
  void *v58;
  id v59;
  id v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  os_log_type_t v70;
  os_log_t v71;
  id v72;
  id v73;
  char v74;
  uint8_t v75[7];
  os_log_type_t v76;
  os_log_t oslog;
  uint8_t v78[7];
  os_log_type_t v79;
  id v80;
  uint8_t v81[7];
  os_log_type_t v82;
  id v83;
  uint8_t v84[15];
  os_log_type_t v85;
  id v86;
  uint8_t v88[15];
  os_log_type_t v89;
  id v90;
  id v91;
  uint8_t v92[7];
  os_log_type_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  int v100;
  os_log_type_t v101;
  id v102;
  id location[2];
  SUSUISoftwareUpdateManager *v104;
  uint8_t v105[16];
  uint8_t v106[24];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v104 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v99 = 0;
    v98 = 0;
    SUDownloadPolicyFactoryClass_0 = getSUDownloadPolicyFactoryClass_0();
    v46 = -[SUSUISoftwareUpdateManager preferredUpdate](v104, "preferredUpdate");
    v45 = -[SUSUISoftwareUpdateManager download](v104, "download");
    v44 = -[SUDownload downloadOptions](v45, "downloadOptions");
    v43 = (id)-[SUDownloadOptions activeDownloadPolicy](v44, "activeDownloadPolicy");
    v97 = (id)objc_msgSend(SUDownloadPolicyFactoryClass_0, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v46, v43, -[SUSUISoftwareUpdateManager allowCellularOverride](v104, "allowCellularOverride"));

    v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
    if (!v96)
      goto LABEL_65;
    v95 = (id)objc_msgSend(v96, "getInternetDataStatusSync:", 0);
    if (!v95 || (objc_msgSend(v95, "cellularDataPossible") & 1) != 0)
    {
      v100 = 0;
    }
    else
    {
      v94 = _SUSUILoggingFacility();
      v93 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_DEFAULT))
      {
        v40 = v94;
        v41 = v93;
        __os_log_helper_16_0_0(v92);
        _os_log_impl(&dword_21BF33000, v40, v41, "Cellular data not possible on device. Not prompting for cellular download acceptance.", v92, 2u);
      }
      objc_storeStrong(&v94, 0);
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v100 = 1;
    }
    objc_storeStrong(&v95, 0);
    if (!v100)
    {
LABEL_65:
      if (!-[SUSUISoftwareUpdateManager clientIsBuddy](v104, "clientIsBuddy"))
        goto LABEL_21;
      v91 = (id)objc_msgSend(MEMORY[0x24BEAEC40], "sharedInstance");
      if ((objc_msgSend(v91, "isBootstrap") & 1) == 0 || (objc_msgSend(v91, "isPathSatisfied") & 1) != 0)
      {
        v100 = 0;
      }
      else
      {
        v90 = _SUSUILoggingFacility();
        v89 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v90;
          v39 = v89;
          __os_log_helper_16_0_0(v88);
          _os_log_impl(&dword_21BF33000, v38, v39, "Can't download update in bootstrap network. Not prompting for cellular download acceptance", v88, 2u);
        }
        objc_storeStrong(&v90, 0);
        (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
        v100 = 1;
      }
      objc_storeStrong(&v91, 0);
      if (!v100)
      {
LABEL_21:
        if (MGGetBoolAnswer() & 1)
        {
          if ((objc_msgSend(v97, "isDownloadAllowableForCellular") & 1) != 0)
          {
            if (v104->_networkType == 1)
            {
              v80 = _SUSUILoggingFacility();
              v79 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
              {
                v32 = v80;
                v33 = v79;
                __os_log_helper_16_0_0(v78);
                _os_log_impl(&dword_21BF33000, v32, v33, "Device is currently using Wi-Fi. Not prompting for cellular download acceptance.", v78, 2u);
              }
              objc_storeStrong(&v80, 0);
              (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
              v100 = 1;
            }
            else if ((objc_msgSend(v97, "is5GDownloadAllowed") & 1) != 0)
            {
              oslog = (os_log_t)_SUSUILoggingFacility();
              v76 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                v30 = oslog;
                v31 = v76;
                __os_log_helper_16_0_0(v75);
                _os_log_impl(&dword_21BF33000, v30, v31, "Device is using inexpensive HDM. Not prompting for cellular download acceptance.", v75, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
              v100 = 1;
            }
            else
            {
              v74 = objc_msgSend(v97, "isDownloadFreeForCellular") & 1;
              v73 = 0;
              v72 = 0;
              v71 = (os_log_t)_SUSUILoggingFacility();
              v70 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_4_0((uint64_t)v105, v74 & 1);
                _os_log_impl(&dword_21BF33000, v71, v70, "Alerting user about cellular fees. zero rated = %d", v105, 8u);
              }
              objc_storeStrong((id *)&v71, 0);
              v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v68 = 0;
              v66 = 0;
              v64 = 0;
              v62 = 0;
              if ((v74 & 1) != 0)
              {
                v28 = 0;
                if (v104->_download)
                {
                  v69 = -[SUDownload descriptor](v104->_download, "descriptor");
                  v68 = 1;
                  v28 = 0;
                  if (v69)
                  {
                    v67 = -[SUDownload descriptor](v104->_download, "descriptor");
                    v66 = 1;
                    v28 = objc_msgSend(v67, "isSplatOnly");
                  }
                }
                v3 = CFSTR("RSR_CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES");
                if ((v28 & 1) == 0)
                  v3 = CFSTR("CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES");
                v27 = v3;
              }
              else
              {
                v26 = 0;
                if (v104->_download)
                {
                  v65 = -[SUDownload descriptor](v104->_download, "descriptor");
                  v64 = 1;
                  v26 = 0;
                  if (v65)
                  {
                    v63 = -[SUDownload descriptor](v104->_download, "descriptor");
                    v62 = 1;
                    v26 = objc_msgSend(v63, "isSplatOnly");
                  }
                }
                v4 = CFSTR("RSR_CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES");
                if ((v26 & 1) == 0)
                  v4 = CFSTR("CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES");
                v27 = v4;
              }
              v5 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", v27, &stru_24E0011F0, CFSTR("Software Update"));
              v6 = v98;
              v98 = v5;

              if ((v62 & 1) != 0)
              if ((v64 & 1) != 0)

              if ((v66 & 1) != 0)
              if ((v68 & 1) != 0)

              v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v7 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"));
              v8 = v73;
              v73 = v7;

              v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v9 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E0011F0, CFSTR("Software Update"));
              v10 = v72;
              v72 = v9;

              v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v11 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ALLOW_CELLULAR_DOWNLOAD"), &stru_24E0011F0, CFSTR("Software Update"));
              v12 = v99;
              v99 = v11;

              v61 = (id)objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v99, v98);
              v18 = v61;
              v17 = (void *)MEMORY[0x24BEBD3A8];
              v16 = v73;
              v20 = MEMORY[0x24BDAC760];
              v54 = MEMORY[0x24BDAC760];
              v55 = -1073741824;
              v56 = 0;
              v57 = __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke;
              v58 = &unk_24DFFCBB8;
              v59 = v73;
              v60 = location[0];
              v19 = (id)objc_msgSend(v17, "actionWithTitle:style:handler:", v16, 0, &v54);
              objc_msgSend(v18, "addAction:");

              v23 = v61;
              v22 = (void *)MEMORY[0x24BEBD3A8];
              v21 = v72;
              v47 = v20;
              v48 = -1073741824;
              v49 = 0;
              v50 = __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke_512;
              v51 = &unk_24DFFCBB8;
              v52 = v72;
              v53 = location[0];
              v24 = (id)objc_msgSend(v22, "actionWithTitle:style:handler:", v21, 1, &v47);
              objc_msgSend(v23, "addAction:");

              WeakRetained = objc_loadWeakRetained((id *)&v104->_hostController);
              objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v61, 1);

              objc_storeStrong(&v53, 0);
              objc_storeStrong(&v52, 0);
              objc_storeStrong(&v60, 0);
              objc_storeStrong(&v59, 0);
              objc_storeStrong(&v61, 0);
              objc_storeStrong(&v72, 0);
              objc_storeStrong(&v73, 0);
              v100 = 0;
            }
          }
          else
          {
            v83 = _SUSUILoggingFacility();
            v82 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v83;
              v35 = v82;
              __os_log_helper_16_0_0(v81);
              _os_log_impl(&dword_21BF33000, v34, v35, "Download policy doesn't allow cellular. Not prompting for cellular download acceptance.", v81, 2u);
            }
            objc_storeStrong(&v83, 0);
            (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
            v100 = 1;
          }
        }
        else
        {
          v86 = _SUSUILoggingFacility();
          v85 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v86, OS_LOG_TYPE_DEFAULT))
          {
            v36 = v86;
            v37 = v85;
            __os_log_helper_16_0_0(v84);
            _os_log_impl(&dword_21BF33000, v36, v37, "Cellular data not possible on device (2nd check). Not prompting for cellular download acceptance.", v84, 2u);
          }
          objc_storeStrong(&v86, 0);
          (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
          v100 = 1;
        }
      }
    }
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
    objc_storeStrong(&v99, 0);
  }
  else
  {
    v102 = _SUSUILoggingFacility();
    v101 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v106, (uint64_t)"-[SUSUISoftwareUpdateManager _alertForDownloadConstraintsWithCompletion:]");
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v102, v101, "[%s] completion is nil. Do nothing", v106, 0xCu);
    }
    objc_storeStrong(&v102, 0);
    v100 = 1;
  }
  objc_storeStrong(location, 0);
}

void __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "User clicked %@. Allowing cellular.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

void __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke_512(uint64_t a1, void *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "User clicked %@. Declining cellular.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

- (void)cancelOrPurgeIfNecessaryWithUpdate:(id)a3 completion:(id)a4
{
  SUSUISoftwareUpdateClientManager *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  SUSUISoftwareUpdateManager *v12;
  id v13;
  id v14;
  id location[2];
  SUSUISoftwareUpdateManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke;
  v10 = &unk_24DFFCBE0;
  v11 = location[0];
  v13 = v14;
  v12 = v16;
  -[SUSUISoftwareUpdateClientManager download:](suClient, "download:");
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id WeakRetained;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  void (*v37)(uint64_t, char, id);
  void *v38;
  id v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(_QWORD *, void *);
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  int v58;
  os_log_type_t v59;
  id v60[2];
  id v61;
  id location[2];
  uint8_t v63[24];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v61 = 0;
  objc_storeStrong(&v61, a3);
  v60[1] = (id)a1;
  v32 = (id)objc_msgSend(location[0], "descriptor");
  v33 = objc_msgSend(v32, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((v33 & 1) != 0)
  {
    v60[0] = _SUSUILoggingFacility();
    v59 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v60[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v63, *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_21BF33000, (os_log_t)v60[0], v59, "Currently downloading descriptor is the same as requested descriptor, do not purge (%@)", v63, 0xCu);
    }
    objc_storeStrong(v60, 0);
    if (*(_QWORD *)(a1 + 48))
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v58 = 1;
  }
  else
  {
    if (location[0])
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "clientIsBuddy") & 1) != 0)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
        v34 = MEMORY[0x24BDAC760];
        v35 = -1073741824;
        v36 = 0;
        v37 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_4;
        v38 = &unk_24DFFC900;
        v39 = *(id *)(a1 + 48);
        objc_msgSend(v7, "purgeDownload:", &v34);
        objc_storeStrong(&v39, 0);
      }
      else
      {
        v57 = 0;
        v20 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v56 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"));

        v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v55 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E0011F0, CFSTR("Software Update"));

        v22 = (void *)MEMORY[0x24BDD17C8];
        v27 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DELETE_CONFIRMATION_TITLE"));
        v25 = (id)objc_msgSend(v27, "localizedStringForKey:value:table:");
        v24 = (id)objc_msgSend(location[0], "descriptor");
        v23 = (id)objc_msgSend(v24, "productVersion");
        v54 = (id)objc_msgSend(v22, "stringWithFormat:", v25, v23);

        v28 = (id)objc_msgSend(location[0], "progress");
        v29 = objc_msgSend(v28, "isDone");

        if ((v29 & 1) != 0)
        {
          v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v3 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE_CONFIRMATION_BODY_DOWNLOADED"), &stru_24E0011F0, CFSTR("Software Update"));
          v4 = v57;
          v57 = v3;

        }
        else
        {
          v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v5 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_CONFIRMATION_BODY_DOWNLOADING"), &stru_24E0011F0, CFSTR("Software Update"));
          v6 = v57;
          v57 = v5;

        }
        v53 = (id)objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v54, v57);
        v10 = v53;
        v9 = (void *)MEMORY[0x24BEBD3A8];
        v8 = v56;
        v12 = MEMORY[0x24BDAC760];
        v47 = MEMORY[0x24BDAC760];
        v48 = -1073741824;
        v49 = 0;
        v50 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_519;
        v51 = &unk_24DFF9F08;
        v52 = *(id *)(a1 + 48);
        v11 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:", v8, 1, &v47);
        objc_msgSend(v10, "addAction:");

        v15 = v53;
        v14 = (void *)MEMORY[0x24BEBD3A8];
        v13 = v55;
        v40 = v12;
        v41 = -1073741824;
        v42 = 0;
        v43 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_2;
        v44 = &unk_24DFFCBB8;
        v45 = *(id *)(a1 + 40);
        v46 = *(id *)(a1 + 48);
        v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, &v40);
        objc_msgSend(v15, "addAction:");

        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v53, 1);

        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
        objc_storeStrong(&v56, 0);
        objc_storeStrong(&v57, 0);
      }
    }
    else if (*(_QWORD *)(a1 + 48))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    v58 = 0;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_519(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id);
  void *v8;
  id v9[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_3;
  v8 = &unk_24DFFC900;
  v9[0] = *(id *)(a1 + 40);
  objc_msgSend(v3, "purgeDownload:");
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_3(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_4(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)presentTermsIfNecessaryCompletion:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateManager presentTermsIfNecessaryForUpdate:completion:](v4, "presentTermsIfNecessaryForUpdate:completion:", 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)presentTermsIfNecessaryForUpdate:(id)a3 completion:(id)a4
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  id *v14;
  id *v15;
  id *v16;
  int v17;
  uint64_t *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint8_t *v25;
  const __CFString *v26;
  id v27;
  Class v28;
  id v29;
  id v30;
  const __CFString *v31;
  id v32;
  const __CFString *v33;
  id v34;
  Class v35;
  id v36;
  id v37;
  const __CFString *v38;
  id v39;
  const __CFString *v40;
  id v41;
  id v42;
  id v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  id v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  int v57;
  os_log_t v58;
  os_log_type_t v59[4];
  id v60;
  id v61;
  int v62;
  id *v63;
  dispatch_block_t v64;
  dispatch_queue_t v65;
  id v66;
  uint64_t *v67;
  uint8_t *v68;
  const __CFString *v69;
  id v70;
  Class v71;
  id v72;
  id v73;
  const __CFString *v74;
  id v75;
  const __CFString *v76;
  id v77;
  Class v78;
  id v79;
  id v80;
  const __CFString *v81;
  id v82;
  const __CFString *v83;
  id v84;
  id v85;
  id v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFString *v91;
  id v92;
  const __CFString *v93;
  uint64_t v94;
  uint64_t v95;
  const __CFString *v96;
  id v97;
  id v98;
  id v99;
  int v100;
  os_log_t v101;
  os_log_type_t v102[4];
  id v103;
  id v104;
  int v105;
  int v106;
  int v107;
  id *v108;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v111;
  _BOOL4 v112;
  id v113;
  int v114;
  id v115;
  uint64_t *v116;
  uint8_t *buf;
  id v118;
  int v119;
  const __CFString *v120;
  id v121;
  const __CFString *v122;
  id v123;
  Class v124;
  id v125;
  id v126;
  const __CFString *v127;
  id v128;
  const __CFString *v129;
  id v130;
  Class aClass;
  id v132;
  id v133;
  const __CFString *v134;
  id WeakRetained;
  const __CFString *v136;
  id v137;
  id v138;
  id v139;
  const __CFString *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const __CFString *v144;
  id v145;
  const __CFString *v146;
  uint64_t v147;
  uint64_t v148;
  const __CFString *v149;
  id v150;
  id v151;
  id v152;
  int v153;
  os_log_t log;
  os_log_type_t v155[4];
  id updated;
  id v157;
  id v158;
  id *v159;
  uint64_t v160;
  id obj;
  const char *v162;
  uint64_t v163;
  int v164;
  int v165;
  void (*v166)(NSObject *, char, id);
  void *v167;
  _QWORD v168[4];
  char v169;
  id v170;
  char v171;
  id v172;
  char v173;
  id v174;
  char v175;
  id v176;
  char v177;
  id v178;
  char v179;
  id v180;
  char v181;
  id v182;
  char v183;
  id v184;
  char v185;
  id v186;
  id v187;
  os_log_type_t v188;
  os_log_t v189;
  uint64_t v190;
  int v191;
  int v192;
  uint64_t (*v193)(uint64_t);
  void *v194;
  id v195;
  char v196;
  id v197;
  char v198;
  id v199;
  char v200;
  id v201;
  char v202;
  id v203;
  char v204;
  id v205;
  char v206;
  id v207;
  char v208;
  id v209;
  char v210;
  id v211;
  char v212;
  id v213;
  id v214;
  os_log_type_t v215;
  os_log_t v216;
  BOOL v217;
  int v218;
  uint64_t v219;
  int v220;
  int v221;
  uint64_t (*v222)(uint64_t);
  void *v223;
  id v224;
  char v225;
  id v226;
  char v227;
  id v228;
  char v229;
  id v230;
  char v231;
  id v232;
  char v233;
  id v234;
  char v235;
  id v236;
  char v237;
  id v238;
  char v239;
  id v240;
  char v241;
  id v242;
  id v243;
  os_log_type_t type;
  os_log_t oslog;
  id v246;
  uint64_t v247;
  id *v248;
  int v249;
  int v250;
  void (*v251)(uint64_t, uint64_t);
  void (*v252)(uint64_t);
  uint64_t v253;
  id v254;
  id location[2];
  id v256;
  _BYTE v257[160];
  _BYTE v258[160];
  _BYTE v259[168];
  uint64_t v260;

  obj = a4;
  v162 = "-[SUSUISoftwareUpdateManager presentTermsIfNecessaryForUpdate:completion:]";
  v260 = *MEMORY[0x24BDAC8D0];
  v256 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v254 = 0;
  objc_storeStrong(&v254, obj);
  v247 = 0;
  v248 = (id *)&v247;
  v249 = 838860800;
  v250 = 48;
  v251 = __Block_byref_object_copy__0;
  v252 = __Block_byref_object_dispose__0;
  v160 = objc_opt_new();
  v253 = v160;
  v159 = (id *)&v253;
  objc_msgSend(v248[5], "setServerFlowStyle:", *((_QWORD *)v256 + 18));
  v158 = (id)objc_msgSend(v256, "download");
  v246 = v158;
  if (!v246)
    goto LABEL_42;
  v157 = _SUSUILoggingFacility();
  oslog = (os_log_t)v157;
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v155 = type;
    updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
    v151 = updated;
    v152 = v151;
    v243 = v152;
    v153 = *((_DWORD *)v256 + 22);
    v4 = *((_QWORD *)v256 + 15) == 0;
    v241 = 0;
    if (v4)
    {
      v149 = CFSTR("N/A");
    }
    else
    {
      v150 = (id)objc_msgSend(*((id *)v256 + 15), "humanReadableUpdateName");
      v242 = v150;
      v241 = 1;
      v149 = (const __CFString *)v242;
    }
    v146 = v149;
    v147 = *((_QWORD *)v256 + 15);
    v148 = *((_QWORD *)v256 + 20);
    v5 = *((_QWORD *)v256 + 16) == 0;
    v239 = 0;
    if (v5)
    {
      v144 = CFSTR("N/A");
    }
    else
    {
      v145 = (id)objc_msgSend(*((id *)v256 + 16), "humanReadableUpdateName");
      v240 = v145;
      v239 = 1;
      v144 = (const __CFString *)v240;
    }
    v140 = v144;
    v141 = *((_QWORD *)v256 + 16);
    v142 = *((_QWORD *)v256 + 21);
    v143 = *((_QWORD *)v256 + 1);
    v6 = *((_QWORD *)v256 + 1) == 0;
    v237 = 0;
    v235 = 0;
    v233 = 0;
    if (v6
      || (v139 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor"),
          v238 = v139,
          v237 = 1,
          !v238))
    {
      v136 = CFSTR("N/A");
    }
    else
    {
      v138 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor");
      v236 = v138;
      v235 = 1;
      v137 = (id)objc_msgSend(v236, "humanReadableUpdateName");
      v234 = v137;
      v233 = 1;
      v136 = (const __CFString *)v234;
    }
    v134 = v136;
    WeakRetained = objc_loadWeakRetained((id *)v256 + 13);
    v133 = objc_loadWeakRetained((id *)v256 + 13);
    v231 = 0;
    v229 = 0;
    if (v133)
    {
      v132 = objc_loadWeakRetained((id *)v256 + 13);
      v232 = v132;
      v231 = 1;
      aClass = (Class)objc_opt_class();
      v130 = NSStringFromClass(aClass);
      v230 = v130;
      v229 = 1;
      v129 = (const __CFString *)v230;
    }
    else
    {
      v129 = CFSTR("N/A");
    }
    v127 = v129;
    v128 = objc_loadWeakRetained((id *)v256 + 14);
    v126 = objc_loadWeakRetained((id *)v256 + 14);
    v227 = 0;
    v225 = 0;
    if (v126)
    {
      v125 = objc_loadWeakRetained((id *)v256 + 14);
      v228 = v125;
      v227 = 1;
      v124 = (Class)objc_opt_class();
      v123 = NSStringFromClass(v124);
      v226 = v123;
      v225 = 1;
      v122 = (const __CFString *)v226;
    }
    else
    {
      v122 = CFSTR("N/A");
    }
    v120 = v122;
    v121 = (id)objc_msgSend(v246, "downloadOptions");
    v118 = v121;
    v119 = objc_msgSend(v118, "termsAndConditionsAgreementStatus");
    v116 = &v13;
    buf = v259;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v259, (uint64_t)v162, (uint64_t)v152, v153, (uint64_t)v146, v147, v148, (uint64_t)v140, v141, v142, v143, (uint64_t)v134, (uint64_t)WeakRetained, (uint64_t)v127, (uint64_t)v128, (uint64_t)v122, v119);
    _os_log_impl(&dword_21BF33000, log, v155[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSU Terms: Agreement status %i", buf, 0x9Au);

    if ((v225 & 1) != 0)
    if ((v227 & 1) != 0)

    if ((v229 & 1) != 0)
    if ((v231 & 1) != 0)

    if ((v233 & 1) != 0)
    if ((v235 & 1) != 0)

    if ((v237 & 1) != 0)
    if ((v239 & 1) != 0)

    if ((v241 & 1) != 0)
    objc_storeStrong(&v243, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v115 = (id)objc_msgSend(v246, "downloadOptions");
  v113 = v115;
  v114 = objc_msgSend(v113, "termsAndConditionsAgreementStatus");
  v112 = v114 != 1;

  if (v112)
  {
LABEL_42:
    v217 = 0;
    if (location[0])
    {
      v107 = objc_msgSend(location[0], "isSplatOnly");
      v106 = v107 & 1;
    }
    else
    {
      v105 = objc_msgSend(*((id *)v256 + 15), "isSplatOnly");
      v106 = v105 & 1;
    }
    v217 = v106 != 0;
    if (v106)
    {
      v104 = _SUSUILoggingFacility();
      v216 = (os_log_t)v104;
      v215 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
      {
        v101 = v216;
        *(_DWORD *)v102 = v215;
        v103 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
        v98 = v103;
        v99 = v98;
        v214 = v99;
        v100 = *((_DWORD *)v256 + 22);
        v7 = *((_QWORD *)v256 + 15) == 0;
        v212 = 0;
        if (v7)
        {
          v96 = CFSTR("N/A");
        }
        else
        {
          v97 = (id)objc_msgSend(*((id *)v256 + 15), "humanReadableUpdateName");
          v213 = v97;
          v212 = 1;
          v96 = (const __CFString *)v213;
        }
        v93 = v96;
        v94 = *((_QWORD *)v256 + 15);
        v95 = *((_QWORD *)v256 + 20);
        v8 = *((_QWORD *)v256 + 16) == 0;
        v210 = 0;
        if (v8)
        {
          v91 = CFSTR("N/A");
        }
        else
        {
          v92 = (id)objc_msgSend(*((id *)v256 + 16), "humanReadableUpdateName");
          v211 = v92;
          v210 = 1;
          v91 = (const __CFString *)v211;
        }
        v87 = v91;
        v88 = *((_QWORD *)v256 + 16);
        v89 = *((_QWORD *)v256 + 21);
        v90 = *((_QWORD *)v256 + 1);
        v9 = *((_QWORD *)v256 + 1) == 0;
        v208 = 0;
        v206 = 0;
        v204 = 0;
        if (v9
          || (v86 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor"),
              v209 = v86,
              v208 = 1,
              !v209))
        {
          v83 = CFSTR("N/A");
        }
        else
        {
          v85 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor");
          v207 = v85;
          v206 = 1;
          v84 = (id)objc_msgSend(v207, "humanReadableUpdateName");
          v205 = v84;
          v204 = 1;
          v83 = (const __CFString *)v205;
        }
        v81 = v83;
        v82 = objc_loadWeakRetained((id *)v256 + 13);
        v80 = objc_loadWeakRetained((id *)v256 + 13);
        v202 = 0;
        v200 = 0;
        if (v80)
        {
          v79 = objc_loadWeakRetained((id *)v256 + 13);
          v203 = v79;
          v202 = 1;
          v78 = (Class)objc_opt_class();
          v77 = NSStringFromClass(v78);
          v201 = v77;
          v200 = 1;
          v76 = (const __CFString *)v201;
        }
        else
        {
          v76 = CFSTR("N/A");
        }
        v74 = v76;
        v75 = objc_loadWeakRetained((id *)v256 + 14);
        v73 = objc_loadWeakRetained((id *)v256 + 14);
        v198 = 0;
        v196 = 0;
        if (v73)
        {
          v72 = objc_loadWeakRetained((id *)v256 + 14);
          v199 = v72;
          v198 = 1;
          v71 = (Class)objc_opt_class();
          v70 = NSStringFromClass(v71);
          v197 = v70;
          v196 = 1;
          v69 = (const __CFString *)v197;
        }
        else
        {
          v69 = CFSTR("N/A");
        }
        v67 = &v13;
        v68 = v258;
        __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v258, (uint64_t)v162, (uint64_t)v99, v100, (uint64_t)v93, v94, v95, (uint64_t)v87, v88, v89, v90, (uint64_t)v81, (uint64_t)v82, (uint64_t)v74, (uint64_t)v75, (uint64_t)v69);
        _os_log_impl(&dword_21BF33000, v101, v102[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nRapid Security Response - Skipping SU Terms presentation", v68, 0x94u);
        if ((v196 & 1) != 0)

        if ((v198 & 1) != 0)
        if ((v200 & 1) != 0)

        if ((v202 & 1) != 0)
        if ((v204 & 1) != 0)

        if ((v206 & 1) != 0)
        if ((v208 & 1) != 0)

        if ((v210 & 1) != 0)
        if ((v212 & 1) != 0)

        objc_storeStrong(&v214, 0);
      }
      objc_storeStrong((id *)&v216, 0);
      if (v254)
      {
        v66 = MEMORY[0x24BDAC9B8];
        v65 = (dispatch_queue_t)v66;
        v64 = &v190;
        v190 = MEMORY[0x24BDAC760];
        v191 = -1073741824;
        v192 = 0;
        v193 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_521;
        v194 = &unk_24DFF7BA8;
        v63 = &v195;
        v195 = v254;
        dispatch_async(v65, v64);

        objc_storeStrong(v63, 0);
      }
      v218 = 1;
    }
    else
    {
      v62 = objc_msgSend(v256, "bypassTermsAndConditions");
      if ((v62 & 1) != 0)
      {
        v61 = _SUSUILoggingFacility();
        v189 = (os_log_t)v61;
        v188 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
        {
          v58 = v189;
          *(_DWORD *)v59 = v188;
          v60 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
          v55 = v60;
          v56 = v55;
          v187 = v56;
          v57 = *((_DWORD *)v256 + 22);
          v10 = *((_QWORD *)v256 + 15) == 0;
          v185 = 0;
          if (v10)
          {
            v53 = CFSTR("N/A");
          }
          else
          {
            v54 = (id)objc_msgSend(*((id *)v256 + 15), "humanReadableUpdateName");
            v186 = v54;
            v185 = 1;
            v53 = (const __CFString *)v186;
          }
          v50 = v53;
          v51 = *((_QWORD *)v256 + 15);
          v52 = *((_QWORD *)v256 + 20);
          v11 = *((_QWORD *)v256 + 16) == 0;
          v183 = 0;
          if (v11)
          {
            v48 = CFSTR("N/A");
          }
          else
          {
            v49 = (id)objc_msgSend(*((id *)v256 + 16), "humanReadableUpdateName");
            v184 = v49;
            v183 = 1;
            v48 = (const __CFString *)v184;
          }
          v44 = v48;
          v45 = *((_QWORD *)v256 + 16);
          v46 = *((_QWORD *)v256 + 21);
          v47 = *((_QWORD *)v256 + 1);
          v12 = *((_QWORD *)v256 + 1) == 0;
          v181 = 0;
          v179 = 0;
          v177 = 0;
          if (v12
            || (v43 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor"),
                v182 = v43,
                v181 = 1,
                !v182))
          {
            v40 = CFSTR("N/A");
          }
          else
          {
            v42 = (id)objc_msgSend(*((id *)v256 + 1), "descriptor");
            v180 = v42;
            v179 = 1;
            v41 = (id)objc_msgSend(v180, "humanReadableUpdateName");
            v178 = v41;
            v177 = 1;
            v40 = (const __CFString *)v178;
          }
          v38 = v40;
          v39 = objc_loadWeakRetained((id *)v256 + 13);
          v37 = objc_loadWeakRetained((id *)v256 + 13);
          v175 = 0;
          v173 = 0;
          if (v37)
          {
            v36 = objc_loadWeakRetained((id *)v256 + 13);
            v176 = v36;
            v175 = 1;
            v35 = (Class)objc_opt_class();
            v34 = NSStringFromClass(v35);
            v174 = v34;
            v173 = 1;
            v33 = (const __CFString *)v174;
          }
          else
          {
            v33 = CFSTR("N/A");
          }
          v31 = v33;
          v32 = objc_loadWeakRetained((id *)v256 + 14);
          v30 = objc_loadWeakRetained((id *)v256 + 14);
          v171 = 0;
          v169 = 0;
          if (v30)
          {
            v29 = objc_loadWeakRetained((id *)v256 + 14);
            v172 = v29;
            v171 = 1;
            v28 = (Class)objc_opt_class();
            v27 = NSStringFromClass(v28);
            v170 = v27;
            v169 = 1;
            v26 = (const __CFString *)v170;
          }
          else
          {
            v26 = CFSTR("N/A");
          }
          v24 = &v13;
          v25 = v257;
          __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v257, (uint64_t)v162, (uint64_t)v56, v57, (uint64_t)v50, v51, v52, (uint64_t)v44, v45, v46, v47, (uint64_t)v38, (uint64_t)v39, (uint64_t)v31, (uint64_t)v32, (uint64_t)v26);
          _os_log_impl(&dword_21BF33000, v58, v59[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBypassing TOS because bypassTermsAndConditions=YES", v25, 0x94u);
          if ((v169 & 1) != 0)

          if ((v171 & 1) != 0)
          if ((v173 & 1) != 0)

          if ((v175 & 1) != 0)
          if ((v177 & 1) != 0)

          if ((v179 & 1) != 0)
          if ((v181 & 1) != 0)

          if ((v183 & 1) != 0)
          if ((v185 & 1) != 0)

          objc_storeStrong(&v187, 0);
        }
        objc_storeStrong((id *)&v189, 0);
        if (v254)
          (*((void (**)(id, uint64_t, _QWORD))v254 + 2))(v254, 1, 0);
        objc_storeStrong(v248 + 5, 0);
        v218 = 1;
      }
      else
      {
        v22 = v248[5];
        v23 = location[0];
        if (location[0])
          v21 = v23;
        else
          v21 = (id)*((_QWORD *)v256 + 15);
        v19 = v21;
        v20 = objc_loadWeakRetained((id *)v256 + 14);
        v18 = &v163;
        v163 = MEMORY[0x24BDAC760];
        v164 = -1073741824;
        v17 = 0;
        v165 = 0;
        v166 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_522;
        v167 = &unk_24DFFCC08;
        v14 = (id *)v168;
        v168[0] = v256;
        v15 = (id *)(v18 + 5);
        v168[1] = location[0];
        v16 = (id *)(v18 + 6);
        v168[2] = v254;
        v168[3] = &v247;
        objc_msgSend(v22, "presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:", v19, v20, v17 & 1, v18);

        objc_storeStrong(v16, 0);
        objc_storeStrong(v15, 0);
        objc_storeStrong(v14, 0);
        v218 = 0;
      }
    }
  }
  else
  {
    if (v254)
    {
      v111 = MEMORY[0x24BDAC9B8];
      queue = (dispatch_queue_t)v111;
      block = &v219;
      v219 = MEMORY[0x24BDAC760];
      v220 = -1073741824;
      v221 = 0;
      v222 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke;
      v223 = &unk_24DFF7BA8;
      v108 = &v224;
      v224 = v254;
      dispatch_async(queue, block);

      objc_storeStrong(v108, 0);
    }
    v218 = 1;
  }
  objc_storeStrong(&v246, 0);
  _Block_object_dispose(&v247, 8);
  objc_storeStrong(v159, 0);
  objc_storeStrong(&v254, 0);
  objc_storeStrong(location, 0);
}

uint64_t __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

uint64_t __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_521(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

void __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_522(NSObject *a1, char a2, id obj)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  BOOL v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id obja;
  uint64_t *v14;
  uint8_t *buf;
  uint64_t v16;
  const __CFString *v17;
  uint64_t isa;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  os_log_t log;
  os_log_type_t type[4];
  id v42;
  uint64_t v43;
  int v44;
  const char *v45;
  NSObject *v46;
  char *v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  char v65;
  id v66;
  unsigned __int8 v67;
  os_log_t v68[2];
  id location;
  char v70;
  NSObject *v71;
  _BYTE v72[184];
  uint64_t v73;

  v47 = &v65;
  v46 = a1;
  v45 = "-[SUSUISoftwareUpdateManager presentTermsIfNecessaryForUpdate:completion:]_block_invoke";
  v73 = *MEMORY[0x24BDAC8D0];
  v71 = a1;
  v70 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v68[1] = v46;
  v68[0] = (os_log_t)_SUSUILoggingFacility();
  v67 = 0;
  if (os_log_type_enabled(v68[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v47 + 3);
    *(_DWORD *)type = v67;
    v42 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v46[4].isa + 22));
    v3 = v42;
    v4 = v46;
    v43 = (uint64_t)v3;
    *((_QWORD *)v47 + 1) = v3;
    v44 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((_QWORD *)v4[4].isa + 15) == 0;
    v64 = 0;
    if ((v4 & 1) != 0)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*((id *)v46[4].isa + 15), "humanReadableUpdateName");
      *(_QWORD *)v47 = v5;
      v64 = 1;
      v39 = v5;
    }
    v36 = v39;
    v37 = *((_QWORD *)v46[4].isa + 15);
    v38 = *((_QWORD *)v46[4].isa + 20);
    v6 = *((_QWORD *)v46[4].isa + 16) == 0;
    v62 = 0;
    if (v6)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v63 = (id)objc_msgSend(*((id *)v46[4].isa + 16), "humanReadableUpdateName");
      v62 = 1;
      v35 = (const __CFString *)v63;
    }
    v31 = v35;
    v32 = *((_QWORD *)v46[4].isa + 16);
    v33 = *((_QWORD *)v46[4].isa + 21);
    v34 = *((_QWORD *)v46[4].isa + 1);
    v7 = *((_QWORD *)v46[4].isa + 1) == 0;
    v60 = 0;
    v58 = 0;
    v56 = 0;
    if (v7
      || (v61 = (id)objc_msgSend(*((id *)v46[4].isa + 1), "descriptor"),
          v60 = 1,
          !v61))
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v59 = (id)objc_msgSend(*((id *)v46[4].isa + 1), "descriptor");
      v29 = 1;
      v58 = 1;
      v57 = (id)objc_msgSend(v59, "humanReadableUpdateName");
      v56 = 1;
      v30 = (const __CFString *)v57;
    }
    v26 = v30;
    WeakRetained = objc_loadWeakRetained((id *)v46[4].isa + 13);
    v28 = objc_loadWeakRetained((id *)v46[4].isa + 13);
    v54 = 0;
    v52 = 0;
    if (v28)
    {
      v55 = objc_loadWeakRetained((id *)v46[4].isa + 13);
      v24 = 1;
      v54 = 1;
      v8 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v8);
      v52 = 1;
      v25 = (const __CFString *)v53;
    }
    else
    {
      v25 = CFSTR("N/A");
    }
    v21 = v25;
    v22 = objc_loadWeakRetained((id *)v46[4].isa + 14);
    v23 = objc_loadWeakRetained((id *)v46[4].isa + 14);
    v50 = 0;
    v48 = 0;
    if (v23)
    {
      v51 = objc_loadWeakRetained((id *)v46[4].isa + 14);
      v19 = 1;
      v50 = 1;
      v9 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v9);
      v48 = 1;
      v20 = (const __CFString *)v49;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v17 = v20;
    isa = (uint64_t)v46[5].isa;
    if (isa)
      v16 = isa;
    else
      v16 = *((_QWORD *)v46[4].isa + 15);
    v10 = *((_QWORD *)v47 + 5);
    v14 = &v12;
    buf = v72;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_4_0_8_64((uint64_t)v72, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v17, v16, v70 & 1, v10);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAccepted TOS for update %p: %d, error: %@", buf, 0xAEu);
    if ((v48 & 1) != 0)

    if ((v50 & 1) != 0)
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong((id *)v68, 0);
  if (v46[6].isa)
    (*((void (**)(void))v46[6].isa + 2))();
  v11 = (id *)(*((_QWORD *)v46[7].isa + 1) + 40);
  obja = 0;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, obja);
}

- (void)scanForUpdateCompletion:(id)a3
{
  SUSUISoftwareUpdateManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, void *);
  void *v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__SUSUISoftwareUpdateManager_scanForUpdateCompletion___block_invoke;
  v8 = &unk_24DFFCC30;
  v9 = location[0];
  -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](v3, "scanForUpdatesCompletion:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUISoftwareUpdateManager_scanForUpdateCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v3;
  id v4;
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  if (a1[4])
  {
    v3 = a1[4];
    v4 = (id)objc_msgSend(location[0], "latestUpdate");
    (*(void (**)(void))(v3 + 16))();

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)scanForUpdatesCompletion:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_userInitiatedRescan = 0;
  -[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:](v4, "scanForUpdatesWithOptions:andCompletion:", 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)rescanForUpdatesInBackgroundWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  id v4;
  char *v5;
  const __CFString *v6;
  BOOL v7;
  BOOL v8;
  objc_class *v9;
  objc_class *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id v17;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  uint64_t v44;
  int v45;
  const char *v46;
  id obj;
  char *v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  __CFString *v64;
  char v65;
  char v66;
  id v67;
  unsigned __int8 v68;
  id v69;
  id v70;
  id location[3];
  _BYTE v72[152];
  uint64_t v73;

  v48 = &v66;
  obj = a4;
  v46 = "-[SUSUISoftwareUpdateManager rescanForUpdatesInBackgroundWithOptions:andCompletionHandler:]";
  v73 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v70 = 0;
  objc_storeStrong(&v70, obj);
  v69 = _SUSUILoggingFacility();
  v68 = 0;
  if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v48 + 3);
    *(_DWORD *)type = v68;
    v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v48 + 7) + 88));
    v4 = v43;
    v5 = v48;
    v44 = (uint64_t)v4;
    *((_QWORD *)v48 + 1) = v4;
    v45 = *(_DWORD *)(*((_QWORD *)v5 + 7) + 88);
    LOBYTE(v5) = *(_QWORD *)(*((_QWORD *)v5 + 7) + 120) == 0;
    v65 = 0;
    if ((v5 & 1) != 0)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v6 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v48 + 7) + 120), "humanReadableUpdateName");
      *(_QWORD *)v48 = v6;
      v65 = 1;
      v40 = v6;
    }
    v37 = v40;
    v38 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 120);
    v39 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 160);
    v7 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 128) == 0;
    v63 = 0;
    if (v7)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v64 = (__CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v48 + 7) + 128), "humanReadableUpdateName");
      v63 = 1;
      v36 = v64;
    }
    v32 = v36;
    v33 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 128);
    v34 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 168);
    v35 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 8);
    v8 = *(_QWORD *)(*((_QWORD *)v48 + 7) + 8) == 0;
    v61 = 0;
    v59 = 0;
    v57 = 0;
    if (v8
      || (v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v48 + 7) + 8), "descriptor"),
          v61 = 1,
          !v62))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v60 = (id)objc_msgSend(*(id *)(*((_QWORD *)v48 + 7) + 8), "descriptor");
      v30 = 1;
      v59 = 1;
      v58 = (id)objc_msgSend(v60, "humanReadableUpdateName");
      v57 = 1;
      v31 = (const __CFString *)v58;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 104));
    v29 = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 104));
    v55 = 0;
    v53 = 0;
    if (v29)
    {
      v56 = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 104));
      v25 = 1;
      v55 = 1;
      v9 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v9);
      v53 = 1;
      v26 = (const __CFString *)v54;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 112));
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 112));
    v51 = 0;
    v49 = 0;
    if (v24)
    {
      v52 = objc_loadWeakRetained((id *)(*((_QWORD *)v48 + 7) + 112));
      v20 = 1;
      v51 = 1;
      v10 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v10);
      v49 = 1;
      v21 = (const __CFString *)v50;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v18 = &v14;
    buf = v72;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v72, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if ((v49 & 1) != 0)

    if ((v51 & 1) != 0)
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    objc_storeStrong(&v67, 0);
  }
  v17 = 0;
  objc_storeStrong(&v69, 0);
  v11 = v48;
  *(_BYTE *)(*((_QWORD *)v48 + 7) + 18) = 1;
  v12 = (void *)*((_QWORD *)v11 + 7);
  v16 = location;
  v13 = *((_QWORD *)v11 + 5);
  v15 = &v70;
  objc_msgSend(v12, "scanForUpdatesWithOptions:andCompletion:", v13, *((_QWORD *)v11 + 4));
  objc_storeStrong(v15, v17);
  objc_storeStrong(v16, v17);
}

- (void)scanForUpdatesWithOptions:(id)a3 andCompletion:(id)a4
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  int userInitiatedRescan;
  id v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id *v12;
  uint64_t *v13;
  SUSUISoftwareUpdateClientManager *v14;
  id *v15;
  uint64_t *v16;
  SUSUISoftwareUpdateClientManager *suClient;
  id v18;
  Class SUScanOptionsClass;
  id v20;
  uint64_t *v21;
  uint8_t *buf;
  const __CFString *v23;
  id v24;
  Class v25;
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  const __CFString *v30;
  id v31;
  Class aClass;
  id v33;
  id v34;
  const __CFString *v35;
  id WeakRetained;
  const __CFString *v37;
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v45;
  id v46;
  const __CFString *v47;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v50;
  id v51;
  id v52;
  id v53;
  int state;
  os_log_t log;
  os_log_type_t type[4];
  id updated;
  id v58;
  id obj;
  const char *v60;
  uint64_t v61;
  int v62;
  int v63;
  void (*v64)(id *, void *, id);
  void *v65;
  _QWORD v66[3];
  uint64_t v67;
  int v68;
  int v69;
  void (*v70)(NSObject *, void *, void *);
  void *v71;
  SUSUISoftwareUpdateManager *v72;
  int v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  __CFString *v91;
  id v92;
  unsigned __int8 v93;
  id v94;
  id v95;
  id location[2];
  SUSUISoftwareUpdateManager *v97;
  _BYTE v98[168];
  uint64_t v99;

  obj = a4;
  v60 = "-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]";
  v99 = *MEMORY[0x24BDAC8D0];
  v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v95 = 0;
  objc_storeStrong(&v95, obj);
  v58 = _SUSUILoggingFacility();
  v94 = v58;
  v93 = 0;
  if (os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v94;
    *(_DWORD *)type = v93;
    updated = SUSUISoftwareUpdateStateToString(v97->_state);
    v52 = updated;
    v53 = v52;
    v92 = v53;
    state = v97->_state;
    v4 = v97->_preferredUpdate == 0;
    v90 = 0;
    if (v4)
    {
      v50 = CFSTR("N/A");
    }
    else
    {
      v51 = (id)-[SUDescriptor humanReadableUpdateName](v97->_preferredUpdate, "humanReadableUpdateName");
      v91 = (__CFString *)v51;
      v90 = 1;
      v50 = v91;
    }
    v47 = v50;
    preferredUpdate = v97->_preferredUpdate;
    preferredUpdateError = v97->_preferredUpdateError;
    v5 = v97->_alternateUpdate == 0;
    v88 = 0;
    if (v5)
    {
      v45 = CFSTR("N/A");
    }
    else
    {
      v46 = (id)-[SUDescriptor humanReadableUpdateName](v97->_alternateUpdate, "humanReadableUpdateName");
      v89 = v46;
      v88 = 1;
      v45 = (const __CFString *)v89;
    }
    v41 = v45;
    alternateUpdate = v97->_alternateUpdate;
    alternateUpdateError = v97->_alternateUpdateError;
    download = v97->_download;
    v6 = v97->_download == 0;
    v86 = 0;
    v84 = 0;
    v82 = 0;
    if (v6
      || (v40 = -[SUDownload descriptor](v97->_download, "descriptor"),
          v87 = v40,
          v86 = 1,
          !v87))
    {
      v37 = CFSTR("N/A");
    }
    else
    {
      v39 = -[SUDownload descriptor](v97->_download, "descriptor");
      v85 = v39;
      v84 = 1;
      v38 = (id)objc_msgSend(v85, "humanReadableUpdateName");
      v83 = v38;
      v82 = 1;
      v37 = (const __CFString *)v83;
    }
    v35 = v37;
    WeakRetained = objc_loadWeakRetained((id *)&v97->_delegate);
    v34 = objc_loadWeakRetained((id *)&v97->_delegate);
    v80 = 0;
    v78 = 0;
    if (v34)
    {
      v33 = objc_loadWeakRetained((id *)&v97->_delegate);
      v81 = v33;
      v80 = 1;
      aClass = (Class)objc_opt_class();
      v31 = NSStringFromClass(aClass);
      v79 = v31;
      v78 = 1;
      v30 = (const __CFString *)v79;
    }
    else
    {
      v30 = CFSTR("N/A");
    }
    v28 = v30;
    v29 = objc_loadWeakRetained((id *)&v97->_hostController);
    v27 = objc_loadWeakRetained((id *)&v97->_hostController);
    v76 = 0;
    v74 = 0;
    if (v27)
    {
      v26 = objc_loadWeakRetained((id *)&v97->_hostController);
      v77 = v26;
      v76 = 1;
      v25 = (Class)objc_opt_class();
      v24 = NSStringFromClass(v25);
      v75 = v24;
      v74 = 1;
      v23 = (const __CFString *)v75;
    }
    else
    {
      v23 = CFSTR("N/A");
    }
    userInitiatedRescan = v97->_userInitiatedRescan;
    v21 = &v9;
    buf = v98;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v98, (uint64_t)v60, (uint64_t)v53, state, (uint64_t)v47, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v41, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v28, (uint64_t)v29, (uint64_t)v23, userInitiatedRescan);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nis user-initiated rescan: %d", buf, 0x9Au);
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v88 & 1) != 0)
    if ((v90 & 1) != 0)

    objc_storeStrong(&v92, 0);
  }
  objc_storeStrong(&v94, 0);
  v20 = v97;
  objc_sync_enter(v20);
  if (!v97->_userInitiatedRescan && v97->_state != 1)
    -[SUSUISoftwareUpdateManager setState:](v97, "setState:", 1);
  if (v97->_manuallyStartedScan)
  {
    v97->_userInitiatedRescan = 0;
    v73 = 1;
  }
  else
  {
    v97->_manuallyStartedScan = 1;
    if (!location[0])
    {
      SUScanOptionsClass = (Class)getSUScanOptionsClass();
      v18 = objc_alloc_init(SUScanOptionsClass);
      v8 = location[0];
      location[0] = v18;

      objc_msgSend(location[0], "setForced:", 1);
      objc_msgSend(location[0], "setIdentifier:", CFSTR("com.apple.Preferences.software_update"));
    }
    v73 = 0;
  }
  objc_sync_exit(v20);

  if (!v73)
  {
    -[SUSUISoftwareUpdateManager scanForBetaPrograms](v97, "scanForBetaPrograms");
    suClient = v97->_suClient;
    v16 = &v67;
    v67 = MEMORY[0x24BDAC760];
    v68 = -1073741824;
    v69 = 0;
    v70 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke;
    v71 = &unk_24DFFCC58;
    v15 = (id *)&v72;
    v72 = v97;
    -[SUSUISoftwareUpdateClientManager getDDMDeclaration:](suClient, "getDDMDeclaration:", v16);
    v14 = v97->_suClient;
    v13 = &v61;
    v61 = MEMORY[0x24BDAC760];
    v62 = -1073741824;
    v63 = 0;
    v64 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_524;
    v65 = &unk_24DFFCCA8;
    v10 = (id *)v66;
    v66[0] = v97;
    v11 = (id *)(v13 + 5);
    v66[1] = location[0];
    v12 = (id *)(v13 + 6);
    v66[2] = v95;
    -[SUSUISoftwareUpdateClientManager softwareUpdatePathRestriction:](v14, "softwareUpdatePathRestriction:", v13);
    objc_storeStrong(v12, 0);
    objc_storeStrong(v11, 0);
    objc_storeStrong(v10, 0);
    objc_storeStrong(v15, 0);
    v73 = 0;
  }
  objc_storeStrong(&v95, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke(NSObject *a1, void *a2, void *a3)
{
  os_log_t oslog[2];
  id v6;
  id location[2];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (v6)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "Failed to get a ddm declaration: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    -[objc_class setDdmDeclaration:](a1[4].isa, "setDdmDeclaration:", location[0]);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_524(id *a1, void *a2, id obj)
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char, id);
  void *v9;
  id v10;
  id v11;
  id v12[3];
  id location;
  void *v14;
  id *v15;

  v15 = a1;
  v14 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  v12[2] = a1;
  v4 = (void *)*((_QWORD *)a1[4] + 7);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_2;
  v9 = &unk_24DFFC9F0;
  v10 = a1[4];
  v12[1] = v14;
  v11 = a1[5];
  v12[0] = a1[6];
  objc_msgSend(v4, "isDelayingUpdates:");
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  id *v14;
  id *v15;
  id *v16;
  id obja;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  id v44;
  int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  void (*v51)(uint64_t, void *, void *);
  void *v52;
  _QWORD v53[3];
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  id v72;
  unsigned __int8 v73;
  id v74[2];
  id location;
  char v76;
  uint64_t v77;
  _BYTE v78[184];
  uint64_t v79;

  v47 = a1;
  v46 = "-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]_block_invoke_2";
  v79 = *MEMORY[0x24BDAC8D0];
  v77 = a1;
  v76 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v74[1] = (id)v47;
  v74[0] = _SUSUILoggingFacility();
  v73 = 0;
  if (os_log_type_enabled((os_log_t)v74[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v74[0];
    *(_DWORD *)type = v73;
    v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(_QWORD *)(v47 + 32) + 88));
    v44 = v43;
    v72 = v44;
    v45 = *(_DWORD *)(*(_QWORD *)(v47 + 32) + 88);
    v3 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 120) == 0;
    v70 = 0;
    if (v3)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v71 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 32) + 120), "humanReadableUpdateName");
      v70 = 1;
      v40 = (const __CFString *)v71;
    }
    v37 = v40;
    v38 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 120);
    v39 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 160);
    v4 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 128) == 0;
    v68 = 0;
    if (v4)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v69 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 32) + 128), "humanReadableUpdateName");
      v68 = 1;
      v36 = (const __CFString *)v69;
    }
    v32 = v36;
    v33 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 128);
    v34 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 168);
    v35 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 8);
    v5 = *(_QWORD *)(*(_QWORD *)(v47 + 32) + 8) == 0;
    v66 = 0;
    v64 = 0;
    v62 = 0;
    if (v5
      || (v67 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 32) + 8), "descriptor"),
          v66 = 1,
          !v67))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v65 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 32) + 8), "descriptor");
      v30 = 1;
      v64 = 1;
      v63 = (id)objc_msgSend(v65, "humanReadableUpdateName");
      v62 = 1;
      v31 = (const __CFString *)v63;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 104));
    v29 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 104));
    v60 = 0;
    v58 = 0;
    if (v29)
    {
      v61 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 104));
      v25 = 1;
      v60 = 1;
      v6 = (objc_class *)objc_opt_class();
      v59 = NSStringFromClass(v6);
      v58 = 1;
      v26 = (const __CFString *)v59;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 112));
    v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 112));
    v56 = 0;
    v54 = 0;
    if (v24)
    {
      v57 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 112));
      v20 = 1;
      v56 = 1;
      v7 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v7);
      v54 = 1;
      v21 = (const __CFString *)v55;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v8 = *(_QWORD *)(v47 + 56);
    v18 = &v10;
    buf = v78;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_0_8_64((uint64_t)v78, (uint64_t)v46, (uint64_t)v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v76 & 1, v8, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisDelaying: %d; pathRestriction: %lu, error: %@",
      buf,
      0xAEu);
    if ((v54 & 1) != 0)

    if ((v56 & 1) != 0)
    if ((v58 & 1) != 0)

    if ((v60 & 1) != 0)
    if ((v62 & 1) != 0)

    if ((v64 & 1) != 0)
    if ((v66 & 1) != 0)

    if ((v68 & 1) != 0)
    if ((v70 & 1) != 0)

    objc_storeStrong(&v72, 0);
  }
  obja = 0;
  objc_storeStrong(v74, 0);
  objc_msgSend(*(id *)(v47 + 32), "setIsDelayingUpdates:", v76 & 1);
  objc_msgSend(*(id *)(v47 + 32), "setSuPathsRestricted:", *(_QWORD *)(v47 + 56) != 0);
  v9 = v47;
  *(_BYTE *)(*(_QWORD *)(v47 + 32) + 17) = 1;
  v13 = *(id *)(*(_QWORD *)(v9 + 32) + 56);
  v11 = *(_QWORD *)(v9 + 40);
  v12 = &v48;
  v48 = MEMORY[0x24BDAC760];
  v49 = -1073741824;
  v50 = 0;
  v51 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_525;
  v52 = &unk_24DFFCC80;
  v16 = (id *)v53;
  v53[0] = *(id *)(v9 + 32);
  v15 = (id *)(v12 + 5);
  v53[1] = *(id *)(v47 + 40);
  v14 = (id *)(v12 + 6);
  v53[2] = *(id *)(v47 + 48);
  objc_msgSend(v13, "scanforUpdatesWithOptions:completion:", v11, v12);
  objc_storeStrong(v14, obja);
  objc_storeStrong(v15, obja);
  objc_storeStrong(v16, obja);
  objc_storeStrong(&location, obja);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_525(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  char v6;
  char v9;
  id v10;
  id v11[2];
  id v12;
  id location[2];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = 0;
  objc_storeStrong(&v12, a3);
  v11[1] = (id)a1;
  v11[0] = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_4_0((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]_block_invoke", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 1, *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) & 1);
    _os_log_impl(&dword_21BF33000, (os_log_t)v11[0], OS_LOG_TYPE_DEFAULT, "%s: _runningInitialScan: %d, _userInitiatedRescan: %d", v14, 0x18u);
  }
  objc_storeStrong(v11, 0);
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) = 0;
  objc_sync_exit(v5);

  v9 = 0;
  v6 = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) & 1) != 0)
  {
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = 1;
    v6 = objc_opt_respondsToSelector();
  }
  if ((v9 & 1) != 0)

  if ((v6 & 1) != 0)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
    objc_msgSend(v4, "managerDidFinishRescan:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "scanFinishedWithUpdates:options:andError:", location[0], *(_QWORD *)(a1 + 40), v12);
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_sync_exit(v3);

  if (*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_SUDownloadPhaseIsQueued:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  char v8;
  id v9;
  id location[3];
  char v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = location[0];
  v6 = getkSUDownloadPhaseBrainFetchingQueuedRemote();
  v8 = 0;
  v7 = 1;
  if ((objc_msgSend(v5, "isEqualToString:") & 1) == 0)
  {
    v4 = location[0];
    v9 = getkSUDownloadPhaseUpdateFetchingQueuedRemote();
    v8 = 1;
    v7 = objc_msgSend(v4, "isEqualToString:");
  }
  v11 = v7 & 1;
  if ((v8 & 1) != 0)

  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)updateStateFromDownload:(id)a3
{
  id v3;
  char *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  objc_class *v9;
  objc_class *v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  id obj;
  os_log_t v16;
  os_log_type_t v17[4];
  uint8_t *v18;
  id v19;
  int v20;
  id v21;
  int v22;
  int v23;
  id v24;
  int v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t *v28;
  uint8_t *buf;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  id v33;
  id v34;
  int v35;
  const __CFString *v36;
  const __CFString *v37;
  id WeakRetained;
  id v39;
  int v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  os_log_t log;
  os_log_type_t v52[4];
  id v53;
  uint64_t v54;
  int v55;
  const char *v56;
  char *v57;
  os_log_type_t v58;
  os_log_t oslog;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  char v76;
  char v77;
  id v78;
  os_log_type_t type;
  id v80;
  id v81;
  id location[3];
  _BYTE v83[32];
  _BYTE v84[168];
  uint64_t v85;

  v57 = &v76;
  v56 = "-[SUSUISoftwareUpdateManager updateStateFromDownload:]";
  v85 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v81 = (id)objc_msgSend(location[0], "progress");
  v80 = _SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v57 + 5);
    *(_DWORD *)v52 = type;
    v53 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v57 + 9) + 88));
    v3 = v53;
    v4 = v57;
    v54 = (uint64_t)v3;
    *((_QWORD *)v57 + 3) = v3;
    v55 = *(_DWORD *)(*((_QWORD *)v4 + 9) + 88);
    LOBYTE(v4) = *(_QWORD *)(*((_QWORD *)v4 + 9) + 120) == 0;
    v77 = 0;
    if ((v4 & 1) != 0)
    {
      v50 = CFSTR("N/A");
    }
    else
    {
      v5 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v57 + 9) + 120), "humanReadableUpdateName");
      *((_QWORD *)v57 + 2) = v5;
      v77 = 1;
      v50 = v5;
    }
    v47 = v50;
    v48 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 120);
    v49 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 160);
    v6 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 128) == 0;
    v75 = 0;
    if (v6)
    {
      v46 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v57 + 9) + 128), "humanReadableUpdateName");
      *(_QWORD *)v57 = v7;
      v75 = 1;
      v46 = v7;
    }
    v42 = v46;
    v43 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 128);
    v44 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 168);
    v45 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 8);
    v8 = *(_QWORD *)(*((_QWORD *)v57 + 9) + 8) == 0;
    v73 = 0;
    v71 = 0;
    v69 = 0;
    if (v8
      || (v74 = (id)objc_msgSend(*(id *)(*((_QWORD *)v57 + 9) + 8), "descriptor"),
          v73 = 1,
          !v74))
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v72 = (id)objc_msgSend(*(id *)(*((_QWORD *)v57 + 9) + 8), "descriptor");
      v40 = 1;
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "humanReadableUpdateName");
      v69 = 1;
      v41 = (const __CFString *)v70;
    }
    v37 = v41;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 104));
    v39 = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 104));
    v67 = 0;
    v65 = 0;
    if (v39)
    {
      v68 = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 104));
      v35 = 1;
      v67 = 1;
      v9 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v9);
      v65 = 1;
      v36 = (const __CFString *)v66;
    }
    else
    {
      v36 = CFSTR("N/A");
    }
    v32 = v36;
    v33 = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 112));
    v34 = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 112));
    v63 = 0;
    v61 = 0;
    if (v34)
    {
      v64 = objc_loadWeakRetained((id *)(*((_QWORD *)v57 + 9) + 112));
      v30 = 1;
      v63 = 1;
      v10 = (objc_class *)objc_opt_class();
      v62 = NSStringFromClass(v10);
      v61 = 1;
      v31 = (const __CFString *)v62;
    }
    else
    {
      v31 = CFSTR("N/A");
    }
    v26 = v31;
    v27 = *((_QWORD *)v57 + 6);
    v11 = objc_msgSend(*((id *)v57 + 6), "isDone");
    v28 = &v14;
    buf = v84;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0((uint64_t)v84, (uint64_t)v56, v54, v55, (uint64_t)v47, v48, v49, (uint64_t)v42, v43, v44, v45, (uint64_t)v37, (uint64_t)WeakRetained, (uint64_t)v32, (uint64_t)v33, (uint64_t)v31, v27, v11 & 1);
    _os_log_impl(&dword_21BF33000, log, v52[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\noperationProgress: %@; download done: %d",
      buf,
      0xA4u);
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    if ((v75 & 1) != 0)
    if ((v77 & 1) != 0)

    objc_storeStrong(&v78, 0);
  }
  objc_storeStrong(&v80, 0);
  v24 = (id)objc_msgSend(*((id *)v57 + 7), "downloadOptions");
  v12 = objc_msgSend(v24, "isAutoDownload");
  v25 = 0;
  if ((v12 & 1) == 0)
  {
    v13 = *(_BYTE *)(*((_QWORD *)v57 + 9) + 55);
    v25 = 0;
    if ((v13 & 1) == 0)
      v25 = *(unsigned __int8 *)(*((_QWORD *)v57 + 9) + 54) ^ 1;
  }
  v23 = v25;

  if ((v23 & 1) != 0)
  {
    v21 = (id)objc_msgSend(*((id *)v57 + 7), "descriptor");
    v22 = objc_msgSend(v21, "isEqual:", *(_QWORD *)(*((_QWORD *)v57 + 9) + 120));

    if ((v22 & 1) != 0)
    {
      objc_msgSend(*((id *)v57 + 9), "hideAlternateUpdate");
    }
    else
    {
      v19 = (id)objc_msgSend(*((id *)v57 + 7), "descriptor");
      v20 = objc_msgSend(v19, "isEqual:", *(_QWORD *)(*((_QWORD *)v57 + 9) + 128));

      if ((v20 & 1) != 0)
        objc_msgSend(*((id *)v57 + 9), "hidePreferredUpdate");
    }
  }
  if ((objc_msgSend(*((id *)v57 + 6), "isDone") & 1) != 0)
  {
    objc_msgSend(*((id *)v57 + 9), "checkAndSetReadyToInstall");
  }
  else
  {
    v60 = (id)objc_msgSend(*((id *)v57 + 6), "phase");
    oslog = (os_log_t)_SUSUILoggingFacility();
    v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = oslog;
      *(_DWORD *)v17 = v58;
      v18 = v83;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v83, (uint64_t)v56, (uint64_t)v60);
      _os_log_impl(&dword_21BF33000, v16, v17[0], "%s - phase: %@", v18, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if ((SUPrefsDownloadPhaseIsStalled_0(v60) & 1) != 0)
    {
      objc_msgSend(*((id *)v57 + 9), "setState:", 14);
    }
    else if ((objc_msgSend(*((id *)v57 + 9), "_SUDownloadPhaseIsQueued:", v60) & 1) != 0)
    {
      objc_msgSend(*((id *)v57 + 9), "setState:", 5);
    }
    else
    {
      objc_msgSend(*((id *)v57 + 9), "setState:", 12);
    }
    objc_storeStrong(&v60, 0);
  }
  obj = 0;
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, obj);
}

- (void)scanFinishedWithUpdates:(id)a3 options:(id)a4 andError:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  BOOL v10;
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  os_log_t *v19;
  char *v20;
  BOOL v21;
  id v22;
  char *v23;
  char *v24;
  char v25;
  BOOL v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  _BOOL4 v32;
  id v33;
  int v34;
  id v35;
  id v36;
  id v37;
  _BOOL4 v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
  int v42;
  id v43;
  id SUErrorDomain_3;
  id v45;
  int v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id *v52;
  id *v53;
  id *v54;
  uint64_t *v55;
  id v56;
  id *v57;
  os_log_t v58;
  os_log_type_t v59[4];
  uint8_t *v60;
  id v61;
  int v62;
  int v63;
  id v64;
  id v65;
  int v66;
  int v67;
  id v68;
  int v69;
  id v70;
  id v71;
  int v72;
  uint64_t v73;
  id *v74;
  int v75;
  id v76;
  int v77;
  id v78;
  int v79;
  id v80;
  os_log_t v81;
  os_log_type_t v82[4];
  uint8_t *v83;
  id v84;
  uint64_t *v85;
  uint8_t *buf;
  id v87;
  id v88;
  id v89;
  const __CFString *v90;
  id v91;
  const __CFString *v92;
  id v93;
  Class v94;
  id v95;
  id v96;
  const __CFString *v97;
  id v98;
  const __CFString *v99;
  id v100;
  Class aClass;
  id v102;
  id v103;
  const __CFString *v104;
  id WeakRetained;
  const __CFString *v106;
  id v107;
  id v108;
  id v109;
  const __CFString *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const __CFString *v114;
  id v115;
  const __CFString *v116;
  uint64_t v117;
  uint64_t v118;
  const __CFString *v119;
  id v120;
  id v121;
  uint64_t v122;
  int v123;
  os_log_t log;
  os_log_type_t v125[4];
  id updated;
  id v127;
  char *v128;
  id obj;
  id v130;
  const char *v131;
  int v132;
  uint64_t v133;
  int v134;
  int v135;
  void (*v136)(uint64_t, void *, void *);
  void *v137;
  _QWORD v138[3];
  id v139;
  os_log_type_t v140;
  os_log_t oslog;
  char v142;
  id v143;
  char v144;
  id v145;
  char v146;
  id v147;
  char v148[8];
  int v149;
  int v150;
  id v151;
  char v152;
  id v153;
  char v154;
  char v155;
  id from;
  int v157;
  os_log_type_t v158;
  id v159;
  char v160;
  char v161;
  char v162;
  char v163;
  char v164;
  char v165;
  char v166;
  char v167;
  char v168;
  id v169;
  os_log_type_t type;
  id v171;
  id v172;
  id v173;
  id location[3];
  _BYTE v175[32];
  _BYTE v176[16];
  _BYTE v177[200];
  uint64_t v178;

  v128 = v148;
  obj = a4;
  v130 = a5;
  v131 = "-[SUSUISoftwareUpdateManager scanFinishedWithUpdates:options:andError:]";
  v178 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v173 = 0;
  objc_storeStrong(&v173, obj);
  v172 = 0;
  objc_storeStrong(&v172, v130);
  v127 = _SUSUILoggingFacility();
  v171 = v127;
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v171, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v128 + 35);
    *(_DWORD *)v125 = type;
    updated = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v128 + 40) + 88));
    v121 = updated;
    v5 = v121;
    v6 = v128;
    v122 = (uint64_t)v5;
    *((_QWORD *)v128 + 33) = v5;
    v123 = *(_DWORD *)(*((_QWORD *)v6 + 40) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 40) + 120) == 0;
    v168 = 0;
    if ((v6 & 1) != 0)
    {
      v119 = CFSTR("N/A");
    }
    else
    {
      v120 = (id)objc_msgSend(*(id *)(*((_QWORD *)v128 + 40) + 120), "humanReadableUpdateName");
      v7 = (const __CFString *)v120;
      *((_QWORD *)v128 + 32) = v7;
      v168 = 1;
      v119 = v7;
    }
    v116 = v119;
    v117 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 120);
    v118 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 128) == 0;
    v167 = 0;
    if (v8)
    {
      v114 = CFSTR("N/A");
    }
    else
    {
      v115 = (id)objc_msgSend(*(id *)(*((_QWORD *)v128 + 40) + 128), "humanReadableUpdateName");
      v9 = (const __CFString *)v115;
      *((_QWORD *)v128 + 30) = v9;
      v167 = 1;
      v114 = v9;
    }
    v110 = v114;
    v111 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 128);
    v112 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 168);
    v113 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 8);
    v10 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 8) == 0;
    v166 = 0;
    v165 = 0;
    v164 = 0;
    if (v10
      || (v109 = (id)objc_msgSend(*(id *)(*((_QWORD *)v128 + 40) + 8), "descriptor"),
          v11 = v109,
          *((_QWORD *)v128 + 28) = v11,
          v166 = 1,
          !v11))
    {
      v106 = CFSTR("N/A");
    }
    else
    {
      v108 = (id)objc_msgSend(*(id *)(*((_QWORD *)v128 + 40) + 8), "descriptor");
      v12 = v108;
      *((_QWORD *)v128 + 26) = v12;
      v165 = 1;
      v107 = (id)objc_msgSend(v12, "humanReadableUpdateName");
      v13 = (const __CFString *)v107;
      *((_QWORD *)v128 + 24) = v13;
      v164 = 1;
      v106 = v13;
    }
    v104 = v106;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 104));
    v103 = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 104));
    v163 = 0;
    v162 = 0;
    if (v103)
    {
      v102 = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 104));
      *((_QWORD *)v128 + 22) = v102;
      v163 = 1;
      aClass = (Class)objc_opt_class();
      v100 = NSStringFromClass(aClass);
      v14 = (const __CFString *)v100;
      *((_QWORD *)v128 + 20) = v14;
      v162 = 1;
      v99 = v14;
    }
    else
    {
      v99 = CFSTR("N/A");
    }
    v97 = v99;
    v98 = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 112));
    v96 = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 112));
    v161 = 0;
    v160 = 0;
    if (v96)
    {
      v95 = objc_loadWeakRetained((id *)(*((_QWORD *)v128 + 40) + 112));
      *((_QWORD *)v128 + 18) = v95;
      v161 = 1;
      v94 = (Class)objc_opt_class();
      v93 = NSStringFromClass(v94);
      v15 = (const __CFString *)v93;
      *((_QWORD *)v128 + 16) = v15;
      v160 = 1;
      v92 = v15;
    }
    else
    {
      v92 = CFSTR("N/A");
    }
    v90 = v92;
    v91 = (id)objc_msgSend(*((id *)v128 + 37), "identifier");
    v88 = v91;
    v89 = (id)objc_msgSend(*((id *)v128 + 37), "clientName");
    v87 = v89;
    v16 = *((_QWORD *)v128 + 36);
    v17 = *((_QWORD *)v128 + 38);
    v85 = &v29;
    buf = v177;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_64((uint64_t)v177, (uint64_t)v131, v122, v123, (uint64_t)v116, v117, v118, (uint64_t)v110, v111, v112, v113, (uint64_t)v104, (uint64_t)WeakRetained, (uint64_t)v97, (uint64_t)v98, (uint64_t)v92, (uint64_t)v88, (uint64_t)v87, v16,
      v17);
    _os_log_impl(&dword_21BF33000, log, v125[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nscanId: %{public}@ (client: %{public}@), error: %{public}@; SUScanResults: %@",
      buf,
      0xBCu);

    if ((v160 & 1) != 0)
    if ((v161 & 1) != 0)

    if ((v162 & 1) != 0)
    if ((v163 & 1) != 0)

    if ((v164 & 1) != 0)
    if ((v165 & 1) != 0)

    if ((v166 & 1) != 0)
    if ((v167 & 1) != 0)

    if ((v168 & 1) != 0)
    objc_storeStrong(&v169, 0);
  }
  objc_storeStrong(&v171, 0);
  if ((*(_BYTE *)(*((_QWORD *)v128 + 40) + 17) & 1) != 0)
  {
    v80 = (id)objc_msgSend(MEMORY[0x24BEAEA40], "sharedDevice");
    v78 = v80;
    v79 = objc_msgSend(v78, "hasSemiSplatActive");

    if ((v79 & 1) != 0)
    {
      SULogInfo();
      objc_msgSend(*((id *)v128 + 40), "clearPastScanResults");
      objc_msgSend(*((id *)v128 + 40), "setState:", 3);
      objc_msgSend(*((id *)v128 + 40), "handleRollbackApplied");
      v157 = 1;
    }
    else
    {
      v20 = v128;
      *(_BYTE *)(*((_QWORD *)v128 + 40) + 17) = 0;
      objc_storeStrong((id *)(*((_QWORD *)v20 + 40) + 152), 0);
      if (*((_QWORD *)v128 + 36))
      {
        v45 = (id)objc_msgSend(*((id *)v128 + 36), "domain");
        v43 = v45;
        SUErrorDomain_3 = getSUErrorDomain_3();
        v41 = SUErrorDomain_3;
        v42 = objc_msgSend(v43, "isEqualToString:");
        v40 = 0;
        if ((v42 & 1) != 0)
        {
          v39 = objc_msgSend(*((id *)v128 + 36), "code");
          v40 = v39 == 3;
        }
        v38 = v40;

        if (v38)
        {
          objc_msgSend(*((id *)v128 + 40), "clearPastScanResults");
          objc_msgSend(*((id *)v128 + 40), "setState:", 3);
        }
        else
        {
          v37 = (id)objc_msgSend(*((id *)v128 + 36), "domain");
          v35 = v37;
          v36 = getSUErrorDomain_3();
          v33 = v36;
          v34 = objc_msgSend(v35, "isEqualToString:");
          v32 = 0;
          if ((v34 & 1) != 0)
          {
            v31 = objc_msgSend(*((id *)v128 + 36), "code");
            v32 = v31 == 55;
          }
          v30 = v32;

          if (v30)
            objc_msgSend(*((id *)v128 + 40), "setState:", 4);
          else
            objc_msgSend(*((id *)v128 + 40), "handleScanError:", *((_QWORD *)v128 + 36));
        }
      }
      else
      {
        objc_initWeak(&from, *((id *)v128 + 40));
        v155 = 0;
        v21 = *(_DWORD *)(*((_QWORD *)v128 + 40) + 88) == 1;
        v154 = 0;
        v77 = 1;
        if (!v21)
        {
          v76 = (id)objc_msgSend(*((id *)v128 + 40), "download");
          v22 = v76;
          *((_QWORD *)v128 + 8) = v22;
          v154 = 1;
          v77 = 1;
          if (!v22)
            v77 = *(unsigned __int8 *)(*((_QWORD *)v128 + 40) + 18);
        }
        v75 = v77;
        if ((v154 & 1) != 0)

        v23 = v128;
        v155 = v75 & 1;
        *(_QWORD *)v128 = MEMORY[0x24BDAC760];
        v149 = -1073741824;
        v150 = 0;
        *((_QWORD *)v23 + 2) = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke;
        *((_QWORD *)v23 + 3) = &unk_24DFFCCD0;
        v74 = &v151;
        objc_copyWeak(&v151, &from);
        v152 = v155 & 1;
        v73 = MEMORY[0x220773A28](v148);
        v24 = v128;
        *((_QWORD *)v128 + 6) = v73;
        if (*((_QWORD *)v24 + 38))
        {
          v25 = *(_BYTE *)(*((_QWORD *)v128 + 40) + 54);
          v146 = 0;
          v144 = 0;
          v142 = 0;
          v72 = 0;
          if ((v25 & 1) != 0)
          {
            v70 = *(id *)(*((_QWORD *)v128 + 40) + 216);
            v71 = (id)objc_msgSend(*((id *)v128 + 38), "preferredDescriptor");
            v147 = v71;
            v146 = 1;
            v69 = objc_msgSend(v70, "isEqual:");
            v72 = 0;
            if ((v69 & 1) != 0)
            {
              if (*(_QWORD *)(*((_QWORD *)v128 + 40) + 120)
                || (v68 = (id)objc_msgSend(*((id *)v128 + 38), "alternateDescriptor"),
                    v145 = v68,
                    v144 = 1,
                    v67 = 1,
                    v145))
              {
                v26 = *(_QWORD *)(*((_QWORD *)v128 + 40) + 120) == 0;
                v66 = 0;
                if (!v26)
                {
                  v64 = *(id *)(*((_QWORD *)v128 + 40) + 120);
                  v65 = (id)objc_msgSend(*((id *)v128 + 38), "alternateDescriptor");
                  v143 = v65;
                  v142 = 1;
                  v63 = objc_msgSend(v64, "isEqual:");
                  v66 = v63;
                }
                v67 = v66;
              }
              v72 = v67;
            }
          }
          v62 = v72;
          if ((v142 & 1) != 0)

          if ((v144 & 1) != 0)
          if ((v146 & 1) != 0)

          if ((v62 & 1) != 0)
          {
            v61 = _SUSUILoggingFacility();
            oslog = (os_log_t)v61;
            v140 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              v58 = oslog;
              *(_DWORD *)v59 = v140;
              v27 = *((_QWORD *)v128 + 38);
              v60 = v175;
              __os_log_helper_16_2_2_8_32_8_64((uint64_t)v175, (uint64_t)v131, v27);
              _os_log_impl(&dword_21BF33000, v58, v59[0], "%s: Skipping on assigning the results preferred update and alternate update as _hidingPreferredUpdate = YES while _hiddenPreferredUpdate = results.preferredDescriptor and _preferredUpdate = results.alternateDescriptor. Results: %@", v60, 0x16u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          else
          {
            objc_msgSend(*((id *)v128 + 40), "assignScanResults:", *((_QWORD *)v128 + 38));
          }
          if ((v155 & 1) != 0)
          {
            v56 = *(id *)(*((_QWORD *)v128 + 40) + 56);
            v133 = MEMORY[0x24BDAC760];
            v134 = -1073741824;
            v135 = 0;
            v136 = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_531;
            v137 = &unk_24DFFCD20;
            v57 = &v139;
            objc_copyWeak(&v139, &from);
            v55 = &v133;
            v52 = (id *)v138;
            v138[0] = *((id *)v128 + 40);
            v53 = (id *)(v55 + 5);
            v138[1] = *((id *)v128 + 38);
            v54 = (id *)(v55 + 6);
            v138[2] = *((id *)v128 + 6);
            objc_msgSend(v56, "download:", v55);
            objc_storeStrong(v54, 0);
            objc_storeStrong(v53, 0);
            objc_storeStrong(v52, 0);
            objc_destroyWeak(v57);
          }
          else
          {
            objc_msgSend(*((id *)v128 + 40), "_requestLayoutSubviews");
          }
        }
        else
        {
          v51 = (id)objc_msgSend(*((id *)v128 + 40), "download");
          v50 = v51;

          if (v50)
          {
            if ((v155 & 1) != 0)
            {
              v48 = (id)*((_QWORD *)v128 + 40);
              v49 = (id)objc_msgSend(*((id *)v128 + 40), "download");
              v47 = v49;
              objc_msgSend(v48, "updateStateFromDownload:");

            }
          }
          else if (*(_QWORD *)(*((_QWORD *)v128 + 40) + 120))
          {
            v132 = 0;
            v46 = objc_msgSend(*((id *)v128 + 40), "shouldShowPreferredUpdateAsAlternate");
            if ((v46 & 1) != 0)
              v28 = 6;
            else
              v28 = 8;
            v132 = v28;
            (*(void (**)(void))(*((_QWORD *)v128 + 6) + 16))();
          }
          else
          {
            (*(void (**)(void))(*((_QWORD *)v128 + 6) + 16))();
          }
        }
        objc_storeStrong(&v153, 0);
        objc_destroyWeak(v74);
        objc_destroyWeak(&from);
      }
      v157 = 0;
    }
  }
  else
  {
    v84 = _SUSUILoggingFacility();
    v18 = v84;
    v19 = (os_log_t *)v128;
    *((_QWORD *)v128 + 14) = v18;
    v158 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v19[14], OS_LOG_TYPE_ERROR))
    {
      v81 = (os_log_t)*((_QWORD *)v128 + 14);
      *(_DWORD *)v82 = v158;
      v83 = v176;
      __os_log_helper_16_2_1_8_32((uint64_t)v176, (uint64_t)v131);
      _os_log_error_impl(&dword_21BF33000, v81, v82[0], "%s: Called while _anyScanInProgress = NO. Stopping.", v83, 0xCu);
    }
    objc_storeStrong(&v159, 0);
    v157 = 1;
  }
  objc_storeStrong(&v172, 0);
  objc_storeStrong(&v173, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke(uint64_t a1, unsigned int a2)
{
  id location[2];
  unsigned int v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
      objc_msgSend(location[0], "setState:", v4);
    else
      objc_msgSend(location[0], "_requestLayoutSubviews");
  }
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_531(uint64_t a1, void *a2, void *a3)
{
  int v3;
  char v4;
  void *v5;
  id v6;
  char v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, char, id);
  void *v26;
  id v27;
  id v28;
  char v29;
  id v30;
  char v31;
  int v32;
  int v33;
  id v34[2];
  id v35;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v35 = 0;
  objc_storeStrong(&v35, a3);
  v34[1] = (id)a1;
  v34[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v34[0])
  {
    objc_msgSend(v34[0], "setDownload:", location[0]);
    if (!location[0])
    {
      objc_msgSend(v34[0], "setHiddenAlternateUpdate:");
      objc_msgSend(v34[0], "setHiddenPreferredUpdate:", 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 55) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 54) = 0;
      v16 = *(void **)(a1 + 32);
      v17 = (id)objc_msgSend(*(id *)(a1 + 40), "preferredDescriptor");
      objc_msgSend(v16, "setPreferredUpdate:");

      v18 = *(void **)(a1 + 32);
      v19 = (id)objc_msgSend(*(id *)(a1 + 40), "alternateDescriptor");
      objc_msgSend(v18, "setAlternateUpdate:");

      v33 = 0;
      if ((objc_msgSend(v34[0], "shouldShowPreferredUpdateAsAlternate") & 1) != 0)
        v3 = 6;
      else
        v3 = 8;
      v33 = v3;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v32 = 1;
      goto LABEL_16;
    }
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v11 = (id)objc_msgSend(location[0], "downloadOptions");
    v8 = objc_msgSend(v11, "downloadFeeAgreementStatus");
    v10 = (id)objc_msgSend(location[0], "descriptor");
    objc_msgSend(v9, "setCellularFeeAgreementStatus:forUpdate:", v8);

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v15 = (id)objc_msgSend(location[0], "downloadOptions");
    v12 = objc_msgSend(v15, "termsAndConditionsAgreementStatus");
    v14 = (id)objc_msgSend(location[0], "descriptor");
    objc_msgSend(v13, "setTermsAgreementStatus:forUpdate:", v12);

    v31 = 0;
    v6 = (id)objc_msgSend(location[0], "descriptor");
    v4 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    v29 = 0;
    v7 = 1;
    if ((v4 & 1) == 0)
    {
      v30 = (id)objc_msgSend(location[0], "descriptor");
      v29 = 1;
      v7 = objc_msgSend(v30, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    }
    if ((v29 & 1) != 0)

    v31 = v7 & 1;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v34[0], "updateStateFromDownload:", location[0]);
    }
    else if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) == 1)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v22 = MEMORY[0x24BDAC760];
      v23 = -1073741824;
      v24 = 0;
      v25 = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_2;
      v26 = &unk_24DFFCCF8;
      objc_copyWeak(&v28, (id *)(a1 + 56));
      v27 = *(id *)(a1 + 48);
      objc_msgSend(v5, "isClearingSpaceForDownload:", &v22);
      objc_storeStrong(&v27, 0);
      objc_destroyWeak(&v28);
    }
  }
  v32 = 0;
LABEL_16:
  objc_storeStrong(v34, 0);
  if (!v32)
    v32 = 0;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v4[2];
  id location;
  char v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v4[1] = (id)a1;
  v4[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4[0])
  {
    objc_msgSend(v4[0], "setClearingSpaceForDownload:", v6 & 1);
    objc_msgSend(v4[0], "shouldShowPreferredUpdateAsAlternate");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (void)clearPastScanResults
{
  -[SUSUISoftwareUpdateManager setPreferredUpdate:](self, "setPreferredUpdate:");
  -[SUSUISoftwareUpdateManager setAlternateUpdate:](self, "setAlternateUpdate:", 0);
  -[SUSUISoftwareUpdateManager setHiddenAlternateUpdate:](self, "setHiddenAlternateUpdate:", 0);
  -[SUSUISoftwareUpdateManager setHiddenPreferredUpdate:](self, "setHiddenPreferredUpdate:", 0);
  self->_hidingAlternateUpdate = 0;
  self->_hidingPreferredUpdate = 0;
}

- (BOOL)shouldShowPreferredUpdateAsAlternate
{
  if (self->_preferredUpdate
    && -[SUDescriptor audienceType](self->_preferredUpdate, "audienceType") == 1
    && !self->_alternateUpdate)
  {
    return -[SUDescriptor promoteAlternateUpdate](self->_preferredUpdate, "promoteAlternateUpdate") & 1;
  }
  else
  {
    return 0;
  }
}

- (void)assignScanResults:(id)a3
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  const __CFString *v6;
  SUSUISoftwareUpdateManager *v7;
  id v8;
  id v9;
  const __CFString *v10;
  uint64_t alternateUpdate;
  id v12;
  const __CFString *v13;
  char v14;
  char v15;
  id v16;
  const __CFString *v17;
  SUSUISoftwareUpdateManager *v18;
  id v19;
  id v20;
  const __CFString *v21;
  uint64_t preferredUpdate;
  id v23;
  const __CFString *v24;
  char v25;
  char v26;
  id v27;
  char v28;
  __CFString *v29;
  os_log_t v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  os_log_type_t v37;
  os_log_t oslog;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  __CFString *v44;
  os_log_type_t v45;
  id v46;
  char v47;
  __CFString *v48;
  char v49;
  id v50;
  char v51;
  __CFString *v52;
  os_log_type_t type;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  id location[2];
  SUSUISoftwareUpdateManager *v60;
  uint8_t v61[48];
  uint8_t v62[64];
  uint8_t v63[48];
  uint8_t v64[72];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = (id)objc_msgSend(location[0], "preferredDescriptor");
  v57 = 0;
  v55 = 0;
  if (v27 || (v26 = 1, v60->_preferredUpdate))
  {
    v58 = (id)objc_msgSend(location[0], "preferredDescriptor");
    v57 = 1;
    v25 = 0;
    if (v58)
    {
      v56 = (id)objc_msgSend(location[0], "preferredDescriptor");
      v55 = 1;
      v25 = objc_msgSend(v56, "isEqual:", v60->_preferredUpdate);
    }
    v26 = v25;
  }
  if ((v55 & 1) != 0)

  if ((v57 & 1) != 0)
  if ((v26 & 1) != 0)
  {
    v46 = _SUSUILoggingFacility();
    v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v60->_preferredUpdate == 0;
      v43 = 0;
      if (v4)
      {
        v17 = CFSTR("N/A");
      }
      else
      {
        v44 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v60->_preferredUpdate, "humanReadableUpdateName");
        v43 = 1;
        v17 = v44;
      }
      __os_log_helper_16_2_4_8_32_8_64_8_0_8_64((uint64_t)v63, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v17, (uint64_t)v60->_preferredUpdate, (uint64_t)v60->_preferredUpdateError);
      _os_log_impl(&dword_21BF33000, (os_log_t)v46, v45, "%s: The previous stored preferred update \"%@\" (%p) is the same as the new recieved one. Keeping it with its related error: %@", v63, 0x2Au);
      if ((v43 & 1) != 0)

    }
    objc_storeStrong(&v46, 0);
  }
  else
  {
    v54 = _SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v60->_preferredUpdate == 0;
      v51 = 0;
      if (v3)
      {
        v24 = CFSTR("N/A");
      }
      else
      {
        v52 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v60->_preferredUpdate, "humanReadableUpdateName");
        v51 = 1;
        v24 = v52;
      }
      preferredUpdate = (uint64_t)v60->_preferredUpdate;
      v23 = (id)objc_msgSend(location[0], "preferredDescriptor");
      v49 = 0;
      v47 = 0;
      if (v23)
      {
        v50 = (id)objc_msgSend(location[0], "preferredDescriptor");
        v49 = 1;
        v48 = (__CFString *)(id)objc_msgSend(v50, "humanReadableUpdateName");
        v47 = 1;
        v21 = v48;
      }
      else
      {
        v21 = CFSTR("N/A");
      }
      v20 = (id)objc_msgSend(location[0], "preferredDescriptor");
      __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64((uint64_t)v64, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v24, preferredUpdate, (uint64_t)v21, (uint64_t)v20, (uint64_t)v60->_preferredUpdateError);
      _os_log_impl(&dword_21BF33000, (os_log_t)v54, type, "%s: Replacing the previous stored preferred update \"%@\" (%p) with a new, different, preferred update: %@ (%p) and clearing the previous preferred update error: %@", v64, 0x3Eu);

      if ((v47 & 1) != 0)
      if ((v49 & 1) != 0)

      if ((v51 & 1) != 0)
    }
    objc_storeStrong(&v54, 0);
    v18 = v60;
    v19 = (id)objc_msgSend(location[0], "preferredDescriptor");
    -[SUSUISoftwareUpdateManager setPreferredUpdate:](v18, "setPreferredUpdate:");

    -[SUSUISoftwareUpdateManager setPreferredUpdateError:](v60, "setPreferredUpdateError:", 0);
  }
  v16 = (id)objc_msgSend(location[0], "alternateDescriptor");
  v41 = 0;
  v39 = 0;
  if (v16 || (v15 = 1, v60->_alternateUpdate))
  {
    v42 = (id)objc_msgSend(location[0], "alternateDescriptor");
    v41 = 1;
    v14 = 0;
    if (v42)
    {
      v40 = (id)objc_msgSend(location[0], "alternateDescriptor");
      v39 = 1;
      v14 = objc_msgSend(v40, "isEqual:", v60->_alternateUpdate);
    }
    v15 = v14;
  }
  if ((v39 & 1) != 0)

  if ((v41 & 1) != 0)
  if ((v15 & 1) != 0)
  {
    v30 = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 0;
      if (v60->_alternateUpdate)
      {
        v29 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v60->_alternateUpdate, "humanReadableUpdateName");
        v28 = 1;
        v6 = v29;
      }
      else
      {
        v6 = CFSTR("N/A");
      }
      __os_log_helper_16_2_4_8_32_8_64_8_0_8_64((uint64_t)v61, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v6, (uint64_t)v60->_alternateUpdate, (uint64_t)v60->_alternateUpdateError);
      _os_log_impl(&dword_21BF33000, v30, OS_LOG_TYPE_DEFAULT, "%s: The previous stored alternate update \"%@\" (%p) is the same as the new recieved one. Keeping it with its related error: %@", v61, 0x2Au);
      if ((v28 & 1) != 0)

    }
    objc_storeStrong((id *)&v30, 0);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v60->_alternateUpdate == 0;
      v35 = 0;
      if (v5)
      {
        v13 = CFSTR("N/A");
      }
      else
      {
        v36 = (id)-[SUDescriptor humanReadableUpdateName](v60->_alternateUpdate, "humanReadableUpdateName");
        v35 = 1;
        v13 = (const __CFString *)v36;
      }
      alternateUpdate = (uint64_t)v60->_alternateUpdate;
      v12 = (id)objc_msgSend(location[0], "alternateDescriptor");
      v33 = 0;
      v31 = 0;
      if (v12)
      {
        v34 = (id)objc_msgSend(location[0], "alternateDescriptor");
        v33 = 1;
        v32 = (id)objc_msgSend(v34, "humanReadableUpdateName");
        v31 = 1;
        v10 = (const __CFString *)v32;
      }
      else
      {
        v10 = CFSTR("N/A");
      }
      v9 = (id)objc_msgSend(location[0], "alternateDescriptor");
      __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64((uint64_t)v62, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v13, alternateUpdate, (uint64_t)v10, (uint64_t)v9, (uint64_t)v60->_alternateUpdateError);
      _os_log_impl(&dword_21BF33000, oslog, v37, "%s: Replacing the previous stored alternate update \"%@\" (%p) with a new, different, alternate update: %@ (%p) and clearing the previous alternate update error: %@", v62, 0x3Eu);

      if ((v31 & 1) != 0)
      if ((v33 & 1) != 0)

      if ((v35 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = v60;
    v8 = (id)objc_msgSend(location[0], "alternateDescriptor");
    -[SUSUISoftwareUpdateManager setAlternateUpdate:](v7, "setAlternateUpdate:");

    -[SUSUISoftwareUpdateManager setAlternateUpdateError:](v60, "setAlternateUpdateError:", 0);
  }
  objc_storeStrong(location, 0);
}

- (void)enrollInBetaUpdatesForProgram:(id)a3 completion:(id)a4
{
  id v4;
  id v5;
  id v6;
  SDDevice *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  BOOL v11;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(id *, void *);
  void *v17;
  SUSUISoftwareUpdateManager *v18;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  char v23;
  NSArray *v24;
  int v25;
  os_log_type_t v26;
  id v27;
  id v28;
  id location[2];
  SUSUISoftwareUpdateManager *v30;
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v10 = -[SUSUISoftwareUpdateManager betaPrograms](v30, "betaPrograms");
    v23 = 0;
    v11 = 1;
    if (v10)
    {
      v24 = -[SUSUISoftwareUpdateManager betaPrograms](v30, "betaPrograms");
      v23 = 1;
      v11 = -[NSArray count](v24, "count") == 0;
    }
    if ((v23 & 1) != 0)

    if (v11)
    {
      v22 = _SUSUILoggingFacility();
      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]");
        _os_log_impl(&dword_21BF33000, (os_log_t)v22, v21, "%s: No programs to enroll in, aborting", v31, 0xCu);
      }
      objc_storeStrong(&v22, 0);
      -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](v30, "scanForUpdatesCompletion:", 0);
      (*((void (**)(id, _QWORD))v28 + 2))(v28, 0);
      v25 = 1;
    }
    else
    {
      if (!location[0])
      {
        v9 = -[SUSUISoftwareUpdateManager betaPrograms](v30, "betaPrograms");
        v4 = -[NSArray firstObject](v9, "firstObject");
        v5 = location[0];
        location[0] = v4;

      }
      v8 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
      v7 = -[SUSUISoftwareUpdateManager currentSeedingDevice](v30, "currentSeedingDevice");
      v6 = location[0];
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke;
      v17 = &unk_24DFF7E50;
      v18 = v30;
      v19 = location[0];
      v20 = v28;
      objc_msgSend(v8, "enrollDevice:inBetaProgram:completion:", v7, v6, &v13);

      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong((id *)&v18, 0);
      v25 = 0;
    }
  }
  else
  {
    v27 = _SUSUILoggingFacility();
    v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v32, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]");
      _os_log_impl(&dword_21BF33000, (os_log_t)v27, v26, "%s: enrollInBetaUpdates feature is not enabled", v32, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    (*((void (**)(id, _QWORD))v28 + 2))(v28, 0);
    v25 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke(id *a1, void *a2)
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id obj;
  uint64_t *v17;
  uint8_t *buf;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  os_log_t log;
  os_log_type_t type[4];
  id v42;
  id v43;
  int v44;
  const char *v45;
  id *v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(uint64_t);
  void *v51;
  _QWORD v52[4];
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  __CFString *v70;
  id v71;
  unsigned __int8 v72;
  id v73[2];
  id location[2];
  _BYTE v75[168];
  uint64_t v76;

  v46 = a1;
  v45 = "-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke";
  v76 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v73[1] = v46;
  v73[0] = _SUSUILoggingFacility();
  v72 = 0;
  if (os_log_type_enabled((os_log_t)v73[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v73[0];
    *(_DWORD *)type = v72;
    v42 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v46[4] + 22));
    v43 = v42;
    v71 = v43;
    v44 = *((_DWORD *)v46[4] + 22);
    v2 = *((_QWORD *)v46[4] + 15) == 0;
    v69 = 0;
    if (v2)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v70 = (__CFString *)(id)objc_msgSend(*((id *)v46[4] + 15), "humanReadableUpdateName");
      v69 = 1;
      v39 = v70;
    }
    v36 = v39;
    v37 = *((_QWORD *)v46[4] + 15);
    v38 = *((_QWORD *)v46[4] + 20);
    v3 = *((_QWORD *)v46[4] + 16) == 0;
    v67 = 0;
    if (v3)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v68 = (id)objc_msgSend(*((id *)v46[4] + 16), "humanReadableUpdateName");
      v67 = 1;
      v35 = (const __CFString *)v68;
    }
    v31 = v35;
    v32 = *((_QWORD *)v46[4] + 16);
    v33 = *((_QWORD *)v46[4] + 21);
    v34 = *((_QWORD *)v46[4] + 1);
    v4 = *((_QWORD *)v46[4] + 1) == 0;
    v65 = 0;
    v63 = 0;
    v61 = 0;
    if (v4
      || (v66 = (id)objc_msgSend(*((id *)v46[4] + 1), "descriptor"), v65 = 1, !v66))
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v64 = (id)objc_msgSend(*((id *)v46[4] + 1), "descriptor");
      v29 = 1;
      v63 = 1;
      v62 = (id)objc_msgSend(v64, "humanReadableUpdateName");
      v61 = 1;
      v30 = (const __CFString *)v62;
    }
    v26 = v30;
    WeakRetained = objc_loadWeakRetained((id *)v46[4] + 13);
    v28 = objc_loadWeakRetained((id *)v46[4] + 13);
    v59 = 0;
    v57 = 0;
    if (v28)
    {
      v60 = objc_loadWeakRetained((id *)v46[4] + 13);
      v24 = 1;
      v59 = 1;
      v5 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v5);
      v57 = 1;
      v25 = (const __CFString *)v58;
    }
    else
    {
      v25 = CFSTR("N/A");
    }
    v21 = v25;
    v22 = objc_loadWeakRetained((id *)v46[4] + 14);
    v23 = objc_loadWeakRetained((id *)v46[4] + 14);
    v55 = 0;
    v53 = 0;
    if (v23)
    {
      v56 = objc_loadWeakRetained((id *)v46[4] + 14);
      v19 = 1;
      v55 = 1;
      v6 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v6);
      v53 = 1;
      v20 = (const __CFString *)v54;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v7 = (uint64_t)v46[5];
    v17 = &v8;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v45, (uint64_t)v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v7, (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nEnroll in program: %@, error: %@", buf, 0xA8u);
    if ((v53 & 1) != 0)

    if ((v55 & 1) != 0)
    if ((v57 & 1) != 0)

    if ((v59 & 1) != 0)
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    objc_storeStrong(&v71, 0);
  }
  obj = 0;
  objc_storeStrong(v73, 0);
  queue = (dispatch_queue_t)MEMORY[0x24BDAC9B8];
  block = &v47;
  v47 = MEMORY[0x24BDAC760];
  v48 = -1073741824;
  v49 = 0;
  v50 = __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke_535;
  v51 = &unk_24DFFCD48;
  v14 = (id *)v52;
  v15 = location;
  v52[0] = location[0];
  v13 = (id *)((char *)block + 56);
  v52[3] = v46[6];
  v12 = (id *)((char *)block + 40);
  v52[1] = v46[4];
  v11 = (id *)((char *)block + 48);
  v52[2] = v46[5];
  dispatch_async(queue, block);

  objc_storeStrong(v11, obj);
  objc_storeStrong(v12, obj);
  objc_storeStrong(v13, obj);
  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
}

void __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke_535(uint64_t a1)
{
  os_log_t oslog;
  os_log_type_t v3;
  id location[3];
  uint8_t v5[16];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    location[0] = _SUSUILoggingFacility();
    v3 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke");
      _os_log_error_impl(&dword_21BF33000, (os_log_t)location[0], v3, "%s: Failed to enroll device in seeding", v6, 0xCu);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke");
      _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "%s: Finished to enroll device in seeding", v5, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(a1 + 40), "setEnrolledBetaProgram:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "scanForUpdatesCompletion:", 0);
  }
}

- (void)unenrollBetaUpdatesWithCompletion:(id)a3
{
  SDDevice *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(void *, char);
  void *v9;
  SUSUISoftwareUpdateManager *v10;
  id v11;
  int v12;
  id location[2];
  SUSUISoftwareUpdateManager *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
    v3 = -[SUSUISoftwareUpdateManager currentSeedingDevice](v14, "currentSeedingDevice");
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke;
    v9 = &unk_24DFF7EC8;
    v10 = v14;
    v11 = location[0];
    objc_msgSend(v4, "unenrollDevice:completion:", v3, &v5);

    objc_storeStrong(&v11, 0);
    objc_storeStrong((id *)&v10, 0);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(location, 0);
}

void __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke(void *a1, char a2)
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id *v10;
  id *v11;
  id obj;
  uint64_t *v13;
  uint8_t *buf;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  id v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id WeakRetained;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  os_log_t log;
  os_log_type_t type[4];
  id v38;
  id v39;
  int v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  id v48;
  id v49;
  char v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  __CFString *v68;
  id location;
  unsigned __int8 v70;
  id v71[2];
  char v72;
  void *v73;
  _BYTE v74[168];
  uint64_t v75;

  v41 = a1;
  v42 = "-[SUSUISoftwareUpdateManager unenrollBetaUpdatesWithCompletion:]_block_invoke";
  v75 = *MEMORY[0x24BDAC8D0];
  v73 = a1;
  v72 = a2 & 1;
  v71[1] = a1;
  v71[0] = _SUSUILoggingFacility();
  v70 = 0;
  if (os_log_type_enabled((os_log_t)v71[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v71[0];
    *(_DWORD *)type = v70;
    v38 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v41 + 4) + 88));
    v39 = v38;
    location = v39;
    v40 = *(_DWORD *)(*((_QWORD *)v41 + 4) + 88);
    v2 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 120) == 0;
    v67 = 0;
    if (v2)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v68 = (__CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v41 + 4) + 120), "humanReadableUpdateName");
      v67 = 1;
      v35 = v68;
    }
    v32 = v35;
    v33 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 120);
    v34 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 160);
    v3 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 128) == 0;
    v65 = 0;
    if (v3)
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v66 = (id)objc_msgSend(*(id *)(*((_QWORD *)v41 + 4) + 128), "humanReadableUpdateName");
      v65 = 1;
      v31 = (const __CFString *)v66;
    }
    v27 = v31;
    v28 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 128);
    v29 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 168);
    v30 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 8);
    v4 = *(_QWORD *)(*((_QWORD *)v41 + 4) + 8) == 0;
    v63 = 0;
    v61 = 0;
    v59 = 0;
    if (v4
      || (v64 = (id)objc_msgSend(*(id *)(*((_QWORD *)v41 + 4) + 8), "descriptor"),
          v63 = 1,
          !v64))
    {
      v26 = CFSTR("N/A");
    }
    else
    {
      v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v41 + 4) + 8), "descriptor");
      v25 = 1;
      v61 = 1;
      v60 = (id)objc_msgSend(v62, "humanReadableUpdateName");
      v59 = 1;
      v26 = (const __CFString *)v60;
    }
    v22 = v26;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 104));
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 104));
    v57 = 0;
    v55 = 0;
    if (v24)
    {
      v58 = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 104));
      v20 = 1;
      v57 = 1;
      v5 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v5);
      v55 = 1;
      v21 = (const __CFString *)v56;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v17 = v21;
    v18 = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 112));
    v19 = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 112));
    v53 = 0;
    v51 = 0;
    if (v19)
    {
      v54 = objc_loadWeakRetained((id *)(*((_QWORD *)v41 + 4) + 112));
      v15 = 1;
      v53 = 1;
      v6 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v6);
      v51 = 1;
      v16 = (const __CFString *)v52;
    }
    else
    {
      v16 = CFSTR("N/A");
    }
    v13 = &v7;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v74, (uint64_t)v42, (uint64_t)v39, v40, (uint64_t)v32, v33, v34, (uint64_t)v27, v28, v29, v30, (uint64_t)v22, (uint64_t)WeakRetained, (uint64_t)v17, (uint64_t)v18, (uint64_t)v16, v72 & 1);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUn-enroll from beta program success: %d", buf, 0x9Au);
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    if ((v61 & 1) != 0)
    if ((v63 & 1) != 0)

    if ((v65 & 1) != 0)
    if ((v67 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v71, 0);
  if ((v72 & 1) != 0)
    objc_msgSend(*((id *)v41 + 4), "setEnrolledBetaProgram:", 0);
  queue = (dispatch_queue_t)MEMORY[0x24BDAC9B8];
  block = &v43;
  v43 = MEMORY[0x24BDAC760];
  v44 = -1073741824;
  v45 = 0;
  v46 = __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke_537;
  v47 = &unk_24DFF7D60;
  v11 = &v49;
  v49 = *((id *)v41 + 5);
  v50 = v72 & 1;
  v10 = (id *)((char *)block + 32);
  v48 = *((id *)v41 + 4);
  dispatch_async(queue, block);

  obj = 0;
  objc_storeStrong(v10, 0);
  objc_storeStrong(v11, obj);
}

uint64_t __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke_537(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "scanForUpdatesCompletion:", 0);
}

- (void)scanForBetaPrograms
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  uint8_t *buf;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  id v15;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  id WeakRetained;
  id v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v27;
  const __CFString *v28;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v31;
  os_log_t log;
  os_log_type_t type[4];
  id v34;
  id v35;
  int state;
  const char *v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(id *, void *);
  void *v42;
  SUSUISoftwareUpdateManager *v43;
  char v44;
  id v45;
  char v46;
  id v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  SUDescriptor *v57;
  char v58;
  __CFString *v59;
  char v60;
  __CFString *v61;
  id location;
  unsigned __int8 v63;
  id v64[2];
  SUSUISoftwareUpdateManager *v65;
  _BYTE v66[152];
  uint64_t v67;

  v37 = "-[SUSUISoftwareUpdateManager scanForBetaPrograms]";
  v67 = *MEMORY[0x24BDAC8D0];
  v65 = self;
  v64[1] = (id)a2;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[SUSUISoftwareUpdateManager clientIsBuddy](v65, "clientIsBuddy"))
    {
      v64[0] = _SUSUILoggingFacility();
      v63 = 0;
      if (os_log_type_enabled((os_log_t)v64[0], OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_t)v64[0];
        *(_DWORD *)type = v63;
        v34 = SUSUISoftwareUpdateStateToString(v65->_state);
        v35 = v34;
        location = v35;
        state = v65->_state;
        v2 = v65->_preferredUpdate == 0;
        v60 = 0;
        if (v2)
        {
          v31 = CFSTR("N/A");
        }
        else
        {
          v61 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v65->_preferredUpdate, "humanReadableUpdateName");
          v60 = 1;
          v31 = v61;
        }
        v28 = v31;
        preferredUpdate = v65->_preferredUpdate;
        preferredUpdateError = v65->_preferredUpdateError;
        v3 = v65->_alternateUpdate == 0;
        v58 = 0;
        if (v3)
        {
          v27 = CFSTR("N/A");
        }
        else
        {
          v59 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v65->_alternateUpdate, "humanReadableUpdateName");
          v58 = 1;
          v27 = v59;
        }
        v23 = v27;
        alternateUpdate = v65->_alternateUpdate;
        alternateUpdateError = v65->_alternateUpdateError;
        download = v65->_download;
        v4 = v65->_download == 0;
        v56 = 0;
        v54 = 0;
        v52 = 0;
        if (v4
          || (v57 = -[SUDownload descriptor](v65->_download, "descriptor"),
              v56 = 1,
              !v57))
        {
          v22 = CFSTR("N/A");
        }
        else
        {
          v55 = -[SUDownload descriptor](v65->_download, "descriptor");
          v21 = 1;
          v54 = 1;
          v53 = (id)objc_msgSend(v55, "humanReadableUpdateName");
          v52 = 1;
          v22 = (const __CFString *)v53;
        }
        v18 = v22;
        WeakRetained = objc_loadWeakRetained((id *)&v65->_delegate);
        v20 = objc_loadWeakRetained((id *)&v65->_delegate);
        v50 = 0;
        v48 = 0;
        if (v20)
        {
          v51 = objc_loadWeakRetained((id *)&v65->_delegate);
          v16 = 1;
          v50 = 1;
          v5 = (objc_class *)objc_opt_class();
          v49 = NSStringFromClass(v5);
          v48 = 1;
          v17 = (const __CFString *)v49;
        }
        else
        {
          v17 = CFSTR("N/A");
        }
        v13 = v17;
        v14 = objc_loadWeakRetained((id *)&v65->_hostController);
        v15 = objc_loadWeakRetained((id *)&v65->_hostController);
        v46 = 0;
        v44 = 0;
        if (v15)
        {
          v47 = objc_loadWeakRetained((id *)&v65->_hostController);
          v11 = 1;
          v46 = 1;
          v6 = (objc_class *)objc_opt_class();
          v45 = NSStringFromClass(v6);
          v44 = 1;
          v12 = (const __CFString *)v45;
        }
        else
        {
          v12 = CFSTR("N/A");
        }
        v9 = &v7;
        buf = v66;
        __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v66, (uint64_t)v37, (uint64_t)v35, state, (uint64_t)v28, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v23, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v18, (uint64_t)WeakRetained, (uint64_t)v13, (uint64_t)v14, (uint64_t)v12);
        _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nNot scanning for beta programs because this is buddy.", buf, 0x94u);
        if ((v44 & 1) != 0)

        if ((v46 & 1) != 0)
        if ((v48 & 1) != 0)

        if ((v50 & 1) != 0)
        if ((v52 & 1) != 0)

        if ((v54 & 1) != 0)
        if ((v56 & 1) != 0)

        if ((v58 & 1) != 0)
        if ((v60 & 1) != 0)

        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(v64, 0);
    }
    else if (v65->_currentSeedingDevice)
    {
      -[SUSUISoftwareUpdateManager _scanForBetaProgramsWithSeedingDevice:](v65, "_scanForBetaProgramsWithSeedingDevice:", v65->_currentSeedingDevice);
    }
    else
    {
      v8 = (id)MEMORY[0x24BE85340];
      v38 = MEMORY[0x24BDAC760];
      v39 = -1073741824;
      v40 = 0;
      v41 = __49__SUSUISoftwareUpdateManager_scanForBetaPrograms__block_invoke;
      v42 = &unk_24DFFCD70;
      v43 = v65;
      objc_msgSend(v8, "getCurrentDevice:", &v38);
      objc_storeStrong((id *)&v43, 0);
    }
  }
}

void __49__SUSUISoftwareUpdateManager_scanForBetaPrograms__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_storeStrong((id *)a1[4] + 31, location[0]);
  objc_msgSend(a1[4], "_scanForBetaProgramsWithSeedingDevice:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)_scanForBetaProgramsWithSeedingDevice:(id)a3
{
  uint64_t v3;
  id v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *);
  void *v11;
  SUSUISoftwareUpdateManager *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint8_t v17[15];
  char v18;
  id v19;
  id location[2];
  SUSUISoftwareUpdateManager *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v15 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
    v4 = v15;
    v3 = objc_msgSend(location[0], "platform");
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke;
    v11 = &unk_24DFFCDE8;
    v12 = v21;
    v13 = v15;
    v14 = location[0];
    objc_msgSend(v4, "queryProgramsForSystemAccountsWithPlatforms:completion:", v3, &v7);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong(&v15, 0);
    v16 = 0;
  }
  else
  {
    v19 = _SUSUILoggingFacility();
    v18 = 16;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_21BF33000, log, type, "Tried to scan for beta programs without a seeding device.", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    v16 = 1;
  }
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke(id *a1, void *a2, void *a3)
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14[3];
  void *v15;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15 = a3;
  v14[2] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2;
  v10 = &unk_24DFFCDC0;
  v11 = a1[4];
  v14[1] = v15;
  v12 = location[0];
  v13 = a1[5];
  v14[0] = a1[6];
  dispatch_async(queue, &v6);

  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2(void *a1)
{
  BOOL v1;
  BOOL v2;
  BOOL v3;
  objc_class *v4;
  objc_class *v5;
  id *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  id *v13;
  id *v14;
  id obj;
  os_log_t v16;
  os_log_type_t v17[4];
  uint8_t *v18;
  id v19;
  id *v20;
  os_log_t v21;
  os_log_type_t v22[4];
  uint8_t *v23;
  id v24;
  id v25;
  int v26;
  uint64_t *v27;
  uint8_t *buf;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  id v32;
  id v33;
  int v34;
  const __CFString *v35;
  const __CFString *v36;
  id WeakRetained;
  id v38;
  int v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  os_log_t log;
  os_log_type_t type[4];
  id v52;
  id v53;
  int v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  int v58;
  int v59;
  void (*v60)(id *, void *);
  void *v61;
  _QWORD v62[2];
  id v63;
  os_log_type_t v64;
  os_log_t v65;
  os_log_type_t v66;
  os_log_t oslog;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  __CFString *v85;
  id location;
  unsigned __int8 v87;
  id v88[3];
  _BYTE v89[16];
  _BYTE v90[16];
  _BYTE v91[152];
  uint64_t v92;

  v55 = a1;
  v56 = "-[SUSUISoftwareUpdateManager _scanForBetaProgramsWithSeedingDevice:]_block_invoke_2";
  v92 = *MEMORY[0x24BDAC8D0];
  v88[2] = a1;
  v88[1] = a1;
  v88[0] = _SUSUILoggingFacility();
  v87 = 0;
  if (os_log_type_enabled((os_log_t)v88[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v88[0];
    *(_DWORD *)type = v87;
    v52 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v55 + 4) + 88));
    v53 = v52;
    location = v53;
    v54 = *(_DWORD *)(*((_QWORD *)v55 + 4) + 88);
    v1 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 120) == 0;
    v84 = 0;
    if (v1)
    {
      v49 = CFSTR("N/A");
    }
    else
    {
      v85 = (__CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 4) + 120), "humanReadableUpdateName");
      v84 = 1;
      v49 = v85;
    }
    v46 = v49;
    v47 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 120);
    v48 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 160);
    v2 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 128) == 0;
    v82 = 0;
    if (v2)
    {
      v45 = CFSTR("N/A");
    }
    else
    {
      v83 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 4) + 128), "humanReadableUpdateName");
      v82 = 1;
      v45 = (const __CFString *)v83;
    }
    v41 = v45;
    v42 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 128);
    v43 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 168);
    v44 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 8);
    v3 = *(_QWORD *)(*((_QWORD *)v55 + 4) + 8) == 0;
    v80 = 0;
    v78 = 0;
    v76 = 0;
    if (v3
      || (v81 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 4) + 8), "descriptor"),
          v80 = 1,
          !v81))
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v79 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 4) + 8), "descriptor");
      v39 = 1;
      v78 = 1;
      v77 = (id)objc_msgSend(v79, "humanReadableUpdateName");
      v76 = 1;
      v40 = (const __CFString *)v77;
    }
    v36 = v40;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 104));
    v38 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 104));
    v74 = 0;
    v72 = 0;
    if (v38)
    {
      v75 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 104));
      v34 = 1;
      v74 = 1;
      v4 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v4);
      v72 = 1;
      v35 = (const __CFString *)v73;
    }
    else
    {
      v35 = CFSTR("N/A");
    }
    v31 = v35;
    v32 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 112));
    v33 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 112));
    v70 = 0;
    v68 = 0;
    if (v33)
    {
      v71 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 4) + 112));
      v29 = 1;
      v70 = 1;
      v5 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v5);
      v68 = 1;
      v30 = (const __CFString *)v69;
    }
    else
    {
      v30 = CFSTR("N/A");
    }
    v27 = &v9;
    buf = v91;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v91, (uint64_t)v56, (uint64_t)v53, v54, (uint64_t)v46, v47, v48, (uint64_t)v41, v42, v43, v44, (uint64_t)v36, (uint64_t)WeakRetained, (uint64_t)v31, (uint64_t)v32, (uint64_t)v30);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nCompleted beta program scan.", buf, 0x94u);
    if ((v68 & 1) != 0)

    if ((v70 & 1) != 0)
    if ((v72 & 1) != 0)

    if ((v74 & 1) != 0)
    if ((v76 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v80 & 1) != 0)

    if ((v82 & 1) != 0)
    if ((v84 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v88, 0);
  if (*((_QWORD *)v55 + 8))
  {
    objc_storeStrong((id *)(*((_QWORD *)v55 + 4) + 256), MEMORY[0x24BDBD1A8]);
    v6 = (id *)v55;
    *(_BYTE *)(*((_QWORD *)v55 + 4) + 85) = 1;
    v25 = (id)objc_msgSend(v6[4], "delegate");
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v24 = (id)objc_msgSend(*((id *)v55 + 4), "delegate");
      objc_msgSend(v24, "manager:didReceiveBetaPrograms:", *((_QWORD *)v55 + 4), *(_QWORD *)(*((_QWORD *)v55 + 4) + 256));

    }
    oslog = (os_log_t)_SUSUILoggingFacility();
    v66 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v21 = oslog;
      *(_DWORD *)v22 = v66;
      v7 = *((_QWORD *)v55 + 8);
      v23 = v90;
      __os_log_helper_16_0_1_8_0((uint64_t)v90, v7);
      _os_log_error_impl(&dword_21BF33000, v21, v22[0], "error fetching new beta programs: %ld", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    objc_storeStrong((id *)(*((_QWORD *)v55 + 4) + 256), *((id *)v55 + 5));
    v65 = (os_log_t)_SUSUILoggingFacility();
    v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v65;
      *(_DWORD *)v17 = v64;
      v19 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 4) + 256), "valueForKey:", CFSTR("programID"));
      v8 = v19;
      v20 = &v63;
      v63 = v8;
      v18 = v89;
      __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v8);
      _os_log_impl(&dword_21BF33000, v16, v17[0], "got new beta programs: %@", v18, 0xCu);

      objc_storeStrong(v20, 0);
    }
    obj = 0;
    objc_storeStrong((id *)&v65, 0);
    v12 = (id)*((_QWORD *)v55 + 6);
    v10 = *((_QWORD *)v55 + 7);
    v11 = &v57;
    v57 = MEMORY[0x24BDAC760];
    v58 = -1073741824;
    v59 = 0;
    v60 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_545;
    v61 = &unk_24DFFCD98;
    v14 = (id *)v62;
    v62[0] = *((id *)v55 + 4);
    v13 = (id *)(v11 + 5);
    v62[1] = *((id *)v55 + 5);
    objc_msgSend(v12, "enrolledBetaProgramForDevice:completion:", v10, v11);
    objc_storeStrong(v13, obj);
    objc_storeStrong(v14, obj);
  }
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_545(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2_546;
  v8 = &unk_24DFF7C20;
  v9 = a1[4];
  v10 = location[0];
  v11[0] = a1[5];
  dispatch_async(queue, &v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2_546(uint64_t a1)
{
  id v1;
  id v2;
  char v3;
  id location[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 85) = 1;
  location[0] = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(_QWORD *)(a1 + 40));
    _os_log_impl(&dword_21BF33000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "refreshed current beta program: %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v1 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
    objc_msgSend(v1, "manager:didReceiveBetaPrograms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (BOOL)isDeviceBetaEnrolled
{
  return self->_enrolledBetaProgram != 0;
}

- (id)betaUpdatesAppleID
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v4 = (id)objc_msgSend(v3, "seedingAppleIDUsernameForCurrentDevice");

  return v4;
}

- (void)manager:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  id v4;
  os_log_t *v5;
  id v6;
  char *v7;
  const __CFString *v8;
  BOOL v9;
  BOOL v10;
  objc_class *v11;
  objc_class *v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t *v16;
  uint8_t *buf;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  id WeakRetained;
  id v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  os_log_t log;
  os_log_type_t type[4];
  id v41;
  uint64_t v42;
  int v43;
  const char *v44;
  id obj;
  char *v46;
  id v47;
  int v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  __CFString *v64;
  char v65;
  char v66;
  id v67;
  unsigned __int8 v68;
  id v69;
  id v70;
  id location[3];
  _BYTE v72[152];
  uint64_t v73;

  v46 = &v66;
  obj = a4;
  v44 = "-[SUSUISoftwareUpdateManager manager:scanRequestDidStartForOptions:]";
  v73 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v70 = 0;
  objc_storeStrong(&v70, obj);
  v47 = (id)objc_msgSend(v70, "identifier");
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.Preferences.software_update"));

  if ((v48 & 1) != 0)
  {
    v4 = _SUSUILoggingFacility();
    v5 = (os_log_t *)v46;
    *((_QWORD *)v46 + 3) = v4;
    v68 = 0;
    if (os_log_type_enabled(v5[3], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_t)*((_QWORD *)v46 + 3);
      *(_DWORD *)type = v68;
      v41 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v46 + 7) + 88));
      v6 = v41;
      v7 = v46;
      v42 = (uint64_t)v6;
      *((_QWORD *)v46 + 1) = v6;
      v43 = *(_DWORD *)(*((_QWORD *)v7 + 7) + 88);
      LOBYTE(v7) = *(_QWORD *)(*((_QWORD *)v7 + 7) + 120) == 0;
      v65 = 0;
      if ((v7 & 1) != 0)
      {
        v38 = CFSTR("N/A");
      }
      else
      {
        v8 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 7) + 120), "humanReadableUpdateName");
        *(_QWORD *)v46 = v8;
        v65 = 1;
        v38 = v8;
      }
      v35 = v38;
      v36 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 120);
      v37 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 160);
      v9 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 128) == 0;
      v63 = 0;
      if (v9)
      {
        v34 = CFSTR("N/A");
      }
      else
      {
        v64 = (__CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 7) + 128), "humanReadableUpdateName");
        v63 = 1;
        v34 = v64;
      }
      v30 = v34;
      v31 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 128);
      v32 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 168);
      v33 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 8);
      v10 = *(_QWORD *)(*((_QWORD *)v46 + 7) + 8) == 0;
      v61 = 0;
      v59 = 0;
      v57 = 0;
      if (v10
        || (v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 7) + 8), "descriptor"),
            v61 = 1,
            !v62))
      {
        v29 = CFSTR("N/A");
      }
      else
      {
        v60 = (id)objc_msgSend(*(id *)(*((_QWORD *)v46 + 7) + 8), "descriptor");
        v28 = 1;
        v59 = 1;
        v58 = (id)objc_msgSend(v60, "humanReadableUpdateName");
        v57 = 1;
        v29 = (const __CFString *)v58;
      }
      v25 = v29;
      WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 104));
      v27 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 104));
      v55 = 0;
      v53 = 0;
      if (v27)
      {
        v56 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 104));
        v23 = 1;
        v55 = 1;
        v11 = (objc_class *)objc_opt_class();
        v54 = NSStringFromClass(v11);
        v53 = 1;
        v24 = (const __CFString *)v54;
      }
      else
      {
        v24 = CFSTR("N/A");
      }
      v20 = v24;
      v21 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 112));
      v22 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 112));
      v51 = 0;
      v49 = 0;
      if (v22)
      {
        v52 = objc_loadWeakRetained((id *)(*((_QWORD *)v46 + 7) + 112));
        v18 = 1;
        v51 = 1;
        v12 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v12);
        v49 = 1;
        v19 = (const __CFString *)v50;
      }
      else
      {
        v19 = CFSTR("N/A");
      }
      v16 = &v14;
      buf = v72;
      __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v72, (uint64_t)v44, v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19);
      _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
      if ((v49 & 1) != 0)

      if ((v51 & 1) != 0)
      if ((v53 & 1) != 0)

      if ((v55 & 1) != 0)
      if ((v57 & 1) != 0)

      if ((v59 & 1) != 0)
      if ((v61 & 1) != 0)

      if ((v63 & 1) != 0)
      if ((v65 & 1) != 0)

      objc_storeStrong(&v67, 0);
    }
    objc_storeStrong(&v69, 0);
    v13 = v46;
    *(_BYTE *)(*((_QWORD *)v46 + 7) + 17) = 1;
    if (*(_DWORD *)(*((_QWORD *)v13 + 7) + 88) != 1 && (*(_BYTE *)(*((_QWORD *)v46 + 7) + 18) & 1) == 0)
      objc_msgSend(*((id *)v46 + 7), "setState:", 1);
  }
  v15 = 0;
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v6;
  char *v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;
  BOOL v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  id *v17;
  uint64_t v18;
  id v19;
  int v20;
  int v21;
  int v22;
  uint64_t *v23;
  uint8_t *buf;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id v28;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  id WeakRetained;
  id v34;
  int v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  os_log_t log;
  os_log_type_t type[4];
  id v48;
  uint64_t v49;
  int v50;
  const char *v51;
  id obj;
  id v53;
  id v54;
  char *v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  char v73;
  char v74;
  id v75;
  unsigned __int8 v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id location[3];
  _BYTE v82[168];
  uint64_t v83;

  v55 = &v73;
  obj = a4;
  v53 = a5;
  v54 = a6;
  v51 = "-[SUSUISoftwareUpdateManager manager:scanRequestDidFinishForOptions:results:error:]";
  v83 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v80 = 0;
  objc_storeStrong(&v80, obj);
  v79 = 0;
  objc_storeStrong(&v79, v53);
  v78 = 0;
  objc_storeStrong(&v78, v54);
  v77 = _SUSUILoggingFacility();
  v76 = 0;
  if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v55 + 5);
    *(_DWORD *)type = v76;
    v48 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v55 + 11) + 88));
    v6 = v48;
    v7 = v55;
    v49 = (uint64_t)v6;
    *((_QWORD *)v55 + 3) = v6;
    v50 = *(_DWORD *)(*((_QWORD *)v7 + 11) + 88);
    LOBYTE(v7) = *(_QWORD *)(*((_QWORD *)v7 + 11) + 120) == 0;
    v74 = 0;
    if ((v7 & 1) != 0)
    {
      v45 = CFSTR("N/A");
    }
    else
    {
      v8 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 11) + 120), "humanReadableUpdateName");
      *((_QWORD *)v55 + 2) = v8;
      v74 = 1;
      v45 = v8;
    }
    v42 = v45;
    v43 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 120);
    v44 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 160);
    v9 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 128) == 0;
    v72 = 0;
    if (v9)
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v10 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 11) + 128), "humanReadableUpdateName");
      *(_QWORD *)v55 = v10;
      v72 = 1;
      v41 = v10;
    }
    v37 = v41;
    v38 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 128);
    v39 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 168);
    v40 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 8);
    v11 = *(_QWORD *)(*((_QWORD *)v55 + 11) + 8) == 0;
    v70 = 0;
    v68 = 0;
    v66 = 0;
    if (v11
      || (v71 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 11) + 8), "descriptor"),
          v70 = 1,
          !v71))
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v69 = (id)objc_msgSend(*(id *)(*((_QWORD *)v55 + 11) + 8), "descriptor");
      v35 = 1;
      v68 = 1;
      v67 = (id)objc_msgSend(v69, "humanReadableUpdateName");
      v66 = 1;
      v36 = (const __CFString *)v67;
    }
    v32 = v36;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 104));
    v34 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 104));
    v64 = 0;
    v62 = 0;
    if (v34)
    {
      v65 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 104));
      v30 = 1;
      v64 = 1;
      v12 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v12);
      v62 = 1;
      v31 = (const __CFString *)v63;
    }
    else
    {
      v31 = CFSTR("N/A");
    }
    v27 = v31;
    v28 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 112));
    v29 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 112));
    v60 = 0;
    v58 = 0;
    if (v29)
    {
      v61 = objc_loadWeakRetained((id *)(*((_QWORD *)v55 + 11) + 112));
      v25 = 1;
      v60 = 1;
      v13 = (objc_class *)objc_opt_class();
      v59 = NSStringFromClass(v13);
      v58 = 1;
      v26 = (const __CFString *)v59;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v14 = *((_QWORD *)v55 + 8);
    v23 = &v18;
    buf = v82;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v82, (uint64_t)v51, v49, v50, (uint64_t)v42, v43, v44, (uint64_t)v37, v38, v39, v40, (uint64_t)v32, (uint64_t)WeakRetained, (uint64_t)v27, (uint64_t)v28, (uint64_t)v26, v14);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\noptions: %{public}@", buf, 0x9Eu);
    if ((v58 & 1) != 0)

    if ((v60 & 1) != 0)
    if ((v62 & 1) != 0)

    if ((v64 & 1) != 0)
    if ((v66 & 1) != 0)

    if ((v68 & 1) != 0)
    if ((v70 & 1) != 0)

    if ((v72 & 1) != 0)
    if ((v74 & 1) != 0)

    objc_storeStrong(&v75, 0);
  }
  objc_storeStrong(&v77, 0);
  v15 = (objc_msgSend(*((id *)v55 + 8), "isForced") & 1) != 0;
  v56 = 0;
  v22 = 0;
  if (!v15)
  {
    v57 = (id)objc_msgSend(*((id *)v55 + 8), "types");
    v56 = 1;
    v16 = objc_msgSend(v57, "count") != 1;
    v21 = 0;
    if (!v16)
      v21 = objc_msgSend(*((id *)v55 + 8), "containsType:", 3);
    v22 = v21 ^ 1;
  }
  v20 = v22;
  if ((v56 & 1) != 0)

  if ((v20 & 1) != 0)
  {
    v17 = (id *)v55;
    *(_BYTE *)(*((_QWORD *)v55 + 11) + 17) = 1;
    objc_msgSend(v17[11], "scanFinishedWithUpdates:options:andError:", v17[7], v17[8], v17[6]);
  }
  v19 = 0;
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, v19);
  objc_storeStrong(&v80, v19);
  objc_storeStrong(location, v19);
}

- (void)manager:(id)a3 downloadDidStart:(id)a4
{
  id v4;
  char *v5;
  const __CFString *v6;
  BOOL v7;
  const __CFString *v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  id v17;
  int v18;
  uint64_t *v19;
  uint8_t *buf;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  id WeakRetained;
  id v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  os_log_t log;
  os_log_type_t type[4];
  id v44;
  uint64_t v45;
  int v46;
  const char *v47;
  id obj;
  char *v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  char v67;
  char v68;
  id v69;
  unsigned __int8 v70;
  id v71;
  id v72;
  id location[3];
  _BYTE v74[168];
  uint64_t v75;

  v49 = &v67;
  obj = a4;
  v47 = "-[SUSUISoftwareUpdateManager manager:downloadDidStart:]";
  v75 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = 0;
  objc_storeStrong(&v72, obj);
  v71 = _SUSUILoggingFacility();
  v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v49 + 5);
    *(_DWORD *)type = v70;
    v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v49 + 9) + 88));
    v4 = v44;
    v5 = v49;
    v45 = (uint64_t)v4;
    *((_QWORD *)v49 + 3) = v4;
    v46 = *(_DWORD *)(*((_QWORD *)v5 + 9) + 88);
    LOBYTE(v5) = *(_QWORD *)(*((_QWORD *)v5 + 9) + 120) == 0;
    v68 = 0;
    if ((v5 & 1) != 0)
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v6 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 9) + 120), "humanReadableUpdateName");
      *((_QWORD *)v49 + 2) = v6;
      v68 = 1;
      v41 = v6;
    }
    v38 = v41;
    v39 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 120);
    v40 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 160);
    v7 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 128) == 0;
    v66 = 0;
    if (v7)
    {
      v37 = CFSTR("N/A");
    }
    else
    {
      v8 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 9) + 128), "humanReadableUpdateName");
      *(_QWORD *)v49 = v8;
      v66 = 1;
      v37 = v8;
    }
    v33 = v37;
    v34 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 128);
    v35 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 168);
    v36 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v49 + 9) + 8) == 0;
    v64 = 0;
    v62 = 0;
    v60 = 0;
    if (v9
      || (v65 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 9) + 8), "descriptor"),
          v64 = 1,
          !v65))
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 9) + 8), "descriptor");
      v31 = 1;
      v62 = 1;
      v61 = (id)objc_msgSend(v63, "humanReadableUpdateName");
      v60 = 1;
      v32 = (const __CFString *)v61;
    }
    v28 = v32;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 104));
    v30 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 104));
    v58 = 0;
    v56 = 0;
    if (v30)
    {
      v59 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 104));
      v26 = 1;
      v58 = 1;
      v10 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v10);
      v56 = 1;
      v27 = (const __CFString *)v57;
    }
    else
    {
      v27 = CFSTR("N/A");
    }
    v23 = v27;
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 112));
    v25 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 112));
    v54 = 0;
    v52 = 0;
    if (v25)
    {
      v55 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 9) + 112));
      v21 = 1;
      v54 = 1;
      v11 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v11);
      v52 = 1;
      v22 = (const __CFString *)v53;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v12 = *((_QWORD *)v49 + 6);
    v19 = &v13;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v74, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, v12);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nStarting to download: %@", buf, 0x9Eu);
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  objc_msgSend(*((id *)v49 + 9), "setDownload:", *((_QWORD *)v49 + 6));
  objc_msgSend(*((id *)v49 + 9), "updateStateFromDownload:", *((_QWORD *)v49 + 6));
  v17 = (id)objc_msgSend(*((id *)v49 + 9), "delegate");
  v50 = 0;
  v18 = 0;
  if (v17)
  {
    v51 = (id)objc_msgSend(*((id *)v49 + 9), "delegate");
    v50 = 1;
    v18 = objc_opt_respondsToSelector();
  }
  v16 = v18;
  if ((v50 & 1) != 0)

  if ((v16 & 1) != 0)
  {
    v15 = (id)objc_msgSend(*((id *)v49 + 9), "delegate");
    objc_msgSend(v15, "manager:downloadDidStart:", *((_QWORD *)v49 + 9), *((_QWORD *)v49 + 6));

  }
  v14 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 downloadProgressDidChange:(id)a4
{
  float v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  id v10;
  int v11;
  NSObject *log;
  os_log_type_t v13;
  id v14;
  unsigned int state;
  id v17;
  os_log_type_t type;
  os_log_t oslog;
  id v20;
  float v21;
  id v22;
  id v23;
  id location[2];
  SUSUISoftwareUpdateManager *v25;
  uint8_t v26[72];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  -[SUSUISoftwareUpdateManager setDownload:](v25, "setDownload:", v23);
  v22 = (id)objc_msgSend(v23, "progress");
  objc_msgSend(v22, "normalizedPercentComplete");
  v21 = v4;
  v20 = (id)objc_msgSend(v22, "phase");
  oslog = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v13 = type;
    *(double *)&v8 = v21;
    v9 = v20;
    v14 = SUSUISoftwareUpdateStateToString(-[SUSUISoftwareUpdateManager state](v25, "state"));
    v10 = v14;
    v17 = v10;
    v11 = -[SUSUISoftwareUpdateManager state](v25, "state");
    objc_msgSend(v22, "timeRemaining");
    __os_log_helper_16_2_7_8_32_8_0_8_64_8_64_4_0_8_0_8_0((uint64_t)v26, (uint64_t)"-[SUSUISoftwareUpdateManager manager:downloadProgressDidChange:]", v8, (uint64_t)v9, (uint64_t)v10, v11, v5, (uint64_t)v23);
    _os_log_impl(&dword_21BF33000, log, v13, "%s - progress: %.02f; phase: %@; state: %@ (%d); time remaining: %f, download: %p",
      v26,
      0x44u);

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  state = 0;
  state = v25->_state;
  -[SUSUISoftwareUpdateManager _updateDownloadProgressWithDownload:stateFromDownload:](v25, "_updateDownloadProgressWithDownload:stateFromDownload:", v23, &state);
  v6 = (id)objc_msgSend(v23, "progress");
  v7 = 0;
  if ((objc_msgSend(v6, "isDone") & 1) != 0)
  {
    v7 = 0;
    if (v25->_state == state)
      v7 = state == 10;
  }

  if (v7)
    -[SUSUISoftwareUpdateManager checkAndSetReadyToInstall](v25, "checkAndSetReadyToInstall");
  else
    -[SUSUISoftwareUpdateManager setState:](v25, "setState:", state);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  uint64_t v44;
  int v45;
  const char *v46;
  id obj;
  id v48;
  char *v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  char v67;
  id v68;
  unsigned __int8 v69;
  id v70;
  id v71;
  id v72;
  id location[3];
  _BYTE v74[168];
  uint64_t v75;

  v49 = &v67;
  obj = a4;
  v48 = a5;
  v46 = "-[SUSUISoftwareUpdateManager manager:downloadDidFinish:withInstallPolicy:]";
  v75 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = 0;
  objc_storeStrong(&v72, obj);
  v71 = 0;
  objc_storeStrong(&v71, v48);
  v70 = _SUSUILoggingFacility();
  v69 = 0;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v49 + 3);
    *(_DWORD *)type = v69;
    v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v49 + 8) + 88));
    v5 = v43;
    v6 = v49;
    v44 = (uint64_t)v5;
    *((_QWORD *)v49 + 1) = v5;
    v45 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v66 = 0;
    if ((v6 & 1) != 0)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v49 = v7;
      v66 = 1;
      v40 = v7;
    }
    v37 = v40;
    v38 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 120);
    v39 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 128) == 0;
    v64 = 0;
    if (v8)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v65 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 128), "humanReadableUpdateName");
      v64 = 1;
      v36 = (const __CFString *)v65;
    }
    v32 = v36;
    v33 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 128);
    v34 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 168);
    v35 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 8) == 0;
    v62 = 0;
    v60 = 0;
    v58 = 0;
    if (v9
      || (v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 8), "descriptor"),
          v62 = 1,
          !v63))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 8), "descriptor");
      v30 = 1;
      v60 = 1;
      v59 = (id)objc_msgSend(v61, "humanReadableUpdateName");
      v58 = 1;
      v31 = (const __CFString *)v59;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
    v29 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
    v56 = 0;
    v54 = 0;
    if (v29)
    {
      v57 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
      v25 = 1;
      v56 = 1;
      v10 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v10);
      v54 = 1;
      v26 = (const __CFString *)v55;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
    v52 = 0;
    v50 = 0;
    if (v24)
    {
      v53 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
      v20 = 1;
      v52 = 1;
      v11 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v11);
      v50 = 1;
      v21 = (const __CFString *)v51;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v12 = *((_QWORD *)v49 + 5);
    v18 = &v13;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v74, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v12);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nFinished to download: %@", buf, 0x9Eu);
    if ((v50 & 1) != 0)

    if ((v52 & 1) != 0)
    if ((v54 & 1) != 0)

    if ((v56 & 1) != 0)
    if ((v58 & 1) != 0)

    if ((v60 & 1) != 0)
    if ((v62 & 1) != 0)

    if ((v64 & 1) != 0)
    if ((v66 & 1) != 0)

    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v70, 0);
  objc_msgSend(*((id *)v49 + 8), "setDownload:", *((_QWORD *)v49 + 5));
  objc_msgSend(*((id *)v49 + 8), "setInstallPolicy:", *((_QWORD *)v49 + 4));
  objc_msgSend(*((id *)v49 + 8), "checkAndSetReadyToInstall");
  v16 = (id)objc_msgSend(*((id *)v49 + 8), "delegate");
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v15 = (id)objc_msgSend(*((id *)v49 + 8), "delegate");
    objc_msgSend(v15, "manager:downloadFinished:", *((_QWORD *)v49 + 8), *((_QWORD *)v49 + 5));

  }
  v14 = 0;
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, v14);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint8_t *buf;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id WeakRetained;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  SUDescriptor *alternateUpdate;
  NSError *alternateUpdateError;
  SUDownload *download;
  const __CFString *v30;
  const __CFString *v31;
  SUDescriptor *preferredUpdate;
  NSError *preferredUpdateError;
  const __CFString *v34;
  os_log_t log;
  os_log_type_t type[4];
  id v37;
  id v38;
  int state;
  const char *v40;
  id obj;
  unsigned int v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  __CFString *v60;
  id v61;
  unsigned __int8 v62;
  id v63;
  id v64;
  id location[2];
  SUSUISoftwareUpdateManager *v66;
  _BYTE v67[168];
  uint64_t v68;

  obj = a4;
  v40 = "-[SUSUISoftwareUpdateManager manager:downloadWasInvalidatedForNewUpdatesAvailable:]";
  v68 = *MEMORY[0x24BDAC8D0];
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = 0;
  objc_storeStrong(&v64, obj);
  v63 = _SUSUILoggingFacility();
  v62 = 0;
  if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v63;
    *(_DWORD *)type = v62;
    v37 = SUSUISoftwareUpdateStateToString(v66->_state);
    v38 = v37;
    v61 = v38;
    state = v66->_state;
    v4 = v66->_preferredUpdate == 0;
    v59 = 0;
    if (v4)
    {
      v34 = CFSTR("N/A");
    }
    else
    {
      v60 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v66->_preferredUpdate, "humanReadableUpdateName");
      v59 = 1;
      v34 = v60;
    }
    v31 = v34;
    preferredUpdate = v66->_preferredUpdate;
    preferredUpdateError = v66->_preferredUpdateError;
    v5 = v66->_alternateUpdate == 0;
    v57 = 0;
    if (v5)
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v58 = (id)-[SUDescriptor humanReadableUpdateName](v66->_alternateUpdate, "humanReadableUpdateName");
      v57 = 1;
      v30 = (const __CFString *)v58;
    }
    v26 = v30;
    alternateUpdate = v66->_alternateUpdate;
    alternateUpdateError = v66->_alternateUpdateError;
    download = v66->_download;
    v6 = v66->_download == 0;
    v55 = 0;
    v53 = 0;
    v51 = 0;
    if (v6
      || (v56 = -[SUDownload descriptor](v66->_download, "descriptor"), v55 = 1, !v56))
    {
      v25 = CFSTR("N/A");
    }
    else
    {
      v54 = -[SUDownload descriptor](v66->_download, "descriptor");
      v24 = 1;
      v53 = 1;
      v52 = (id)objc_msgSend(v54, "humanReadableUpdateName");
      v51 = 1;
      v25 = (const __CFString *)v52;
    }
    v21 = v25;
    WeakRetained = objc_loadWeakRetained((id *)&v66->_delegate);
    v23 = objc_loadWeakRetained((id *)&v66->_delegate);
    v49 = 0;
    v47 = 0;
    if (v23)
    {
      v50 = objc_loadWeakRetained((id *)&v66->_delegate);
      v19 = 1;
      v49 = 1;
      v7 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v7);
      v47 = 1;
      v20 = (const __CFString *)v48;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v16 = v20;
    v17 = objc_loadWeakRetained((id *)&v66->_hostController);
    v18 = objc_loadWeakRetained((id *)&v66->_hostController);
    v45 = 0;
    v43 = 0;
    if (v18)
    {
      v46 = objc_loadWeakRetained((id *)&v66->_hostController);
      v14 = 1;
      v45 = 1;
      v8 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v8);
      v43 = 1;
      v15 = (const __CFString *)v44;
    }
    else
    {
      v15 = CFSTR("N/A");
    }
    v12 = &v9;
    buf = v67;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0((uint64_t)v67, (uint64_t)v40, (uint64_t)v38, state, (uint64_t)v31, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v26, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v21, (uint64_t)WeakRetained, (uint64_t)v16, (uint64_t)v17, (uint64_t)v15, (uint64_t)v64);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nNew scan results: %p", buf, 0x9Eu);
    if ((v43 & 1) != 0)

    if ((v45 & 1) != 0)
    if ((v47 & 1) != 0)

    if ((v49 & 1) != 0)
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    objc_storeStrong(&v61, 0);
  }
  v11 = 0;
  objc_storeStrong(&v63, 0);
  -[SUSUISoftwareUpdateManager setDownload:](v66, "setDownload:", v11);
  v42 = 8;
  if (v66->_hidingPreferredUpdate)
  {
    v42 = 9;
    -[SUSUISoftwareUpdateManager revealHiddenPreferredUpdate](v66, "revealHiddenPreferredUpdate");
  }
  if (v66->_hidingAlternateUpdate)
  {
    v42 = 9;
    -[SUSUISoftwareUpdateManager revealHiddenAlteranteUpdate](v66, "revealHiddenAlteranteUpdate");
  }
  -[SUSUISoftwareUpdateManager setState:](v66, "setState:", v42);
  v10 = 0;
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, v10);
}

- (void)manager:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  BOOL v10;
  id v11;
  id v12;
  objc_class *v13;
  objc_class *v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  int v23;
  uint64_t v24;
  os_log_t v25;
  os_log_type_t v26[4];
  uint8_t *v27;
  int v28;
  int v29;
  id v30;
  id v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint8_t *buf;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  id v39;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id WeakRetained;
  id v45;
  int v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  uint64_t v60;
  int v61;
  const char *v62;
  id obj;
  id v64;
  char *v65;
  os_log_type_t v66;
  os_log_t oslog;
  unsigned int v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  id v89;
  os_log_type_t type;
  id v91;
  id v92;
  id v93;
  id location[3];
  _BYTE v95[16];
  _BYTE v96[168];
  uint64_t v97;

  v65 = &v85;
  obj = a4;
  v64 = a5;
  v62 = "-[SUSUISoftwareUpdateManager manager:downloadDidFail:withError:]";
  v97 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v93 = 0;
  objc_storeStrong(&v93, obj);
  v92 = 0;
  objc_storeStrong(&v92, v64);
  v91 = _SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v65 + 9);
    *(_DWORD *)v58 = type;
    v59 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v65 + 14) + 88));
    v5 = v59;
    v6 = v65;
    v60 = (uint64_t)v5;
    *((_QWORD *)v65 + 7) = v5;
    v61 = *(_DWORD *)(*((_QWORD *)v6 + 14) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 14) + 120) == 0;
    v88 = 0;
    if ((v6 & 1) != 0)
    {
      v56 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v65 + 14) + 120), "humanReadableUpdateName");
      *((_QWORD *)v65 + 6) = v7;
      v88 = 1;
      v56 = v7;
    }
    v53 = v56;
    v54 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 120);
    v55 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 128) == 0;
    v87 = 0;
    if (v8)
    {
      v52 = CFSTR("N/A");
    }
    else
    {
      v9 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v65 + 14) + 128), "humanReadableUpdateName");
      *((_QWORD *)v65 + 4) = v9;
      v87 = 1;
      v52 = v9;
    }
    v48 = v52;
    v49 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 128);
    v50 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 168);
    v51 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 8);
    v10 = *(_QWORD *)(*((_QWORD *)v65 + 14) + 8) == 0;
    v86 = 0;
    v84 = 0;
    v82 = 0;
    if (v10
      || (v11 = (id)objc_msgSend(*(id *)(*((_QWORD *)v65 + 14) + 8), "descriptor"),
          *((_QWORD *)v65 + 2) = v11,
          v86 = 1,
          !v11))
    {
      v47 = CFSTR("N/A");
    }
    else
    {
      v12 = (id)objc_msgSend(*(id *)(*((_QWORD *)v65 + 14) + 8), "descriptor");
      *(_QWORD *)v65 = v12;
      v46 = 1;
      v84 = 1;
      v83 = (id)objc_msgSend(v12, "humanReadableUpdateName");
      v82 = 1;
      v47 = (const __CFString *)v83;
    }
    v43 = v47;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 104));
    v45 = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 104));
    v80 = 0;
    v78 = 0;
    if (v45)
    {
      v81 = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 104));
      v41 = 1;
      v80 = 1;
      v13 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v13);
      v78 = 1;
      v42 = (const __CFString *)v79;
    }
    else
    {
      v42 = CFSTR("N/A");
    }
    v38 = v42;
    v39 = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 112));
    v40 = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 112));
    v76 = 0;
    v74 = 0;
    if (v40)
    {
      v77 = objc_loadWeakRetained((id *)(*((_QWORD *)v65 + 14) + 112));
      v36 = 1;
      v76 = 1;
      v14 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v14);
      v74 = 1;
      v37 = (const __CFString *)v75;
    }
    else
    {
      v37 = CFSTR("N/A");
    }
    v15 = *((_QWORD *)v65 + 10);
    v34 = &v19;
    buf = v96;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v96, (uint64_t)v62, v60, v61, (uint64_t)v53, v54, v55, (uint64_t)v48, v49, v50, v51, (uint64_t)v43, (uint64_t)WeakRetained, (uint64_t)v38, (uint64_t)v39, (uint64_t)v37, v15);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nDownload failed with error: %@", buf, 0x9Eu);
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v88 & 1) != 0)

    objc_storeStrong(&v89, 0);
  }
  v33 = 0;
  objc_storeStrong(&v91, 0);
  v73 = 0;
  objc_msgSend(*((id *)v65 + 14), "setDownload:", v33);
  objc_msgSend(*(id *)(*((_QWORD *)v65 + 14) + 96), "destroyInstallationKeybag");
  if ((*(_BYTE *)(*((_QWORD *)v65 + 14) + 54) & 1) != 0)
  {
    v73 = 1;
    objc_msgSend(*((id *)v65 + 14), "revealHiddenPreferredUpdate");
  }
  if ((*(_BYTE *)(*((_QWORD *)v65 + 14) + 55) & 1) != 0)
  {
    v73 = 1;
    objc_msgSend(*((id *)v65 + 14), "revealHiddenAlteranteUpdate");
  }
  v30 = (id)objc_msgSend(*((id *)v65 + 10), "domain");
  v31 = getSUErrorDomain_3();
  v16 = objc_msgSend(v30, "isEqualToString:");
  v71 = 0;
  v69 = 0;
  v32 = 0;
  if ((v16 & 1) != 0)
  {
    v17 = objc_msgSend(*((id *)v65 + 10), "code") != 16;
    v32 = 0;
    if (!v17)
    {
      v72 = (id)objc_msgSend(*((id *)v65 + 10), "userInfo");
      v29 = 1;
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "objectForKey:", *MEMORY[0x24BEAEEF0]);
      v69 = v29 & 1;
      v32 = objc_msgSend(v70, "BOOLValue");
    }
  }
  v28 = v32;
  if ((v69 & 1) != 0)

  if ((v71 & 1) != 0)
  if ((v28 & 1) != 0)
  {
    v68 = 0;
    if ((objc_msgSend(*((id *)v65 + 14), "shouldShowPreferredUpdateAsAlternate") & 1) != 0)
    {
      v68 = 6;
    }
    else
    {
      if ((v73 & 1) != 0)
        v18 = 9;
      else
        v18 = 8;
      v68 = v18;
    }
    objc_msgSend(*((id *)v65 + 14), "setState:", v68);
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    v66 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v25 = oslog;
      *(_DWORD *)v26 = v66;
      v27 = v95;
      __os_log_helper_16_2_1_8_32((uint64_t)v95, (uint64_t)v62);
      _os_log_impl(&dword_21BF33000, v25, v26[0], "%s: Rescanning for update", v27, 0xCu);
    }
    v24 = 0;
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*((id *)v65 + 14), "scanForUpdatesCompletion:", v24);
  }
  v22 = (id)objc_msgSend(*((id *)v65 + 14), "delegate");
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v21 = (id)objc_msgSend(*((id *)v65 + 14), "delegate");
    objc_msgSend(v21, "manager:download:failedWithError:", *((_QWORD *)v65 + 14), *((_QWORD *)v65 + 11), *((_QWORD *)v65 + 10));

  }
  v20 = 0;
  objc_storeStrong(&v92, 0);
  objc_storeStrong(&v93, v20);
  objc_storeStrong(location, v20);
}

- (void)manager:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  const __CFString *v12;
  char v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t *v19;
  uint8_t *buf;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  id WeakRetained;
  id v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  os_log_t log;
  os_log_type_t type[4];
  id v44;
  uint64_t v45;
  int v46;
  const char *v47;
  id obj;
  _BOOL4 v49;
  char *v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  char v68;
  id v69;
  unsigned __int8 v70;
  id v71;
  BOOL v72;
  id v73;
  id location[3];
  _BYTE v75[168];
  uint64_t v76;

  v50 = &v68;
  obj = a4;
  v49 = a5;
  v47 = "-[SUSUISoftwareUpdateManager manager:clearingSpaceForDownload:clearingSpace:]";
  v76 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = 0;
  objc_storeStrong(&v73, obj);
  v72 = v49;
  v71 = _SUSUILoggingFacility();
  v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v50 + 3);
    *(_DWORD *)type = v70;
    v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v50 + 8) + 88));
    v5 = v44;
    v6 = v50;
    v45 = (uint64_t)v5;
    *((_QWORD *)v50 + 1) = v5;
    v46 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v67 = 0;
    if ((v6 & 1) != 0)
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v50 = v7;
      v67 = 1;
      v41 = v7;
    }
    v38 = v41;
    v39 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 120);
    v40 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128) == 0;
    v65 = 0;
    if (v8)
    {
      v37 = CFSTR("N/A");
    }
    else
    {
      v66 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 128), "humanReadableUpdateName");
      v65 = 1;
      v37 = (const __CFString *)v66;
    }
    v33 = v37;
    v34 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128);
    v35 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 168);
    v36 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8) == 0;
    v63 = 0;
    v61 = 0;
    v59 = 0;
    if (v9
      || (v64 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor"),
          v63 = 1,
          !v64))
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor");
      v31 = 1;
      v61 = 1;
      v60 = (id)objc_msgSend(v62, "humanReadableUpdateName");
      v59 = 1;
      v32 = (const __CFString *)v60;
    }
    v28 = v32;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v30 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v57 = 0;
    v55 = 0;
    if (v30)
    {
      v58 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
      v26 = 1;
      v57 = 1;
      v10 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v10);
      v55 = 1;
      v27 = (const __CFString *)v56;
    }
    else
    {
      v27 = CFSTR("N/A");
    }
    v23 = v27;
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v25 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v53 = 0;
    v51 = 0;
    if (v25)
    {
      v54 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
      v21 = 1;
      v53 = 1;
      v11 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v11);
      v51 = 1;
      v22 = (const __CFString *)v52;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v12 = CFSTR("YES");
    if (!v72)
      v12 = CFSTR("NO");
    v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, (uint64_t)v12);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nclearing: %@", buf, 0x9Eu);
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    if ((v61 & 1) != 0)
    if ((v63 & 1) != 0)

    if ((v65 & 1) != 0)
    if ((v67 & 1) != 0)

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  v13 = objc_msgSend(*((id *)v50 + 8), "clearingSpaceForDownload");
  if ((v13 & 1) != v72)
  {
    objc_msgSend(*((id *)v50 + 8), "setClearingSpaceForDownload:", v72);
    v17 = (id)objc_msgSend(*((id *)v50 + 8), "delegate");
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v16 = (id)objc_msgSend(*((id *)v50 + 8), "delegate");
      objc_msgSend(v16, "manager:clearingSpaceForDownload:", *((_QWORD *)v50 + 8), v72);

    }
  }
  v15 = 0;
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 installDidStart:(id)a4
{
  id v4;
  char *v5;
  const __CFString *v6;
  BOOL v7;
  BOOL v8;
  objc_class *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t *v17;
  uint8_t *buf;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  os_log_t log;
  os_log_type_t type[4];
  id v42;
  uint64_t v43;
  int v44;
  const char *v45;
  id obj;
  char *v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  char v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  id v69;
  id location[3];
  _BYTE v71[168];
  uint64_t v72;

  v47 = &v65;
  obj = a4;
  v45 = "-[SUSUISoftwareUpdateManager manager:installDidStart:]";
  v72 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, obj);
  v68 = _SUSUILoggingFacility();
  v67 = 0;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v47 + 3);
    *(_DWORD *)type = v67;
    v42 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v47 + 7) + 88));
    v4 = v42;
    v5 = v47;
    v43 = (uint64_t)v4;
    *((_QWORD *)v47 + 1) = v4;
    v44 = *(_DWORD *)(*((_QWORD *)v5 + 7) + 88);
    LOBYTE(v5) = *(_QWORD *)(*((_QWORD *)v5 + 7) + 120) == 0;
    v64 = 0;
    if ((v5 & 1) != 0)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v6 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 120), "humanReadableUpdateName");
      *(_QWORD *)v47 = v6;
      v64 = 1;
      v39 = v6;
    }
    v36 = v39;
    v37 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 120);
    v38 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 160);
    v7 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 128) == 0;
    v62 = 0;
    if (v7)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 128), "humanReadableUpdateName");
      v62 = 1;
      v35 = (const __CFString *)v63;
    }
    v31 = v35;
    v32 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 128);
    v33 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 168);
    v34 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 8);
    v8 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 8) == 0;
    v60 = 0;
    v58 = 0;
    v56 = 0;
    if (v8
      || (v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 8), "descriptor"),
          v60 = 1,
          !v61))
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v59 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 8), "descriptor");
      v29 = 1;
      v58 = 1;
      v57 = (id)objc_msgSend(v59, "humanReadableUpdateName");
      v56 = 1;
      v30 = (const __CFString *)v57;
    }
    v26 = v30;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
    v28 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
    v54 = 0;
    v52 = 0;
    if (v28)
    {
      v55 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
      v24 = 1;
      v54 = 1;
      v9 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v9);
      v52 = 1;
      v25 = (const __CFString *)v53;
    }
    else
    {
      v25 = CFSTR("N/A");
    }
    v21 = v25;
    v22 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
    v23 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
    v50 = 0;
    v48 = 0;
    if (v23)
    {
      v51 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
      v19 = 1;
      v50 = 1;
      v10 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v10);
      v48 = 1;
      v20 = (const __CFString *)v49;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v11 = *((_QWORD *)v47 + 4);
    v17 = &v12;
    buf = v71;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v71, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v11);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@", buf, 0x9Eu);
    if ((v48 & 1) != 0)

    if ((v50 & 1) != 0)
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v68, 0);
  objc_msgSend(*((id *)v47 + 7), "setState:", 15);
  v15 = (id)objc_msgSend(*((id *)v47 + 7), "delegate");
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v14 = (id)objc_msgSend(*((id *)v47 + 7), "delegate");
    objc_msgSend(v14, "manager:installStartedForUpdate:", *((_QWORD *)v47 + 7), *((_QWORD *)v47 + 4));

  }
  v13 = 0;
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, v13);
}

- (void)manager:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t *v19;
  uint8_t *buf;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  id WeakRetained;
  id v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  os_log_t log;
  os_log_type_t type[4];
  id v44;
  uint64_t v45;
  int v46;
  const char *v47;
  id obj;
  id v49;
  char *v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  char v68;
  id v69;
  unsigned __int8 v70;
  id v71;
  id v72;
  id v73;
  id location[3];
  _BYTE v75[168];
  uint64_t v76;

  v50 = &v68;
  obj = a4;
  v49 = a5;
  v47 = "-[SUSUISoftwareUpdateManager manager:installDidFail:withError:]";
  v76 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = 0;
  objc_storeStrong(&v73, obj);
  v72 = 0;
  objc_storeStrong(&v72, v49);
  v71 = _SUSUILoggingFacility();
  v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v50 + 3);
    *(_DWORD *)type = v70;
    v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v50 + 8) + 88));
    v5 = v44;
    v6 = v50;
    v45 = (uint64_t)v5;
    *((_QWORD *)v50 + 1) = v5;
    v46 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v67 = 0;
    if ((v6 & 1) != 0)
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v50 = v7;
      v67 = 1;
      v41 = v7;
    }
    v38 = v41;
    v39 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 120);
    v40 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128) == 0;
    v65 = 0;
    if (v8)
    {
      v37 = CFSTR("N/A");
    }
    else
    {
      v66 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 128), "humanReadableUpdateName");
      v65 = 1;
      v37 = (const __CFString *)v66;
    }
    v33 = v37;
    v34 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128);
    v35 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 168);
    v36 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8) == 0;
    v63 = 0;
    v61 = 0;
    v59 = 0;
    if (v9
      || (v64 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor"),
          v63 = 1,
          !v64))
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor");
      v31 = 1;
      v61 = 1;
      v60 = (id)objc_msgSend(v62, "humanReadableUpdateName");
      v59 = 1;
      v32 = (const __CFString *)v60;
    }
    v28 = v32;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v30 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v57 = 0;
    v55 = 0;
    if (v30)
    {
      v58 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
      v26 = 1;
      v57 = 1;
      v10 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v10);
      v55 = 1;
      v27 = (const __CFString *)v56;
    }
    else
    {
      v27 = CFSTR("N/A");
    }
    v23 = v27;
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v25 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v53 = 0;
    v51 = 0;
    if (v25)
    {
      v54 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
      v21 = 1;
      v53 = 1;
      v11 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v11);
      v51 = 1;
      v22 = (const __CFString *)v52;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v12 = *((_QWORD *)v50 + 5);
    v13 = *((_QWORD *)v50 + 4);
    v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, v12, v13);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@, error: %@", buf, 0xA8u);
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    if ((v61 & 1) != 0)
    if ((v63 & 1) != 0)

    if ((v65 & 1) != 0)
    if ((v67 & 1) != 0)

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  v17 = (id)objc_msgSend(*((id *)v50 + 8), "delegate");
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v16 = (id)objc_msgSend(*((id *)v50 + 8), "delegate");
    objc_msgSend(v16, "manager:installFailedWithError:", *((_QWORD *)v50 + 8), *((_QWORD *)v50 + 4));

  }
  objc_msgSend(*((id *)v50 + 8), "refreshState");
  v15 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, v15);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 installDidFinish:(id)a4
{
  id v4;
  char *v5;
  const __CFString *v6;
  BOOL v7;
  BOOL v8;
  objc_class *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t *v17;
  uint8_t *buf;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  id v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  id v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  os_log_t log;
  os_log_type_t type[4];
  id v42;
  uint64_t v43;
  int v44;
  const char *v45;
  id obj;
  char *v47;
  char v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  char v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  id v69;
  id location[3];
  _BYTE v71[168];
  uint64_t v72;

  v47 = &v65;
  obj = a4;
  v45 = "-[SUSUISoftwareUpdateManager manager:installDidFinish:]";
  v72 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, obj);
  v68 = _SUSUILoggingFacility();
  v67 = 0;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v47 + 3);
    *(_DWORD *)type = v67;
    v42 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v47 + 7) + 88));
    v4 = v42;
    v5 = v47;
    v43 = (uint64_t)v4;
    *((_QWORD *)v47 + 1) = v4;
    v44 = *(_DWORD *)(*((_QWORD *)v5 + 7) + 88);
    LOBYTE(v5) = *(_QWORD *)(*((_QWORD *)v5 + 7) + 120) == 0;
    v64 = 0;
    if ((v5 & 1) != 0)
    {
      v39 = CFSTR("N/A");
    }
    else
    {
      v6 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 120), "humanReadableUpdateName");
      *(_QWORD *)v47 = v6;
      v64 = 1;
      v39 = v6;
    }
    v36 = v39;
    v37 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 120);
    v38 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 160);
    v7 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 128) == 0;
    v62 = 0;
    if (v7)
    {
      v35 = CFSTR("N/A");
    }
    else
    {
      v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 128), "humanReadableUpdateName");
      v62 = 1;
      v35 = (const __CFString *)v63;
    }
    v31 = v35;
    v32 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 128);
    v33 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 168);
    v34 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 8);
    v8 = *(_QWORD *)(*((_QWORD *)v47 + 7) + 8) == 0;
    v60 = 0;
    v58 = 0;
    v56 = 0;
    if (v8
      || (v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 8), "descriptor"),
          v60 = 1,
          !v61))
    {
      v30 = CFSTR("N/A");
    }
    else
    {
      v59 = (id)objc_msgSend(*(id *)(*((_QWORD *)v47 + 7) + 8), "descriptor");
      v29 = 1;
      v58 = 1;
      v57 = (id)objc_msgSend(v59, "humanReadableUpdateName");
      v56 = 1;
      v30 = (const __CFString *)v57;
    }
    v26 = v30;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
    v28 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
    v54 = 0;
    v52 = 0;
    if (v28)
    {
      v55 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 104));
      v24 = 1;
      v54 = 1;
      v9 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v9);
      v52 = 1;
      v25 = (const __CFString *)v53;
    }
    else
    {
      v25 = CFSTR("N/A");
    }
    v21 = v25;
    v22 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
    v23 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
    v50 = 0;
    v48 = 0;
    if (v23)
    {
      v51 = objc_loadWeakRetained((id *)(*((_QWORD *)v47 + 7) + 112));
      v19 = 1;
      v50 = 1;
      v10 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v10);
      v48 = 1;
      v20 = (const __CFString *)v49;
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v11 = *((_QWORD *)v47 + 4);
    v17 = &v12;
    buf = v71;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v71, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v11);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@", buf, 0x9Eu);
    if ((v48 & 1) != 0)

    if ((v50 & 1) != 0)
    if ((v52 & 1) != 0)

    if ((v54 & 1) != 0)
    if ((v56 & 1) != 0)

    if ((v58 & 1) != 0)
    if ((v60 & 1) != 0)

    if ((v62 & 1) != 0)
    if ((v64 & 1) != 0)

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v68, 0);
  objc_msgSend(*((id *)v47 + 7), "setState:", 16);
  v15 = (id)objc_msgSend(*((id *)v47 + 7), "delegate");
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v14 = (id)objc_msgSend(*((id *)v47 + 7), "delegate");
    objc_msgSend(v14, "manager:installFinished:", *((_QWORD *)v47 + 7), *((_QWORD *)v47 + 4));

  }
  v13 = 0;
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, v13);
}

- (void)manager:(id)a3 autoUpdateScheduleStateChanged:(BOOL)a4 autoInstallOperation:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t *v18;
  uint8_t *buf;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  id v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  id WeakRetained;
  id v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  os_log_t log;
  os_log_type_t type[4];
  id v43;
  uint64_t v44;
  int v45;
  const char *v46;
  _BOOL4 v47;
  id obj;
  char *v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  char v67;
  id v68;
  unsigned __int8 v69;
  id v70;
  id v71;
  BOOL v72;
  id location[3];
  _BYTE v74[168];
  uint64_t v75;

  v49 = &v67;
  v47 = a4;
  obj = a5;
  v46 = "-[SUSUISoftwareUpdateManager manager:autoUpdateScheduleStateChanged:autoInstallOperation:]";
  v75 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = v47;
  v71 = 0;
  objc_storeStrong(&v71, obj);
  v70 = _SUSUILoggingFacility();
  v69 = 0;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v49 + 3);
    *(_DWORD *)type = v69;
    v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v49 + 8) + 88));
    v5 = v43;
    v6 = v49;
    v44 = (uint64_t)v5;
    *((_QWORD *)v49 + 1) = v5;
    v45 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v66 = 0;
    if ((v6 & 1) != 0)
    {
      v40 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v49 = v7;
      v66 = 1;
      v40 = v7;
    }
    v37 = v40;
    v38 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 120);
    v39 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 128) == 0;
    v64 = 0;
    if (v8)
    {
      v36 = CFSTR("N/A");
    }
    else
    {
      v65 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 128), "humanReadableUpdateName");
      v64 = 1;
      v36 = (const __CFString *)v65;
    }
    v32 = v36;
    v33 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 128);
    v34 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 168);
    v35 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v49 + 8) + 8) == 0;
    v62 = 0;
    v60 = 0;
    v58 = 0;
    if (v9
      || (v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 8), "descriptor"),
          v62 = 1,
          !v63))
    {
      v31 = CFSTR("N/A");
    }
    else
    {
      v61 = (id)objc_msgSend(*(id *)(*((_QWORD *)v49 + 8) + 8), "descriptor");
      v30 = 1;
      v60 = 1;
      v59 = (id)objc_msgSend(v61, "humanReadableUpdateName");
      v58 = 1;
      v31 = (const __CFString *)v59;
    }
    v27 = v31;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
    v29 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
    v56 = 0;
    v54 = 0;
    if (v29)
    {
      v57 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
      v25 = 1;
      v56 = 1;
      v10 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v10);
      v54 = 1;
      v26 = (const __CFString *)v55;
    }
    else
    {
      v26 = CFSTR("N/A");
    }
    v22 = v26;
    v23 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
    v52 = 0;
    v50 = 0;
    if (v24)
    {
      v53 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 112));
      v20 = 1;
      v52 = 1;
      v11 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v11);
      v50 = 1;
      v21 = (const __CFString *)v51;
    }
    else
    {
      v21 = CFSTR("N/A");
    }
    v12 = *((_QWORD *)v49 + 4);
    v18 = &v13;
    buf = v74;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v74, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v72, v12);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAuto-update scheduled: %d, operation: %@", buf, 0xA4u);
    if ((v50 & 1) != 0)

    if ((v52 & 1) != 0)
    if ((v54 & 1) != 0)

    if ((v56 & 1) != 0)
    if ((v58 & 1) != 0)

    if ((v60 & 1) != 0)
    if ((v62 & 1) != 0)

    if ((v64 & 1) != 0)
    if ((v66 & 1) != 0)

    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v70, 0);
  v16 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)(*((_QWORD *)v49 + 8) + 104));
    objc_msgSend(v15, "manager:autoUpdateScheduledStatusChanged:", *((_QWORD *)v49 + 8), v72);

  }
  v14 = 0;
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 rollingBackStateChanged:(BOOL)a4 rollback:(id)a5
{
  id v5;
  char *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  objc_class *v10;
  objc_class *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t *v19;
  uint8_t *buf;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  id WeakRetained;
  id v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  os_log_t log;
  os_log_type_t type[4];
  id v44;
  uint64_t v45;
  int v46;
  const char *v47;
  _BOOL4 v48;
  id obj;
  char *v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  char v68;
  id v69;
  unsigned __int8 v70;
  id v71;
  id v72;
  BOOL v73;
  id location[3];
  _BYTE v75[168];
  uint64_t v76;

  v50 = &v68;
  v48 = a4;
  obj = a5;
  v47 = "-[SUSUISoftwareUpdateManager manager:rollingBackStateChanged:rollback:]";
  v76 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = v48;
  v72 = 0;
  objc_storeStrong(&v72, obj);
  v71 = _SUSUILoggingFacility();
  v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v50 + 3);
    *(_DWORD *)type = v70;
    v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((_QWORD *)v50 + 8) + 88));
    v5 = v44;
    v6 = v50;
    v45 = (uint64_t)v5;
    *((_QWORD *)v50 + 1) = v5;
    v46 = *(_DWORD *)(*((_QWORD *)v6 + 8) + 88);
    LOBYTE(v6) = *(_QWORD *)(*((_QWORD *)v6 + 8) + 120) == 0;
    v67 = 0;
    if ((v6 & 1) != 0)
    {
      v41 = CFSTR("N/A");
    }
    else
    {
      v7 = (const __CFString *)(id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 120), "humanReadableUpdateName");
      *(_QWORD *)v50 = v7;
      v67 = 1;
      v41 = v7;
    }
    v38 = v41;
    v39 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 120);
    v40 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 160);
    v8 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128) == 0;
    v65 = 0;
    if (v8)
    {
      v37 = CFSTR("N/A");
    }
    else
    {
      v66 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 128), "humanReadableUpdateName");
      v65 = 1;
      v37 = (const __CFString *)v66;
    }
    v33 = v37;
    v34 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 128);
    v35 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 168);
    v36 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8);
    v9 = *(_QWORD *)(*((_QWORD *)v50 + 8) + 8) == 0;
    v63 = 0;
    v61 = 0;
    v59 = 0;
    if (v9
      || (v64 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor"),
          v63 = 1,
          !v64))
    {
      v32 = CFSTR("N/A");
    }
    else
    {
      v62 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 8) + 8), "descriptor");
      v31 = 1;
      v61 = 1;
      v60 = (id)objc_msgSend(v62, "humanReadableUpdateName");
      v59 = 1;
      v32 = (const __CFString *)v60;
    }
    v28 = v32;
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v30 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    v57 = 0;
    v55 = 0;
    if (v30)
    {
      v58 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
      v26 = 1;
      v57 = 1;
      v10 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v10);
      v55 = 1;
      v27 = (const __CFString *)v56;
    }
    else
    {
      v27 = CFSTR("N/A");
    }
    v23 = v27;
    v24 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v25 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
    v53 = 0;
    v51 = 0;
    if (v25)
    {
      v54 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 112));
      v21 = 1;
      v53 = 1;
      v11 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v11);
      v51 = 1;
      v22 = (const __CFString *)v52;
    }
    else
    {
      v22 = CFSTR("N/A");
    }
    v12 = CFSTR("NO");
    if (v73)
      v12 = CFSTR("YES");
    v13 = *((_QWORD *)v50 + 4);
    v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, (uint64_t)v12, v13);
    _os_log_impl(&dword_21BF33000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisRollingBack: %@; rollback: %@",
      buf,
      0xA8u);
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    if ((v59 & 1) != 0)

    if ((v61 & 1) != 0)
    if ((v63 & 1) != 0)

    if ((v65 & 1) != 0)
    if ((v67 & 1) != 0)

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  v17 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)(*((_QWORD *)v50 + 8) + 104));
    objc_msgSend(v16, "manager:rollingBackStateChanged:rollback:", *((_QWORD *)v50 + 8), v73, *((_QWORD *)v50 + 4));

  }
  v15 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 inUserInteraction:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:inUserInteraction:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 handleDDMDeclaration:(id)a4
{
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  id location[2];
  SUSUISoftwareUpdateManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  -[SUSUISoftwareUpdateManager setDdmDeclaration:](v10, "setDdmDeclaration:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v4, "manager:handleDDMDeclaration:", v10, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (SUManagerClient)SUManager
{
  return (SUManagerClient *)objc_getProperty(self, a2, 96, 1);
}

- (int)state
{
  return self->_state;
}

- (SUSUISoftwareUpdateManagerDelegate)delegate
{
  return (SUSUISoftwareUpdateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)hostController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (SUDescriptor)preferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPreferredUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (SUDescriptor)alternateUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAlternateUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (SUMutableDownloadMetadata)downloadMetadata
{
  return (SUMutableDownloadMetadata *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDownloadMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (RUIStyle)serverFlowStyle
{
  return (RUIStyle *)objc_getProperty(self, a2, 144, 1);
}

- (void)setServerFlowStyle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSError)scanError
{
  return (NSError *)objc_getProperty(self, a2, 152, 1);
}

- (NSError)preferredUpdateError
{
  return (NSError *)objc_getProperty(self, a2, 160, 1);
}

- (NSError)alternateUpdateError
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setProgressString:(id)a3
{
  objc_storeStrong((id *)&self->_progressString, a3);
}

- (void)setActionString:(id)a3
{
  objc_storeStrong((id *)&self->_actionString, a3);
}

- (BOOL)isDelayingUpdates
{
  return self->_isDelayingUpdates;
}

- (void)setIsDelayingUpdates:(BOOL)a3
{
  self->_isDelayingUpdates = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (BOOL)allowCellularOverride
{
  return self->_allowCellularOverride;
}

- (void)setAllowCellularOverride:(BOOL)a3
{
  self->_allowCellularOverride = a3;
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return (SUCoreDDMDeclaration *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDdmDeclaration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void)setUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (SUInstallPolicy)installPolicy
{
  return (SUInstallPolicy *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInstallPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (SUDescriptor)hiddenPreferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 216, 1);
}

- (void)setHiddenPreferredUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (SUDescriptor)hiddenAlternateUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 224, 1);
}

- (void)setHiddenAlternateUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)preferredUpdateErrorDescription
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPreferredUpdateErrorDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)alternateUpdateErrorDescription
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAlternateUpdateErrorDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)hidingPreferredUpdate
{
  return self->_hidingPreferredUpdate;
}

- (BOOL)hidingAlternateUpdate
{
  return self->_hidingAlternateUpdate;
}

- (BOOL)didCompleteBetaProgramScan
{
  return self->_didCompleteBetaProgramScan;
}

- (void)setDidCompleteBetaProgramScan:(BOOL)a3
{
  self->_didCompleteBetaProgramScan = a3;
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeedingDevice, a3);
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_betaPrograms, a3);
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_alternateUpdateErrorDescription, 0);
  objc_storeStrong((id *)&self->_preferredUpdateErrorDescription, 0);
  objc_storeStrong((id *)&self->_hiddenAlternateUpdate, 0);
  objc_storeStrong((id *)&self->_hiddenPreferredUpdate, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_progressString, 0);
  objc_storeStrong((id *)&self->_alternateUpdateError, 0);
  objc_storeStrong((id *)&self->_preferredUpdateError, 0);
  objc_storeStrong((id *)&self->_scanError, 0);
  objc_storeStrong((id *)&self->_serverFlowStyle, 0);
  objc_storeStrong((id *)&self->_downloadMetadata, 0);
  objc_storeStrong((id *)&self->_alternateUpdate, 0);
  objc_storeStrong((id *)&self->_preferredUpdate, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_SUManager, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_updateAgreementManager, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_download, 0);
}

@end

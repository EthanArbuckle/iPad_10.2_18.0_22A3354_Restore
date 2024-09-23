@implementation SUCoreDocumentation

- (SUCoreDocumentation)initWithDocumentationAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  SUCoreDocumentation *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char v21;
  id v22;
  void *v23;
  NSObject *v24;
  SUCoreDocumentation *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("unable to create SU documentation: nil update asset");
    goto LABEL_21;
  }
  objc_msgSend(v4, "attributes");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "attributes"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        !v9))
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("unable to create SU documentation: documentation asset without attributes");
LABEL_21:
    objc_msgSend(v26, "trackError:forReason:withResult:withError:", CFSTR("[DOCUMENTATION]"), v28, 8100, 0);

    v25 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "getLocalUrl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Attempting to create a documentation instance with no localBundleURL (non-fatal)", buf, 2u);
    }

  }
  objc_msgSend(v5, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SUCoreDocumentation initWithLocalBundleURL:attributes:](self, "initWithLocalBundleURL:attributes:", v10, v13);

  objc_msgSend(v5, "assetServerUrl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation setServerAssetURL:](v14, "setServerAssetURL:", v15);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isBootedOSSecureInternal");

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "fileExistsAtPath:", &stru_1EA87A8E8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Plist not found... creating a default plist", buf, 2u);
      }

      v30 = 0;
      v21 = objc_msgSend(CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?>     <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">     <plist version=\"1.0\">     <dict>         <key>MobileAssetNewPath</key>         <string></string>     </dict>     </plist>"), "writeToFile:atomically:encoding:error:", &stru_1EA87A8E8, 1, 4, &v30);
      v22 = v30;
      if ((v21 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "oslog");
        v24 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v22;
          _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Error creating plist: %@", buf, 0xCu);
        }

      }
    }

  }
  self = v14;

  v25 = self;
LABEL_22:

  return v25;
}

- (SUCoreDocumentation)initWithLocalBundleURL:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  SUCoreDocumentation *v9;
  uint64_t v10;
  NSString *productVersion;
  uint64_t v12;
  NSNumber *slaVersion;
  NSURL *serverAssetURL;
  uint64_t v15;
  NSData *serverAssetMeasurement;
  uint64_t v17;
  NSString *serverAssetAlgorithm;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *recommendedUpdateMinOSVersion;
  uint64_t v24;
  NSString *recommendedUpdateMaxOSVersion;
  void *v26;
  uint64_t v27;
  void *v28;
  SUCoreDocumentation *v29;
  NSString *v30;
  NSString *v31;
  NSNumber *recommendedUpdateNotificationFrequencyDays;
  uint64_t v33;
  NSString *releaseNotesSummaryFileName;
  uint64_t v35;
  NSString *releaseNotesFileName;
  uint64_t v37;
  NSString *licenseAgreementFileName;
  uint64_t v39;
  NSString *preferencesIconFileName;
  NSString *language;
  void *v42;
  void *v43;
  uint64_t v44;
  NSString *v45;
  NSString *humanReadableUpdateName;
  NSString *humanReadableUpdateTitle;
  NSString *humanReadableUpdateVersion;
  NSString *humanReadableMoreInfoLink;
  NSString *notificationTitleString;
  NSString *notificationBodyString;
  NSString *recommendedUpdateTitleString;
  NSString *recommendedUpdateAlertBodyString;
  NSString *mandatoryUpdateBodyString;
  objc_super v56;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v56.receiver = self;
    v56.super_class = (Class)SUCoreDocumentation;
    v9 = -[SUCoreDocumentation init](&v56, sel_init);
    if (v9)
    {
      objc_msgSend(v8, "safeStringForKey:", CFSTR("OSVersion"));
      v10 = objc_claimAutoreleasedReturnValue();
      productVersion = v9->_productVersion;
      v9->_productVersion = (NSString *)v10;

      objc_msgSend(v8, "safeObjectForKey:ofClass:", CFSTR("SUSLAVersionRequired"), objc_opt_class());
      v12 = objc_claimAutoreleasedReturnValue();
      slaVersion = v9->_slaVersion;
      v9->_slaVersion = (NSNumber *)v12;

      objc_storeStrong((id *)&v9->_localBundleURL, a3);
      serverAssetURL = v9->_serverAssetURL;
      v9->_serverAssetURL = 0;

      objc_msgSend(v8, "safeDataForKey:", CFSTR("_Measurement"));
      v15 = objc_claimAutoreleasedReturnValue();
      serverAssetMeasurement = v9->_serverAssetMeasurement;
      v9->_serverAssetMeasurement = (NSData *)v15;

      objc_msgSend(v8, "safeStringForKey:", CFSTR("_MeasurementAlgorithm"));
      v17 = objc_claimAutoreleasedReturnValue();
      serverAssetAlgorithm = v9->_serverAssetAlgorithm;
      v9->_serverAssetAlgorithm = (NSString *)v17;

      objc_msgSend(v8, "safeObjectForKey:ofClass:", CFSTR("_DownloadSize"), objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_serverAssetChunkSize = objc_msgSend(v19, "longLongValue");

      v9->_notificationEnabled = objc_msgSend(v8, "safeBooleanForKey:", CFSTR("NotificationEnabled"));
      objc_msgSend(v8, "safeDictionaryForKey:", CFSTR("RecommendedUpdate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v9->_recommendedUpdateEnabled = objc_msgSend(v20, "safeBooleanForKey:", CFSTR("Enabled"));
        objc_msgSend(v21, "safeStringForKey:", CFSTR("MinOSVersion"));
        v22 = objc_claimAutoreleasedReturnValue();
        recommendedUpdateMinOSVersion = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = (NSString *)v22;

        objc_msgSend(v21, "safeStringForKey:", CFSTR("MaxOSVersion"));
        v24 = objc_claimAutoreleasedReturnValue();
        recommendedUpdateMaxOSVersion = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = (NSString *)v24;

        v9->_recommendedUpdateApplicable = -[SUCoreDocumentation isRecommendedUpdateApplicable](v9, "isRecommendedUpdateApplicable");
        objc_msgSend(v21, "objectForKey:", CFSTR("NotificationFrequencyDays"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "safeIntegerForKey:", CFSTR("NotificationFrequencyDays")));
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
        v27 = objc_claimAutoreleasedReturnValue();
        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v27;
      }
      else
      {
        *(_WORD *)&v9->_recommendedUpdateEnabled = 0;
        v30 = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = 0;

        v31 = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = 0;

        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = 0;
      }

      objc_msgSend(v8, "safeStringForKey:", CFSTR("ReleaseNotesSummaryFileName"));
      v33 = objc_claimAutoreleasedReturnValue();
      releaseNotesSummaryFileName = v9->_releaseNotesSummaryFileName;
      v9->_releaseNotesSummaryFileName = (NSString *)v33;

      if (!v9->_releaseNotesSummaryFileName)
      {
        v9->_releaseNotesSummaryFileName = (NSString *)CFSTR("ReadMeSummary");

      }
      objc_msgSend(v8, "safeStringForKey:", CFSTR("ReleaseNotesFileName"));
      v35 = objc_claimAutoreleasedReturnValue();
      releaseNotesFileName = v9->_releaseNotesFileName;
      v9->_releaseNotesFileName = (NSString *)v35;

      if (!v9->_releaseNotesFileName)
      {
        v9->_releaseNotesFileName = (NSString *)CFSTR("ReadMe");

      }
      objc_msgSend(v8, "safeStringForKey:", CFSTR("LicenseAgreementFileName"));
      v37 = objc_claimAutoreleasedReturnValue();
      licenseAgreementFileName = v9->_licenseAgreementFileName;
      v9->_licenseAgreementFileName = (NSString *)v37;

      if (!v9->_licenseAgreementFileName)
      {
        v9->_licenseAgreementFileName = (NSString *)CFSTR("License");

      }
      objc_msgSend(v8, "safeStringForKey:", CFSTR("PreferencesIconFileName"));
      v39 = objc_claimAutoreleasedReturnValue();
      preferencesIconFileName = v9->_preferencesIconFileName;
      v9->_preferencesIconFileName = (NSString *)v39;

      if (!v9->_preferencesIconFileName)
      {
        v9->_preferencesIconFileName = (NSString *)CFSTR("PreferencesIcon");

      }
      language = v9->_language;
      v9->_language = (NSString *)CFSTR("en");

      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42 && objc_msgSend(v42, "count"))
      {
        objc_msgSend(v43, "objectAtIndex:", 0);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v9->_language;
        v9->_language = (NSString *)v44;

      }
      humanReadableUpdateName = v9->_humanReadableUpdateName;
      v9->_humanReadableUpdateName = 0;

      humanReadableUpdateTitle = v9->_humanReadableUpdateTitle;
      v9->_humanReadableUpdateTitle = 0;

      humanReadableUpdateVersion = v9->_humanReadableUpdateVersion;
      v9->_humanReadableUpdateVersion = 0;

      humanReadableMoreInfoLink = v9->_humanReadableMoreInfoLink;
      v9->_humanReadableMoreInfoLink = 0;

      notificationTitleString = v9->_notificationTitleString;
      v9->_notificationTitleString = 0;

      notificationBodyString = v9->_notificationBodyString;
      v9->_notificationBodyString = 0;

      recommendedUpdateTitleString = v9->_recommendedUpdateTitleString;
      v9->_recommendedUpdateTitleString = 0;

      recommendedUpdateAlertBodyString = v9->_recommendedUpdateAlertBodyString;
      v9->_recommendedUpdateAlertBodyString = 0;

      mandatoryUpdateBodyString = v9->_mandatoryUpdateBodyString;
      v9->_mandatoryUpdateBodyString = 0;

    }
    self = v9;
    v29 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackError:forReason:withResult:withError:", CFSTR("[DOCUMENTATION]"), CFSTR("unable to create SU documentation with no attributes dictionary"), 8100, 0);

    v29 = 0;
  }

  return v29;
}

- (id)extendDocumentationProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "begin:atFunction:", CFSTR("documentation"), CFSTR("extendDocumentationProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreDocumentation _extendDocumentationPropertiesWithSimulateEvent:](self, "_extendDocumentationPropertiesWithSimulateEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUCoreDocumentation _extendDocumentationProperties](self, "_extendDocumentationProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end:atFunction:", CFSTR("documentation"), CFSTR("extendDocumentationProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SUCoreDocumentation _extendDocumentationPropertiesWithSimulateEvent:](self, "_extendDocumentationPropertiesWithSimulateEvent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }

  }
  return v5;
}

- (id)_extendDocumentationPropertiesWithSimulateEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "simAction");
  if (v5 == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("SimulatedLocalBundelURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setLocalBundleURL:](self, "setLocalBundleURL:", v7);

    -[SUCoreDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", CFSTR("SimulatedHumanReadableUpdateName"));
    -[SUCoreDocumentation setHumanReadableUpdateTitle:](self, "setHumanReadableUpdateTitle:", CFSTR("SimulatedHumanReadableUpdateTitle"));
    -[SUCoreDocumentation setHumanReadableUpdateVersion:](self, "setHumanReadableUpdateVersion:", CFSTR("SimulatedHumanReadableUpdateVersion"));
    -[SUCoreDocumentation setHumanReadableMoreInfoLink:](self, "setHumanReadableMoreInfoLink:", CFSTR("SimulatedHumanReadableMoreInfoLink"));
    -[SUCoreDocumentation setNotificationEnabled:](self, "setNotificationEnabled:", 1);
    -[SUCoreDocumentation setNotificationTitleString:](self, "setNotificationTitleString:", CFSTR("SimulatedNotificationTitleString"));
    -[SUCoreDocumentation setNotificationBodyString:](self, "setNotificationBodyString:", CFSTR("SimulatedNotificationBodyString"));
    -[SUCoreDocumentation setRecommendedUpdateEnabled:](self, "setRecommendedUpdateEnabled:", 1);
    -[SUCoreDocumentation setRecommendedUpdateApplicable:](self, "setRecommendedUpdateApplicable:", 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setRecommendedUpdateNotificationFrequencyDays:](self, "setRecommendedUpdateNotificationFrequencyDays:", v8);

    -[SUCoreDocumentation setRecommendedUpdateMinOSVersion:](self, "setRecommendedUpdateMinOSVersion:", CFSTR("SimulatedRecommendedUpdateMinOSVersion"));
    -[SUCoreDocumentation setRecommendedUpdateMaxOSVersion:](self, "setRecommendedUpdateMaxOSVersion:", CFSTR("SimulatedRecommendedUpdateMaxOSVersion"));
    -[SUCoreDocumentation setRecommendedUpdateTitleString:](self, "setRecommendedUpdateTitleString:", CFSTR("SimulatedRecommendedUpdateTitleString"));
    -[SUCoreDocumentation setRecommendedUpdateAlertBodyString:](self, "setRecommendedUpdateAlertBodyString:", CFSTR("SimulatedRecommendedUpdateAlertBodyString"));
    -[SUCoreDocumentation setMandatoryUpdateBodyString:](self, "setMandatoryUpdateBodyString:", CFSTR("SimulatedMandatoryUpdateBodyString"));
    objc_msgSend(CFSTR("SimulatedReleaseNotesSummary"), "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v9);

    objc_msgSend(CFSTR("SimulatedReleaseNotes"), "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setReleaseNotes:](self, "setReleaseNotes:", v10);

    objc_msgSend(CFSTR("SimulatedLicenseAgreement"), "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v11);

LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v4);
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_extendDocumentationPropertiesWithSimulateEvent"), v13, 8113, 0);

    goto LABEL_6;
  }
  objc_msgSend(v4, "buildErrorWithDescription:", CFSTR("Simulated extendDocumentationProperties error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)_extendDocumentationProperties
{
  void *v3;
  int v4;
  void *v5;
  SUCoreDocumentation *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  SUCoreDocumentation *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  const __CFAllocator *v20;
  const __CFURL *v21;
  __CFBundle *v22;
  SUCoreDocumentation *v23;
  SUCoreDocumentation *v24;
  int v25;
  void *v26;
  NSObject *v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  int v35;
  void *v36;
  NSObject *v37;
  __CFString *v38;
  __CFString *v39;
  int v40;
  void *v41;
  NSObject *v42;
  __CFString *v43;
  __CFString *v44;
  int v45;
  void *v46;
  NSObject *v47;
  __CFString *v48;
  __CFString *v49;
  int v50;
  void *v51;
  NSObject *v52;
  __CFString *v53;
  __CFString *v54;
  int v55;
  void *v56;
  NSObject *v57;
  __CFString *v58;
  __CFString *v59;
  int v60;
  void *v61;
  NSObject *v62;
  __CFString *v63;
  __CFString *v64;
  int v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  uint8_t buf[4];
  SUCoreDocumentation *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBootedOSSecureInternal");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", &stru_1EA87A8E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("MobileAssetNewPath"));
    v6 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Overriding documentation assets with custom path", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentation setLocalBundleURL:](self, "setLocalBundleURL:", v12);

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "oslog");
        v10 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
          v14 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v88 = v14;
          _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] New Local Bundle: %@", buf, 0xCu);

        }
        goto LABEL_13;
      }
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v88 = v6;
        v16 = "[SU Documentation Preview] Invalid Update path: %@";
        v17 = v10;
        v18 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "[SU Documentation Preview] Unable to find alternate local bundle URL";
        v17 = v10;
        v18 = 2;
LABEL_12:
        _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
LABEL_13:

  }
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
    v21 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v22 = CFBundleCreate(v20, v21);

    if (v22)
    {
      v23 = (SUCoreDocumentation *)CFBundleCopyLocalizedString(v22, CFSTR("HumanReadableUpdateName"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v25 = -[SUCoreDocumentation isEqualToString:](v23, "isEqualToString:", CFSTR("HumanReadableUpdateName")),
            v24 = v23,
            v25))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = v23;
          _os_log_impl(&dword_1DDFDD000, v27, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateName: %{public}@", buf, 0xCu);
        }

        v24 = 0;
      }
      -[SUCoreDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", v24);
      v28 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("HumanReadableUpdateTitle"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("HumanReadableUpdateTitle")),
            v29 = v28,
            v30))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "oslog");
        v32 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v28;
          _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateTitle: %{public}@", buf, 0xCu);
        }

        v29 = 0;
      }
      -[SUCoreDocumentation setHumanReadableUpdateTitle:](self, "setHumanReadableUpdateTitle:", v29);
      v33 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("HumanReadableUpdateVersion"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR("HumanReadableUpdateVersion")),
            v34 = v33,
            v35))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "oslog");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v33;
          _os_log_impl(&dword_1DDFDD000, v37, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateVersion: %{public}@", buf, 0xCu);
        }

        v34 = 0;
      }
      -[SUCoreDocumentation setHumanReadableUpdateVersion:](self, "setHumanReadableUpdateVersion:", v34);
      v38 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("HumanReadableMoreInfoLink"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("HumanReadableMoreInfoLink")),
            v39 = v38,
            v40))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "oslog");
        v42 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v38;
          _os_log_impl(&dword_1DDFDD000, v42, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableMoreInfoLink: %{public}@", buf, 0xCu);
        }

        v39 = 0;
      }
      v86 = v28;
      -[SUCoreDocumentation setHumanReadableMoreInfoLink:](self, "setHumanReadableMoreInfoLink:", v39);
      v43 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("NotificationTitleString"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v45 = -[__CFString isEqualToString:](v43, "isEqualToString:", CFSTR("NotificationTitleString")),
            v44 = v43,
            v45))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "oslog");
        v47 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v43;
          _os_log_impl(&dword_1DDFDD000, v47, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load notificationTitleString: %{public}@", buf, 0xCu);
        }

        v44 = 0;
      }
      v85 = v33;
      -[SUCoreDocumentation setNotificationTitleString:](self, "setNotificationTitleString:", v44);
      v48 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("NotificationBodyString"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v50 = -[__CFString isEqualToString:](v48, "isEqualToString:", CFSTR("NotificationBodyString")),
            v49 = v48,
            v50))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "oslog");
        v52 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v48;
          _os_log_impl(&dword_1DDFDD000, v52, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load notificationBodyString: %{public}@", buf, 0xCu);
        }

        v49 = 0;
      }
      v84 = v38;
      -[SUCoreDocumentation setNotificationBodyString:](self, "setNotificationBodyString:", v49);
      v53 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("RecommendedUpdateTitleString"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("RecommendedUpdateTitleString")),
            v54 = v53,
            v55))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "oslog");
        v57 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v53;
          _os_log_impl(&dword_1DDFDD000, v57, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load recommendedUpdateTitleString: %{public}@", buf, 0xCu);
        }

        v54 = 0;
      }
      -[SUCoreDocumentation setRecommendedUpdateTitleString:](self, "setRecommendedUpdateTitleString:", v54);
      v58 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("RecommendedUpdateAlertBodyString"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v60 = -[__CFString isEqualToString:](v58, "isEqualToString:", CFSTR("RecommendedUpdateAlertBodyString")),
            v59 = v58,
            v60))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "oslog");
        v62 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v58;
          _os_log_impl(&dword_1DDFDD000, v62, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load recommendedUpdateAlertBodyString: %{public}@", buf, 0xCu);
        }

        v59 = 0;
      }
      -[SUCoreDocumentation setRecommendedUpdateAlertBodyString:](self, "setRecommendedUpdateAlertBodyString:", v59);
      v63 = (__CFString *)CFBundleCopyLocalizedString(v22, CFSTR("MandatoryUpdateBodyString"), 0, CFSTR("documentation"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v65 = -[__CFString isEqualToString:](v63, "isEqualToString:", CFSTR("MandatoryUpdateBodyString")),
            v64 = v63,
            v65))
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v64);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "oslog");
        v67 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v63;
          _os_log_impl(&dword_1DDFDD000, v67, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load mandatoryUpdateBodyString: %{public}@", buf, 0xCu);
        }

        v64 = 0;
      }
      -[SUCoreDocumentation setMandatoryUpdateBodyString:](self, "setMandatoryUpdateBodyString:", v64);
      -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v69);

      -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation setReleaseNotes:](self, "setReleaseNotes:", v71);

      -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v73);

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "oslog");
      v75 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v88 = self;
        _os_log_impl(&dword_1DDFDD000, v75, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Successfully extended documentation properties: %{public}@", buf, 0xCu);
      }

      CFRelease(v22);
      v76 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "stringWithFormat:", CFSTR("unable to load asset bundle for the local bundle URL of the documentation asset: %@"), v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "buildError:underlying:description:", 8100, 0, v81);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v23 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedDescription");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation trackError:forReason:withResult:withError:](v23, "trackError:forReason:withResult:withError:", CFSTR("[DOCUMENTATION]"), v82, 8100, v76);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "buildError:underlying:description:", 8101, 0, CFSTR("unable to find local bundle URL for documentation asset"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v23 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation trackError:forReason:withResult:withError:](v23, "trackError:forReason:withResult:withError:", CFSTR("[DOCUMENTATION]"), CFSTR("unable to find local bundle URL for documentation asset"), 8101, v76);
  }

  return v76;
}

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4;
  void *v5;

  v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, CFSTR("html"), 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRecommendedUpdateApplicable
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "productVersion");
    v4 = objc_claimAutoreleasedReturnValue();

    -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7)
      && v4)
    {
      -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:options:", v4, 64);

      -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject compare:options:](v4, "compare:options:", v10, 64);

      v13 = v9 != 1 && v11 != 1;
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v19 = CFSTR("NO");
        v23 = 138544130;
        v24 = v16;
        if (v13)
          v19 = CFSTR("YES");
        v25 = 2114;
        v26 = v4;
        v27 = 2114;
        v28 = v17;
        v29 = 2114;
        v30 = v19;
        _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] recommendedUpdateMinOSVersion=%{public}@ <= currentOSVersion=%{public}@ <= recommendedUpdateMaxOSVersion=%{public}@ | isRecommendedUpdateApplicable=%{public}@", (uint8_t *)&v23, 0x2Au);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SUCoreDocumentation isRecommendedUpdateApplicable].cold.1(self, (uint64_t)v4, v15);
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation isRecommendedUpdateApplicable].cold.2();
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)softwareUpdateIconImagePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImagePath].cold.1();
    goto LABEL_9;
  }
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImagePath].cold.2();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Using icon path: %{public}@", (uint8_t *)&v14, 0xCu);
  }
LABEL_10:

  return v8;
}

- (id)softwareUpdateIconImage
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id UIImageClass;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  getUIImageClass();
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImage].cold.1();
    goto LABEL_16;
  }
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImage].cold.2();
    goto LABEL_16;
  }
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImage].cold.3();
LABEL_16:
    v13 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Loading bundle with localBundleURL:%{public}@ preferencesIconFileName:%{public}@", (uint8_t *)&v21, 0x16u);

  }
  v9 = (void *)MEMORY[0x1E0CB34D0];
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleWithURL:", v10);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    UIImageClass = getUIImageClass();
    -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(UIImageClass, "imageNamed:inBundle:withConfiguration:", v12, v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v16;
        _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Successfully loaded update icon bundle with name: %{public}@", (uint8_t *)&v21, 0xCu);

      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[SUCoreDocumentation softwareUpdateIconImage].cold.5(self);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentation softwareUpdateIconImage].cold.4(self);
    v13 = 0;
  }

LABEL_23:
  return v13;
}

- (SUCoreDocumentation)initWithCoder:(id)a3
{
  id v4;
  SUCoreDocumentation *v5;
  uint64_t v6;
  NSData *releaseNotesSummary;
  uint64_t v8;
  NSData *releaseNotes;
  uint64_t v10;
  NSData *licenseAgreement;
  uint64_t v12;
  NSString *humanReadableUpdateName;
  uint64_t v14;
  NSString *humanReadableUpdateTitle;
  uint64_t v16;
  NSString *humanReadableUpdateVersion;
  uint64_t v18;
  NSString *humanReadableMoreInfoLink;
  uint64_t v20;
  NSString *notificationTitleString;
  uint64_t v22;
  NSString *notificationBodyString;
  uint64_t v24;
  NSNumber *recommendedUpdateNotificationFrequencyDays;
  uint64_t v26;
  NSString *recommendedUpdateMinOSVersion;
  uint64_t v28;
  NSString *recommendedUpdateMaxOSVersion;
  uint64_t v30;
  NSString *recommendedUpdateTitleString;
  uint64_t v32;
  NSString *recommendedUpdateAlertBodyString;
  uint64_t v34;
  NSString *mandatoryUpdateBodyString;
  uint64_t v36;
  NSString *productVersion;
  uint64_t v38;
  NSNumber *slaVersion;
  uint64_t v40;
  NSURL *localBundleURL;
  uint64_t v42;
  NSURL *serverAssetURL;
  uint64_t v44;
  NSData *serverAssetMeasurement;
  uint64_t v46;
  NSString *serverAssetAlgorithm;
  void *v48;
  uint64_t v49;
  NSString *releaseNotesSummaryFileName;
  uint64_t v51;
  NSString *releaseNotesFileName;
  uint64_t v53;
  NSString *licenseAgreementFileName;
  uint64_t v55;
  NSString *preferencesIconFileName;
  uint64_t v57;
  NSString *language;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SUCoreDocumentation;
  v5 = -[SUCoreDocumentation init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseNotesSummary"));
    v6 = objc_claimAutoreleasedReturnValue();
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseNotes"));
    v8 = objc_claimAutoreleasedReturnValue();
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LicenseAgreement"));
    v10 = objc_claimAutoreleasedReturnValue();
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateName"));
    v12 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableMoreInfoLink"));
    v18 = objc_claimAutoreleasedReturnValue();
    humanReadableMoreInfoLink = v5->_humanReadableMoreInfoLink;
    v5->_humanReadableMoreInfoLink = (NSString *)v18;

    v5->_notificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationTitleString"));
    v20 = objc_claimAutoreleasedReturnValue();
    notificationTitleString = v5->_notificationTitleString;
    v5->_notificationTitleString = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationBodyString"));
    v22 = objc_claimAutoreleasedReturnValue();
    notificationBodyString = v5->_notificationBodyString;
    v5->_notificationBodyString = (NSString *)v22;

    v5->_recommendedUpdateEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RecommendedUpdateEnabled"));
    v5->_recommendedUpdateApplicable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RecommendedUpdateApplicable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecommendedUpdateNotificationFrequencyDays"));
    v24 = objc_claimAutoreleasedReturnValue();
    recommendedUpdateNotificationFrequencyDays = v5->_recommendedUpdateNotificationFrequencyDays;
    v5->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecommendedUpdateMinOSVersion"));
    v26 = objc_claimAutoreleasedReturnValue();
    recommendedUpdateMinOSVersion = v5->_recommendedUpdateMinOSVersion;
    v5->_recommendedUpdateMinOSVersion = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecommendedUpdateMaxOSVersion"));
    v28 = objc_claimAutoreleasedReturnValue();
    recommendedUpdateMaxOSVersion = v5->_recommendedUpdateMaxOSVersion;
    v5->_recommendedUpdateMaxOSVersion = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecommendedUpdateTitleString"));
    v30 = objc_claimAutoreleasedReturnValue();
    recommendedUpdateTitleString = v5->_recommendedUpdateTitleString;
    v5->_recommendedUpdateTitleString = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecommendedUpdateAlertBodyString"));
    v32 = objc_claimAutoreleasedReturnValue();
    recommendedUpdateAlertBodyString = v5->_recommendedUpdateAlertBodyString;
    v5->_recommendedUpdateAlertBodyString = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MandatoryUpdateBodyString"));
    v34 = objc_claimAutoreleasedReturnValue();
    mandatoryUpdateBodyString = v5->_mandatoryUpdateBodyString;
    v5->_mandatoryUpdateBodyString = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductVersion"));
    v36 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SLAVersion"));
    v38 = objc_claimAutoreleasedReturnValue();
    slaVersion = v5->_slaVersion;
    v5->_slaVersion = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalBundleURL"));
    v40 = objc_claimAutoreleasedReturnValue();
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAssetURL"));
    v42 = objc_claimAutoreleasedReturnValue();
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAssetMeasurement"));
    v44 = objc_claimAutoreleasedReturnValue();
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAssetAlgorithm"));
    v46 = objc_claimAutoreleasedReturnValue();
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAssetChuckSize"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serverAssetChunkSize = objc_msgSend(v48, "longLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseNotesSummaryFileName"));
    v49 = objc_claimAutoreleasedReturnValue();
    releaseNotesSummaryFileName = v5->_releaseNotesSummaryFileName;
    v5->_releaseNotesSummaryFileName = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseNotesFileName"));
    v51 = objc_claimAutoreleasedReturnValue();
    releaseNotesFileName = v5->_releaseNotesFileName;
    v5->_releaseNotesFileName = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LicenseAgreementFileName"));
    v53 = objc_claimAutoreleasedReturnValue();
    licenseAgreementFileName = v5->_licenseAgreementFileName;
    v5->_licenseAgreementFileName = (NSString *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreferencesIconFileName"));
    v55 = objc_claimAutoreleasedReturnValue();
    preferencesIconFileName = v5->_preferencesIconFileName;
    v5->_preferencesIconFileName = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Language"));
    v57 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v57;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v4 = a3;
  -[SUCoreDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ReleaseNotesSummary"));

  -[SUCoreDocumentation releaseNotes](self, "releaseNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ReleaseNotes"));

  -[SUCoreDocumentation licenseAgreement](self, "licenseAgreement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LicenseAgreement"));

  -[SUCoreDocumentation humanReadableUpdateName](self, "humanReadableUpdateName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HumanReadableUpdateName"));

  -[SUCoreDocumentation humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HumanReadableUpdateTitle"));

  -[SUCoreDocumentation humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HumanReadableUpdateVersion"));

  -[SUCoreDocumentation humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HumanReadableMoreInfoLink"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation notificationEnabled](self, "notificationEnabled"), CFSTR("NotificationEnabled"));
  -[SUCoreDocumentation notificationTitleString](self, "notificationTitleString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("NotificationTitleString"));

  -[SUCoreDocumentation notificationBodyString](self, "notificationBodyString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("NotificationBodyString"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"), CFSTR("RecommendedUpdateEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation recommendedUpdateApplicable](self, "recommendedUpdateApplicable"), CFSTR("RecommendedUpdateApplicable"));
  -[SUCoreDocumentation recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("RecommendedUpdateNotificationFrequencyDays"));

  -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("RecommendedUpdateMinOSVersion"));

  -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("RecommendedUpdateMaxOSVersion"));

  -[SUCoreDocumentation recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("RecommendedUpdateTitleString"));

  -[SUCoreDocumentation recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("RecommendedUpdateAlertBodyString"));

  -[SUCoreDocumentation mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("MandatoryUpdateBodyString"));

  -[SUCoreDocumentation productVersion](self, "productVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("ProductVersion"));

  -[SUCoreDocumentation slaVersion](self, "slaVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("SLAVersion"));

  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("LocalBundleURL"));

  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("ServerAssetURL"));

  -[SUCoreDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("ServerAssetMeasurement"));

  -[SUCoreDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("ServerAssetAlgorithm"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SUCoreDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("ServerAssetChuckSize"));

  -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("ReleaseNotesSummaryFileName"));

  -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("ReleaseNotesFileName"));

  -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("LicenseAgreementFileName"));

  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("PreferencesIconFileName"));

  -[SUCoreDocumentation language](self, "language");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("Language"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotes](self, "releaseNotes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation licenseAgreement](self, "licenseAgreement");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateName](self, "humanReadableUpdateName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDocumentation notificationEnabled](self, "notificationEnabled"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v20 = v3;
  -[SUCoreDocumentation notificationTitleString](self, "notificationTitleString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation notificationBodyString](self, "notificationBodyString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v18 = v4;
  if (-[SUCoreDocumentation recommendedUpdateApplicable](self, "recommendedUpdateApplicable"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v17 = v5;
  -[SUCoreDocumentation recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation productVersion](self, "productVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation slaVersion](self, "slaVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation language](self, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("\n[>>>\n                        releaseNotesSummary: %@\n                               releaseNotes: %@\n                           licenseAgreement: %@\n                    humanReadableUpdateName: %@\n                   humanReadableUpdateTitle: %@\n                 humanReadableUpdateVersion: %@\n                  humanReadableMoreInfoLink: %@\n                        notificationEnabled: %@\n                    notificationTitleString: %@\n                     notificationBodyString: %@\n                   recommendedUpdateEnabled: %@\n                recommendedUpdateApplicable: %@\n recommendedUpdateNotificationFrequencyDays: %@\n              recommendedUpdateMinOSVersion: %@\n              recommendedUpdateMaxOSVersion: %@\n               recommendedUpdateTitleString: %@\n           recommendedUpdateAlertBodyString: %@\n                  mandatoryUpdateBodyString: %@\n                             productVersion: %@\n                                 slaVersion: %@\n                             localBundleURL: %@\n                             serverAssetURL: %@\n                     serverAssetMeasurement: %@\n                       serverAssetAlgorithm: %@\n                                   language: %@\n                releaseNotesSummaryFileName: %@\n                       releaseNotesFileName: %@\n                   licenseAgreementFileName: %@\n                    preferencesIconFileName: %@\n<<<]"), v35, v37, v32, v36, v34, v21, v33, v20, v31, v19, v18, v17, v30, v29, v28, v27,
                  v26,
                  v25,
                  v24,
                  v16,
                  v15,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return v23;
}

- (id)summary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("localBundleURL:%@, serverAssetURL:%@"), v4, v5);

  return v6;
}

- (NSData)releaseNotesSummary
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReleaseNotesSummary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)releaseNotes
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReleaseNotes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)licenseAgreement
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLicenseAgreement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)humanReadableUpdateTitle
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)humanReadableUpdateVersion
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHumanReadableUpdateVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)humanReadableMoreInfoLink
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHumanReadableMoreInfoLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)notificationEnabled
{
  return self->_notificationEnabled;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  self->_notificationEnabled = a3;
}

- (NSString)notificationTitleString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNotificationTitleString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)notificationBodyString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotificationBodyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)recommendedUpdateEnabled
{
  return self->_recommendedUpdateEnabled;
}

- (void)setRecommendedUpdateEnabled:(BOOL)a3
{
  self->_recommendedUpdateEnabled = a3;
}

- (BOOL)recommendedUpdateApplicable
{
  return self->_recommendedUpdateApplicable;
}

- (void)setRecommendedUpdateApplicable:(BOOL)a3
{
  self->_recommendedUpdateApplicable = a3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRecommendedUpdateNotificationFrequencyDays:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)recommendedUpdateMinOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecommendedUpdateMinOSVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)recommendedUpdateMaxOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecommendedUpdateMaxOSVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)recommendedUpdateTitleString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRecommendedUpdateTitleString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)recommendedUpdateAlertBodyString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRecommendedUpdateAlertBodyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)mandatoryUpdateBodyString
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMandatoryUpdateBodyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)slaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSlaVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSURL)localBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLocalBundleURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSURL)serverAssetURL
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setServerAssetURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSData)serverAssetMeasurement
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setServerAssetMeasurement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)serverAssetAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setServerAssetAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)releaseNotesSummaryFileName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReleaseNotesSummaryFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)releaseNotesFileName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setReleaseNotesFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)licenseAgreementFileName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLicenseAgreementFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)preferencesIconFileName
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPreferencesIconFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesIconFileName, 0);
  objc_storeStrong((id *)&self->_licenseAgreementFileName, 0);
  objc_storeStrong((id *)&self->_releaseNotesFileName, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummaryFileName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_localBundleURL, 0);
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateBodyString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateAlertBodyString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateTitleString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateMaxOSVersion, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateMinOSVersion, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateNotificationFrequencyDays, 0);
  objc_storeStrong((id *)&self->_notificationBodyString, 0);
  objc_storeStrong((id *)&self->_notificationTitleString, 0);
  objc_storeStrong((id *)&self->_humanReadableMoreInfoLink, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateVersion, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateTitle, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

- (void)isRecommendedUpdateApplicable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[DOCUMENTATION] recommendedUpdateEnabled=NO | isRecommendedUpdateApplicable=NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)softwareUpdateIconImagePath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[DOCUMENTATION] Failed to determine icon path due to no preferences icon file name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)softwareUpdateIconImage
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "preferencesIconFileName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DDFDD000, v2, v3, "[DOCUMENTATION] Failed to load update icon bundle with name: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end

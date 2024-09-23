@implementation STLog

+ (OS_os_log)screenTimeOrganizationController
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("screenTimeOrganizationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactor
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)xpcServiceProvider
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("xpcServiceProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationClient
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("communicationClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

void __22__STLog_logCategories__block_invoke()
{
  os_log_t v0;
  os_log_t v1;
  os_log_t v2;
  os_log_t v3;
  os_log_t v4;
  os_log_t v5;
  os_log_t v6;
  os_log_t v7;
  os_log_t v8;
  os_log_t v9;
  uint64_t v10;
  void *v11;
  os_log_t v12;
  os_log_t v13;
  os_log_t v14;
  os_log_t v15;
  os_log_t v16;
  os_log_t v17;
  os_log_t v18;
  os_log_t v19;
  os_log_t v20;
  os_log_t v21;
  os_log_t v22;
  os_log_t v23;
  os_log_t v24;
  os_log_t v25;
  os_log_t v26;
  os_log_t v27;
  os_log_t v28;
  os_log_t v29;
  os_log_t v30;
  os_log_t v31;
  os_log_t v32;
  os_log_t v33;
  os_log_t v34;
  os_log_t v35;
  os_log_t v36;
  os_log_t v37;
  os_log_t v38;
  os_log_t v39;
  os_log_t v40;
  os_log_t v41;
  os_log_t v42;
  os_log_t v43;
  os_log_t v44;
  os_log_t v45;
  os_log_t v46;
  os_log_t v47;
  os_log_t v48;
  os_log_t v49;
  os_log_t v50;
  os_log_t v51;
  os_log_t v52;
  os_log_t v53;
  os_log_t v54;
  os_log_t v55;
  os_log_t v56;
  os_log_t v57;
  os_log_t v58;
  os_log_t v59;
  os_log_t v60;
  os_log_t v61;
  os_log_t v62;
  os_log_t v63;
  os_log_t v64;
  os_log_t v65;
  os_log_t v66;
  os_log_t v67;
  os_log_t v68;
  os_log_t v69;
  os_log_t v70;
  os_log_t v71;
  os_log_t v72;
  os_log_t v73;
  os_log_t v74;
  os_log_t v75;
  os_log_t v76;
  os_log_t v77;
  os_log_t v78;
  os_log_t v79;
  os_log_t v80;
  os_log_t v81;
  os_log_t v82;
  _QWORD v83[81];
  _QWORD v84[83];

  v84[81] = *MEMORY[0x1E0C80C00];
  v83[0] = CFSTR("accountState");
  v82 = os_log_create("com.apple.screentime.core", "accountState");
  v84[0] = v82;
  v83[1] = CFSTR("appInfo");
  v81 = os_log_create("com.apple.screentime.core", "appInfo");
  v84[1] = v81;
  v83[2] = CFSTR("appMonitor");
  v80 = os_log_create("com.apple.screentime.core", "appMonitor");
  v84[2] = v80;
  v83[3] = CFSTR("apns");
  v79 = os_log_create("com.apple.screentime.core", "apns");
  v84[3] = v79;
  v83[4] = CFSTR("ask");
  v78 = os_log_create("com.apple.screentime.core", "ask");
  v84[4] = v78;
  v83[5] = CFSTR("blueprint");
  v77 = os_log_create("com.apple.screentime.core", "blueprint");
  v84[5] = v77;
  v83[6] = CFSTR("checkpoint");
  v76 = os_log_create("com.apple.screentime.core", "checkpoint");
  v84[6] = v76;
  v83[7] = CFSTR("cloudkit");
  v75 = os_log_create("com.apple.screentime.core", "cloudkit");
  v84[7] = v75;
  v83[8] = CFSTR("communicationSafety");
  v74 = os_log_create("com.apple.screentime.core", "communicationSafety");
  v84[8] = v74;
  v83[9] = CFSTR("conduit");
  v73 = os_log_create("com.apple.screentime.core", "conduit");
  v84[9] = v73;
  v83[10] = CFSTR("contactsService");
  v72 = os_log_create("com.apple.screentime.core", "contactsService");
  v84[10] = v72;
  v83[11] = CFSTR("conversation");
  v71 = os_log_create("com.apple.screentime.core", "conversation");
  v84[11] = v71;
  v83[12] = CFSTR("coreAnalytics");
  v70 = os_log_create("com.apple.screentime.core", "coreAnalytics");
  v84[12] = v70;
  v83[13] = CFSTR("coreAnimation");
  v69 = os_log_create("com.apple.screentime.core", "coreAnimation");
  v84[13] = v69;
  v83[14] = CFSTR("daemon");
  v68 = os_log_create("com.apple.screentime.core", "daemon");
  v84[14] = v68;
  v83[15] = CFSTR("deviceState");
  v67 = os_log_create("com.apple.screentime.core", "deviceState");
  v84[15] = v67;
  v83[16] = CFSTR("family");
  v66 = os_log_create("com.apple.screentime.core", "family");
  v84[16] = v66;
  v83[17] = CFSTR("familyScreenTimeManager");
  v65 = os_log_create("com.apple.screentime.core", "familyScreenTimeManager");
  v84[17] = v65;
  v83[18] = CFSTR("familySettingsManager");
  v64 = os_log_create("com.apple.screentime.core", "familySettingsManager");
  v84[18] = v64;
  v83[19] = CFSTR("idsTransport");
  v63 = os_log_create("com.apple.screentime.core", "idsTransport");
  v84[19] = v63;
  v83[20] = CFSTR("managementStateObserver");
  v62 = os_log_create("com.apple.screentime.core", "managementStateObserver");
  v84[20] = v62;
  v83[21] = CFSTR("mirroring");
  v61 = os_log_create("com.apple.screentime.core", "mirroring");
  v84[21] = v61;
  v83[22] = CFSTR("oneMoreMinuteManager");
  v60 = os_log_create("com.apple.screentime.core", "oneMoreMinuteManager");
  v84[22] = v60;
  v83[23] = CFSTR("payload");
  v59 = os_log_create("com.apple.screentime.core", "payload");
  v84[23] = v59;
  v83[24] = CFSTR("payloadManager");
  v58 = os_log_create("com.apple.screentime.core", "payloadManager");
  v84[24] = v58;
  v83[25] = CFSTR("payloadQueue");
  v57 = os_log_create("com.apple.screentime.core", "payloadQueue");
  v84[25] = v57;
  v83[26] = CFSTR("persistence");
  v56 = os_log_create("com.apple.screentime.core", "persistence");
  v84[26] = v56;
  v83[27] = CFSTR("personal");
  v55 = os_log_create("com.apple.screentime.core", "personal");
  v84[27] = v55;
  v83[28] = CFSTR("pinController");
  v54 = os_log_create("com.apple.screentime.core", "pinController");
  v84[28] = v54;
  v83[29] = CFSTR("pinService");
  v53 = os_log_create("com.apple.screentime.core", "pinService");
  v84[29] = v53;
  v83[30] = CFSTR("privateService");
  v52 = os_log_create("com.apple.screentime.core", "privateService");
  v84[30] = v52;
  v83[31] = CFSTR("requestManager");
  v51 = os_log_create("com.apple.screentime.core", "requestManager");
  v84[31] = v51;
  v83[32] = CFSTR("restrictionsMigrator");
  v50 = os_log_create("com.apple.screentime.core", "restrictionsMigrator");
  v84[32] = v50;
  v83[33] = CFSTR("screentime");
  v49 = os_log_create("com.apple.screentime.core", "screentime");
  v84[33] = v49;
  v83[34] = CFSTR("screenTimeOrganizationController");
  v48 = os_log_create("com.apple.screentime.core", "screenTimeOrganizationController");
  v84[34] = v48;
  v83[35] = CFSTR("settingsService");
  v47 = os_log_create("com.apple.screentime.core", "settingsService");
  v84[35] = v47;
  v83[36] = CFSTR("test");
  v46 = os_log_create("com.apple.screentime.core", "test");
  v84[36] = v46;
  v83[37] = CFSTR("tool");
  v45 = os_log_create("com.apple.screentime.core", "tool");
  v84[37] = v45;
  v83[38] = CFSTR("transaction");
  v44 = os_log_create("com.apple.screentime.core", "transaction");
  v84[38] = v44;
  v83[39] = CFSTR("usage");
  v43 = os_log_create("com.apple.screentime.core", "usage");
  v84[39] = v43;
  v83[40] = CFSTR("userNotifications");
  v42 = os_log_create("com.apple.screentime.core", "userNotifications");
  v84[40] = v42;
  v83[41] = CFSTR("utility");
  v41 = os_log_create("com.apple.screentime.core", "utility");
  v84[41] = v41;
  v83[42] = CFSTR("versionVector");
  v40 = os_log_create("com.apple.screentime.core", "versionVector");
  v84[42] = v40;
  v83[43] = CFSTR("askClient");
  v39 = os_log_create("com.apple.screentime.core", "askClient");
  v84[43] = v39;
  v83[44] = CFSTR("backgroundActivity");
  v38 = os_log_create("com.apple.screentime.core", "backgroundActivity");
  v84[44] = v38;
  v83[45] = CFSTR("cachingCodableStore");
  v37 = os_log_create("com.apple.screentime.core", "cachingCodableStore");
  v84[45] = v37;
  v83[46] = CFSTR("communicationClient");
  v36 = os_log_create("com.apple.screentime.core", "communicationClient");
  v84[46] = v36;
  v83[47] = CFSTR("contactStorePrimitives");
  v35 = os_log_create("com.apple.screentime.core", "contactStorePrimitives");
  v84[47] = v35;
  v83[48] = CFSTR("coreDataConfigurationStore");
  v34 = os_log_create("com.apple.screentime.core", "coreDataConfigurationStore");
  v84[48] = v34;
  v83[49] = CFSTR("coreDataTransformer");
  v33 = os_log_create("com.apple.screentime.core", "coreDataTransformer");
  v84[49] = v33;
  v83[50] = CFSTR("coreDataObserver");
  v32 = os_log_create("com.apple.screentime.core", "coreDataObserver");
  v84[50] = v32;
  v83[51] = CFSTR("defaultUserPolicyApplicator");
  v31 = os_log_create("com.apple.screentime.core", "defaultUserPolicyApplicator");
  v84[51] = v31;
  v83[52] = CFSTR("deviceCapabilitiesClient");
  v30 = os_log_create("com.apple.screentime.core", "deviceCapabilitiesClient");
  v84[52] = v30;
  v83[53] = CFSTR("deviceInformationPrimitives");
  v29 = os_log_create("com.apple.screentime.core", "deviceInformationPrimitives");
  v84[53] = v29;
  v83[54] = CFSTR("eyeReliefStateWriter");
  v28 = os_log_create("com.apple.screentime.core", "eyeReliefStateWriter");
  v84[54] = v28;
  v83[55] = CFSTR("familyCirclePrimitives");
  v27 = os_log_create("com.apple.screentime.core", "familyCirclePrimitives");
  v84[55] = v27;
  v83[56] = CFSTR("familyCommunicationService");
  v26 = os_log_create("com.apple.screentime.core", "familyCommunicationService");
  v84[56] = v26;
  v83[57] = CFSTR("familyInformationProvider");
  v25 = os_log_create("com.apple.screentime.core", "familyInformationProvider");
  v84[57] = v25;
  v83[58] = CFSTR("familyMemberGenesisStateStore");
  v24 = os_log_create("com.apple.screentime.core", "familyMemberGenesisStateStore");
  v84[58] = v24;
  v83[59] = CFSTR("fileBackedKeyValueStore");
  v23 = os_log_create("com.apple.screentime.core", "fileBackedKeyValueStore");
  v84[59] = v23;
  v83[60] = CFSTR("idsMessageTransport");
  v22 = os_log_create("com.apple.screentime.core", "idsMessageTransport");
  v84[60] = v22;
  v83[61] = CFSTR("idsTransportMessageAddressMap");
  v21 = os_log_create("com.apple.screentime.core", "idsTransportMessageAddressMap");
  v84[61] = v21;
  v83[62] = CFSTR("idsTransportMessageIdentifierMap");
  v20 = os_log_create("com.apple.screentime.core", "idsTransportMessageIdentifierMap");
  v84[62] = v20;
  v83[63] = CFSTR("idsTransportPrimitives");
  v19 = os_log_create("com.apple.screentime.core", "idsTransportPrimitives");
  v84[63] = v19;
  v83[64] = CFSTR("messageTrackingTransportEnvoy");
  v18 = os_log_create("com.apple.screentime.core", "messageTrackingTransportEnvoy");
  v84[64] = v18;
  v83[65] = CFSTR("messageTrackingTransportService");
  v17 = os_log_create("com.apple.screentime.core", "messageTrackingTransportService");
  v84[65] = v17;
  v83[66] = CFSTR("organizationControllerConfigurationAdapter");
  v16 = os_log_create("com.apple.screentime.core", "organizationControllerConfigurationAdapter");
  v84[66] = v16;
  v83[67] = CFSTR("passcodeAuthenticationProviderService");
  v15 = os_log_create("com.apple.screentime.core", "passcodeAuthenticationProviderService");
  v84[67] = v15;
  v83[68] = CFSTR("passcodeProviderService");
  v14 = os_log_create("com.apple.screentime.core", "passcodeProviderService");
  v84[68] = v14;
  v83[69] = CFSTR("promise");
  v13 = os_log_create("com.apple.screentime.core", "promise");
  v84[69] = v13;
  v83[70] = CFSTR("reactor");
  v12 = os_log_create("com.apple.screentime.core", "reactor");
  v84[70] = v12;
  v83[71] = CFSTR("reactorCore");
  v0 = os_log_create("com.apple.screentime.core", "reactorCore");
  v84[71] = v0;
  v83[72] = CFSTR("reactorDirectiveProcessor");
  v1 = os_log_create("com.apple.screentime.core", "reactorDirectiveProcessor");
  v84[72] = v1;
  v83[73] = CFSTR("reactorTool");
  v2 = os_log_create("com.apple.screentime.core", "reactorTool");
  v84[73] = v2;
  v83[74] = CFSTR("remoteViewService");
  v3 = os_log_create("com.apple.screentime.core", "remoteViewService");
  v84[74] = v3;
  v83[75] = CFSTR("setupClient");
  v4 = os_log_create("com.apple.screentime.core", "setupClient");
  v84[75] = v4;
  v83[76] = CFSTR("transportServiceMessageLedger");
  v5 = os_log_create("com.apple.screentime.core", "transportServiceMessageLedger");
  v84[76] = v5;
  v83[77] = CFSTR("userSafetyPolicyWriter");
  v6 = os_log_create("com.apple.screentime.core", "userSafetyPolicyWriter");
  v84[77] = v6;
  v83[78] = CFSTR("v2Disable");
  v7 = os_log_create("com.apple.screentime.core", "v2Disable");
  v84[78] = v7;
  v83[79] = CFSTR("xpcServiceProvider");
  v8 = os_log_create("com.apple.screentime.core", "xpcServiceProvider");
  v84[79] = v8;
  v83[80] = CFSTR("familyMessaging");
  v9 = os_log_create("com.apple.screentime.core", "familyMessaging");
  v84[80] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 81);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_logCategories;
  _logCategories = v10;

}

+ (OS_os_log)conversation
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("conversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (NSDictionary)logCategories
{
  if (logCategories_onceToken != -1)
    dispatch_once(&logCategories_onceToken, &__block_literal_global_14);
  return (NSDictionary *)(id)_logCategories;
}

+ (OS_os_log)accountState
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accountState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)appInfo
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("appInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)appMonitor
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("appMonitor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)apns
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)ask
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)blueprint
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blueprint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)checkpoint
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)cloudkit
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cloudkit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationSafety
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("communicationSafety"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)conduit
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("conduit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)contactsService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contactsService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreAnalytics
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreAnalytics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreAnimation
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreAnimation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataValidation
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreDataValidation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)daemon
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("daemon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceState
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)family
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("family"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyScreenTimeManager
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyScreenTimeManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familySettingsManager
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familySettingsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransport
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idsTransport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)managementStateObserver
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("managementStateObserver"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)mirroring
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mirroring"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)oneMoreMinuteManager
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("oneMoreMinuteManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)payload
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)payloadManager
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("payloadManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)payloadQueue
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("payloadQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)persistence
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("persistence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)personal
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("personal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)pinController
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("pinController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)pinService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("pinService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)privateService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("privateService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)requestManager
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("requestManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)restrictionsMigrator
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("restrictionsMigrator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)settingsService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("settingsService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)screentime
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("screentime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)test
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("test"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)tool
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("tool"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)transaction
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("transaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)usage
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("usage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)userNotifications
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("userNotifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)utility
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("utility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)versionVector
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("versionVector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)askClient
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("askClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)backgroundActivity
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("backgroundActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)cachingCodableStore
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cachingCodableStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)contactStorePrimitives
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contactStorePrimitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataConfigurationStore
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreDataConfigurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataTransformer
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreDataTransformer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataObserver
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coreDataObserver"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)defaultUserPolicyApplicator
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("defaultUserPolicyApplicator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceCapabilitiesClient
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceCapabilitiesClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceInformationPrimitives
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceInformationPrimitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)downtimeClient
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("downtimeClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)eyeReliefStateWriter
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eyeReliefStateWriter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyCirclePrimitives
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyCirclePrimitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyCommunicationService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyCommunicationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyInformationProvider
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyInformationProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyMemberGenesisStateStore
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyMemberGenesisStateStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)fileBackedKeyValueStore
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fileBackedKeyValueStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsMessageTransport
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idsMessageTransport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportMessageAddressMap
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idsTransportMessageAddressMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportMessageIdentifierMap
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idsTransportMessageIdentifierMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportPrimitives
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idsTransportPrimitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)messageTrackingTransportEnvoy
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("messageTrackingTransportEnvoy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)messageTrackingTransportService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("messageTrackingTransportService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)organizationControllerConfigurationAdapter
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("organizationControllerConfigurationAdapter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)passcodeAuthenticationProviderService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("passcodeAuthenticationProviderService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)passcodeProviderService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("passcodeProviderService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)promise
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("promise"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorCore
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reactorCore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorDirectiveProcessor
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reactorDirectiveProcessor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorTool
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reactorTool"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)remoteViewService
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("remoteViewService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)setupClient
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("setupClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)transportServiceMessageLedger
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("transportServiceMessageLedger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)userSafetyPolicyWriter
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("userSafetyPolicyWriter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)v2Disable
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("v2Disable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyMessaging
{
  void *v2;
  void *v3;

  +[STLog logCategories](STLog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("familyMessaging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

@end

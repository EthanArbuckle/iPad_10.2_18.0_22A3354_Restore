@implementation OTEscrowTranslation

+ (id)dictionaryToEscrowAuthenticationInfo:(id)a3
{
  id v3;
  OTEscrowAuthenticationInformation *v4;
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

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    v4 = objc_alloc_init(OTEscrowAuthenticationInformation);
    getkSecureBackupAuthenticationAppleID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationAppleid:](v4, "setAuthenticationAppleid:", v6);

    getkSecureBackupAuthenticationAuthToken();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationAuthToken:](v4, "setAuthenticationAuthToken:", v8);

    getkSecureBackupAuthenticationDSID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationDsid:](v4, "setAuthenticationDsid:", v10);

    getkSecureBackupAuthenticationEscrowProxyURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationEscrowproxyUrl:](v4, "setAuthenticationEscrowproxyUrl:", v12);

    getkSecureBackupAuthenticationiCloudEnvironment();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationIcloudEnvironment:](v4, "setAuthenticationIcloudEnvironment:", v14);

    getkSecureBackupAuthenticationPassword();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationPassword:](v4, "setAuthenticationPassword:", v16);

    getkSecureBackupFMiPUUIDKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setFmipUuid:](v4, "setFmipUuid:", v18);

    getkSecureBackupFMiPRecoveryKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setFmipRecovery:](v4, "setFmipRecovery:", objc_msgSend(v20, "BOOLValue"));

    getkSecureBackupIDMSRecoveryKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setIdmsRecovery:](v4, "setIdmsRecovery:", objc_msgSend(v22, "BOOLValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)escrowAuthenticationInfoToDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authenticationAppleid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E3919890);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationAppleid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationAppleID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v8);

    }
    objc_msgSend(v3, "authenticationAuthToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", &stru_1E3919890);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationAuthToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationAuthToken();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

    }
    objc_msgSend(v3, "authenticationDsid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", &stru_1E3919890);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationDsid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationDSID();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

    }
    objc_msgSend(v3, "authenticationEscrowproxyUrl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", &stru_1E3919890);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationEscrowproxyUrl");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationEscrowProxyURL();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

    }
    objc_msgSend(v3, "authenticationIcloudEnvironment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", &stru_1E3919890);

    if ((v22 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationIcloudEnvironment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationiCloudEnvironment();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v24);

    }
    objc_msgSend(v3, "authenticationPassword");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", &stru_1E3919890);

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v3, "authenticationPassword");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationPassword();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v28);

    }
    objc_msgSend(v3, "fmipUuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", &stru_1E3919890);

    if ((v30 & 1) == 0)
    {
      objc_msgSend(v3, "fmipUuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupFMiPUUIDKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, v32);

    }
    v33 = objc_msgSend(v3, "fmipRecovery");
    v34 = MEMORY[0x1E0C9AAA0];
    v35 = MEMORY[0x1E0C9AAB0];
    if (v33)
      v36 = MEMORY[0x1E0C9AAB0];
    else
      v36 = MEMORY[0x1E0C9AAA0];
    getkSecureBackupFMiPRecoveryKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, v37);

    if (objc_msgSend(v3, "idmsRecovery"))
      v38 = v35;
    else
      v38 = v34;
    getkSecureBackupIDMSRecoveryKey();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, v39);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToCDPRecoveryInformation:(id)a3
{
  id v3;
  OTCDPRecoveryInformation *v4;
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

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    v4 = objc_alloc_init(OTCDPRecoveryInformation);
    getkSecureBackupPassphraseKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setRecoverySecret:](v4, "setRecoverySecret:", v6);

    getkSecureBackupUseCachedPassphraseKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUseCachedSecret:](v4, "setUseCachedSecret:", objc_msgSend(v8, "BOOLValue"));

    getkSecureBackupRecoveryKeyKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setRecoveryKey:](v4, "setRecoveryKey:", v10);

    getkSecureBackupUsesRecoveryKeyKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUsePreviouslyCachedRecoveryKey:](v4, "setUsePreviouslyCachedRecoveryKey:", objc_msgSend(v12, "BOOLValue"));

    getkSecureBackupSilentRecoveryAttemptKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setSilentRecoveryAttempt:](v4, "setSilentRecoveryAttempt:", objc_msgSend(v14, "BOOLValue"));

    getkSecureBackupContainsiCDPDataKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setContainsIcdpData:](v4, "setContainsIcdpData:", objc_msgSend(v16, "BOOLValue"));

    getkSecureBackupUsesMultipleiCSCKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUsesMultipleIcsc:](v4, "setUsesMultipleIcsc:", objc_msgSend(v18, "BOOLValue"));

    getkSecureBackupNonViableRepairKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setNonViableRepair:](v4, "setNonViableRepair:", objc_msgSend(v20, "BOOLValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)cdpRecoveryInformationToDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recoverySecret");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPassphraseKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

    v7 = objc_msgSend(v3, "useCachedSecret");
    v8 = MEMORY[0x1E0C9AAA0];
    v9 = MEMORY[0x1E0C9AAB0];
    if (v7)
      v10 = MEMORY[0x1E0C9AAB0];
    else
      v10 = MEMORY[0x1E0C9AAA0];
    getkSecureBackupUseCachedPassphraseKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

    objc_msgSend(v3, "recoveryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecoveryKeyKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

    if (objc_msgSend(v3, "usePreviouslyCachedRecoveryKey"))
      v14 = v9;
    else
      v14 = v8;
    getkSecureBackupUsesRecoveryKeyKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

    if (objc_msgSend(v3, "silentRecoveryAttempt"))
      v16 = v9;
    else
      v16 = v8;
    getkSecureBackupSilentRecoveryAttemptKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);

    if (objc_msgSend(v3, "containsIcdpData"))
      v18 = v9;
    else
      v18 = v8;
    getkSecureBackupContainsiCDPDataKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

    if (objc_msgSend(v3, "usesMultipleIcsc"))
      v20 = v9;
    else
      v20 = v8;
    getkSecureBackupUsesMultipleiCSCKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v21);

    if (objc_msgSend(v3, "nonViableRepair"))
      v22 = v9;
    else
      v22 = v8;
    getkSecureBackupNonViableRepairKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v23);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDateFormat:", CFSTR("dd-MM-yyyy HH:mm:ss"));
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v8);

    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v4, "dateFromString:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

+ (id)_stringWithSecureBackupDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v4, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dictionaryToMetadata:(id)a3
{
  id v3;
  OTEscrowRecordMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  OTEscrowRecordMetadataPasscodeGeneration *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  OTEscrowRecordMetadataClientMetadata *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    v4 = objc_alloc_init(OTEscrowRecordMetadata);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BackupKeybagDigest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBackupKeybagDigest:](v4, "setBackupKeybagDigest:", v5);

    getkSecureBackupUsesMultipleiCSCKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setSecureBackupUsesMultipleIcscs:](v4, "setSecureBackupUsesMultipleIcscs:", objc_msgSend(v7, "BOOLValue"));

    getkSecureBackupBottleIDKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBottleId:](v4, "setBottleId:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bottleValid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBottleValidity:](v4, "setBottleValidity:", v10);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.securebackup.timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _dateWithSecureBackupDateString:](OTEscrowTranslation, "_dateWithSecureBackupDateString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v12;
    objc_msgSend(v12, "timeIntervalSince1970");
    -[OTEscrowRecordMetadata setSecureBackupTimestamp:](v4, "setSecureBackupTimestamp:", (unint64_t)v13);
    getkSecureBackupEscrowedSPKIKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setEscrowedSpki:](v4, "setEscrowedSpki:", v15);

    getkSecureBackupPeerInfoDataKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setPeerInfo:](v4, "setPeerInfo:", v17);

    getkSecureBackupSerialNumberKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setSerial:](v4, "setSerial:", v19);

    getkSecureBackupBuildVersionKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBuild:](v4, "setBuild:", v21);

    getkSecureBackupPasscodeGenerationKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc_init(OTEscrowRecordMetadataPasscodeGeneration);
      -[OTEscrowRecordMetadata setPasscodeGeneration:](v4, "setPasscodeGeneration:", v24);

      getkSecureBackupPasscodeGenerationKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v26, "longLongValue");
      -[OTEscrowRecordMetadata passcodeGeneration](v4, "passcodeGeneration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setValue:", v27);

    }
    getkSecureBackupClientMetadataKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc_init(OTEscrowRecordMetadataClientMetadata);
    -[OTEscrowRecordMetadata setClientMetadata:](v4, "setClientMetadata:", v31);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_platform"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "longLongValue");
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDevicePlatform:", v33);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("SecureBackupMetadataTimestamp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _dateWithSecureBackupDateString:](OTEscrowTranslation, "_dateWithSecureBackupDateString:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "timeIntervalSince1970");
    v38 = (unint64_t)v37;
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSecureBackupMetadataTimestamp:", v38);

    getkSecureBackupNumericPassphraseLengthKey();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v41, "longLongValue");
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSecureBackupNumericPassphraseLength:", v42);

    getkSecureBackupUsesComplexPassphraseKey();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "BOOLValue");
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setSecureBackupUsesComplexPassphrase:", v46);

    getkSecureBackupUsesNumericPassphraseKey();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "BOOLValue");
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setSecureBackupUsesNumericPassphrase:", v50);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_color"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setDeviceColor:", v52);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_enclosure_color"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDeviceEnclosureColor:", v54);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_mid"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDeviceMid:", v56);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_model"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setDeviceModel:", v58);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_model_class"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setDeviceModelClass:", v60);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_model_version"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setDeviceModelVersion:", v62);

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device_name"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setDeviceName:", v64);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToEscrowRecord:(id)a3
{
  id v3;
  OTEscrowRecord *v4;
  void *v5;
  void *v6;
  double v7;
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

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    v4 = objc_alloc_init(OTEscrowRecord);
    getkSecureBackupEscrowDateKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeIntervalSince1970");
    -[OTEscrowRecord setCreationDate:](v4, "setCreationDate:", (unint64_t)v7);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation dictionaryToMetadata:](OTEscrowTranslation, "dictionaryToMetadata:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setEscrowInformationMetadata:](v4, "setEscrowInformationMetadata:", v9);

    getkSecureBackupRemainingAttemptsKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[OTEscrowRecord setRemainingAttempts:](v4, "setRemainingAttempts:", objc_msgSend(v11, "longLongValue"));
    getkSecureBackupRecordLabelKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setLabel:](v4, "setLabel:", v13);

    getkSecureBackupRecordStatusKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecordStatus:](v4, "setRecordStatus:", objc_msgSend(v15, "isEqualToString:", CFSTR("valid")) ^ 1);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("silentAttemptAllowed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setSilentAttemptAllowed:](v4, "setSilentAttemptAllowed:", objc_msgSend(v16, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FEDERATIONID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setFederationId:](v4, "setFederationId:", v17);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EXPECTEDFEDERATIONID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setExpectedFederationId:](v4, "setExpectedFederationId:", v18);

    getkSecureBackupRecordIDKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecordId:](v4, "setRecordId:", v20);

    getkSecureBackupPeerInfoSerialNumberKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setSerialNumber:](v4, "setSerialNumber:", v22);

    getkSecureBackupCoolOffEndKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      getkSecureBackupCoolOffEndKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTEscrowRecord setCoolOffEnd:](v4, "setCoolOffEnd:", objc_msgSend(v26, "longLongValue"));

    }
    getkSecureBackupRecoveryStatusKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecoveryStatus:](v4, "setRecoveryStatus:", objc_msgSend(v28, "intValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)metadataToDictionary:(id)a3
{
  id v3;
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
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

    objc_msgSend(v3, "backupKeybagDigest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("BackupKeybagDigest"));

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v3, "secureBackupUsesMultipleIcscs"));
    getkSecureBackupUsesMultipleiCSCKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

    objc_msgSend(v3, "bottleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupBottleIDKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

    objc_msgSend(v3, "bottleValidity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("bottleValid"));

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v3, "secureBackupTimestamp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _stringWithSecureBackupDate:](OTEscrowTranslation, "_stringWithSecureBackupDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("com.apple.securebackup.timestamp"));

    objc_msgSend(v3, "escrowedSpki");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupEscrowedSPKIKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

    objc_msgSend(v3, "peerInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPeerInfoDataKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v18);

    objc_msgSend(v3, "serial");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupSerialNumberKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

    objc_msgSend(v3, "build");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupBuildVersionKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v22);

    objc_msgSend(v3, "passcodeGeneration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v23, "hasValue");

    if ((_DWORD)v22)
    {
      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "passcodeGeneration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithUnsignedLongLong:", objc_msgSend(v25, "value"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupPasscodeGenerationKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v27);

    }
    v28 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v3, "clientMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithUnsignedLongLong:", objc_msgSend(v29, "devicePlatform"));
    getkSecureBackupClientMetadataKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, CFSTR("device_platform"));

    v33 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "clientMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v34, "secureBackupMetadataTimestamp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _stringWithSecureBackupDate:](OTEscrowTranslation, "_stringWithSecureBackupDate:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v36, CFSTR("SecureBackupMetadataTimestamp"));

    v39 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v3, "clientMetadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithUnsignedLongLong:", objc_msgSend(v40, "secureBackupNumericPassphraseLength"));
    getkSecureBackupClientMetadataKey();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupNumericPassphraseLengthKey();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, v44);

    v45 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v3, "clientMetadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithUnsignedLongLong:", objc_msgSend(v46, "secureBackupUsesComplexPassphrase"));
    getkSecureBackupClientMetadataKey();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesComplexPassphraseKey();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v47, v50);

    v51 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v3, "clientMetadata");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithUnsignedLongLong:", objc_msgSend(v52, "secureBackupUsesNumericPassphrase"));
    getkSecureBackupClientMetadataKey();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesNumericPassphraseKey();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v53, v56);

    objc_msgSend(v3, "clientMetadata");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "deviceColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v58, CFSTR("device_color"));

    objc_msgSend(v3, "clientMetadata");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "deviceEnclosureColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v62, CFSTR("device_enclosure_color"));

    objc_msgSend(v3, "clientMetadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "deviceMid");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v66, CFSTR("device_mid"));

    objc_msgSend(v3, "clientMetadata");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "deviceModel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setObject:forKeyedSubscript:", v70, CFSTR("device_model"));

    objc_msgSend(v3, "clientMetadata");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "deviceModelClass");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKeyedSubscript:", v74, CFSTR("device_model_class"));

    objc_msgSend(v3, "clientMetadata");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "deviceModelVersion");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKeyedSubscript:", v78, CFSTR("device_model_version"));

    objc_msgSend(v3, "clientMetadata");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "deviceName");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v82, CFSTR("device_name"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)escrowRecordToDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
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

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v3, "creationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupEscrowDateKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

    objc_msgSend(v3, "escrowInformationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation metadataToDictionary:](OTEscrowTranslation, "metadataToDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v3, "remainingAttempts"));
    getkSecureBackupRemainingAttemptsKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

    objc_msgSend(v3, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecordLabelKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

    if (objc_msgSend(v3, "recordStatus"))
      v13 = CFSTR("invalid");
    else
      v13 = CFSTR("valid");
    getkSecureBackupRecordStatusKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v3, "silentAttemptAllowed"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("silentAttemptAllowed"));

    objc_msgSend(v3, "federationId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("FEDERATIONID"));

    objc_msgSend(v3, "expectedFederationId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("EXPECTEDFEDERATIONID"));

    objc_msgSend(v3, "recordId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecordIDKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

    objc_msgSend(v3, "serialNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPeerInfoSerialNumberKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "coolOffEnd"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupCoolOffEndKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "recoveryStatus"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecoveryStatusKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToCDPRecordContext:(id)a3
{
  id v3;
  OTICDPRecordContext *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    v4 = objc_alloc_init(OTICDPRecordContext);
    +[OTEscrowTranslation dictionaryToEscrowAuthenticationInfo:](OTEscrowTranslation, "dictionaryToEscrowAuthenticationInfo:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTICDPRecordContext setAuthInfo:](v4, "setAuthInfo:", v5);

    +[OTEscrowTranslation dictionaryToCDPRecoveryInformation:](OTEscrowTranslation, "dictionaryToCDPRecoveryInformation:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTICDPRecordContext setCdpInfo:](v4, "setCdpInfo:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)CDPRecordContextToDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation escrowAuthenticationInfoToDictionary:](OTEscrowTranslation, "escrowAuthenticationInfoToDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);

    objc_msgSend(v3, "cdpInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation cdpRecoveryInformationToDictionary:](OTEscrowTranslation, "cdpRecoveryInformationToDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportedRestorePath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "authInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "idmsRecovery") & 1) == 0)
  {
    objc_msgSend(v5, "authInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fmipUuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "authInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fmipUuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToString:", &stru_1E3919890))
      {
        LOBYTE(v7) = 0;
        goto LABEL_8;
      }
    }
    objc_msgSend(v5, "authInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "fmipRecovery") & 1) != 0)
    {

      LOBYTE(v7) = 0;
      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v5, "cdpInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recoveryKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v5, "cdpInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recoveryKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      if (!objc_msgSend(v16, "isEqualToString:", &stru_1E3919890))
      {
        LOBYTE(v7) = 0;
        goto LABEL_18;
      }
      v17 = v12;
    }
    else
    {
      v17 = v12;
    }
    objc_msgSend(v5, "cdpInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v15, "usePreviouslyCachedRecoveryKey") ^ 1;

    if (!v13)
    {

LABEL_20:
      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
    v12 = v17;
LABEL_18:

    goto LABEL_20;
  }
  LOBYTE(v7) = 0;
LABEL_10:

  return v7;
}

@end

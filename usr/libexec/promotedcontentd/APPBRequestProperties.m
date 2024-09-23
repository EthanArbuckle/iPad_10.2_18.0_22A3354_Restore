@implementation APPBRequestProperties

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *deviceModel;
  NSString *appID;
  uint64_t runState;
  void *v9;
  NSString *carrierMNC;
  NSString *carrierMCC;
  $91ED43557AAACFFE87335DF110E99599 has;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSMutableArray *userKeyboards;
  $91ED43557AAACFFE87335DF110E99599 v19;
  void *v20;
  NSData *iAdID;
  NSString *appVersion;
  void *v23;
  NSString *countryCode;
  $91ED43557AAACFFE87335DF110E99599 v25;
  void *v26;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  $91ED43557AAACFFE87335DF110E99599 v29;
  void *v30;
  void *v31;
  NSString *iTunesStore;
  NSString *applicationLinkedOnOS;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  $91ED43557AAACFFE87335DF110E99599 v36;
  uint64_t deviceMode;
  void *v38;
  void *v39;
  uint64_t connectionType;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t accountType;
  void *v53;
  NSData *dPID;
  NSString *locality;
  NSString *administrativeArea;
  NSString *subAdministrativeArea;
  NSString *isoCountryCode;
  NSString *postalCode;
  void *v60;
  NSString *campaignNameSpace;
  $91ED43557AAACFFE87335DF110E99599 v62;
  void *v63;
  id v64;
  void *v66;
  void *v67;
  void *v68;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  appID = self->_appID;
  if (appID)
    objc_msgSend(v5, "setObject:forKey:", appID, CFSTR("appID"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    runState = self->_runState;
    if (runState >= 3)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_runState));
    else
      v9 = *(&off_100215120 + runState);
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("runState"));

  }
  carrierMNC = self->_carrierMNC;
  if (carrierMNC)
    objc_msgSend(v5, "setObject:forKey:", carrierMNC, CFSTR("carrierMNC"));
  carrierMCC = self->_carrierMCC;
  if (carrierMCC)
    objc_msgSend(v5, "setObject:forKey:", carrierMCC, CFSTR("carrierMCC"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isOnInternationalDataRoaming));
    objc_msgSend(v5, "setObject:forKey:", v39, CFSTR("isOnInternationalDataRoaming"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  connectionType = self->_connectionType;
  if (connectionType >= 0xB)
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType));
  else
    v41 = *(&off_100215138 + connectionType);
  objc_msgSend(v5, "setObject:forKey:", v41, CFSTR("connectionType"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *(float *)&v4 = self->_timezone;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("timezone"));

  }
LABEL_18:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_screenWidth));
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("screenWidth"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_screenHeight));
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("screenHeight"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_screenDPI));
  objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("screenDPI"));

  userKeyboards = self->_userKeyboards;
  if (userKeyboards)
    objc_msgSend(v5, "setObject:forKey:", userKeyboards, CFSTR("userKeyboard"));
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_clientClockTime));
    objc_msgSend(v5, "setObject:forKey:", v42, CFSTR("clientClockTime"));

    v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x400) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v19 & 0x800) == 0)
        goto LABEL_23;
      goto LABEL_66;
    }
  }
  else if ((*(_WORD *)&v19 & 0x400) == 0)
  {
    goto LABEL_22;
  }
  *(float *)&v17 = self->_localLatency;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  objc_msgSend(v5, "setObject:forKey:", v43, CFSTR("localLatency"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v19 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_localLatencyCount));
  objc_msgSend(v5, "setObject:forKey:", v44, CFSTR("localLatencyCount"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v19 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  *(float *)&v17 = self->_localLatencyStddev;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  objc_msgSend(v5, "setObject:forKey:", v45, CFSTR("localLatencyStddev"));

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x80) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v19 & 0x100) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  *(float *)&v17 = self->_localBandwidth;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  objc_msgSend(v5, "setObject:forKey:", v46, CFSTR("localBandwidth"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v19 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_69:
  *(float *)&v17 = self->_localBandwidthBytes;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  objc_msgSend(v5, "setObject:forKey:", v47, CFSTR("localBandwidthBytes"));

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_27:
    *(float *)&v17 = self->_localBandwidthStddev;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("localBandwidthStddev"));

  }
LABEL_28:
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v5, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v5, "setObject:forKey:", appVersion, CFSTR("appVersion"));
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_denyExplicit));
    objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("denyExplicit"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v5, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x10) != 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_appsRank));
    objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("appsRank"));

    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x2000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v25 & 0x10000) == 0)
        goto LABEL_39;
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
    goto LABEL_38;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_moviesRank));
  objc_msgSend(v5, "setObject:forKey:", v49, CFSTR("moviesRank"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v25 & 0x100000) == 0)
      goto LABEL_40;
    goto LABEL_74;
  }
LABEL_73:
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tvshowsRank));
  objc_msgSend(v5, "setObject:forKey:", v50, CFSTR("tvshowsRank"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x100000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v25 & 0x80000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_74:
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_allowInstallApps));
  objc_msgSend(v5, "setObject:forKey:", v51, CFSTR("allowInstallApps"));

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_41:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_allowITunes));
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("allowITunes"));

  }
LABEL_42:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
    objc_msgSend(v5, "setObject:forKey:", osVersionAndBuild, CFSTR("osVersionAndBuild"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v5, "setObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    *(float *)&v17 = self->_unfilledDuration;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("unfilledDuration"));

    v29 = self->_has;
  }
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_unfilledClientCount));
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("unfilledClientCount"));

  }
  iTunesStore = self->_iTunesStore;
  if (iTunesStore)
    objc_msgSend(v5, "setObject:forKey:", iTunesStore, CFSTR("iTunesStore"));
  applicationLinkedOnOS = self->_applicationLinkedOnOS;
  if (applicationLinkedOnOS)
    objc_msgSend(v5, "setObject:forKey:", applicationLinkedOnOS, CFSTR("applicationLinkedOnOS"));
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    objc_msgSend(v5, "setObject:forKey:", anonymousDemandiAdID, CFSTR("anonymousDemandiAdID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v5, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x40) != 0)
  {
    deviceMode = self->_deviceMode;
    if (deviceMode >= 3)
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceMode));
    else
      v38 = *(&off_100215190 + deviceMode);
    objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("deviceMode"));

    v36 = self->_has;
  }
  if ((*(_BYTE *)&v36 & 2) != 0)
  {
    accountType = self->_accountType;
    if (accountType >= 8)
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_accountType));
    else
      v53 = *(&off_1002151A8 + accountType);
    objc_msgSend(v5, "setObject:forKey:", v53, CFSTR("accountType"));

  }
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v5, "setObject:forKey:", dPID, CFSTR("DPID"));
  locality = self->_locality;
  if (locality)
    objc_msgSend(v5, "setObject:forKey:", locality, CFSTR("locality"));
  administrativeArea = self->_administrativeArea;
  if (administrativeArea)
    objc_msgSend(v5, "setObject:forKey:", administrativeArea, CFSTR("administrativeArea"));
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea)
    objc_msgSend(v5, "setObject:forKey:", subAdministrativeArea, CFSTR("subAdministrativeArea"));
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
    objc_msgSend(v5, "setObject:forKey:", isoCountryCode, CFSTR("isoCountryCode"));
  postalCode = self->_postalCode;
  if (postalCode)
    objc_msgSend(v5, "setObject:forKey:", postalCode, CFSTR("postalCode"));
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isTest));
    objc_msgSend(v5, "setObject:forKey:", v60, CFSTR("isTest"));

  }
  campaignNameSpace = self->_campaignNameSpace;
  if (campaignNameSpace)
    objc_msgSend(v5, "setObject:forKey:", campaignNameSpace, CFSTR("campaignNameSpace"));
  v62 = self->_has;
  if ((*(_BYTE *)&v62 & 4) != 0)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_advertisingIdentifierMonthResetCount));
    objc_msgSend(v5, "setObject:forKey:", v66, CFSTR("advertisingIdentifierMonthResetCount"));

    v62 = self->_has;
    if ((*(_DWORD *)&v62 & 0x2000000) == 0)
    {
LABEL_104:
      if ((*(_DWORD *)&v62 & 0x400000) == 0)
        goto LABEL_105;
LABEL_110:
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_internalUserWantsProdAds));
      objc_msgSend(v5, "setObject:forKey:", v68, CFSTR("internalUserWantsProdAds"));

      if ((*(_DWORD *)&self->_has & 8) == 0)
        goto LABEL_107;
      goto LABEL_106;
    }
  }
  else if ((*(_DWORD *)&v62 & 0x2000000) == 0)
  {
    goto LABEL_104;
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_limitAdTracking));
  objc_msgSend(v5, "setObject:forKey:", v67, CFSTR("limitAdTracking"));

  v62 = self->_has;
  if ((*(_DWORD *)&v62 & 0x400000) != 0)
    goto LABEL_110;
LABEL_105:
  if ((*(_BYTE *)&v62 & 8) != 0)
  {
LABEL_106:
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_appStoreViewAdVersion));
    objc_msgSend(v5, "setObject:forKey:", v63, CFSTR("appStoreViewAdVersion"));

  }
LABEL_107:
  v64 = v5;

  return v64;
}

- (void)setIsTest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isTest = a3;
}

- (void)setRunState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_runState = a3;
}

- (void)setClientClockTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_clientClockTime = a3;
}

- (void)setAppStoreViewAdVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_appStoreViewAdVersion = a3;
}

- (void)setTimezone:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timezone = a3;
}

- (void)setOsVersionAndBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, a3);
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void)setDeviceMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_deviceMode = a3;
}

- (void)setConnectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_connectionType = a3;
}

- (void)setTvshowsRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tvshowsRank = a3;
}

- (void)setMoviesRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_moviesRank = a3;
}

- (void)setDenyExplicit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_denyExplicit = a3;
}

- (void)setAppsRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_appsRank = a3;
}

- (void)setAllowInstallApps:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_allowInstallApps = a3;
}

- (void)setAllowITunes:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_allowITunes = a3;
}

- (void)setUserKeyboards:(id)a3
{
  objc_storeStrong((id *)&self->_userKeyboards, a3);
}

- (void)setScreenWidth:(int)a3
{
  self->_screenWidth = a3;
}

- (void)setScreenHeight:(int)a3
{
  self->_screenHeight = a3;
}

- (void)setScreenDPI:(int)a3
{
  self->_screenDPI = a3;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (void)setITunesStore:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStore, a3);
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (void)setAnonymousDemandiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, a3);
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setAccountType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_accountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_carrierMNC, 0);
  objc_storeStrong((id *)&self->_carrierMCC, 0);
  objc_storeStrong((id *)&self->_campaignNameSpace, 0);
  objc_storeStrong((id *)&self->_applicationLinkedOnOS, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *deviceModel;
  NSString *appID;
  NSString *carrierMNC;
  NSString *carrierMCC;
  $91ED43557AAACFFE87335DF110E99599 has;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  $91ED43557AAACFFE87335DF110E99599 v16;
  NSData *iAdID;
  NSString *appVersion;
  NSString *countryCode;
  $91ED43557AAACFFE87335DF110E99599 v20;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  $91ED43557AAACFFE87335DF110E99599 v23;
  NSString *iTunesStore;
  NSString *applicationLinkedOnOS;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  $91ED43557AAACFFE87335DF110E99599 v28;
  NSData *dPID;
  NSString *locality;
  NSString *administrativeArea;
  NSString *subAdministrativeArea;
  NSString *isoCountryCode;
  NSString *postalCode;
  NSString *campaignNameSpace;
  $91ED43557AAACFFE87335DF110E99599 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = v4;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    PBDataWriterWriteStringField(v4, deviceModel, 2);
  appID = self->_appID;
  if (appID)
    PBDataWriterWriteStringField(v5, appID, 3);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt32Field(v5, self->_runState, 4);
  carrierMNC = self->_carrierMNC;
  if (carrierMNC)
    PBDataWriterWriteStringField(v5, carrierMNC, 5);
  carrierMCC = self->_carrierMCC;
  if (carrierMCC)
    PBDataWriterWriteStringField(v5, carrierMCC, 6);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isOnInternationalDataRoaming, 9);
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field(v5, self->_connectionType, 10);
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_14:
    PBDataWriterWriteFloatField(v5, 14, self->_timezone);
LABEL_15:
  PBDataWriterWriteInt32Field(v5, self->_screenWidth, 15);
  PBDataWriterWriteInt32Field(v5, self->_screenHeight, 16);
  PBDataWriterWriteInt32Field(v5, self->_screenDPI, 17);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = self->_userKeyboards;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v15), 19);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v13);
  }

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 21, self->_clientClockTime);
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x400) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v16 & 0x800) == 0)
        goto LABEL_25;
      goto LABEL_91;
    }
  }
  else if ((*(_WORD *)&v16 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteFloatField(v5, 22, self->_localLatency);
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v16 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field(v5, self->_localLatencyCount, 23);
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v16 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteFloatField(v5, 24, self->_localLatencyStddev);
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v16 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteFloatField(v5, 25, self->_localBandwidth);
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v16 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_94:
  PBDataWriterWriteFloatField(v5, 26, self->_localBandwidthBytes);
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_29:
    PBDataWriterWriteFloatField(v5, 27, self->_localBandwidthStddev);
LABEL_30:
  iAdID = self->_iAdID;
  if (iAdID)
    PBDataWriterWriteDataField(v5, iAdID, 28);
  appVersion = self->_appVersion;
  if (appVersion)
    PBDataWriterWriteStringField(v5, appVersion, 29);
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    PBDataWriterWriteBOOLField(v5, self->_denyExplicit, 30);
  countryCode = self->_countryCode;
  if (countryCode)
    PBDataWriterWriteStringField(v5, countryCode, 31);
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_appsRank, 32);
    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x2000) == 0)
    {
LABEL_40:
      if ((*(_DWORD *)&v20 & 0x10000) == 0)
        goto LABEL_41;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteInt32Field(v5, self->_moviesRank, 33);
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v20 & 0x100000) == 0)
      goto LABEL_42;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field(v5, self->_tvshowsRank, 34);
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v20 & 0x80000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_99:
  PBDataWriterWriteBOOLField(v5, self->_allowInstallApps, 35);
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
LABEL_43:
    PBDataWriterWriteBOOLField(v5, self->_allowITunes, 36);
LABEL_44:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
    PBDataWriterWriteStringField(v5, osVersionAndBuild, 39);
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    PBDataWriterWriteStringField(v5, localeIdentifier, 40);
  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000) != 0)
  {
    PBDataWriterWriteFloatField(v5, 41, self->_unfilledDuration);
    v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x20000) != 0)
    PBDataWriterWriteInt32Field(v5, self->_unfilledClientCount, 42);
  iTunesStore = self->_iTunesStore;
  if (iTunesStore)
    PBDataWriterWriteStringField(v5, iTunesStore, 43);
  applicationLinkedOnOS = self->_applicationLinkedOnOS;
  if (applicationLinkedOnOS)
    PBDataWriterWriteStringField(v5, applicationLinkedOnOS, 45);
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    PBDataWriterWriteDataField(v5, anonymousDemandiAdID, 48);
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    PBDataWriterWriteDataField(v5, contentiAdID, 49);
  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_deviceMode, 50);
    v28 = self->_has;
  }
  if ((*(_BYTE *)&v28 & 2) != 0)
    PBDataWriterWriteInt32Field(v5, self->_accountType, 51);
  dPID = self->_dPID;
  if (dPID)
    PBDataWriterWriteDataField(v5, dPID, 52);
  locality = self->_locality;
  if (locality)
    PBDataWriterWriteStringField(v5, locality, 53);
  administrativeArea = self->_administrativeArea;
  if (administrativeArea)
    PBDataWriterWriteStringField(v5, administrativeArea, 54);
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea)
    PBDataWriterWriteStringField(v5, subAdministrativeArea, 55);
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
    PBDataWriterWriteStringField(v5, isoCountryCode, 56);
  postalCode = self->_postalCode;
  if (postalCode)
    PBDataWriterWriteStringField(v5, postalCode, 57);
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    PBDataWriterWriteBOOLField(v5, self->_isTest, 58);
  campaignNameSpace = self->_campaignNameSpace;
  if (campaignNameSpace)
    PBDataWriterWriteStringField(v5, campaignNameSpace, 59);
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 4) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_advertisingIdentifierMonthResetCount, 60);
    v36 = self->_has;
    if ((*(_DWORD *)&v36 & 0x2000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v36 & 0x400000) == 0)
        goto LABEL_83;
LABEL_103:
      PBDataWriterWriteBOOLField(v5, self->_internalUserWantsProdAds, 62);
      if ((*(_DWORD *)&self->_has & 8) == 0)
        goto LABEL_85;
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v36 & 0x2000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField(v5, self->_limitAdTracking, 61);
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
    goto LABEL_103;
LABEL_83:
  if ((*(_BYTE *)&v36 & 8) != 0)
LABEL_84:
    PBDataWriterWriteInt32Field(v5, self->_appStoreViewAdVersion, 63);
LABEL_85:

}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (int)runState
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_runState;
  else
    return 0;
}

- (void)setHasRunState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRunState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215120 + a3);
}

- (int)StringAsRunState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Simulator")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevelopmentDevice")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumerDevice")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCarrierMNC
{
  return self->_carrierMNC != 0;
}

- (BOOL)hasCarrierMCC
{
  return self->_carrierMCC != 0;
}

- (void)setIsOnInternationalDataRoaming:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isOnInternationalDataRoaming = a3;
}

- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsOnInternationalDataRoaming
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)connectionType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setHasConnectionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215138 + a3);
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownConnection")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_G")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_5G")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_G")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_5G")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_75G")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_H_Plus")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_4G")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_5G")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasTimezone:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimezone
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearUserKeyboards
{
  -[NSMutableArray removeAllObjects](self->_userKeyboards, "removeAllObjects");
}

- (void)addUserKeyboard:(id)a3
{
  id v4;
  NSMutableArray *userKeyboards;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userKeyboards = self->_userKeyboards;
  v8 = v4;
  if (!userKeyboards)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_userKeyboards;
    self->_userKeyboards = v6;

    v4 = v8;
    userKeyboards = self->_userKeyboards;
  }
  -[NSMutableArray addObject:](userKeyboards, "addObject:", v4);

}

- (unint64_t)userKeyboardsCount
{
  return (unint64_t)-[NSMutableArray count](self->_userKeyboards, "count");
}

- (id)userKeyboardAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_userKeyboards, "objectAtIndex:", a3);
}

+ (Class)userKeyboardType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)setHasClientClockTime:(BOOL)a3
{
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasClientClockTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLocalLatency:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_localLatency = a3;
}

- (void)setHasLocalLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLocalLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLocalLatencyCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_localLatencyCount = a3;
}

- (void)setHasLocalLatencyCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLocalLatencyCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLocalLatencyStddev:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_localLatencyStddev = a3;
}

- (void)setHasLocalLatencyStddev:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasLocalLatencyStddev
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLocalBandwidth:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_localBandwidth = a3;
}

- (void)setHasLocalBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLocalBandwidth
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setLocalBandwidthBytes:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_localBandwidthBytes = a3;
}

- (void)setHasLocalBandwidthBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocalBandwidthBytes
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLocalBandwidthStddev:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_localBandwidthStddev = a3;
}

- (void)setHasLocalBandwidthStddev:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocalBandwidthStddev
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setHasDenyExplicit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasDenyExplicit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setHasAppsRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAppsRank
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMoviesRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMoviesRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasTvshowsRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTvshowsRank
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasAllowInstallApps:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasAllowInstallApps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasAllowITunes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAllowITunes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (void)setUnfilledDuration:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_unfilledDuration = a3;
}

- (void)setHasUnfilledDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUnfilledDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUnfilledClientCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_unfilledClientCount = a3;
}

- (void)setHasUnfilledClientCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUnfilledClientCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (BOOL)hasApplicationLinkedOnOS
{
  return self->_applicationLinkedOnOS != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (int)deviceMode
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_deviceMode;
  else
    return 0;
}

- (void)setHasDeviceMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDeviceMode
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)deviceModeAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215190 + a3);
}

- (int)StringAsDeviceMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EducationMode")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GuestMode")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)accountType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_accountType;
  else
    return 0;
}

- (void)setHasAccountType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAccountType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)accountTypeAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002151A8 + a3);
}

- (int)StringAsAccountType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoAccount")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Consumer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManagedAccount")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U13")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("T13")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U18")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown_Age")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SensitiveContentEligible")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (void)setHasIsTest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsTest
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasCampaignNameSpace
{
  return self->_campaignNameSpace != 0;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasLimitAdTracking
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setInternalUserWantsProdAds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_internalUserWantsProdAds = a3;
}

- (void)setHasInternalUserWantsProdAds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasInternalUserWantsProdAds
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasAppStoreViewAdVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAppStoreViewAdVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBRequestProperties;
  v3 = -[APPBRequestProperties description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBRequestProperties dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return APPBRequestPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  $91ED43557AAACFFE87335DF110E99599 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  $91ED43557AAACFFE87335DF110E99599 v10;
  _BYTE *v11;
  $91ED43557AAACFFE87335DF110E99599 v12;
  $91ED43557AAACFFE87335DF110E99599 v13;
  $91ED43557AAACFFE87335DF110E99599 v14;
  $91ED43557AAACFFE87335DF110E99599 v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (self->_deviceModel)
  {
    objc_msgSend(v4, "setDeviceModel:");
    v4 = v16;
  }
  if (self->_appID)
  {
    objc_msgSend(v16, "setAppID:");
    v4 = v16;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v4 + 62) = self->_runState;
    *((_DWORD *)v4 + 76) |= 0x4000u;
  }
  if (self->_carrierMNC)
  {
    objc_msgSend(v16, "setCarrierMNC:");
    v4 = v16;
  }
  if (self->_carrierMCC)
  {
    objc_msgSend(v16, "setCarrierMCC:");
    v4 = v16;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
LABEL_84:
    *((_DWORD *)v4 + 28) = self->_connectionType;
    *((_DWORD *)v4 + 76) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_BYTE *)v4 + 300) = self->_isOnInternationalDataRoaming;
  *((_DWORD *)v4 + 76) |= 0x800000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_84;
LABEL_13:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 68) = LODWORD(self->_timezone);
    *((_DWORD *)v4 + 76) |= 0x8000u;
  }
LABEL_15:
  *((_DWORD *)v4 + 65) = self->_screenWidth;
  *((_DWORD *)v4 + 64) = self->_screenHeight;
  *((_DWORD *)v4 + 63) = self->_screenDPI;
  if (-[APPBRequestProperties userKeyboardsCount](self, "userKeyboardsCount"))
  {
    objc_msgSend(v16, "clearUserKeyboards");
    v6 = -[APPBRequestProperties userKeyboardsCount](self, "userKeyboardsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBRequestProperties userKeyboardAtIndex:](self, "userKeyboardAtIndex:", i));
        objc_msgSend(v16, "addUserKeyboard:", v9);

      }
    }
  }
  v10 = self->_has;
  v11 = v16;
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
    *((_QWORD *)v16 + 1) = *(_QWORD *)&self->_clientClockTime;
    *((_DWORD *)v16 + 76) |= 1u;
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v10 & 0x800) == 0)
        goto LABEL_22;
      goto LABEL_88;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v16 + 49) = LODWORD(self->_localLatency);
  *((_DWORD *)v16 + 76) |= 0x400u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v16 + 50) = self->_localLatencyCount;
  *((_DWORD *)v16 + 76) |= 0x800u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v10 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v16 + 51) = LODWORD(self->_localLatencyStddev);
  *((_DWORD *)v16 + 76) |= 0x1000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v16 + 46) = LODWORD(self->_localBandwidth);
  *((_DWORD *)v16 + 76) |= 0x80u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_91:
  *((_DWORD *)v16 + 47) = LODWORD(self->_localBandwidthBytes);
  *((_DWORD *)v16 + 76) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_26:
    *((_DWORD *)v16 + 48) = LODWORD(self->_localBandwidthStddev);
    *((_DWORD *)v16 + 76) |= 0x200u;
  }
LABEL_27:
  if (self->_iAdID)
  {
    objc_msgSend(v16, "setIAdID:");
    v11 = v16;
  }
  if (self->_appVersion)
  {
    objc_msgSend(v16, "setAppVersion:");
    v11 = v16;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    v11[298] = self->_denyExplicit;
    *((_DWORD *)v11 + 76) |= 0x200000u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v16, "setCountryCode:");
    v11 = v16;
  }
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
    *((_DWORD *)v11 + 20) = self->_appsRank;
    *((_DWORD *)v11 + 76) |= 0x10u;
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x2000) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v12 & 0x10000) == 0)
        goto LABEL_38;
      goto LABEL_95;
    }
  }
  else if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
    goto LABEL_37;
  }
  *((_DWORD *)v11 + 56) = self->_moviesRank;
  *((_DWORD *)v11 + 76) |= 0x2000u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x100000) == 0)
      goto LABEL_39;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v11 + 69) = self->_tvshowsRank;
  *((_DWORD *)v11 + 76) |= 0x10000u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_96:
  v11[297] = self->_allowInstallApps;
  *((_DWORD *)v11 + 76) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_40:
    v11[296] = self->_allowITunes;
    *((_DWORD *)v11 + 76) |= 0x80000u;
  }
LABEL_41:
  if (self->_osVersionAndBuild)
  {
    objc_msgSend(v16, "setOsVersionAndBuild:");
    v11 = v16;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v16, "setLocaleIdentifier:");
    v11 = v16;
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    *((_DWORD *)v11 + 71) = LODWORD(self->_unfilledDuration);
    *((_DWORD *)v11 + 76) |= 0x40000u;
    v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    *((_DWORD *)v11 + 70) = self->_unfilledClientCount;
    *((_DWORD *)v11 + 76) |= 0x20000u;
  }
  if (self->_iTunesStore)
  {
    objc_msgSend(v16, "setITunesStore:");
    v11 = v16;
  }
  if (self->_applicationLinkedOnOS)
  {
    objc_msgSend(v16, "setApplicationLinkedOnOS:");
    v11 = v16;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v16, "setAnonymousDemandiAdID:");
    v11 = v16;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v16, "setContentiAdID:");
    v11 = v16;
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    *((_DWORD *)v11 + 36) = self->_deviceMode;
    *((_DWORD *)v11 + 76) |= 0x40u;
    v14 = self->_has;
  }
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    *((_DWORD *)v11 + 4) = self->_accountType;
    *((_DWORD *)v11 + 76) |= 2u;
  }
  if (self->_dPID)
  {
    objc_msgSend(v16, "setDPID:");
    v11 = v16;
  }
  if (self->_locality)
  {
    objc_msgSend(v16, "setLocality:");
    v11 = v16;
  }
  if (self->_administrativeArea)
  {
    objc_msgSend(v16, "setAdministrativeArea:");
    v11 = v16;
  }
  if (self->_subAdministrativeArea)
  {
    objc_msgSend(v16, "setSubAdministrativeArea:");
    v11 = v16;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v16, "setIsoCountryCode:");
    v11 = v16;
  }
  if (self->_postalCode)
  {
    objc_msgSend(v16, "setPostalCode:");
    v11 = v16;
  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    v11[301] = self->_isTest;
    *((_DWORD *)v11 + 76) |= 0x1000000u;
  }
  if (self->_campaignNameSpace)
  {
    objc_msgSend(v16, "setCampaignNameSpace:");
    v11 = v16;
  }
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 4) != 0)
  {
    *((_DWORD *)v11 + 8) = self->_advertisingIdentifierMonthResetCount;
    *((_DWORD *)v11 + 76) |= 4u;
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x2000000) == 0)
    {
LABEL_79:
      if ((*(_DWORD *)&v15 & 0x400000) == 0)
        goto LABEL_80;
LABEL_100:
      v11[299] = self->_internalUserWantsProdAds;
      *((_DWORD *)v11 + 76) |= 0x400000u;
      if ((*(_DWORD *)&self->_has & 8) == 0)
        goto LABEL_82;
      goto LABEL_81;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
    goto LABEL_79;
  }
  v11[302] = self->_limitAdTracking;
  *((_DWORD *)v11 + 76) |= 0x2000000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) != 0)
    goto LABEL_100;
LABEL_80:
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
LABEL_81:
    *((_DWORD *)v11 + 14) = self->_appStoreViewAdVersion;
    *((_DWORD *)v11 + 76) |= 8u;
  }
LABEL_82:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  $91ED43557AAACFFE87335DF110E99599 has;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  $91ED43557AAACFFE87335DF110E99599 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  $91ED43557AAACFFE87335DF110E99599 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  $91ED43557AAACFFE87335DF110E99599 v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  $91ED43557AAACFFE87335DF110E99599 v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  $91ED43557AAACFFE87335DF110E99599 v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v7 = (void *)v5[19];
  v5[19] = v6;

  v8 = -[NSString copyWithZone:](self->_appID, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v5 + 62) = self->_runState;
    *((_DWORD *)v5 + 76) |= 0x4000u;
  }
  v10 = -[NSString copyWithZone:](self->_carrierMNC, "copyWithZone:", a3);
  v11 = (void *)v5[13];
  v5[13] = v10;

  v12 = -[NSString copyWithZone:](self->_carrierMCC, "copyWithZone:", a3);
  v13 = (void *)v5[12];
  v5[12] = v12;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    *((_BYTE *)v5 + 300) = self->_isOnInternationalDataRoaming;
    *((_DWORD *)v5 + 76) |= 0x800000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 28) = self->_connectionType;
  *((_DWORD *)v5 + 76) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 68) = LODWORD(self->_timezone);
    *((_DWORD *)v5 + 76) |= 0x8000u;
  }
LABEL_7:
  *((_DWORD *)v5 + 65) = self->_screenWidth;
  *((_DWORD *)v5 + 64) = self->_screenHeight;
  *((_DWORD *)v5 + 63) = self->_screenDPI;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v15 = self->_userKeyboards;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v60;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v19), "copyWithZone:", a3, (_QWORD)v59);
        objc_msgSend(v5, "addUserKeyboard:", v20);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v17);
  }

  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_clientClockTime;
    *((_DWORD *)v5 + 76) |= 1u;
    v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v21 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&v21 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v5 + 49) = LODWORD(self->_localLatency);
  *((_DWORD *)v5 + 76) |= 0x400u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v21 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v5 + 50) = self->_localLatencyCount;
  *((_DWORD *)v5 + 76) |= 0x800u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v21 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v5 + 51) = LODWORD(self->_localLatencyStddev);
  *((_DWORD *)v5 + 76) |= 0x1000u;
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v21 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v5 + 46) = LODWORD(self->_localBandwidth);
  *((_DWORD *)v5 + 76) |= 0x80u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v21 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_54:
  *((_DWORD *)v5 + 47) = LODWORD(self->_localBandwidthBytes);
  *((_DWORD *)v5 + 76) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    *((_DWORD *)v5 + 48) = LODWORD(self->_localBandwidthStddev);
    *((_DWORD *)v5 + 76) |= 0x200u;
  }
LABEL_22:
  v22 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3, (_QWORD)v59);
  v23 = (void *)v5[20];
  v5[20] = v22;

  v24 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v25 = (void *)v5[8];
  v5[8] = v24;

  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    *((_BYTE *)v5 + 298) = self->_denyExplicit;
    *((_DWORD *)v5 + 76) |= 0x200000u;
  }
  v26 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v27 = (void *)v5[16];
  v5[16] = v26;

  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_appsRank;
    *((_DWORD *)v5 + 76) |= 0x10u;
    v28 = self->_has;
    if ((*(_WORD *)&v28 & 0x2000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v28 & 0x10000) == 0)
        goto LABEL_27;
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v5 + 56) = self->_moviesRank;
  *((_DWORD *)v5 + 76) |= 0x2000u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v28 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v5 + 69) = self->_tvshowsRank;
  *((_DWORD *)v5 + 76) |= 0x10000u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v28 & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_59:
  *((_BYTE *)v5 + 297) = self->_allowInstallApps;
  *((_DWORD *)v5 + 76) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *((_BYTE *)v5 + 296) = self->_allowITunes;
    *((_DWORD *)v5 + 76) |= 0x80000u;
  }
LABEL_30:
  v29 = -[NSString copyWithZone:](self->_osVersionAndBuild, "copyWithZone:", a3);
  v30 = (void *)v5[29];
  v5[29] = v29;

  v31 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v32 = (void *)v5[26];
  v5[26] = v31;

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000) != 0)
  {
    *((_DWORD *)v5 + 71) = LODWORD(self->_unfilledDuration);
    *((_DWORD *)v5 + 76) |= 0x40000u;
    v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x20000) != 0)
  {
    *((_DWORD *)v5 + 70) = self->_unfilledClientCount;
    *((_DWORD *)v5 + 76) |= 0x20000u;
  }
  v34 = -[NSString copyWithZone:](self->_iTunesStore, "copyWithZone:", a3);
  v35 = (void *)v5[21];
  v5[21] = v34;

  v36 = -[NSString copyWithZone:](self->_applicationLinkedOnOS, "copyWithZone:", a3);
  v37 = (void *)v5[9];
  v5[9] = v36;

  v38 = -[NSData copyWithZone:](self->_anonymousDemandiAdID, "copyWithZone:", a3);
  v39 = (void *)v5[5];
  v5[5] = v38;

  v40 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v41 = (void *)v5[15];
  v5[15] = v40;

  v42 = self->_has;
  if ((*(_BYTE *)&v42 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_deviceMode;
    *((_DWORD *)v5 + 76) |= 0x40u;
    v42 = self->_has;
  }
  if ((*(_BYTE *)&v42 & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_accountType;
    *((_DWORD *)v5 + 76) |= 2u;
  }
  v43 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v44 = (void *)v5[17];
  v5[17] = v43;

  v45 = -[NSString copyWithZone:](self->_locality, "copyWithZone:", a3);
  v46 = (void *)v5[27];
  v5[27] = v45;

  v47 = -[NSString copyWithZone:](self->_administrativeArea, "copyWithZone:", a3);
  v48 = (void *)v5[3];
  v5[3] = v47;

  v49 = -[NSString copyWithZone:](self->_subAdministrativeArea, "copyWithZone:", a3);
  v50 = (void *)v5[33];
  v5[33] = v49;

  v51 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v52 = (void *)v5[22];
  v5[22] = v51;

  v53 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v54 = (void *)v5[30];
  v5[30] = v53;

  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *((_BYTE *)v5 + 301) = self->_isTest;
    *((_DWORD *)v5 + 76) |= 0x1000000u;
  }
  v55 = -[NSString copyWithZone:](self->_campaignNameSpace, "copyWithZone:", a3);
  v56 = (void *)v5[11];
  v5[11] = v55;

  v57 = self->_has;
  if ((*(_BYTE *)&v57 & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_advertisingIdentifierMonthResetCount;
    *((_DWORD *)v5 + 76) |= 4u;
    v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x2000000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v57 & 0x400000) == 0)
        goto LABEL_43;
LABEL_63:
      *((_BYTE *)v5 + 299) = self->_internalUserWantsProdAds;
      *((_DWORD *)v5 + 76) |= 0x400000u;
      if ((*(_DWORD *)&self->_has & 8) == 0)
        return v5;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x2000000) == 0)
  {
    goto LABEL_42;
  }
  *((_BYTE *)v5 + 302) = self->_limitAdTracking;
  *((_DWORD *)v5 + 76) |= 0x2000000u;
  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x400000) != 0)
    goto LABEL_63;
LABEL_43:
  if ((*(_BYTE *)&v57 & 8) != 0)
  {
LABEL_44:
    *((_DWORD *)v5 + 14) = self->_appStoreViewAdVersion;
    *((_DWORD *)v5 + 76) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceModel;
  NSString *appID;
  int v7;
  NSString *carrierMNC;
  NSString *carrierMCC;
  $91ED43557AAACFFE87335DF110E99599 has;
  int v11;
  NSMutableArray *userKeyboards;
  int v13;
  NSData *iAdID;
  NSString *appVersion;
  $91ED43557AAACFFE87335DF110E99599 v16;
  int v17;
  NSString *countryCode;
  int v19;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  $91ED43557AAACFFE87335DF110E99599 v22;
  int v23;
  NSString *iTunesStore;
  NSString *applicationLinkedOnOS;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  $91ED43557AAACFFE87335DF110E99599 v28;
  int v29;
  NSData *dPID;
  NSString *locality;
  NSString *administrativeArea;
  NSString *subAdministrativeArea;
  NSString *isoCountryCode;
  NSString *postalCode;
  $91ED43557AAACFFE87335DF110E99599 v36;
  int v37;
  NSString *campaignNameSpace;
  int v39;
  BOOL v40;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_201;
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_201;
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](appID, "isEqual:"))
      goto LABEL_201;
  }
  v7 = *((_DWORD *)v4 + 76);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_runState != *((_DWORD *)v4 + 62))
      goto LABEL_201;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_201;
  }
  carrierMNC = self->_carrierMNC;
  if ((unint64_t)carrierMNC | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](carrierMNC, "isEqual:"))
  {
    goto LABEL_201;
  }
  carrierMCC = self->_carrierMCC;
  if ((unint64_t)carrierMCC | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](carrierMCC, "isEqual:"))
      goto LABEL_201;
  }
  has = self->_has;
  v11 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0)
      goto LABEL_201;
    if (self->_isOnInternationalDataRoaming)
    {
      if (!*((_BYTE *)v4 + 300))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 300))
    {
      goto LABEL_201;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_connectionType != *((_DWORD *)v4 + 28))
      goto LABEL_201;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_timezone != *((float *)v4 + 68))
      goto LABEL_201;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_201;
  }
  if (self->_screenWidth != *((_DWORD *)v4 + 65)
    || self->_screenHeight != *((_DWORD *)v4 + 64)
    || self->_screenDPI != *((_DWORD *)v4 + 63))
  {
    goto LABEL_201;
  }
  userKeyboards = self->_userKeyboards;
  if ((unint64_t)userKeyboards | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](userKeyboards, "isEqual:"))
      goto LABEL_201;
    has = self->_has;
  }
  v13 = *((_DWORD *)v4 + 76);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_clientClockTime != *((double *)v4 + 1))
      goto LABEL_201;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_localLatency != *((float *)v4 + 49))
      goto LABEL_201;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v13 & 0x800) == 0 || self->_localLatencyCount != *((_DWORD *)v4 + 50))
      goto LABEL_201;
  }
  else if ((v13 & 0x800) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_localLatencyStddev != *((float *)v4 + 51))
      goto LABEL_201;
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_localBandwidth != *((float *)v4 + 46))
      goto LABEL_201;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_localBandwidthBytes != *((float *)v4 + 47))
      goto LABEL_201;
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_localBandwidthStddev != *((float *)v4 + 48))
      goto LABEL_201;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_201;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 20) && !-[NSData isEqual:](iAdID, "isEqual:"))
    goto LABEL_201;
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:"))
      goto LABEL_201;
  }
  v16 = self->_has;
  v17 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0)
      goto LABEL_201;
    if (self->_denyExplicit)
    {
      if (!*((_BYTE *)v4 + 298))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 298))
    {
      goto LABEL_201;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_201;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_201;
    v16 = self->_has;
  }
  v19 = *((_DWORD *)v4 + 76);
  if ((*(_BYTE *)&v16 & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_appsRank != *((_DWORD *)v4 + 20))
      goto LABEL_201;
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&v16 & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_moviesRank != *((_DWORD *)v4 + 56))
      goto LABEL_201;
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0 || self->_tvshowsRank != *((_DWORD *)v4 + 69))
      goto LABEL_201;
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0)
      goto LABEL_201;
    if (self->_allowInstallApps)
    {
      if (!*((_BYTE *)v4 + 297))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 297))
    {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v19 & 0x80000) == 0)
      goto LABEL_201;
    if (self->_allowITunes)
    {
      if (!*((_BYTE *)v4 + 296))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 296))
    {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x80000) != 0)
  {
    goto LABEL_201;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_201;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_201;
  }
  v22 = self->_has;
  v23 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v22 & 0x40000) != 0)
  {
    if ((v23 & 0x40000) == 0 || self->_unfilledDuration != *((float *)v4 + 71))
      goto LABEL_201;
  }
  else if ((v23 & 0x40000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    if ((v23 & 0x20000) == 0 || self->_unfilledClientCount != *((_DWORD *)v4 + 70))
      goto LABEL_201;
  }
  else if ((v23 & 0x20000) != 0)
  {
    goto LABEL_201;
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](iTunesStore, "isEqual:"))
  {
    goto LABEL_201;
  }
  applicationLinkedOnOS = self->_applicationLinkedOnOS;
  if ((unint64_t)applicationLinkedOnOS | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](applicationLinkedOnOS, "isEqual:"))
      goto LABEL_201;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:"))
      goto LABEL_201;
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((_QWORD *)v4 + 15))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:"))
      goto LABEL_201;
  }
  v28 = self->_has;
  v29 = *((_DWORD *)v4 + 76);
  if ((*(_BYTE *)&v28 & 0x40) != 0)
  {
    if ((v29 & 0x40) == 0 || self->_deviceMode != *((_DWORD *)v4 + 36))
      goto LABEL_201;
  }
  else if ((v29 & 0x40) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_BYTE *)&v28 & 2) != 0)
  {
    if ((v29 & 2) == 0 || self->_accountType != *((_DWORD *)v4 + 4))
      goto LABEL_201;
  }
  else if ((v29 & 2) != 0)
  {
    goto LABEL_201;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 17) && !-[NSData isEqual:](dPID, "isEqual:"))
    goto LABEL_201;
  locality = self->_locality;
  if ((unint64_t)locality | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](locality, "isEqual:"))
      goto LABEL_201;
  }
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](administrativeArea, "isEqual:"))
      goto LABEL_201;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](subAdministrativeArea, "isEqual:"))
      goto LABEL_201;
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:"))
      goto LABEL_201;
  }
  postalCode = self->_postalCode;
  if ((unint64_t)postalCode | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](postalCode, "isEqual:"))
      goto LABEL_201;
  }
  v36 = self->_has;
  v37 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v36 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0)
      goto LABEL_201;
    if (self->_isTest)
    {
      if (!*((_BYTE *)v4 + 301))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 301))
    {
      goto LABEL_201;
    }
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_201;
  }
  campaignNameSpace = self->_campaignNameSpace;
  if ((unint64_t)campaignNameSpace | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](campaignNameSpace, "isEqual:"))
      goto LABEL_201;
    v36 = self->_has;
  }
  v39 = *((_DWORD *)v4 + 76);
  if ((*(_BYTE *)&v36 & 4) != 0)
  {
    if ((v39 & 4) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 8))
      goto LABEL_201;
  }
  else if ((v39 & 4) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v36 & 0x2000000) != 0)
  {
    if ((v39 & 0x2000000) == 0)
      goto LABEL_201;
    if (self->_limitAdTracking)
    {
      if (!*((_BYTE *)v4 + 302))
        goto LABEL_201;
    }
    else if (*((_BYTE *)v4 + 302))
    {
      goto LABEL_201;
    }
  }
  else if ((v39 & 0x2000000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    if ((v39 & 0x400000) != 0)
    {
      if (self->_internalUserWantsProdAds)
      {
        if (!*((_BYTE *)v4 + 299))
          goto LABEL_201;
        goto LABEL_196;
      }
      if (!*((_BYTE *)v4 + 299))
        goto LABEL_196;
    }
LABEL_201:
    v40 = 0;
    goto LABEL_202;
  }
  if ((v39 & 0x400000) != 0)
    goto LABEL_201;
LABEL_196:
  if ((*(_BYTE *)&v36 & 8) != 0)
  {
    if ((v39 & 8) == 0 || self->_appStoreViewAdVersion != *((_DWORD *)v4 + 14))
      goto LABEL_201;
    v40 = 1;
  }
  else
  {
    v40 = (*((_DWORD *)v4 + 76) & 8) == 0;
  }
LABEL_202:

  return v40;
}

- (unint64_t)hash
{
  $91ED43557AAACFFE87335DF110E99599 has;
  float timezone;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  $91ED43557AAACFFE87335DF110E99599 v9;
  unint64_t v10;
  double clientClockTime;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float localLatency;
  float v17;
  float v18;
  float v19;
  float localLatencyStddev;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  float localBandwidth;
  float v27;
  float v28;
  float v29;
  unint64_t v30;
  float localBandwidthBytes;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  float localBandwidthStddev;
  float v37;
  float v38;
  float v39;
  $91ED43557AAACFFE87335DF110E99599 v40;
  $91ED43557AAACFFE87335DF110E99599 v41;
  float unfilledDuration;
  float v43;
  float v44;
  float v45;
  unint64_t v46;
  $91ED43557AAACFFE87335DF110E99599 v47;
  unint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  uint64_t v53;
  NSUInteger v54;
  $91ED43557AAACFFE87335DF110E99599 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  uint64_t v69;
  unint64_t v70;
  NSUInteger v71;
  NSUInteger v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSUInteger v78;
  uint64_t v79;
  NSUInteger v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t screenDPI;
  uint64_t screenHeight;
  uint64_t screenWidth;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSUInteger v93;
  NSUInteger v94;
  uint64_t v95;
  NSUInteger v96;
  NSUInteger v97;

  v97 = -[NSString hash](self->_deviceModel, "hash");
  v96 = -[NSString hash](self->_appID, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v95 = 2654435761 * self->_runState;
  else
    v95 = 0;
  v94 = -[NSString hash](self->_carrierMNC, "hash");
  v93 = -[NSString hash](self->_carrierMCC, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    v92 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v91 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    goto LABEL_16;
  }
  v92 = 2654435761 * self->_isOnInternationalDataRoaming;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v91 = 2654435761 * self->_connectionType;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_13;
LABEL_7:
  timezone = self->_timezone;
  v5 = -timezone;
  if (timezone >= 0.0)
    v5 = self->_timezone;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_16:
  screenWidth = self->_screenWidth;
  v90 = v8;
  screenDPI = self->_screenDPI;
  screenHeight = self->_screenHeight;
  v86 = (unint64_t)-[NSMutableArray hash](self->_userKeyboards, "hash");
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    clientClockTime = self->_clientClockTime;
    v12 = -clientClockTime;
    if (clientClockTime >= 0.0)
      v12 = self->_clientClockTime;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    localLatency = self->_localLatency;
    v17 = -localLatency;
    if (localLatency >= 0.0)
      v17 = self->_localLatency;
    v18 = floorf(v17 + 0.5);
    v19 = (float)(v17 - v18) * 1.8447e19;
    v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    v85 = 2654435761 * self->_localLatencyCount;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_34;
LABEL_39:
    v24 = 0;
    goto LABEL_42;
  }
  v85 = 0;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
    goto LABEL_39;
LABEL_34:
  localLatencyStddev = self->_localLatencyStddev;
  v21 = -localLatencyStddev;
  if (localLatencyStddev >= 0.0)
    v21 = self->_localLatencyStddev;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabsf(v23);
  }
LABEL_42:
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    localBandwidth = self->_localBandwidth;
    v27 = -localBandwidth;
    if (localBandwidth >= 0.0)
      v27 = self->_localBandwidth;
    v28 = floorf(v27 + 0.5);
    v29 = (float)(v27 - v28) * 1.8447e19;
    v25 = 2654435761u * (unint64_t)fmodf(v28, 1.8447e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabsf(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    localBandwidthBytes = self->_localBandwidthBytes;
    v32 = -localBandwidthBytes;
    if (localBandwidthBytes >= 0.0)
      v32 = self->_localBandwidthBytes;
    v33 = floorf(v32 + 0.5);
    v34 = (float)(v32 - v33) * 1.8447e19;
    v30 = 2654435761u * (unint64_t)fmodf(v33, 1.8447e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabsf(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  v83 = v30;
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    localBandwidthStddev = self->_localBandwidthStddev;
    v37 = -localBandwidthStddev;
    if (localBandwidthStddev >= 0.0)
      v37 = self->_localBandwidthStddev;
    v38 = floorf(v37 + 0.5);
    v39 = (float)(v37 - v38) * 1.8447e19;
    v35 = 2654435761u * (unint64_t)fmodf(v38, 1.8447e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabsf(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  v82 = v35;
  v81 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v80 = -[NSString hash](self->_appVersion, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    v79 = 2654435761 * self->_denyExplicit;
  else
    v79 = 0;
  v78 = -[NSString hash](self->_countryCode, "hash");
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 0x10) != 0)
  {
    v77 = 2654435761 * self->_appsRank;
    if ((*(_WORD *)&v40 & 0x2000) != 0)
    {
LABEL_71:
      v76 = 2654435761 * self->_moviesRank;
      if ((*(_DWORD *)&v40 & 0x10000) != 0)
        goto LABEL_72;
      goto LABEL_77;
    }
  }
  else
  {
    v77 = 0;
    if ((*(_WORD *)&v40 & 0x2000) != 0)
      goto LABEL_71;
  }
  v76 = 0;
  if ((*(_DWORD *)&v40 & 0x10000) != 0)
  {
LABEL_72:
    v74 = 2654435761 * self->_tvshowsRank;
    if ((*(_DWORD *)&v40 & 0x100000) != 0)
      goto LABEL_73;
LABEL_78:
    v75 = 0;
    if ((*(_DWORD *)&v40 & 0x80000) != 0)
      goto LABEL_74;
    goto LABEL_79;
  }
LABEL_77:
  v74 = 0;
  if ((*(_DWORD *)&v40 & 0x100000) == 0)
    goto LABEL_78;
LABEL_73:
  v75 = 2654435761 * self->_allowInstallApps;
  if ((*(_DWORD *)&v40 & 0x80000) != 0)
  {
LABEL_74:
    v73 = 2654435761 * self->_allowITunes;
    goto LABEL_80;
  }
LABEL_79:
  v73 = 0;
LABEL_80:
  v72 = -[NSString hash](self->_osVersionAndBuild, "hash");
  v71 = -[NSString hash](self->_localeIdentifier, "hash");
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    unfilledDuration = self->_unfilledDuration;
    v43 = -unfilledDuration;
    if (unfilledDuration >= 0.0)
      v43 = self->_unfilledDuration;
    v44 = floorf(v43 + 0.5);
    v45 = (float)(v43 - v44) * 1.8447e19;
    v46 = 2654435761u * (unint64_t)fmodf(v44, 1.8447e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v46 += (unint64_t)v45;
    }
    else
    {
      v46 -= (unint64_t)fabsf(v45);
    }
    v70 = v46;
    if ((*(_DWORD *)&v41 & 0x20000) != 0)
      goto LABEL_82;
  }
  else
  {
    v70 = 0;
    if ((*(_DWORD *)&v41 & 0x20000) != 0)
    {
LABEL_82:
      v69 = 2654435761 * self->_unfilledClientCount;
      goto LABEL_91;
    }
  }
  v69 = 0;
LABEL_91:
  v68 = -[NSString hash](self->_iTunesStore, "hash");
  v67 = -[NSString hash](self->_applicationLinkedOnOS, "hash");
  v66 = (unint64_t)-[NSData hash](self->_anonymousDemandiAdID, "hash");
  v65 = (unint64_t)-[NSData hash](self->_contentiAdID, "hash");
  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 0x40) != 0)
    v64 = 2654435761 * self->_deviceMode;
  else
    v64 = 0;
  v84 = v24;
  if ((*(_BYTE *)&v47 & 2) != 0)
    v63 = 2654435761 * self->_accountType;
  else
    v63 = 0;
  v48 = v10;
  v62 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  v61 = -[NSString hash](self->_locality, "hash");
  v49 = -[NSString hash](self->_administrativeArea, "hash");
  v50 = -[NSString hash](self->_subAdministrativeArea, "hash");
  v51 = -[NSString hash](self->_isoCountryCode, "hash");
  v52 = -[NSString hash](self->_postalCode, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    v53 = 2654435761 * self->_isTest;
  else
    v53 = 0;
  v54 = -[NSString hash](self->_campaignNameSpace, "hash");
  v55 = self->_has;
  if ((*(_BYTE *)&v55 & 4) != 0)
  {
    v56 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
    if ((*(_DWORD *)&v55 & 0x2000000) != 0)
    {
LABEL_102:
      v57 = 2654435761 * self->_limitAdTracking;
      if ((*(_DWORD *)&v55 & 0x400000) != 0)
        goto LABEL_103;
LABEL_107:
      v58 = 0;
      if ((*(_BYTE *)&v55 & 8) != 0)
        goto LABEL_104;
LABEL_108:
      v59 = 0;
      return v96 ^ v97 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ (2654435761 * screenWidth) ^ (2654435761 * screenHeight) ^ (2654435761 * screenDPI) ^ v86 ^ v48 ^ v15 ^ v85 ^ v84 ^ v25 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v56 ^ v57 ^ v58 ^ v59;
    }
  }
  else
  {
    v56 = 0;
    if ((*(_DWORD *)&v55 & 0x2000000) != 0)
      goto LABEL_102;
  }
  v57 = 0;
  if ((*(_DWORD *)&v55 & 0x400000) == 0)
    goto LABEL_107;
LABEL_103:
  v58 = 2654435761 * self->_internalUserWantsProdAds;
  if ((*(_BYTE *)&v55 & 8) == 0)
    goto LABEL_108;
LABEL_104:
  v59 = 2654435761 * self->_appStoreViewAdVersion;
  return v96 ^ v97 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ (2654435761 * screenWidth) ^ (2654435761 * screenHeight) ^ (2654435761 * screenDPI) ^ v86 ^ v48 ^ v15 ^ v85 ^ v84 ^ v25 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v56 ^ v57 ^ v58 ^ v59;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 19))
    -[APPBRequestProperties setDeviceModel:](self, "setDeviceModel:");
  if (*((_QWORD *)v4 + 6))
    -[APPBRequestProperties setAppID:](self, "setAppID:");
  if ((*((_BYTE *)v4 + 305) & 0x40) != 0)
  {
    self->_runState = *((_DWORD *)v4 + 62);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 13))
    -[APPBRequestProperties setCarrierMNC:](self, "setCarrierMNC:");
  if (*((_QWORD *)v4 + 12))
    -[APPBRequestProperties setCarrierMCC:](self, "setCarrierMCC:");
  v5 = *((_DWORD *)v4 + 76);
  if ((v5 & 0x800000) != 0)
  {
    self->_isOnInternationalDataRoaming = *((_BYTE *)v4 + 300);
    *(_DWORD *)&self->_has |= 0x800000u;
    v5 = *((_DWORD *)v4 + 76);
    if ((v5 & 0x20) == 0)
    {
LABEL_13:
      if ((v5 & 0x8000) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  self->_connectionType = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 76) & 0x8000) != 0)
  {
LABEL_14:
    self->_timezone = *((float *)v4 + 68);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_15:
  self->_screenWidth = *((_DWORD *)v4 + 65);
  self->_screenHeight = *((_DWORD *)v4 + 64);
  self->_screenDPI = *((_DWORD *)v4 + 63);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *((id *)v4 + 36);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[APPBRequestProperties addUserKeyboard:](self, "addUserKeyboard:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 1) != 0)
  {
    self->_clientClockTime = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v11 = *((_DWORD *)v4 + 76);
    if ((v11 & 0x400) == 0)
    {
LABEL_24:
      if ((v11 & 0x800) == 0)
        goto LABEL_25;
      goto LABEL_91;
    }
  }
  else if ((v11 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  self->_localLatency = *((float *)v4 + 49);
  *(_DWORD *)&self->_has |= 0x400u;
  v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x800) == 0)
  {
LABEL_25:
    if ((v11 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_92;
  }
LABEL_91:
  self->_localLatencyCount = *((_DWORD *)v4 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x1000) == 0)
  {
LABEL_26:
    if ((v11 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_93;
  }
LABEL_92:
  self->_localLatencyStddev = *((float *)v4 + 51);
  *(_DWORD *)&self->_has |= 0x1000u;
  v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x80) == 0)
  {
LABEL_27:
    if ((v11 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_94;
  }
LABEL_93:
  self->_localBandwidth = *((float *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x80u;
  v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x100) == 0)
  {
LABEL_28:
    if ((v11 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_94:
  self->_localBandwidthBytes = *((float *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 76) & 0x200) != 0)
  {
LABEL_29:
    self->_localBandwidthStddev = *((float *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 20))
    -[APPBRequestProperties setIAdID:](self, "setIAdID:");
  if (*((_QWORD *)v4 + 8))
    -[APPBRequestProperties setAppVersion:](self, "setAppVersion:");
  if ((*((_BYTE *)v4 + 306) & 0x20) != 0)
  {
    self->_denyExplicit = *((_BYTE *)v4 + 298);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((_QWORD *)v4 + 16))
    -[APPBRequestProperties setCountryCode:](self, "setCountryCode:");
  v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x10) != 0)
  {
    self->_appsRank = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x10u;
    v12 = *((_DWORD *)v4 + 76);
    if ((v12 & 0x2000) == 0)
    {
LABEL_40:
      if ((v12 & 0x10000) == 0)
        goto LABEL_41;
      goto LABEL_98;
    }
  }
  else if ((v12 & 0x2000) == 0)
  {
    goto LABEL_40;
  }
  self->_moviesRank = *((_DWORD *)v4 + 56);
  *(_DWORD *)&self->_has |= 0x2000u;
  v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x10000) == 0)
  {
LABEL_41:
    if ((v12 & 0x100000) == 0)
      goto LABEL_42;
    goto LABEL_99;
  }
LABEL_98:
  self->_tvshowsRank = *((_DWORD *)v4 + 69);
  *(_DWORD *)&self->_has |= 0x10000u;
  v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x100000) == 0)
  {
LABEL_42:
    if ((v12 & 0x80000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_99:
  self->_allowInstallApps = *((_BYTE *)v4 + 297);
  *(_DWORD *)&self->_has |= 0x100000u;
  if ((*((_DWORD *)v4 + 76) & 0x80000) != 0)
  {
LABEL_43:
    self->_allowITunes = *((_BYTE *)v4 + 296);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_44:
  if (*((_QWORD *)v4 + 29))
    -[APPBRequestProperties setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
  if (*((_QWORD *)v4 + 26))
    -[APPBRequestProperties setLocaleIdentifier:](self, "setLocaleIdentifier:");
  v13 = *((_DWORD *)v4 + 76);
  if ((v13 & 0x40000) != 0)
  {
    self->_unfilledDuration = *((float *)v4 + 71);
    *(_DWORD *)&self->_has |= 0x40000u;
    v13 = *((_DWORD *)v4 + 76);
  }
  if ((v13 & 0x20000) != 0)
  {
    self->_unfilledClientCount = *((_DWORD *)v4 + 70);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)v4 + 21))
    -[APPBRequestProperties setITunesStore:](self, "setITunesStore:");
  if (*((_QWORD *)v4 + 9))
    -[APPBRequestProperties setApplicationLinkedOnOS:](self, "setApplicationLinkedOnOS:");
  if (*((_QWORD *)v4 + 5))
    -[APPBRequestProperties setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  if (*((_QWORD *)v4 + 15))
    -[APPBRequestProperties setContentiAdID:](self, "setContentiAdID:");
  v14 = *((_DWORD *)v4 + 76);
  if ((v14 & 0x40) != 0)
  {
    self->_deviceMode = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_has |= 0x40u;
    v14 = *((_DWORD *)v4 + 76);
  }
  if ((v14 & 2) != 0)
  {
    self->_accountType = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 17))
    -[APPBRequestProperties setDPID:](self, "setDPID:");
  if (*((_QWORD *)v4 + 27))
    -[APPBRequestProperties setLocality:](self, "setLocality:");
  if (*((_QWORD *)v4 + 3))
    -[APPBRequestProperties setAdministrativeArea:](self, "setAdministrativeArea:");
  if (*((_QWORD *)v4 + 33))
    -[APPBRequestProperties setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  if (*((_QWORD *)v4 + 22))
    -[APPBRequestProperties setIsoCountryCode:](self, "setIsoCountryCode:");
  if (*((_QWORD *)v4 + 30))
    -[APPBRequestProperties setPostalCode:](self, "setPostalCode:");
  if ((*((_BYTE *)v4 + 307) & 1) != 0)
  {
    self->_isTest = *((_BYTE *)v4 + 301);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((_QWORD *)v4 + 11))
    -[APPBRequestProperties setCampaignNameSpace:](self, "setCampaignNameSpace:");
  v15 = *((_DWORD *)v4 + 76);
  if ((v15 & 4) != 0)
  {
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 4u;
    v15 = *((_DWORD *)v4 + 76);
    if ((v15 & 0x2000000) == 0)
    {
LABEL_82:
      if ((v15 & 0x400000) == 0)
        goto LABEL_83;
LABEL_103:
      self->_internalUserWantsProdAds = *((_BYTE *)v4 + 299);
      *(_DWORD *)&self->_has |= 0x400000u;
      if ((*((_DWORD *)v4 + 76) & 8) == 0)
        goto LABEL_85;
      goto LABEL_84;
    }
  }
  else if ((v15 & 0x2000000) == 0)
  {
    goto LABEL_82;
  }
  self->_limitAdTracking = *((_BYTE *)v4 + 302);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v15 = *((_DWORD *)v4 + 76);
  if ((v15 & 0x400000) != 0)
    goto LABEL_103;
LABEL_83:
  if ((v15 & 8) != 0)
  {
LABEL_84:
    self->_appStoreViewAdVersion = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_85:

}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)carrierMNC
{
  return self->_carrierMNC;
}

- (void)setCarrierMNC:(id)a3
{
  objc_storeStrong((id *)&self->_carrierMNC, a3);
}

- (NSString)carrierMCC
{
  return self->_carrierMCC;
}

- (void)setCarrierMCC:(id)a3
{
  objc_storeStrong((id *)&self->_carrierMCC, a3);
}

- (BOOL)isOnInternationalDataRoaming
{
  return self->_isOnInternationalDataRoaming;
}

- (float)timezone
{
  return self->_timezone;
}

- (int)screenWidth
{
  return self->_screenWidth;
}

- (int)screenHeight
{
  return self->_screenHeight;
}

- (int)screenDPI
{
  return self->_screenDPI;
}

- (NSMutableArray)userKeyboards
{
  return self->_userKeyboards;
}

- (double)clientClockTime
{
  return self->_clientClockTime;
}

- (float)localLatency
{
  return self->_localLatency;
}

- (int)localLatencyCount
{
  return self->_localLatencyCount;
}

- (float)localLatencyStddev
{
  return self->_localLatencyStddev;
}

- (float)localBandwidth
{
  return self->_localBandwidth;
}

- (float)localBandwidthBytes
{
  return self->_localBandwidthBytes;
}

- (float)localBandwidthStddev
{
  return self->_localBandwidthStddev;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (BOOL)denyExplicit
{
  return self->_denyExplicit;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int)appsRank
{
  return self->_appsRank;
}

- (int)moviesRank
{
  return self->_moviesRank;
}

- (int)tvshowsRank
{
  return self->_tvshowsRank;
}

- (BOOL)allowInstallApps
{
  return self->_allowInstallApps;
}

- (BOOL)allowITunes
{
  return self->_allowITunes;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (float)unfilledDuration
{
  return self->_unfilledDuration;
}

- (int)unfilledClientCount
{
  return self->_unfilledClientCount;
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (NSString)applicationLinkedOnOS
{
  return self->_applicationLinkedOnOS;
}

- (void)setApplicationLinkedOnOS:(id)a3
{
  objc_storeStrong((id *)&self->_applicationLinkedOnOS, a3);
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (NSData)dPID
{
  return self->_dPID;
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (NSString)campaignNameSpace
{
  return self->_campaignNameSpace;
}

- (void)setCampaignNameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_campaignNameSpace, a3);
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (BOOL)internalUserWantsProdAds
{
  return self->_internalUserWantsProdAds;
}

- (int)appStoreViewAdVersion
{
  return self->_appStoreViewAdVersion;
}

@end

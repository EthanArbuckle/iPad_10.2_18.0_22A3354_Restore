@implementation WCM_WiFiControllerIOS

- (void)updateAntennaSelectionWiFiEnh5G:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Try to set 5G antennaSelection %@"), a3);
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh5G](self, "antennaSelectionEnh5G")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set 5G antennaSelection %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setAntennaSelectionEnh5G:](self, "setAntennaSelectionEnh5G:", a3);
    -[WCM_WiFiService setAntennaSelectionWiFiEnh:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelectionWiFiEnh:", -[WCM_WiFiControllerIOS antennaSelectionEnh5G](self, "antennaSelectionEnh5G"));
  }
}

- (void)updateAntennaSelectionWiFiEnh2G:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Try to set 2G antennaSelection %@"), a3);
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh2G](self, "antennaSelectionEnh2G")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set 2G antennaSelection %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setAntennaSelectionEnh2G:](self, "setAntennaSelectionEnh2G:", a3);
    -[WCM_WiFiService setAntennaSelectionWiFiEnh:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelectionWiFiEnh:", -[WCM_WiFiControllerIOS antennaSelectionEnh2G](self, "antennaSelectionEnh2G"));
  }
}

- (void)updateAntennaSelectionWiFiEnh6G:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Try to set 6G antennaSelection %@"), a3);
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelectionEnh6G](self, "antennaSelectionEnh6G")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set 6G antennaSelection %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setAntennaSelectionEnh6G:](self, "setAntennaSelectionEnh6G:", a3);
    -[WCM_WiFiService setAntennaSelectionWiFiEnh:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelectionWiFiEnh:", -[WCM_WiFiControllerIOS antennaSelectionEnh6G](self, "antennaSelectionEnh6G"));
  }
}

- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3 andUseCase:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending eSCOHid indication to Wifi (%d) useCase (%d)"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[WCM_WiFiService setWifiBTeSCOHidStatus:andUseCase:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWifiBTeSCOHidStatus:andUseCase:", v5, v4);
}

- (NSArray)antennaSelectionEnh6G
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh5G + 4);
}

- (NSArray)antennaSelectionEnh5G
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh2G + 4);
}

- (NSArray)antennaSelectionEnh2G
{
  return *(NSArray **)((char *)&self->_antennaSelection + 4);
}

- (WCM_WiFiControllerIOS)init
{
  char *v2;
  char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_WiFiControllerIOS;
  v2 = -[WCM_WiFiController init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2[76] = 0;
    *(_QWORD *)(v2 + 92) = &off_100230D68;
    *(_QWORD *)(v3 + 100) = &off_100242228;
    *(_QWORD *)(v3 + 108) = &off_100242240;
    *(_QWORD *)(v3 + 116) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 124) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 132) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 140) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 148) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 156) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 164) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 180) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 188) = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    *(_QWORD *)(v3 + 196) = &off_100242288;
    *(_QWORD *)(v3 + 204) = &off_1002422A0;
    *(_QWORD *)(v3 + 212) = &off_1002422B8;
    *(_QWORD *)(v3 + 220) = &off_1002422D0;
    *(_QWORD *)(v3 + 228) = &off_1002422E8;
    *(_QWORD *)(v3 + 236) = &off_100242300;
    *(_QWORD *)(v3 + 252) = objc_alloc_init((Class)NSDictionary);
    v3[77] = 0;
    *((_DWORD *)v3 + 20) = 4;
    *((_DWORD *)v3 + 21) = 0;
    *((_DWORD *)v3 + 22) = 0;
    *(_QWORD *)(v3 + 300) = -1;
    *(_QWORD *)(v3 + 308) = -1;
    v3[79] = 0;
  }
  return (WCM_WiFiControllerIOS *)v3;
}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))
  {
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleWiFiRCU1PowerOff");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleWiFiRCU2PowerOff");
  }
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiControllerIOS;
  -[WCM_WiFiController dealloc](&v3, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  WCM_WiFiService *v7;
  id v8;
  id v9;
  id v10;
  WCM_WiFiService *v11;
  id v12;
  id v13;
  id v14;
  WCM_WiFiService *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  if (!a3)
  {
    BYTE4(self->super._catsAppBitmap) = 0;
    v20.receiver = self;
    v20.super_class = (Class)WCM_WiFiControllerIOS;
    -[WCM_WiFiController handlePowerState:](&v20, "handlePowerState:", 0);
    return;
  }
  v20.receiver = self;
  v20.super_class = (Class)WCM_WiFiControllerIOS;
  -[WCM_WiFiController handlePowerState:](&v20, "handlePowerState:", 1);
  -[WCM_WiFiControllerIOS updateWifiEnvelopeParams](self, "updateWifiEnvelopeParams");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiAssocProtectionModeSupport")))-[WCM_WiFiService setChannelsToEnableAssocProtectionModeWiFiEnh](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableAssocProtectionModeWiFiEnh");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WlanConditionId")))
  {
    -[WCM_WiFiService setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:", objc_msgSend(&off_100230DE0, "intValue"), 1, 0, 0, objc_msgSend(&off_100230D80, "intValue"), objc_msgSend(&off_100230ED0, "intValue"));
    -[WCM_WiFiService setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:", objc_msgSend(&off_100230DF8, "intValue"), 0, 1, 0, objc_msgSend(&off_100230EE8, "intValue"), objc_msgSend(&off_100230F00, "intValue"));
    -[WCM_WiFiService setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelConfigurationForConditionId:enable2G:enable5G:enable6G:wifi_channel_lower:wifi_channel_upper:", objc_msgSend(&off_100230E10, "intValue"), 0, 0, 1, objc_msgSend(&off_100230D80, "intValue"), objc_msgSend(&off_100230F18, "intValue"));
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("LTEScanProtection")))
  {
    v4 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
    v5 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport"));
    v6 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiScanProtectionModeSupport"));
    v7 = -[WCM_WiFiController wifiService](self, "wifiService");
    v8 = objc_msgSend(v4, "wcmCellularScanProtectionWiFiChannels");
    if (v5)
    {
      v9 = objc_msgSend(v4, "wcmCellularScanProtectionWiFiChannelsWiFiEnh");
      if (v6)
      {
        v10 = objc_msgSend(v4, "wcmWiFiScanThrottlingChannelIndices");
        v11 = v7;
        v12 = v8;
        v13 = v9;
      }
      else
      {
        v11 = v7;
        v12 = v8;
        v13 = v9;
        v10 = 0;
      }
      -[WCM_WiFiService setChannelsForCellularScanProtectionWiFiEnh:wiFiEnhChannels:indexArrayForScanThrottling:](v11, "setChannelsForCellularScanProtectionWiFiEnh:wiFiEnhChannels:indexArrayForScanThrottling:", v12, v13, v10);
    }
    else
    {
      if (v6)
      {
        v14 = objc_msgSend(v4, "wcmWiFiScanThrottlingChannelIndices");
        v15 = v7;
        v16 = v8;
      }
      else
      {
        v15 = v7;
        v16 = v8;
        v14 = 0;
      }
      -[WCM_WiFiService setChannelsForCellularScanProtectionWithMode:indexArrayForScanThrottling:](v15, "setChannelsForCellularScanProtectionWithMode:indexArrayForScanThrottling:", v16, v14);
    }
    -[WCM_WiFiService setMaxDurationForCellularScanProtection:](-[WCM_WiFiController wifiService](self, "wifiService"), "setMaxDurationForCellularScanProtection:", objc_msgSend(v4, "wcmCellularScanProtectionWiFiMaxDuration"));
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("LTELAACoexSupport")))-[WCM_WiFiControllerIOS enableWifiLaaCoexMode](self, "enableWifiLaaCoexMode");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("MedtronicSupport")))
  {
    v17 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "extAccessory");
    if (v17)
      objc_msgSend(v17, "accessoryReconnect");
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtProfile")))
  {
    -[WCM_WiFiControllerIOS downloadWiFiBTCoexProfiles](self, "downloadWiFiBTCoexProfiles");
    if (-[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Downloaded Successfully, Activating Default Profile"));
      -[WCM_WiFiService setWiFiBTCoexActiveProfileFor2G:and5G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexActiveProfileFor2G:and5G:", 0, 0);
      v18 = 0;
      v19 = 0;
LABEL_30:
      -[WCM_WiFiControllerIOS setActiveProfileFor2G:](self, "setActiveProfileFor2G:", v18);
      -[WCM_WiFiControllerIOS setActiveProfileFor5G:](self, "setActiveProfileFor5G:", v19);
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBt5GProfile")))
  {
    -[WCM_WiFiControllerIOS downloadWiFiBTCoexProfiles](self, "downloadWiFiBTCoexProfiles");
    if (-[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Downloaded Successfully, Activating Default Profiles"));
      v19 = 6;
      -[WCM_WiFiService setWiFiBTCoexActiveProfileFor2G:and5G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexActiveProfileFor2G:and5G:", 0, 6);
      v18 = 0;
      goto LABEL_30;
    }
LABEL_29:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Not Downloaded Successfully, Not Activating"));
    v18 = -1;
    v19 = -1;
    goto LABEL_30;
  }
LABEL_31:
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiGen9rFemConfig")))-[WCM_WiFiControllerIOS updatePowerOnGen9rFemConfiguration](self, "updatePowerOnGen9rFemConfiguration");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiRCU1Status");
}

- (void)clearDownloadCoexProfilesState
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("clearDownloadCoexProfilesState"));
  -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", 0);
  -[WCM_WiFiControllerIOS setActiveProfileFor2G:](self, "setActiveProfileFor2G:", -1);
  -[WCM_WiFiControllerIOS setActiveProfileFor5G:](self, "setActiveProfileFor5G:", -1);
}

- (void)downloadWiFiBTCoexProfiles
{
  id v3;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", 1);
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileDefault"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileDefault"), 0) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileLight"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileLight"), 1) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileHeavyHFP"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileHeavyHFP"), 2) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileHeavyA2DP"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileHeavyA2DP"), 3) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileTDD"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileTDD"), 4) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
  if (objc_msgSend(v3, "wcmWiFiBTCoexProfileDefault5G"))
    -[WCM_WiFiControllerIOS setWifiBTCoexProfilesDownloaded:](self, "setWifiBTCoexProfilesDownloaded:", -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", objc_msgSend(v3, "wcmWiFiBTCoexProfileDefault5G"), 6) & -[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"));
}

- (id)getWiFiServiceSingletone
{
  if (qword_100271418 != -1)
    dispatch_once(&qword_100271418, &stru_100205928);
  return (id)qword_100271410;
}

- (int64_t)getWiFiBTActiveProfileFor2G
{
  return *(int64_t *)((char *)&self->_wifiAgcModeEnable + 4);
}

- (void)updateWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  -[WCM_WiFiService setWiFiBTCoexProfile:atIndex:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexProfile:atIndex:", a3, a4);
}

- (void)updateWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4
{
  if (-[WCM_WiFiControllerIOS activeProfileFor2G](self, "activeProfileFor2G") == a3
    && -[WCM_WiFiControllerIOS activeProfileFor5G](self, "activeProfileFor5G") == a4)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Already set index2G(%d) index5G(%d)"), a3, a4);
    return;
  }
  if (-[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"))
    goto LABEL_7;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Not Downloaded Successfully, Attempting to Download Again"));
  -[WCM_WiFiControllerIOS downloadWiFiBTCoexProfiles](self, "downloadWiFiBTCoexProfiles");
  if (-[WCM_WiFiControllerIOS wifiBTCoexProfilesDownloaded](self, "wifiBTCoexProfilesDownloaded"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Downloaded Successfully on 2nd Attempt, Updating"));
LABEL_7:
    -[WCM_WiFiControllerIOS setActiveProfileFor2G:](self, "setActiveProfileFor2G:", a3);
    -[WCM_WiFiControllerIOS setActiveProfileFor5G:](self, "setActiveProfileFor5G:", a4);
    -[WCM_WiFiService setWiFiBTCoexActiveProfileFor2G:and5G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTCoexActiveProfileFor2G:and5G:", a3, a4);
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("All Coex Profiles Not Downloaded Successfully On 2nd Attepmt, Not Activating"));
  -[WCM_WiFiControllerIOS setActiveProfileFor2G:](self, "setActiveProfileFor2G:", -1);
  -[WCM_WiFiControllerIOS setActiveProfileFor5G:](self, "setActiveProfileFor5G:", -1);
}

- (void)updateChannelsToBlocklist:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsBlocklisted](self, "channelsBlocklisted")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already blocklisted channels %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsBlocklisted:](self, "setChannelsBlocklisted:", a3);
    -[WCM_WiFiService setChannelsToBlocklist:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToBlocklist:", a3);
  }
}

- (void)updateChannelsToEnableWCI2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2Enabled](self, "channelsWCI2Enabled")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already WCI2 enabled on channels %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsWCI2Enabled:](self, "setChannelsWCI2Enabled:", a3);
    -[WCM_WiFiService setChannelsToEnableWCI2:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableWCI2:", a3);
  }
}

- (void)updateChannelsToEnableWCI2V2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2EnabledV2](self, "channelsWCI2EnabledV2")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: WCI2 is already enabled on channels %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsWCI2EnabledV2:](self, "setChannelsWCI2EnabledV2:", a3);
    -[WCM_WiFiService setChannelsToEnableWCI2V2:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableWCI2V2:", a3);
  }
}

- (void)updateChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2Enabled2Gand5G](self, "channelsWCI2Enabled2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWCI2EnabledWiFiEnh](self, "channelsWCI2EnabledWiFiEnh")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh:  Channel lists are the same as channelsWCI2Enabled2Gand5G and channelsWCI2EnabledWiFiEnh, no need to update."));
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsWCI2Enabled2Gand5G:](self, "setChannelsWCI2Enabled2Gand5G:", a3);
    -[WCM_WiFiControllerIOS setChannelsWCI2EnabledWiFiEnh:](self, "setChannelsWCI2EnabledWiFiEnh:", a4);
    -[WCM_WiFiService setChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:", -[WCM_WiFiControllerIOS channelsWCI2Enabled2Gand5G](self, "channelsWCI2Enabled2Gand5G"), -[WCM_WiFiControllerIOS channelsWCI2EnabledWiFiEnh](self, "channelsWCI2EnabledWiFiEnh"));
  }
}

- (void)updateChannelsToEnableType7MSG:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsToEnableType7MSG](self, "channelsToEnableType7MSG")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: WiFi_Type7 MSG is already enabled on channels %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsToEnableType7MSG:](self, "setChannelsToEnableType7MSG:", a3);
    -[WCM_WiFiService setChannelsToEnableType7MSG:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableType7MSG:", a3);
  }
}

- (void)updateChannelsToEnableType7MSG2GWiFi:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsToEnableType7MSG2GWiFi](self, "channelsToEnableType7MSG2GWiFi")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_: 2GWiFi_Type7 MSG is already enabled on channels %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsToEnableType7MSG2GWiFi:](self, "setChannelsToEnableType7MSG2GWiFi:", a3);
    -[WCM_WiFiService setChannelsToEnableType7MSG2GWiFi:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableType7MSG2GWiFi:", -[WCM_WiFiControllerIOS channelsToEnableType7MSG2GWiFi](self, "channelsToEnableType7MSG2GWiFi"));
  }
}

- (void)updateChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWiFiType7MSG2Gand5G](self, "channelsWiFiType7MSG2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsWiFiType7MSGWiFiEnh](self, "channelsWiFiType7MSGWiFiEnh")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh:  Channel lists are the same as channelsWiFiType7MSG2Gand5G and channelsWiFiType7MSGWiFiEnh, no need to update."));
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsWiFiType7MSG2Gand5G:](self, "setChannelsWiFiType7MSG2Gand5G:", a3);
    -[WCM_WiFiControllerIOS setChannelsWiFiType7MSGWiFiEnh:](self, "setChannelsWiFiType7MSGWiFiEnh:", a4);
    -[WCM_WiFiService setChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:", -[WCM_WiFiControllerIOS channelsWiFiType7MSG2Gand5G](self, "channelsWiFiType7MSG2Gand5G"), -[WCM_WiFiControllerIOS channelsWiFiType7MSGWiFiEnh](self, "channelsWiFiType7MSGWiFiEnh"));
  }
}

- (void)updateChannelsToDisableOCL:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsOCLDisabled](self, "channelsOCLDisabled")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already OCL disabled on channels %@"), a3);
    }
    else
    {
      -[WCM_WiFiControllerIOS setChannelsOCLDisabled:](self, "setChannelsOCLDisabled:", a3);
      -[WCM_WiFiService setChannelsToDisableOCL:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToDisableOCL:", a3);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLWarning: channels is a null pointer. Return here"));
  }
}

- (void)updateChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsDisableOCL2Gand5G](self, "channelsDisableOCL2Gand5G"))&& objc_msgSend(a4, "isEqualToArray:", -[WCM_WiFiControllerIOS channelsDisableOCLWiFiEnh](self, "channelsDisableOCLWiFiEnh")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DisableOCL_WiFiEnh: Channel lists are the same as channelsDisableOCL2Gand5G and channelsDisableOCLWiFiEnh, no need to update."));
  }
  else
  {
    -[WCM_WiFiControllerIOS setChannelsDisableOCL2Gand5G:](self, "setChannelsDisableOCL2Gand5G:", a3);
    -[WCM_WiFiControllerIOS setChannelsDisableOCLWiFiEnh:](self, "setChannelsDisableOCLWiFiEnh:", a4);
    -[WCM_WiFiService setChannelsToDisableOCLWiFiEnh:WiFiEnhChannels:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsToDisableOCLWiFiEnh:WiFiEnhChannels:", -[WCM_WiFiControllerIOS channelsDisableOCL2Gand5G](self, "channelsDisableOCL2Gand5G"), -[WCM_WiFiControllerIOS channelsDisableOCLWiFiEnh](self, "channelsDisableOCLWiFiEnh"));
  }
}

- (void)updateRxPriorityThreshold:(id)a3
{
  if (-[NSNumber isEqualToNumber:](-[WCM_WiFiControllerIOS rxPriThreshold](self, "rxPriThreshold"), "isEqualToNumber:", a3))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set rxPriThreshold %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setRxPriThreshold:](self, "setRxPriThreshold:", a3);
    -[WCM_WiFiService setRxPriorityThreshold:](-[WCM_WiFiController wifiService](self, "wifiService"), "setRxPriorityThreshold:", a3);
  }
}

- (void)updateAntennaPreference:(id)a3 withCellPolicy:(id)a4
{
  WCM_WiFiControllerIOS *v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  char v11;
  _UNKNOWN **v12;
  _UNKNOWN **v13;
  uint64_t v14;
  _UNKNOWN **v15;
  _UNKNOWN **v16;
  void *v17;

  v6 = self;
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaConfig](self, "antennaConfig")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set antennaPreference %@"), a3);
  }
  else
  {
    v17 = v6;
    -[WCM_WiFiControllerIOS setAntennaConfig:](v6, "setAntennaConfig:", a3);
    v7 = objc_msgSend(a3, "firstObject");
    v8 = objc_msgSend(a3, "lastObject");
    v9 = 0;
    LODWORD(v6) = 858980352;
    v10 = 1;
    do
    {
      v11 = v10;
      v12 = (_UNKNOWN **)objc_msgSend(v7, "objectAtIndex:", v9);
      if (objc_msgSend(v12, "isEqual:", &off_100230D68))
        v13 = &off_100230DB0;
      else
        v13 = v12;
      v14 = (objc_msgSend(v13, "intValue") << (8 * v9)) | v6;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("2G Core %d config Command = 0x%x Antenna Config = %@"), v9, v14, v12);
      v15 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", v9);
      if (objc_msgSend(v15, "isEqual:", &off_100230D68))
        v16 = &off_100230DB0;
      else
        v16 = v15;
      v6 = (WCM_WiFiControllerIOS *)((objc_msgSend(v16, "intValue") << ((8 * v9) | 4)) | v14);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("5G Core %d config Command = 0x%x Antenna Config = %@"), v9, v6, v15);
      v10 = 0;
      v9 = 1;
    }
    while ((v11 & 1) != 0);
    objc_msgSend(objc_msgSend(v17, "wifiService"), "setRxAntennaPreference:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 858993459));
    objc_msgSend(objc_msgSend(v17, "wifiService"), "setTxAntennaPreference:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 858993459));
    if ((_DWORD)v6 != 858993459)
    {
      objc_msgSend(objc_msgSend(v17, "wifiService"), "setTxAntennaPreference:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
      objc_msgSend(objc_msgSend(v17, "wifiService"), "setRxAntennaPreference:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
      objc_msgSend(objc_msgSend(v17, "wifiService"), "setAntennaCellPolicy:", a4);
    }
  }
}

- (void)updateAntennaSelection:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelection](self, "antennaSelection")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set antennaSelection %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setAntennaSelection:](self, "setAntennaSelection:", a3);
    -[WCM_WiFiService setAntennaSelection:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelection:", a3);
  }
}

- (void)updateAntennaSelectionV2:(id)a3
{
  if (objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS antennaSelection](self, "antennaSelection")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set antennaSelection %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setAntennaSelection:](self, "setAntennaSelection:", a3);
    -[WCM_WiFiService setAntennaSelectionV2:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelectionV2:", a3);
  }
}

- (void)updateChannelsForTimeSharingMode:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "isEqualToArray:", &off_100242318) ^ 1;
  if ((_DWORD)v5 == -[WCM_WiFiControllerIOS lteCDRXTDDMode](self, "lteCDRXTDDMode")
    && objc_msgSend(a3, "isEqualToArray:", -[WCM_WiFiControllerIOS cdrxTDDEnabledChannels](self, "cdrxTDDEnabledChannels")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set lteCDRXTDDMode(%d) cdrxTDDEnabledChannels %@"), v5, a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setLteCDRXTDDMode:](self, "setLteCDRXTDDMode:", v5);
    -[WCM_WiFiControllerIOS setCdrxTDDEnabledChannels:](self, "setCdrxTDDEnabledChannels:", a3);
    -[WCM_WiFiService setChannelsForTimeSharingMode:](-[WCM_WiFiController wifiService](self, "wifiService"), "setChannelsForTimeSharingMode:", a3);
  }
}

- (void)updateMWSSignalingConfig
{
  id v3;
  _QWORD v4[15];
  _QWORD v5[15];

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  v4[0] = CFSTR("MWS_WCI_Signaling_RxAssertOffset");
  v5[0] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSRxAssertOffset"));
  v4[1] = CFSTR("MWS_WCI_Signaling_RxAssertJitter");
  v5[1] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSRxAssertJitter"));
  v4[2] = CFSTR("MWS_WCI_Signaling_RxDeAssertOffset");
  v5[2] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSRxDeAssertOffset"));
  v4[3] = CFSTR("MWS_WCI_Signaling_RxDeAssertJitter");
  v5[3] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSRxDeAssertJitter"));
  v4[4] = CFSTR("MWS_WCI_Signaling_TxAssertOffset");
  v5[4] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSTxAssertOffset"));
  v4[5] = CFSTR("MWS_WCI_Signaling_TxAssertJitter");
  v5[5] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSTxAssertJitter"));
  v4[6] = CFSTR("MWS_WCI_Signaling_TxDeAssertOffset");
  v5[6] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSTxDeAssertOffset"));
  v4[7] = CFSTR("MWS_WCI_Signaling_TxDeAssertJitter");
  v5[7] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSTxDeAssertJitter"));
  v4[8] = CFSTR("MWS_WCI_Signaling_PatternAssertOffset");
  v5[8] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSPatternAssertOffset"));
  v4[9] = CFSTR("MWS_WCI_Signaling_PatternAssertJitter");
  v5[9] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSPatternAssertJitter"));
  v4[10] = CFSTR("MWS_WCI_Signaling_InactivityAssertOffset");
  v5[10] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSInactivityAssertOffset"));
  v4[11] = CFSTR("MWS_WCI_Signaling_InactivityAssertJitter");
  v5[11] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSInactivityAssertJitter"));
  v4[12] = CFSTR("MWS_WCI_Signaling_ScanFrequencyAssertOffset");
  v5[12] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSScanFrequencyAssertOffset"));
  v4[13] = CFSTR("MWS_WCI_Signaling_ScanFrequencyAssertJitter");
  v5[13] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSScanFrequencyAssertJitter"));
  v4[14] = CFSTR("MWS_WCI_Signaling_PriorityAssertOffsetRequest");
  v5[14] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v3, "wcmWCI2MWSPriorityAssertOffsetRequest"));
  -[WCM_WiFiService setMWSSignalingConfig:](-[WCM_WiFiController wifiService](self, "wifiService"), "setMWSSignalingConfig:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 15));
}

- (BOOL)isCarPlaySessionInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi IOS Controller CarPlaySessioninProgress state:(%d)"), -[WCM_WiFiControllerIOS mCarPlaySessionInProgress](self, "mCarPlaySessionInProgress"));
  return -[WCM_WiFiControllerIOS mCarPlaySessionInProgress](self, "mCarPlaySessionInProgress");
}

- (int)getCarPlayScanRelaxReason
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi IOS Controller CarPlayRelaxReason :(%d)"), -[WCM_WiFiControllerIOS mCarPlayBTScanRelaxReason](self, "mCarPlayBTScanRelaxReason"));
  return -[WCM_WiFiControllerIOS mCarPlayBTScanRelaxReason](self, "mCarPlayBTScanRelaxReason");
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Update IOS Controller CarPlayState state:(%d), reason:(%d)"), a3, *(_QWORD *)&a4);
  -[WCM_WiFiControllerIOS setMCarPlaySessionInProgress:](self, "setMCarPlaySessionInProgress:", v5);
  -[WCM_WiFiControllerIOS setMCarPlayBTScanRelaxReason:](self, "setMCarPlayBTScanRelaxReason:", v4);
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiControllerIOS;
  -[WCM_WiFiController updateCarPlaySessionState:reason:](&v7, "updateCarPlaySessionState:reason:", v5, v4);
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFi IOS Controller updateContentionFreeWiFiInfoToRC2 implementation"));
  -[WCM_WiFiControllerIOS setMLeastCongestedChannel:](self, "setMLeastCongestedChannel:", v5);
  -[WCM_WiFiControllerIOS setMLeastCongestedChannelCount:](self, "setMLeastCongestedChannelCount:", v4);
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiControllerIOS;
  -[WCM_WiFiController updateContentionFreeWiFiInfoToRC2:count:](&v7, "updateContentionFreeWiFiInfoToRC2:count:", v5, v4);
}

- (id)getLeastCongestedWifiParam
{
  id v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFi IOS Controller getLeastCongestedWifiParam implementation"));
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WCM_WiFiControllerIOS mLeastCongestedChannel](self, "mLeastCongestedChannel")));
  objc_msgSend(v3, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WCM_WiFiControllerIOS mLeastCongestedChannelCount](self, "mLeastCongestedChannelCount")));
  return v3;
}

- (void)updateMWSFrameConfig:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  int v19;
  int v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  uint64_t v24;
  NSNumber *v25;
  id v26;
  NSDictionary *v27;
  uint64_t v28;
  WCM_WiFiControllerIOS *v29;
  float *v30;
  float *v31;
  _QWORD v32[6];
  _QWORD v33[6];

  if (a3)
  {
    v5 = +[NSMutableArray array](NSMutableArray, "array");
    v6 = +[NSMutableArray array](NSMutableArray, "array");
    if ((objc_msgSend(a3, "tddBand") & 1) != 0)
    {
      v7 = (unint64_t)objc_msgSend(a3, "tddULDLConfig");
      v8 = (unint64_t)objc_msgSend(a3, "subframeFormat");
      v9 = objc_msgSend(a3, "dlCPConfig");
      v10 = objc_msgSend(a3, "ulCPConfig");
      if (v7 > 6 || v8 > 9)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid tddULDLConfig(%d) subframeFormat(%d)"), v7, v8);
        return;
      }
      v29 = self;
      v11 = 0;
      v12 = 0;
      v13 = 120;
      if (!v10)
        v13 = 80;
      v30 = (float *)((char *)&unk_1001DEF70 + 4 * v8 + v13);
      v31 = (float *)((char *)&unk_1001DEF70 + 40 * (v9 != 0) + 4 * v8);
      do
      {
        v14 = aDsuuudsuuudsuu[10 * v7 + v11];
        objc_msgSend(v6, "addObject:", +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v14 != 68));
        if (v11 <= 9)
          v15 = 9;
        else
          v15 = v11;
        v16 = v15 - v11;
        v17 = &aDsuuudsuuudsuu[10 * v7 + 1 + v11];
        v18 = v11;
        do
        {
          v12 += 1000;
          if (!v16)
            goto LABEL_23;
          v20 = *v17++;
          v19 = v20;
          ++v18;
          --v16;
        }
        while (v20 == v14);
        if (v19 != 83)
        {
          LODWORD(v15) = v18 - 1;
LABEL_23:
          objc_msgSend(v5, "addObject:", +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v12));
          v12 = 0;
          v18 = v15;
          goto LABEL_24;
        }
        v21 = llroundf(*v31);
        v22 = llroundf(*v30);
        if (v14 == 68)
          v23 = v21;
        else
          v23 = v22;
        v24 = (__int16)(v23 + v12);
        if (v14 == 68)
          v12 = v22;
        else
          v12 = v21;
        objc_msgSend(v5, "addObject:", +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v24));
        objc_msgSend(v6, "addObject:", +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", 3));
        objc_msgSend(v5, "addObject:", +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)(1000 - (v21 + v22))));
LABEL_24:
        v11 = v18 + 1;
      }
      while (v18 < 9);
      v25 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v6, "count"));
      self = v29;
    }
    else
    {
      v25 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 1);
      objc_msgSend(v5, "addObject:", +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 10000));
      objc_msgSend(v6, "addObject:", +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", 2));
    }
    v26 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
    v32[0] = CFSTR("MWS_Aggressor_Frame_SyncAssertOffset");
    v33[0] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v26, "wcmWCI2FrameSyncAssertOffset"));
    v32[1] = CFSTR("MWS_Aggressor_Frame_SyncAssertJitter");
    v33[1] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(v26, "wcmWCI2FrameSyncAssertJitter"));
    v32[2] = CFSTR("MWS_Aggressor_Frame_Duration");
    v33[2] = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 10000);
    v33[3] = v25;
    v32[3] = CFSTR("MWS_Aggressor_Frame_NumPeriods");
    v32[4] = CFSTR("MWS_Aggressor_Frame_PeriodDuration");
    v32[5] = CFSTR("MWS_Aggressor_Frame_PeriodType");
    v33[4] = v5;
    v33[5] = v6;
    v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    if (-[NSDictionary isEqualToDictionary:](-[WCM_WiFiControllerIOS frameConfiguration](self, "frameConfiguration"), "isEqualToDictionary:", v27))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Already set frameConfiguration %@"), v27, v28);
    }
    else
    {
      -[WCM_WiFiControllerIOS setFrameConfiguration:](self, "setFrameConfiguration:", v27);
      -[WCM_WiFiService setMWSFrameConfig:](-[WCM_WiFiController wifiService](self, "wifiService"), "setMWSFrameConfig:", v27);
    }
  }
}

- (void)updateCellularFrequencyConfig:(id)a3 withWiFiRangingDesenseFlag:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL8 v19;
  id v20;
  double v21;
  double v22;
  double v23;
  NSNumber *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSNumber *v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  NSNumber *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSNumber *v40;
  double v41;
  _QWORD v42[4];
  _QWORD v43[4];

  if (a3)
  {
    v4 = a4;
    if ((objc_msgSend(a3, "bandInfoType") & 0x21) != 0)
    {
      objc_msgSend(a3, "ulCenterFreq");
      v8 = v7;
      -[WCM_WiFiControllerIOS cellularULCenterFreq](self, "cellularULCenterFreq");
      if (v8 != v9)
        goto LABEL_8;
      objc_msgSend(a3, "ulBandwidth");
      v11 = v10;
      -[WCM_WiFiControllerIOS cellularULBandwidth](self, "cellularULBandwidth");
      if (v11 != v12)
        goto LABEL_8;
      objc_msgSend(a3, "ulCenterFreq2");
      v14 = v13;
      -[WCM_WiFiControllerIOS cellularULCenterFreq2](self, "cellularULCenterFreq2");
      if (v14 == v15
        && (objc_msgSend(a3, "ulBandwidth2"),
            v17 = v16,
            -[WCM_WiFiControllerIOS cellularULBandwidth2](self, "cellularULBandwidth2"),
            v17 == v18))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Skip sending cellular frequency config as uplink carriers are the same as previous ones"));
      }
      else
      {
LABEL_8:
        objc_msgSend(a3, "ulCenterFreq");
        -[WCM_WiFiControllerIOS setCellularULCenterFreq:](self, "setCellularULCenterFreq:");
        objc_msgSend(a3, "ulBandwidth");
        -[WCM_WiFiControllerIOS setCellularULBandwidth:](self, "setCellularULBandwidth:");
        objc_msgSend(a3, "ulCenterFreq2");
        -[WCM_WiFiControllerIOS setCellularULCenterFreq2:](self, "setCellularULCenterFreq2:");
        objc_msgSend(a3, "ulBandwidth2");
        -[WCM_WiFiControllerIOS setCellularULBandwidth2:](self, "setCellularULBandwidth2:");
        v19 = objc_msgSend(a3, "bandInfoType") != 1;
        v20 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(a3, "ulCenterFreq");
        if (v21 != 0.0)
        {
          objc_msgSend(a3, "ulBandwidth");
          if (v22 != 0.0)
          {
            objc_msgSend(a3, "ulCenterFreq");
            v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v23 * 1000.0));
            objc_msgSend(a3, "ulBandwidth");
            objc_msgSend(v20, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v24, CFSTR("MWS_CELLULAR_FREQ_CONFIG_CENTER"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v25 * 1000.0)), CFSTR("MWS_CELLULAR_FREQ_CONFIG_BW"), 0));
          }
        }
        objc_msgSend(a3, "ulCenterFreq2");
        if (v26 != 0.0)
        {
          objc_msgSend(a3, "ulBandwidth2");
          if (v27 != 0.0)
          {
            objc_msgSend(a3, "ulCenterFreq2");
            v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v28 * 1000.0));
            objc_msgSend(a3, "ulBandwidth2");
            objc_msgSend(v20, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v29, CFSTR("MWS_CELLULAR_FREQ_CONFIG_CENTER"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v30 * 1000.0)), CFSTR("MWS_CELLULAR_FREQ_CONFIG_BW"), 0));
          }
        }
        v31 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(a3, "dlCenterFreq");
        if (v32 != 0.0)
        {
          objc_msgSend(a3, "dlBandwidth");
          if (v33 != 0.0)
          {
            objc_msgSend(a3, "dlCenterFreq");
            v35 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v34 * 1000.0));
            objc_msgSend(a3, "dlBandwidth");
            objc_msgSend(v31, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v35, CFSTR("MWS_CELLULAR_FREQ_CONFIG_CENTER"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v36 * 1000.0)), CFSTR("MWS_CELLULAR_FREQ_CONFIG_BW"), 0));
          }
        }
        objc_msgSend(a3, "dlCenterFreq2");
        if (v37 != 0.0)
        {
          objc_msgSend(a3, "dlBandwidth2");
          if (v38 != 0.0)
          {
            objc_msgSend(a3, "dlCenterFreq2");
            v40 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v39 * 1000.0));
            objc_msgSend(a3, "dlBandwidth2");
            objc_msgSend(v31, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v40, CFSTR("MWS_CELLULAR_FREQ_CONFIG_CENTER"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v41 * 1000.0)), CFSTR("MWS_CELLULAR_FREQ_CONFIG_BW"), 0));
          }
        }
        v42[0] = CFSTR("MWS_CELLULAR_FREQ_CONFIG_TECH");
        v43[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19);
        v43[1] = v20;
        v42[1] = CFSTR("MWS_CELLULAR_FREQ_CONFIG_UL");
        v42[2] = CFSTR("MWS_CELLULAR_FREQ_CONFIG_DL");
        v43[2] = v31;
        v42[3] = CFSTR("MWS_CELLULAR_FREQ_CONFIG_DESENSE_TOF");
        v43[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4);
        -[WCM_WiFiService setCellularFrequencyConfig:](-[WCM_WiFiController wifiService](self, "wifiService"), "setCellularFrequencyConfig:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Skip sending cellular frequency config on bandInfoType(%d)"), objc_msgSend(a3, "bandInfoType"));
    }
  }
}

- (void)updateWifiEnvelopeParams
{
  id v3;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Wifi Controller Envelope setting envelope params %@ %@"), objc_msgSend(v3, "wcmWiFiEnvelopeOnIndication"), objc_msgSend(v3, "wcmWiFiEnvelopeIndicationTimer"));
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiBt2gEnvelopeIndication")))
  {
    -[WCM_WiFiService setEnableEnvelopeIndicationFor2G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setEnableEnvelopeIndicationFor2G:", objc_msgSend(v3, "wcmWiFiEnvelopeOnIndication"));
    -[WCM_WiFiService setEnvelopeIndicationTimerFor2G:](-[WCM_WiFiController wifiService](self, "wifiService"), "setEnvelopeIndicationTimerFor2G:", objc_msgSend(v3, "wcmWiFiEnvelopeIndicationTimer"));
  }
}

- (void)setWifiAgcCoexMode:(id)a3
{
  if (-[NSNumber isEqualToNumber:](-[WCM_WiFiControllerIOS wifiAgcModeEnable](self, "wifiAgcModeEnable"), "isEqualToNumber:", a3))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Wifi Coex Agc Rx Gain Mode already set to %@"), a3);
  }
  else
  {
    -[WCM_WiFiControllerIOS setWifiAgcModeEnable:](self, "setWifiAgcModeEnable:", a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Wifi Controller setting Agc Rx Coex Gain Mode %@"), a3);
    -[WCM_WiFiService setEnableAgcCoexMode:](-[WCM_WiFiController wifiService](self, "wifiService"), "setEnableAgcCoexMode:", a3);
  }
}

- (void)enableWifiLaaCoexMode
{
  id v3;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Wifi Controller setting LAA params TxDurationThresh %@ ActiveScanThrottleMask %@ ActiveDwellTime %@"), objc_msgSend(v3, "wcmWiFiWCI2TxDurationThresh"), objc_msgSend(v3, "wcmWiFiActiveScanThrottleMask"), objc_msgSend(v3, "wcmWiFiActiveDwellTime"));
  -[WCM_WiFiService setLAACoexConfigEnableTxInd](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigEnableTxInd");
  -[WCM_WiFiService setLAACoexConfigWci2TxDurationThreshold:](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigWci2TxDurationThreshold:", objc_msgSend(v3, "wcmWiFiWCI2TxDurationThresh"));
  -[WCM_WiFiService setLAACoexConfigScanThrottleMask:](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigScanThrottleMask:", objc_msgSend(v3, "wcmWiFiActiveScanThrottleMask"));
  -[WCM_WiFiService setLAACoexConfigWifiDwellTime:](-[WCM_WiFiController wifiService](self, "wifiService"), "setLAACoexConfigWifiDwellTime:", objc_msgSend(v3, "wcmWiFiActiveDwellTime"));
}

- (void)updateMedtronicState:(int)a3
{
  -[WCM_WiFiService setMedtronicState:](-[WCM_WiFiController wifiService](self, "wifiService"), "setMedtronicState:", *(_QWORD *)&a3);
}

- (void)updatePowerOnGen9rFemConfiguration
{
  id v3;
  unsigned int v4;
  WCM_WiFiService *v5;
  id v6;
  WCM_WiFiService *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: updatePowerOnGen9rFemConfiguration"));
  v4 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly"));
  v5 = -[WCM_WiFiController wifiService](self, "wifiService");
  v6 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
  if (v4)
  {
    v7 = v5;
    v8 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v12 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
    v10 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
    v7 = v5;
    v8 = v6;
    v9 = v12;
    v11 = 1;
  }
  -[WCM_WiFiService setChannelsToEnablerFemModeWiFiEnh:enable5G:enable6G:setDefaultForall:](v7, "setChannelsToEnablerFemModeWiFiEnh:enable5G:enable6G:setDefaultForall:", v8, v9, v10, v11);
}

- (void)updateGen9rFemConfiguration
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  WCM_WiFiService *v9;
  id v10;
  id v11;
  id v12;
  WCM_WiFiService *v13;
  id v14;
  id v15;
  uint64_t v16;
  WCM_WiFiService *v17;

  v3 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: updateGen9rFemConfiguration"));
  v4 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
  v5 = byte_100271420;
  if (byte_100271420 == v4)
  {
    v6 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
    if (byte_100271421 == v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: updateGen9rFemConfiguration, skipped due to duplicated command"));
      return;
    }
    v5 = byte_100271420;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: updateGen9rFemConfiguration, 2g(%d->%d)"), v5, objc_msgSend(v3, "wcmGen9rFemLpmMode2g"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: updateGen9rFemConfiguration, 5g(%d->%d)"), byte_100271421, objc_msgSend(v3, "wcmGen9rFemLpmMode5g"));
  v7 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
  v8 = byte_100271420;
  byte_100271420 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
  byte_100271421 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly")) & 1) == 0)
  {
    v9 = -[WCM_WiFiController wifiService](self, "wifiService");
    v10 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
    v11 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
    v12 = objc_msgSend(v3, "wcmGen9rFemLpmMode5g");
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = 1;
LABEL_10:
    -[WCM_WiFiService setChannelsToEnablerFemModeWiFiEnh:enable5G:enable6G:setDefaultForall:](v13, "setChannelsToEnablerFemModeWiFiEnh:enable5G:enable6G:setDefaultForall:", v14, v15, v12, v16);
    return;
  }
  if (v8 != v7)
  {
    v17 = -[WCM_WiFiController wifiService](self, "wifiService");
    v14 = objc_msgSend(v3, "wcmGen9rFemLpmMode2g");
    v13 = v17;
    v15 = 0;
    v12 = 0;
    v16 = 0;
    goto LABEL_10;
  }
}

- (void)updateWiFiBTULOFDMAstate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: WiFi / BT setting UL OFDMA disable state (%d)"), a3);
  -[WCM_WiFiService setWiFiBTULOFDMAstate:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTULOFDMAstate:", v3);
}

- (void)updateWiFiRCU1ULOFDMAstate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: WiFi / RCU1 setting UL OFDMA disable state (%d)"), a3);
  -[WCM_WiFiService setWiFiRCU1ULOFDMAstate:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU1ULOFDMAstate:", v3);
}

- (void)updateWiFiRCU2ULOFDMAstate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller: WiFi / RCU2 setting UL OFDMA disable state (%d)"), a3);
  -[WCM_WiFiService setWiFiRCU2ULOFDMAstate:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU2ULOFDMAstate:", v3);
}

- (void)updateWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6
{
  _BOOL8 v8;
  _BOOL8 v9;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting RCU1 ModeChanged(%d) ChanChanged(%d) Mode(%@) Chan(%@)"), v9, v8, a5, a6);
    -[WCM_WiFiService setWiFiRCU1ModeChanged:andChannelChanged:andMode:andChannel:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU1ModeChanged:andChannelChanged:andMode:andChannel:", v9, v8, a5, a6);
  }
}

- (void)updateWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending LeConn enable(%d) peakOutageMs(%d) durationMs(%d) dutyCycle(%d) reason(%d)"), a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  -[WCM_WiFiService setWiFiBTLeConnEnable:andPeakOutageMs:andDurationMs:andDutyCycle:andReason:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiBTLeConnEnable:andPeakOutageMs:andDurationMs:andDutyCycle:andReason:", v11, v10, v9, v8, v7);
}

- (void)updateWiFiRCU2CoexMode:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting RCU2 Coex Mode (%@)"), a3);
  -[WCM_WiFiService setWiFiRCU2CoexMode:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU2CoexMode:", a3);
}

- (void)updateWiFiRCU2PMProtectionMode:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting RCU2 PM Protection Mode (%@)"), a3);
  -[WCM_WiFiService setWiFiRCU2PMProtectionMode:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU2PMProtectionMode:", a3);
}

- (void)updateWiFiRCU2TimingArray:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting RCU2 Timing Array (%@)"), a3);
  -[WCM_WiFiService setWiFiRCU2TimingArray:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiRCU2TimingArray:", a3);
}

- (void)setHPovrLEscanGrantDuration:(unsigned int)a3
{
  -[WCM_WiFiService setHPovrLEscanGrantDuration:](-[WCM_WiFiController wifiService](self, "wifiService"), "setHPovrLEscanGrantDuration:", *(_QWORD *)&a3);
}

- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting Airplay critical wifi traffic (%d), duration (ms) (%d), criticality percentage (%d), processID (%d)"), a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
  -[WCM_WiFiService setCriticalWiFiTraffic:duration:criticalityPercentage:forProcessID:](-[WCM_WiFiController wifiService](self, "wifiService"), "setCriticalWiFiTraffic:duration:criticalityPercentage:forProcessID:", v9, v8, v7, v6);
}

- (void)updateRCU2CoexParams:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting RCU2 coex param (%@)"), a3);
  -[WCM_WiFiService setRCU2CoexParams:](-[WCM_WiFiController wifiService](self, "wifiService"), "setRCU2CoexParams:", a3);
}

- (void)updateWiFieSCOActiveStatus:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending eSCO indication to Wifi (%d)"), *(_QWORD *)&a3);
  -[WCM_WiFiService setWifiBTeSCOStatus:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWifiBTeSCOStatus:", v3);
}

- (void)updateWiFiLimitedAggregationActiveStatus:(int)a3
{
  -[WCM_WiFiControllerIOS updateWiFiLimitedAggregationActiveStatus:andUseCase:](self, "updateWiFiLimitedAggregationActiveStatus:andUseCase:", *(_QWORD *)&a3, 1);
}

- (void)updateWiFiA2DPActiveStatus:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending A2DP indication to Wifi (%d)"), *(_QWORD *)&a3);
  -[WCM_WiFiService setWifiBTA2DPStatus:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWifiBTA2DPStatus:", v3);
}

- (void)updateWiFiA2DPLLAActiveStatus:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending A2DP LLA indication to Wifi (%d)"), *(_QWORD *)&a3);
  -[WCM_WiFiService setWifiBTA2DPLLAStatus:](-[WCM_WiFiController wifiService](self, "wifiService"), "setWifiBTA2DPLLAStatus:", v3);
}

- (void)updateWiFiBTConnectionReport:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending BT Connection Report to Wifi"));
  -[WCM_WiFiService setBTConnectionReport:](-[WCM_WiFiController wifiService](self, "wifiService"), "setBTConnectionReport:", a3);
}

- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspUpdateBTStatus to Wifi (%d, 0x%x, %d)"), a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  -[WCM_WiFiService bspUpdateBTStatus_powerState:frequencyBand:ullaMode:](-[WCM_WiFiController wifiService](self, "wifiService"), "bspUpdateBTStatus_powerState:frequencyBand:ullaMode:", v7, v6, v5);
}

- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspBandSwitchRequest to Wifi (0x%x, 0x%x)"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[WCM_WiFiService bspBandSwitchRequest:targetBand:](-[WCM_WiFiController wifiService](self, "wifiService"), "bspBandSwitchRequest:targetBand:", v5, v4);
}

- (void)bspStatusRequest
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspStatusRequest to Wifi"));
  -[WCM_WiFiService bspStatusRequest](-[WCM_WiFiController wifiService](self, "wifiService"), "bspStatusRequest");
}

- (void)bspRegulatoryInfoRequest
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspRegulatoryInfoRequest to Wifi"));
  -[WCM_WiFiService bspRegulatoryInfoRequest](-[WCM_WiFiController wifiService](self, "wifiService"), "bspRegulatoryInfoRequest");
}

- (void)bspNanPhsStateRequest
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspNanPhsStateRequest to Wifi"));
  -[WCM_WiFiService bspNanPhsStateRequest](-[WCM_WiFiController wifiService](self, "wifiService"), "bspNanPhsStateRequest");
}

- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspSetCoexMode to Wifi"));
  -[WCM_WiFiService bspSetCoexMode:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:](-[WCM_WiFiController wifiService](self, "wifiService"), "bspSetCoexMode:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:", v13, v12, v11, v10, v9, v8);
}

- (void)bspGetBandSwitchStatus
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspGetBandSwitchStatus to Wifi"));
  -[WCM_WiFiService bspGetBandSwitchStatus](-[WCM_WiFiController wifiService](self, "wifiService"), "bspGetBandSwitchStatus");
}

- (void)bspGetChannelQualityInfo
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller sending bspGetChannelQualityInfo to Wifi"));
  -[WCM_WiFiService bspGetChannelQualityInfo](-[WCM_WiFiController wifiService](self, "wifiService"), "bspGetChannelQualityInfo");
}

- (void)setCoexParams:(const char *)a3 withValue:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting params for %s"), a3);
  -[WCM_WiFiService setCoexParams:withValue:](-[WCM_WiFiController wifiService](self, "wifiService"), "setCoexParams:withValue:", a3, a4);
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Wifi Controller setting antennaSelection %@"), a3);
  -[WCM_WiFiService setAntennaSelectionWiFiEnh:](-[WCM_WiFiController wifiService](self, "wifiService"), "setAntennaSelectionWiFiEnh:", a3);
}

- (BOOL)lteCDRXTDDMode
{
  return BYTE4(self->super._catsAppBitmap);
}

- (void)setLteCDRXTDDMode:(BOOL)a3
{
  BYTE4(self->super._catsAppBitmap) = a3;
}

- (NSNumber)rxPriThreshold
{
  return *(NSNumber **)&self->_mLeastCongestedChannelCount;
}

- (void)setRxPriThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 92);
}

- (NSArray)channelsBlocklisted
{
  return *(NSArray **)((char *)&self->_rxPriThreshold + 4);
}

- (void)setChannelsBlocklisted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 100);
}

- (NSArray)channelsWCI2Enabled
{
  return *(NSArray **)((char *)&self->_channelsBlocklisted + 4);
}

- (void)setChannelsWCI2Enabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 108);
}

- (NSMutableArray)channelsWCI2EnabledV2
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2Enabled + 4);
}

- (void)setChannelsWCI2EnabledV2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 116);
}

- (NSMutableArray)channelsWCI2Enabled2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2EnabledV2 + 4);
}

- (void)setChannelsWCI2Enabled2Gand5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 124);
}

- (NSMutableArray)channelsWCI2EnabledWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2Enabled2Gand5G + 4);
}

- (void)setChannelsWCI2EnabledWiFiEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 132);
}

- (NSMutableArray)channelsToEnableType7MSG
{
  return *(NSMutableArray **)((char *)&self->_channelsWCI2EnabledWiFiEnh + 4);
}

- (void)setChannelsToEnableType7MSG:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 140);
}

- (NSMutableArray)channelsToEnableType7MSG2GWiFi
{
  return *(NSMutableArray **)((char *)&self->_channelsToEnableType7MSG + 4);
}

- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 148);
}

- (NSMutableArray)channelsWiFiType7MSG2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsToEnableType7MSG2GWiFi + 4);
}

- (void)setChannelsWiFiType7MSG2Gand5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 156);
}

- (NSMutableArray)channelsWiFiType7MSGWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsWiFiType7MSG2Gand5G + 4);
}

- (void)setChannelsWiFiType7MSGWiFiEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 164);
}

- (NSArray)channelsOCLDisabled
{
  return *(NSArray **)((char *)&self->_channelsWiFiType7MSGWiFiEnh + 4);
}

- (void)setChannelsOCLDisabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 172);
}

- (NSMutableArray)channelsDisableOCL2Gand5G
{
  return *(NSMutableArray **)((char *)&self->_channelsOCLDisabled + 4);
}

- (void)setChannelsDisableOCL2Gand5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 180);
}

- (NSMutableArray)channelsDisableOCLWiFiEnh
{
  return *(NSMutableArray **)((char *)&self->_channelsDisableOCL2Gand5G + 4);
}

- (void)setChannelsDisableOCLWiFiEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 188);
}

- (NSArray)antennaConfig
{
  return *(NSArray **)((char *)&self->_channelsDisableOCLWiFiEnh + 4);
}

- (void)setAntennaConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 196);
}

- (NSArray)antennaSelection
{
  return *(NSArray **)((char *)&self->_antennaConfig + 4);
}

- (void)setAntennaSelection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 204);
}

- (void)setAntennaSelectionEnh2G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 212);
}

- (void)setAntennaSelectionEnh5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 220);
}

- (void)setAntennaSelectionEnh6G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 228);
}

- (NSArray)cdrxTDDEnabledChannels
{
  return *(NSArray **)((char *)&self->_antennaSelectionEnh6G + 4);
}

- (void)setCdrxTDDEnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 236);
}

- (NSArray)scanChannels
{
  return *(NSArray **)((char *)&self->_cdrxTDDEnabledChannels + 4);
}

- (void)setScanChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 244);
}

- (NSDictionary)frameConfiguration
{
  return *(NSDictionary **)((char *)&self->_scanChannels + 4);
}

- (void)setFrameConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 252);
}

- (double)cellularULCenterFreq
{
  return *(double *)((char *)&self->_frameConfiguration + 4);
}

- (void)setCellularULCenterFreq:(double)a3
{
  *(double *)((char *)&self->_frameConfiguration + 4) = a3;
}

- (double)cellularULBandwidth
{
  return *(double *)((char *)&self->_cellularULCenterFreq + 4);
}

- (void)setCellularULBandwidth:(double)a3
{
  *(double *)((char *)&self->_cellularULCenterFreq + 4) = a3;
}

- (double)cellularULCenterFreq2
{
  return *(double *)((char *)&self->_cellularULBandwidth + 4);
}

- (void)setCellularULCenterFreq2:(double)a3
{
  *(double *)((char *)&self->_cellularULBandwidth + 4) = a3;
}

- (double)cellularULBandwidth2
{
  return *(double *)((char *)&self->_cellularULCenterFreq2 + 4);
}

- (void)setCellularULBandwidth2:(double)a3
{
  *(double *)((char *)&self->_cellularULCenterFreq2 + 4) = a3;
}

- (NSNumber)wifiAgcModeEnable
{
  return *(NSNumber **)((char *)&self->_cellularULBandwidth2 + 4);
}

- (void)setWifiAgcModeEnable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 292);
}

- (BOOL)mCarPlaySessionInProgress
{
  return BYTE5(self->super._catsAppBitmap);
}

- (void)setMCarPlaySessionInProgress:(BOOL)a3
{
  BYTE5(self->super._catsAppBitmap) = a3;
}

- (int)mCarPlayBTScanRelaxReason
{
  return *(_DWORD *)&self->_lteCDRXTDDMode;
}

- (void)setMCarPlayBTScanRelaxReason:(int)a3
{
  *(_DWORD *)&self->_lteCDRXTDDMode = a3;
}

- (unsigned)mLeastCongestedChannel
{
  return self->_mCarPlayBTScanRelaxReason;
}

- (void)setMLeastCongestedChannel:(unsigned int)a3
{
  self->_mCarPlayBTScanRelaxReason = a3;
}

- (unsigned)mLeastCongestedChannelCount
{
  return self->_mLeastCongestedChannel;
}

- (void)setMLeastCongestedChannelCount:(unsigned int)a3
{
  self->_mLeastCongestedChannel = a3;
}

- (int64_t)activeProfileFor2G
{
  return *(int64_t *)((char *)&self->_wifiAgcModeEnable + 4);
}

- (void)setActiveProfileFor2G:(int64_t)a3
{
  *(NSNumber **)((char *)&self->_wifiAgcModeEnable + 4) = (NSNumber *)a3;
}

- (int64_t)activeProfileFor5G
{
  return *(int64_t *)((char *)&self->_activeProfileFor2G + 4);
}

- (void)setActiveProfileFor5G:(int64_t)a3
{
  *(int64_t *)((char *)&self->_activeProfileFor2G + 4) = a3;
}

- (BOOL)sharedAntennaDisabled
{
  return BYTE6(self->super._catsAppBitmap);
}

- (void)setSharedAntennaDisabled:(BOOL)a3
{
  BYTE6(self->super._catsAppBitmap) = a3;
}

- (BOOL)wifiBTCoexProfilesDownloaded
{
  return HIBYTE(self->super._catsAppBitmap);
}

- (void)setWifiBTCoexProfilesDownloaded:(BOOL)a3
{
  HIBYTE(self->super._catsAppBitmap) = a3;
}

@end

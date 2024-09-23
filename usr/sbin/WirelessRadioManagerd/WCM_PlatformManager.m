@implementation WCM_PlatformManager

- (NSNumber)wcmCellularWCI2ModeMaxAllowedFrameDenials
{
  return self->_wcmCellularWCI2ModeMaxAllowedFrameDenials;
}

- (NSNumber)wcmCellularWCI2ModeLTETxDenial
{
  return self->_wcmCellularWCI2ModeLTETxDenial;
}

- (NSNumber)wcmCellularWCI2ModeFrameDenialWindow
{
  return self->_wcmCellularWCI2ModeFrameDenialWindow;
}

- (int)wrmPlatformId
{
  return self->_wrmPlatformId;
}

- (WCM_WiFiCellCoexIssueBandTable)wcmWiFiCellCoexIssueTable
{
  return self->_wcmWiFiCellCoexIssueTable;
}

- (unint64_t)wcmCellularWCI2PlatformPolicyBitmap
{
  return self->_wcmCellularWCI2PlatformPolicyBitmap;
}

- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimitTO
{
  return self->_wcmCellularWCI2ModeWCI2PowerLimitTO;
}

- (NSNumber)wcmCellularWCI2ModeTxPowerThresholdAdvTx
{
  return self->_wcmCellularWCI2ModeTxPowerThresholdAdvTx;
}

- (NSNumber)wcmCellularWCI2ModeRBFilerAlpha
{
  return self->_wcmCellularWCI2ModeRBFilerAlpha;
}

- (NSNumber)wcmCellularWCI2ModePowerThreshold
{
  return self->_wcmCellularWCI2ModePowerThreshold;
}

- (NSNumber)wcmCellularWCI2ModeLinkPathLossThreshold
{
  return self->_wcmCellularWCI2ModeLinkPathLossThreshold;
}

- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerHigh
{
  return self->_wcmCellularWCI2ModeLTEMaxTxPowerHigh;
}

- (NSNumber)wcmCellularWCI2ModeLTEHarqnackratioThreshold
{
  return self->_wcmCellularWCI2ModeLTEHarqnackratioThreshold;
}

- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimitTO
{
  return self->_wcmCellularWCI2ModeControllerTxPowerLimitTO;
}

- (NSNumber)wcmCellularWCI2ModeControllerLTERBThreshold
{
  return self->_wcmCellularWCI2ModeControllerLTERBThreshold;
}

- (NSNumber)wcmCellularWCI2ModeControllerLTEPowerLimitingEnable
{
  return self->_wcmCellularWCI2ModeControllerLTEPowerLimitingEnable;
}

- (NSNumber)wcmCellularWCI2ModeAPTTable
{
  return self->_wcmCellularWCI2ModeAPTTable;
}

- (WCM_PlatformManager)init
{
  WCM_PlatformManager *v3;
  WCM_PlatformManager *v4;
  objc_super v6;

  NSLog(CFSTR("Init Platform"), a2);
  v6.receiver = self;
  v6.super_class = (Class)WCM_PlatformManager;
  v3 = -[WCM_PlatformManager init](&v6, "init");
  v4 = v3;
  if (v3)
  {
    -[WCM_PlatformManager setPlatform](v3, "setPlatform");
    -[WCM_PlatformManager initPlatformPolicies](v4, "initPlatformPolicies");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  NSLog(CFSTR("Dealloc Platform"), a2);

  v3.receiver = self;
  v3.super_class = (Class)WCM_PlatformManager;
  -[WCM_PlatformManager dealloc](&v3, "dealloc");
}

- (NSMutableSet)wcmCoexFeatures
{
  NSMutableSet *result;

  result = self->_wcmCoexFeatures;
  if (!result)
  {
    result = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_wcmCoexFeatures = result;
  }
  return result;
}

- (void)initPlatformPolicies
{
  CFPropertyListRef v3;
  CFTypeID TypeID;
  CFTypeID v5;
  void *value;

  +[WCM_Logging initSettingsFromPreferences](WCM_Logging, "initSettingsFromPreferences");
  -[WCM_PlatformManager setLoggingToFileEnabled:](self, "setLoggingToFileEnabled:", +[WCM_Logging getLogToFile](WCM_Logging, "getLogToFile"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("WRM Version: %s"), ");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Init Platform Policies for wrmPlatformId(%u)"), -[WCM_PlatformManager wrmPlatformId](self, "wrmPlatformId"));
  -[WCM_PlatformManager setForceWiFiBTCoexToTDD:](self, "setForceWiFiBTCoexToTDD:", -[WCM_PlatformManager fetchWRMdebugPlistForceTDD](self, "fetchWRMdebugPlistForceTDD"));
  if (-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Forcing WiFi/BT coex to TDD ? (%d)"), -[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"));
  -[WCM_PlatformManager loadStaticPolicyFor:](self, "loadStaticPolicyFor:", -[WCM_PlatformManager wrmPlatformId](self, "wrmPlatformId"));
  -[WCM_PlatformManager configureSupportedPlatform](self, "configureSupportedPlatform");
  value = 0;
  v3 = CFPreferencesCopyAppValue(CFSTR("ConfigInfo"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (v3
    && (TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v3))
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, CFSTR("ConfigEnable"), (const void **)&value)
    && (v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
  {
    if (CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0) == kCFCompareEqualTo)
      -[WCM_PlatformManager loadCoexConfigurablePolicy](self, "loadCoexConfigurablePolicy");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ConfigInfo not Found"));
  }
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("DisableiRAT")))-[WCM_PlatformManager setIRATSupported:](self, "setIRATSupported:", 0);
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("LTEScanProtection")))-[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x400);
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex")))-[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x800);
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("CellularWatchFcmBcmAntennaReport")))-[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x800);
  if ((-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex")) & 1) != 0|| -[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV1_1Coex")))
  {
    -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x800);
    -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x10000);
  }
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("WCI2Type7ShortBit")))-[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x4000);
  if ((-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("ProtectWiFiRanging")) & 1) != 0|| -[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("CellularMwsTxAllBands")))
  {
    -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 2);
  }
  if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("LTELAACoexSupport")))
  {
    -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x20000);
    if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))
    {
      if (-[NSMutableSet containsObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))-[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x40000);
    }
  }
  if (v3)
    CFRelease(v3);
  -[WCM_PlatformManager printPlatformConfig](self, "printPlatformConfig");
}

- (void)printPlatformConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Platform Coex Features: %@"), -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Cellular Configuration"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Max TxPower High: %@"), -[WCM_PlatformManager wcmCellularWCI2ModeLTEMaxTxPowerHigh](self, "wcmCellularWCI2ModeLTEMaxTxPowerHigh"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Max TxPower Low: %@"), -[WCM_PlatformManager wcmCellularWCI2ModeLTEMaxTxPowerLow](self, "wcmCellularWCI2ModeLTEMaxTxPowerLow"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Max LTE Denial: %@"), -[WCM_PlatformManager wcmCellularWCI2ModeLTETxDenial](self, "wcmCellularWCI2ModeLTETxDenial"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Max Allowed Frame Denials :%@"), -[WCM_PlatformManager wcmCellularWCI2ModeMaxAllowedFrameDenials](self, "wcmCellularWCI2ModeMaxAllowedFrameDenials"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Frame Denial Window :%@"), -[WCM_PlatformManager wcmCellularWCI2ModeFrameDenialWindow](self, "wcmCellularWCI2ModeFrameDenialWindow"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Tx Pwr Threshold for Adv Tx :%@"), -[WCM_PlatformManager wcmCellularWCI2ModeTxPowerThresholdAdvTx](self, "wcmCellularWCI2ModeTxPowerThresholdAdvTx"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Tx Rb Threshold for Adv Tx :%@"), -[WCM_PlatformManager wcmCellularWCI2ModeRBThresholdAdvTx](self, "wcmCellularWCI2ModeRBThresholdAdvTx"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    LTE Scan Protection Frequencies: %@"), -[WCM_PlatformManager wcmCellularScanProtectionCellFrequencies](self, "wcmCellularScanProtectionCellFrequencies"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Scan Protection Channels: %@"), -[WCM_PlatformManager wcmCellularScanProtectionWiFiChannels](self, "wcmCellularScanProtectionWiFiChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Scan Protection Max Duration: %@"), -[WCM_PlatformManager wcmCellularScanProtectionWiFiMaxDuration](self, "wcmCellularScanProtectionWiFiMaxDuration"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    LTE Scan Protection Frequencies for BT: %@"), -[WCM_PlatformManager wcmCellularScanProtectionCellFrequenciesforBT](self, "wcmCellularScanProtectionCellFrequenciesforBT"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFi Configuration"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Block Listed Channels on B7  : %@"), -[WCM_PlatformManager wcmWiFiB7BlocklistChannels](self, "wcmWiFiB7BlocklistChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    WCI2 Enabled Channels on B7  : %@"), -[WCM_PlatformManager wcmWiFiB7WCI2EnabledChannels](self, "wcmWiFiB7WCI2EnabledChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Block Listed Channels on B40A: %@"), -[WCM_PlatformManager wcmWiFiB40ABlocklistChannels](self, "wcmWiFiB40ABlocklistChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    WCI2 Enabled Channels on B40A: %@"), -[WCM_PlatformManager wcmWiFiB40AWCI2EnabledChannels](self, "wcmWiFiB40AWCI2EnabledChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Block Listed Channels on B40B: %@"), -[WCM_PlatformManager wcmWiFiB40BBlocklistChannels](self, "wcmWiFiB40BBlocklistChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    WCI2 Enabled Channels on B40B: %@"), -[WCM_PlatformManager wcmWiFiB40BWCI2EnabledChannels](self, "wcmWiFiB40BWCI2EnabledChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Block Listed Channels on B41A1: %@"), -[WCM_PlatformManager wcmWiFiB41A1BlocklistChannels](self, "wcmWiFiB41A1BlocklistChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    WCI2 Enabled Channels on B41A1: %@"), -[WCM_PlatformManager wcmWiFiB41A1WCI2EnabledChannels](self, "wcmWiFiB41A1WCI2EnabledChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Block Listed Channels on B41A2: %@"), -[WCM_PlatformManager wcmWiFiB41A2BlocklistChannels](self, "wcmWiFiB41A2BlocklistChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    WCI2 Enabled Channels on B41A2: %@"), -[WCM_PlatformManager wcmWiFiB41A2WCI2EnabledChannels](self, "wcmWiFiB41A2WCI2EnabledChannels"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Rx Pri Threshold Low : %@"), -[WCM_PlatformManager wcmWiFiPriThresholdLow](self, "wcmWiFiPriThresholdLow"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Rx Pri Threshold Med : %@"), -[WCM_PlatformManager wcmWiFiPriThresholdMed](self, "wcmWiFiPriThresholdMed"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Rx Pri Threshold High: %@"), -[WCM_PlatformManager wcmWiFiPriThresholdHigh](self, "wcmWiFiPriThresholdHigh"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Non-Coex Config     : %@"), -[WCM_PlatformManager wcmWiFiAntennaConfigDefault](self, "wcmWiFiAntennaConfigDefault"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Non-Coex Cell Policy: %@"), -[WCM_PlatformManager wcmWiFiAntennaCellPolicyDefault](self, "wcmWiFiAntennaCellPolicyDefault"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Coex Config         : %@"), -[WCM_PlatformManager wcmWiFiAntennaConfig](self, "wcmWiFiAntennaConfig"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Coex Cell Policy    : %@"), -[WCM_PlatformManager wcmWiFiAntennaCellPolicy](self, "wcmWiFiAntennaCellPolicy"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BT Configuration"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap Default : %@"), -[WCM_PlatformManager wcmBTAFHMapDefault](self, "wcmBTAFHMapDefault"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap B7   : %@"), -[WCM_PlatformManager wcmBTB7AFHMap](self, "wcmBTB7AFHMap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap B40A : %@"), -[WCM_PlatformManager wcmBTB40AAFHMap](self, "wcmBTB40AAFHMap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap B40B : %@"), -[WCM_PlatformManager wcmBTB40BAFHMap](self, "wcmBTB40BAFHMap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap B41A1: %@"), -[WCM_PlatformManager wcmBTB41A1AFHMap](self, "wcmBTB41A1AFHMap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    AFHMap B41A2: %@"), -[WCM_PlatformManager wcmBTB41A2AFHMap](self, "wcmBTB41A2AFHMap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    ChannelMap Default : %@"), -[WCM_PlatformManager wcmHFBTChannelMapDefault](self, "wcmHFBTChannelMapDefault"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Blocking Band Default : %@"), -[WCM_PlatformManager wcmBTAntBlockEnableBandsDefault](self, "wcmBTAntBlockEnableBandsDefault"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Preferred Role : %@"), -[WCM_PlatformManager wcmBTPreferredRole](self, "wcmBTPreferredRole"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Coex Default     : %@"), -[WCM_PlatformManager wcmBTDefaultAntenna](self, "wcmBTDefaultAntenna"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Non-Coex Default : %@"), -[WCM_PlatformManager wcmBTDefaultAntennaNonCoex](self, "wcmBTDefaultAntennaNonCoex"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Coex Config      : %@"), -[WCM_PlatformManager wcmBTAntennaConfig](self, "wcmBTAntennaConfig"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Non-Coex Config  : %@"), -[WCM_PlatformManager wcmBTAntennaConfigNonCoex](self, "wcmBTAntennaConfigNonCoex"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("    Antenna Blocking Duration  : %@"), -[WCM_PlatformManager wcmBTAntBlockDuration](self, "wcmBTAntBlockDuration"));
}

- (void)loadConfigurableActiveFeature:(id)a3
{
  const __CFString *v5;

  -[NSMutableSet removeAllObjects](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "removeAllObjects");
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DisableiRAT")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableiRAT"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCI2Mode")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Mode"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeepBTAwake")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("KeepBTAwake"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LTEScanProtection")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LTECDRXWiFiTimeSharing")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AntennaSelectionCoex")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionCoex"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AntennaSelectionV2Coex")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AntennaSelectionV1_1Coex")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiOCLSupport")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiAWDWCI2CoexBitmap")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCI2Type7ShortBit")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AntennaTunningForGps")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BTDiversityAFHMap")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTDiversityAFHMap"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiAWDWCI2CoexBitmap")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCI2Type7ShortBit")), "BOOLValue"))
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AntennaTunningForGps")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ProtectWiFiRanging")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
  v5 = CFSTR("WiFiBtProfile");
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiBtProfile")), "BOOLValue") & 1) != 0
    || (v5 = CFSTR("WiFiBt5GProfile"),
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiBt5GProfile")), "BOOLValue")))
  {
    -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", v5);
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiAntennaFallback")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAntennaFallback"));
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Wifi5gChannelMapping")), "BOOLValue"))-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
}

- (void)loadCoexConfigurablePolicy
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Loading Coex Configurable Policies"), 0, 0);
  v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", sub_1000896B4((uint64_t)CFSTR("WRMPolicy"), (uint64_t)CFSTR("plist")), 2, &v10, &v11);
  if (v3)
  {
    v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CoexPolicy"));
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WiFi"));
      if (v6)
        -[WCM_PlatformManager loadWiFiConfigurablePolicy:](self, "loadWiFiConfigurablePolicy:", v6);
      v7 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BT"));
      if (v7)
        -[WCM_PlatformManager loadBTConfigurablePolicy:](self, "loadBTConfigurablePolicy:", v7);
      v8 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Cellular"));
      if (v8)
        -[WCM_PlatformManager loadCellularConfigurablePolicy:](self, "loadCellularConfigurablePolicy:", v8);
      v9 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activeFeatures"));
      if (v9)
        -[WCM_PlatformManager loadConfigurableActiveFeature:](self, "loadConfigurableActiveFeature:", v9);
    }
    else
    {
      NSLog(CFSTR("No Coex specific config"));
    }
    -[WCM_PlatformManager printPlatformConfig](self, "printPlatformConfig");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("No Policy found"));
  }
}

- (void)loadWiFiConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmWiFiB7BlocklistChannels:](self, "setWcmWiFiB7BlocklistChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B7_BLOCKLIST_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB7WCI2EnabledChannels:](self, "setWcmWiFiB7WCI2EnabledChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B7_WCI2_ENABLED_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB40ABlocklistChannels:](self, "setWcmWiFiB40ABlocklistChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B40A_BLOCKLIST_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB40AWCI2EnabledChannels:](self, "setWcmWiFiB40AWCI2EnabledChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B40A_WCI2_ENABLED_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB40BBlocklistChannels:](self, "setWcmWiFiB40BBlocklistChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B40B_BLOCKLIST_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB40BWCI2EnabledChannels:](self, "setWcmWiFiB40BWCI2EnabledChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B40B_WCI2_ENABLED_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB41A1BlocklistChannels:](self, "setWcmWiFiB41A1BlocklistChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B41A1_BLOCKLIST_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB41A1WCI2EnabledChannels:](self, "setWcmWiFiB41A1WCI2EnabledChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B41A1_WCI2_ENABLED_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB41A2BlocklistChannels:](self, "setWcmWiFiB41A2BlocklistChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B41A2_BLOCKLIST_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiB41A2WCI2EnabledChannels:](self, "setWcmWiFiB41A2WCI2EnabledChannels:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_B41A2_WCI2_ENABLED_CHANNELS")));
  -[WCM_PlatformManager setWcmWiFiPriThresholdLow:](self, "setWcmWiFiPriThresholdLow:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_RX_PRI_THRESHOLD_LOW")));
  -[WCM_PlatformManager setWcmWiFiPriThresholdMed:](self, "setWcmWiFiPriThresholdMed:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_RX_PRI_THRESHOLD_MED")));
  -[WCM_PlatformManager setWcmWiFiPriThresholdHigh:](self, "setWcmWiFiPriThresholdHigh:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_WIFI_RX_PRI_THRESHOLD_HIGH")));
}

- (void)loadBTConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmBTAFHMapDefault:](self, "setWcmBTAFHMapDefault:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_AFHMAP_DEFAULT")));
  -[WCM_PlatformManager setWcmBTB7AFHMap:](self, "setWcmBTB7AFHMap:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_B7_AFHMAP")));
  -[WCM_PlatformManager setWcmBTB40AAFHMap:](self, "setWcmBTB40AAFHMap:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_B40A_AFHMAP")));
  -[WCM_PlatformManager setWcmBTB40BAFHMap:](self, "setWcmBTB40BAFHMap:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_B40B_AFHMAP")));
  -[WCM_PlatformManager setWcmBTB41A1AFHMap:](self, "setWcmBTB41A1AFHMap:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_B41A1_AFHMAP")));
  -[WCM_PlatformManager setWcmBTB41A2AFHMap:](self, "setWcmBTB41A2AFHMap:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_B41A2_AFHMAP")));
  -[WCM_PlatformManager setWcmBTPreferredRole:](self, "setWcmBTPreferredRole:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_BT_PREFERRED_ROLE")));
}

- (void)loadCellularConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmCellularWCI2ModePolicy:](self, "setWcmCellularWCI2ModePolicy:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_POLICY")));
  -[WCM_PlatformManager setWcmCellularWCI2ModePowerThreshold:](self, "setWcmCellularWCI2ModePowerThreshold:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_POWERTHRESHOLD")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdHigh:](self, "setWcmCellularWCI2ModeRBThresholdHigh:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_HIGH")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdLow:](self, "setWcmCellularWCI2ModeRBThresholdLow:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_LOW")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTETxDenial:](self, "setWcmCellularWCI2ModeLTETxDenial:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_LTE_TXDENIAL")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeAPTTable:](self, "setWcmCellularWCI2ModeAPTTable:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_APTTABLE")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimit:](self, "setWcmCellularWCI2ModeControllerTxPowerLimit:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_CONTROLLER_TXPOWERLIMIT")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimit:](self, "setWcmCellularWCI2ModeWCI2PowerLimit:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_WCI2_POWERLIMIT")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLinkPathLossThreshold:](self, "setWcmCellularWCI2ModeLinkPathLossThreshold:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_LINK_PATHLOSSTHRESHOLD")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBFilerAlpha:](self, "setWcmCellularWCI2ModeRBFilerAlpha:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_RB_FILTERALPHA")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdHigh:](self, "setWcmCellularWCI2ModeFilterRBThresholdHigh:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_FILTER_RBTHRESHOLD_HIGH")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdLow:](self, "setWcmCellularWCI2ModeFilterRBThresholdLow:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_FILTER_RBTHRESHOLD_LOW")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimitTO:](self, "setWcmCellularWCI2ModeControllerTxPowerLimitTO:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_CONTROLLER_TXPOWERLIMIT_TO")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimitTO:](self, "setWcmCellularWCI2ModeWCI2PowerLimitTO:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_WCI2_POWERLIMIT_TO")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeMaxAllowedFrameDenials:](self, "setWcmCellularWCI2ModeMaxAllowedFrameDenials:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_MAX_ALLOWED_FRAME_DENIALS")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFrameDenialWindow:](self, "setWcmCellularWCI2ModeFrameDenialWindow:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_FRAME_DENIAL_WINDOW")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeTxPowerThresholdAdvTx:](self, "setWcmCellularWCI2ModeTxPowerThresholdAdvTx:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_TXPOWER_THRESHOLD_ADVANCE_TX")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdAdvTx:](self, "setWcmCellularWCI2ModeRBThresholdAdvTx:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_ADVANCE_TX")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEMaxTxPowerHigh:](self, "setWcmCellularWCI2ModeLTEMaxTxPowerHigh:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_LTE_MAX_TX_POWER_HIGH")));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEMaxTxPowerLow:](self, "setWcmCellularWCI2ModeLTEMaxTxPowerLow:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WCM_CELLULAR_LTE_MAX_TX_POWER_LOW")));
}

- (void)enableLegacyCoexFeature
{
  -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("KeepBTAwake"));
}

- (void)configureSupportedPlatform
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[WCM_PlatformManager wrmPlatformId](self, "wrmPlatformId");
  v4 = 1;
  switch(v3)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 5u:
    case 7u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xDCu:
    case 0xDDu:
    case 0xDEu:
    case 0xDFu:
    case 0xE0u:
    case 0xE1u:
    case 0xE2u:
    case 0xE3u:
    case 0xE4u:
    case 0xE5u:
    case 0xE6u:
    case 0xE7u:
    case 0xE8u:
    case 0xE9u:
    case 0xEAu:
    case 0xEBu:
    case 0xECu:
    case 0xEDu:
    case 0xEEu:
    case 0xEFu:
    case 0xF0u:
    case 0xF1u:
    case 0xF2u:
    case 0xF3u:
    case 0xF4u:
    case 0x104u:
    case 0x105u:
    case 0x106u:
    case 0x107u:
    case 0x108u:
    case 0x109u:
    case 0x10Au:
    case 0x12Cu:
    case 0x12Du:
    case 0x12Eu:
    case 0x12Fu:
    case 0x130u:
    case 0x131u:
    case 0x132u:
    case 0x133u:
    case 0x134u:
    case 0x135u:
    case 0x136u:
    case 0x137u:
    case 0x138u:
    case 0x139u:
    case 0x13Au:
    case 0x13Bu:
    case 0x13Cu:
    case 0x13Du:
    case 0x13Eu:
    case 0x13Fu:
    case 0x140u:
    case 0x141u:
    case 0x142u:
    case 0x143u:
    case 0x144u:
    case 0x145u:
    case 0x146u:
    case 0x147u:
    case 0x148u:
    case 0x149u:
    case 0x14Au:
    case 0x14Bu:
    case 0x14Cu:
    case 0x14Du:
    case 0x14Eu:
    case 0x14Fu:
    case 0x150u:
    case 0x151u:
    case 0x152u:
    case 0x153u:
    case 0x154u:
    case 0x155u:
    case 0x156u:
    case 0x157u:
      break;
    case 4u:
    case 6u:
    case 8u:
    case 9u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0xAEu:
    case 0xAFu:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
    case 0xC4u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCBu:
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD2u:
    case 0xD3u:
    case 0xD4u:
    case 0xD5u:
    case 0xD6u:
    case 0xD7u:
    case 0xD8u:
    case 0xD9u:
    case 0xDAu:
    case 0xDBu:
    case 0xF5u:
    case 0xF6u:
    case 0xF7u:
    case 0xF8u:
    case 0xF9u:
    case 0xFAu:
    case 0xFBu:
    case 0xFCu:
    case 0xFDu:
    case 0xFEu:
    case 0xFFu:
    case 0x100u:
    case 0x101u:
    case 0x102u:
    case 0x103u:
    case 0x10Bu:
    case 0x10Cu:
    case 0x10Du:
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
    case 0x111u:
    case 0x112u:
    case 0x113u:
    case 0x114u:
    case 0x115u:
    case 0x116u:
    case 0x117u:
    case 0x118u:
    case 0x119u:
    case 0x11Au:
    case 0x11Bu:
    case 0x11Cu:
    case 0x11Du:
    case 0x11Eu:
    case 0x11Fu:
    case 0x120u:
    case 0x121u:
    case 0x122u:
    case 0x123u:
    case 0x124u:
    case 0x125u:
    case 0x126u:
    case 0x127u:
    case 0x128u:
    case 0x129u:
    case 0x12Au:
    case 0x12Bu:
      goto LABEL_5;
    default:
      if (v3 - 500 >= 3 && v3 - 600 >= 2)
LABEL_5:
        v4 = 0;
      break;
  }
  -[WCM_PlatformManager setCoexSupported:](self, "setCoexSupported:", v4);
  -[WCM_PlatformManager setIRATSupported:](self, "setIRATSupported:", 1);
}

- (BOOL)isBand40ACoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0)
      return 0;
    v6 = a6 * 0.5 + a5;
  }
  else
  {
    v6 = a4 * 0.5 + a3;
  }
  -[WCM_PlatformManager wcmCellularCoexB40ARange](self, "wcmCellularCoexB40ARange");
  v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand40BCoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0)
      return 0;
    v6 = a6 * 0.5 + a5;
  }
  else
  {
    v6 = a4 * 0.5 + a3;
  }
  -[WCM_PlatformManager wcmCellularCoexB40BRange](self, "wcmCellularCoexB40BRange");
  v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand41A1CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0)
      return 0;
    v6 = a5 + a6 * -0.5;
  }
  else
  {
    v6 = a3 + a4 * -0.5;
  }
  -[WCM_PlatformManager wcmCellularCoexB41A1Range](self, "wcmCellularCoexB41A1Range");
  v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand41A2CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0)
      return 0;
    v6 = a5 + a6 * -0.5;
  }
  else
  {
    v6 = a3 + a4 * -0.5;
  }
  -[WCM_PlatformManager wcmCellularCoexB41A2Range](self, "wcmCellularCoexB41A2Range");
  v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand7CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0)
      return 0;
    v6 = a5 + a6 * -0.5;
    -[WCM_PlatformManager wcmCellularCoexB7DLRange](self, "wcmCellularCoexB7DLRange");
  }
  else
  {
    v6 = a3 + a4 * -0.5;
    -[WCM_PlatformManager wcmCellularCoexB7ULRange](self, "wcmCellularCoexB7ULRange");
  }
  v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (unint64_t)getBand40AUlCenterFreq
{
  double v3;
  double v4;
  double v5;

  -[WCM_PlatformManager wcmCellularCoexB40ARange](self, "wcmCellularCoexB40ARange");
  v4 = v3;
  -[WCM_PlatformManager wcmCellularCoexB40ARange](self, "wcmCellularCoexB40ARange");
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand40AUlBw
{
  double v2;

  -[WCM_PlatformManager wcmCellularCoexB40ARange](self, "wcmCellularCoexB40ARange");
  return (unint64_t)v2;
}

- (unint64_t)getBand40BUlCenterFreq
{
  double v3;
  double v4;
  double v5;

  -[WCM_PlatformManager wcmCellularCoexB40BRange](self, "wcmCellularCoexB40BRange");
  v4 = v3;
  -[WCM_PlatformManager wcmCellularCoexB40BRange](self, "wcmCellularCoexB40BRange");
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand40BUlBw
{
  double v2;

  -[WCM_PlatformManager wcmCellularCoexB40BRange](self, "wcmCellularCoexB40BRange");
  return (unint64_t)v2;
}

- (unint64_t)getBand41A1UlCenterFreq
{
  double v3;
  double v4;
  double v5;

  -[WCM_PlatformManager wcmCellularCoexB41A1Range](self, "wcmCellularCoexB41A1Range");
  v4 = v3;
  -[WCM_PlatformManager wcmCellularCoexB41A1Range](self, "wcmCellularCoexB41A1Range");
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand41A1UlBw
{
  double v2;

  -[WCM_PlatformManager wcmCellularCoexB41A1Range](self, "wcmCellularCoexB41A1Range");
  return (unint64_t)v2;
}

- (unint64_t)getBand41A2UlCenterFreq
{
  double v3;
  double v4;
  double v5;

  -[WCM_PlatformManager wcmCellularCoexB41A2Range](self, "wcmCellularCoexB41A2Range");
  v4 = v3;
  -[WCM_PlatformManager wcmCellularCoexB41A2Range](self, "wcmCellularCoexB41A2Range");
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand41A2UlBw
{
  double v2;

  -[WCM_PlatformManager wcmCellularCoexB41A2Range](self, "wcmCellularCoexB41A2Range");
  return (unint64_t)v2;
}

- (BOOL)isIMD2ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8
{
  return sub_10007AE04(0, a3 - a4 * 0.5, a4, a5 - a5 * 0.5, a6, a7 - a8 * 0.5, a8);
}

- (BOOL)isIMD3ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8
{
  return sub_10007AEAC(0, a3 - a4 * 0.5, a4, a5 - a5 * 0.5, a6, a7 - a8 * 0.5, a8);
}

- (BOOL)is3FoForFreq:(double)a3 bw:(double)a4 resultantFreq:(double)a5 resultantBW:(double)a6
{
  return sub_10007AD2C(0, a3 - a4 * 0.5, a4, a5 - a6 * 0.5, a6);
}

- (BOOL)fetchWRMdebugPlistForceTDD
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  CFTypeID TypeID;
  CFComparisonResult v5;
  const char *v6;
  BOOL v7;
  const __CFString *v8;
  void *value;

  v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("ForceTDD"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (v2)
  {
    v3 = v2;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v3, CFSTR("ForceWiFiBTCoexModeToTDD"), (const void **)&value))
      {
        v5 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0);
        v6 = "FALSE";
        v7 = v5 == kCFCompareEqualTo;
        if (v5 == kCFCompareEqualTo)
          v6 = "TRUE";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("In fetchWRMdebugPlistForceTDD: Reading value %s"), v6);
        goto LABEL_11;
      }
      v8 = CFSTR("In fetchWRMdebugPlistForceTDD: Reading value FAILED");
    }
    else
    {
      v8 = CFSTR("In fetchWRMdebugPlistForceTDD: dict does not exist");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v8);
    v7 = 0;
LABEL_11:
    CFRelease(v3);
    return v7;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("In fetchWRMdebugPlistForceTDD: dict does not exist"));
  return 0;
}

- (void)setWrmPlatformId:(int)a3
{
  self->_wrmPlatformId = a3;
}

- (int)wrmSku
{
  return self->_wrmSku;
}

- (void)setWrmSku:(int)a3
{
  self->_wrmSku = a3;
}

- (BOOL)coexSupported
{
  return self->_coexSupported;
}

- (void)setCoexSupported:(BOOL)a3
{
  self->_coexSupported = a3;
}

- (BOOL)iRATSupported
{
  return self->_iRATSupported;
}

- (void)setIRATSupported:(BOOL)a3
{
  self->_iRATSupported = a3;
}

- (BOOL)loggingToFileEnabled
{
  return self->_loggingToFileEnabled;
}

- (void)setLoggingToFileEnabled:(BOOL)a3
{
  self->_loggingToFileEnabled = a3;
}

- (void)setWcmCoexFeatures:(id)a3
{
  self->_wcmCoexFeatures = (NSMutableSet *)a3;
}

- (void)setWcmWiFiCellCoexIssueTable:(id)a3
{
  self->_wcmWiFiCellCoexIssueTable = (WCM_WiFiCellCoexIssueBandTable *)a3;
}

- (WCM_CellularRc1CoexIssueTable)wcmCellRc1CoexIssueTable
{
  return self->_wcmCellRc1CoexIssueTable;
}

- (void)setWcmCellRc1CoexIssueTable:(id)a3
{
  self->_wcmCellRc1CoexIssueTable = (WCM_CellularRc1CoexIssueTable *)a3;
}

- (NSDictionary)wcmWiFiBTCoexProfileDefault
{
  return self->_wcmWiFiBTCoexProfileDefault;
}

- (void)setWcmWiFiBTCoexProfileDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSDictionary)wcmWiFiBTCoexProfileDefault5G
{
  return self->_wcmWiFiBTCoexProfileDefault5G;
}

- (void)setWcmWiFiBTCoexProfileDefault5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)wcmWiFiBTCoexProfileLight
{
  return self->_wcmWiFiBTCoexProfileLight;
}

- (void)setWcmWiFiBTCoexProfileLight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavy
{
  return self->_wcmWiFiBTCoexProfileHeavy;
}

- (void)setWcmWiFiBTCoexProfileHeavy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)wcmWiFiBTCoexProfileClamshell
{
  return self->_wcmWiFiBTCoexProfileClamshell;
}

- (void)setWcmWiFiBTCoexProfileClamshell:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSDictionary)wcmWiFiBTCoexProfileHPP
{
  return self->_wcmWiFiBTCoexProfileHPP;
}

- (void)setWcmWiFiBTCoexProfileHPP:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSDictionary)wcmWiFiBTCoexProfileHPPHeavy
{
  return self->_wcmWiFiBTCoexProfileHPPHeavy;
}

- (void)setWcmWiFiBTCoexProfileHPPHeavy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSDictionary)wcmWiFiBTCoexProfileUSB3Desense
{
  return self->_wcmWiFiBTCoexProfileUSB3Desense;
}

- (void)setWcmWiFiBTCoexProfileUSB3Desense:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyHFP
{
  return self->_wcmWiFiBTCoexProfileHeavyHFP;
}

- (void)setWcmWiFiBTCoexProfileHeavyHFP:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyLEA
{
  return self->_wcmWiFiBTCoexProfileHeavyLEA;
}

- (void)setWcmWiFiBTCoexProfileHeavyLEA:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyA2DP
{
  return self->_wcmWiFiBTCoexProfileHeavyA2DP;
}

- (void)setWcmWiFiBTCoexProfileHeavyA2DP:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSDictionary)wcmWiFiBTCoexProfileTDD
{
  return self->_wcmWiFiBTCoexProfileTDD;
}

- (void)setWcmWiFiBTCoexProfileTDD:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSDictionary)wcmWiFiBTCoexProfileThreadHybrid
{
  return self->_wcmWiFiBTCoexProfileThreadHybrid;
}

- (void)setWcmWiFiBTCoexProfileThreadHybrid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (BOOL)forceWiFiBTCoexToTDD
{
  return self->_forceWiFiBTCoexToTDD;
}

- (void)setForceWiFiBTCoexToTDD:(BOOL)a3
{
  self->_forceWiFiBTCoexToTDD = a3;
}

- (int64_t)wcmWCI2FrameSyncAssertOffset
{
  return self->_wcmWCI2FrameSyncAssertOffset;
}

- (void)setWcmWCI2FrameSyncAssertOffset:(int64_t)a3
{
  self->_wcmWCI2FrameSyncAssertOffset = a3;
}

- (unint64_t)wcmWCI2FrameSyncAssertJitter
{
  return self->_wcmWCI2FrameSyncAssertJitter;
}

- (void)setWcmWCI2FrameSyncAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2FrameSyncAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSRxAssertOffset
{
  return self->_wcmWCI2MWSRxAssertOffset;
}

- (void)setWcmWCI2MWSRxAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSRxAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSRxAssertJitter
{
  return self->_wcmWCI2MWSRxAssertJitter;
}

- (void)setWcmWCI2MWSRxAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSRxAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSRxDeAssertOffset
{
  return self->_wcmWCI2MWSRxDeAssertOffset;
}

- (void)setWcmWCI2MWSRxDeAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSRxDeAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSRxDeAssertJitter
{
  return self->_wcmWCI2MWSRxDeAssertJitter;
}

- (void)setWcmWCI2MWSRxDeAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSRxDeAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSTxAssertOffset
{
  return self->_wcmWCI2MWSTxAssertOffset;
}

- (void)setWcmWCI2MWSTxAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSTxAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSTxAssertJitter
{
  return self->_wcmWCI2MWSTxAssertJitter;
}

- (void)setWcmWCI2MWSTxAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSTxAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSTxDeAssertOffset
{
  return self->_wcmWCI2MWSTxDeAssertOffset;
}

- (void)setWcmWCI2MWSTxDeAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSTxDeAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSTxDeAssertJitter
{
  return self->_wcmWCI2MWSTxDeAssertJitter;
}

- (void)setWcmWCI2MWSTxDeAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSTxDeAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSPatternAssertOffset
{
  return self->_wcmWCI2MWSPatternAssertOffset;
}

- (void)setWcmWCI2MWSPatternAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSPatternAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSPatternAssertJitter
{
  return self->_wcmWCI2MWSPatternAssertJitter;
}

- (void)setWcmWCI2MWSPatternAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSPatternAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSInactivityAssertOffset
{
  return self->_wcmWCI2MWSInactivityAssertOffset;
}

- (void)setWcmWCI2MWSInactivityAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSInactivityAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSInactivityAssertJitter
{
  return self->_wcmWCI2MWSInactivityAssertJitter;
}

- (void)setWcmWCI2MWSInactivityAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSInactivityAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSScanFrequencyAssertOffset
{
  return self->_wcmWCI2MWSScanFrequencyAssertOffset;
}

- (void)setWcmWCI2MWSScanFrequencyAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSScanFrequencyAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSScanFrequencyAssertJitter
{
  return self->_wcmWCI2MWSScanFrequencyAssertJitter;
}

- (void)setWcmWCI2MWSScanFrequencyAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSScanFrequencyAssertJitter = a3;
}

- (unint64_t)wcmWCI2MWSPriorityAssertOffsetRequest
{
  return self->_wcmWCI2MWSPriorityAssertOffsetRequest;
}

- (void)setWcmWCI2MWSPriorityAssertOffsetRequest:(unint64_t)a3
{
  self->_wcmWCI2MWSPriorityAssertOffsetRequest = a3;
}

- (BOOL)wcmWiFiSupportFrameConfig
{
  return self->_wcmWiFiSupportFrameConfig;
}

- (void)setWcmWiFiSupportFrameConfig:(BOOL)a3
{
  self->_wcmWiFiSupportFrameConfig = a3;
}

- (BOOL)wcmWiFiSupportWciSignalingConfig
{
  return self->_wcmWiFiSupportWciSignalingConfig;
}

- (void)setWcmWiFiSupportWciSignalingConfig:(BOOL)a3
{
  self->_wcmWiFiSupportWciSignalingConfig = a3;
}

- (NSArray)wcmWiFiB7BlocklistChannels
{
  return self->_wcmWiFiB7BlocklistChannels;
}

- (void)setWcmWiFiB7BlocklistChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (NSArray)wcmWiFiB7WCI2EnabledChannels
{
  return self->_wcmWiFiB7WCI2EnabledChannels;
}

- (void)setWcmWiFiB7WCI2EnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSArray)wcmWiFiB40ABlocklistChannels
{
  return self->_wcmWiFiB40ABlocklistChannels;
}

- (void)setWcmWiFiB40ABlocklistChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSArray)wcmWiFiB40AWCI2EnabledChannels
{
  return self->_wcmWiFiB40AWCI2EnabledChannels;
}

- (void)setWcmWiFiB40AWCI2EnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (NSArray)wcmWiFiB40BBlocklistChannels
{
  return self->_wcmWiFiB40BBlocklistChannels;
}

- (void)setWcmWiFiB40BBlocklistChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (NSArray)wcmWiFiB40BWCI2EnabledChannels
{
  return self->_wcmWiFiB40BWCI2EnabledChannels;
}

- (void)setWcmWiFiB40BWCI2EnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (NSArray)wcmWiFiB41A1BlocklistChannels
{
  return self->_wcmWiFiB41A1BlocklistChannels;
}

- (void)setWcmWiFiB41A1BlocklistChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (NSArray)wcmWiFiB41A1WCI2EnabledChannels
{
  return self->_wcmWiFiB41A1WCI2EnabledChannels;
}

- (void)setWcmWiFiB41A1WCI2EnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSArray)wcmWiFiB41A2BlocklistChannels
{
  return self->_wcmWiFiB41A2BlocklistChannels;
}

- (void)setWcmWiFiB41A2BlocklistChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (NSArray)wcmWiFiB41A2WCI2EnabledChannels
{
  return self->_wcmWiFiB41A2WCI2EnabledChannels;
}

- (void)setWcmWiFiB41A2WCI2EnabledChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (NSNumber)wcmWiFiPriThresholdLow
{
  return self->_wcmWiFiPriThresholdLow;
}

- (void)setWcmWiFiPriThresholdLow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (NSNumber)wcmWiFiPriThresholdMed
{
  return self->_wcmWiFiPriThresholdMed;
}

- (void)setWcmWiFiPriThresholdMed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (NSNumber)wcmWiFiPriThresholdHigh
{
  return self->_wcmWiFiPriThresholdHigh;
}

- (void)setWcmWiFiPriThresholdHigh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (NSArray)wcmWiFiAntennaConfig
{
  return self->_wcmWiFiAntennaConfig;
}

- (void)setWcmWiFiAntennaConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (NSNumber)wcmWiFiAntennaCellPolicy
{
  return self->_wcmWiFiAntennaCellPolicy;
}

- (void)setWcmWiFiAntennaCellPolicy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (NSArray)wcmWiFiAntennaConfigDefault
{
  return self->_wcmWiFiAntennaConfigDefault;
}

- (void)setWcmWiFiAntennaConfigDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (NSNumber)wcmWiFiAntennaCellPolicyDefault
{
  return self->_wcmWiFiAntennaCellPolicyDefault;
}

- (void)setWcmWiFiAntennaCellPolicyDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (NSNumber)wcmWiFiRxProtectMode
{
  return self->_wcmWiFiRxProtectMode;
}

- (void)setWcmWiFiRxProtectMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (NSNumber)wcmWiFiRxProtectAutoParamWeight
{
  return self->_wcmWiFiRxProtectAutoParamWeight;
}

- (void)setWcmWiFiRxProtectAutoParamWeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (NSNumber)wcmWiFiRxProtectAutoParamThresh
{
  return self->_wcmWiFiRxProtectAutoParamThresh;
}

- (void)setWcmWiFiRxProtectAutoParamThresh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (NSNumber)wcmWiFiTxOnIndication
{
  return self->_wcmWiFiTxOnIndication;
}

- (void)setWcmWiFiTxOnIndication:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (NSNumber)wcmWiFiScanJoinProtectDuration
{
  return self->_wcmWiFiScanJoinProtectDuration;
}

- (void)setWcmWiFiScanJoinProtectDuration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (NSNumber)wcmWiFiEnvelopeOnIndication
{
  return self->_wcmWiFiEnvelopeOnIndication;
}

- (void)setWcmWiFiEnvelopeOnIndication:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (NSNumber)wcmWiFiEnvelopeIndicationTimer
{
  return self->_wcmWiFiEnvelopeIndicationTimer;
}

- (void)setWcmWiFiEnvelopeIndicationTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (NSNumber)wcmWiFiWCI2TxDurationThresh
{
  return self->_wcmWiFiWCI2TxDurationThresh;
}

- (void)setWcmWiFiWCI2TxDurationThresh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (NSNumber)wcmWiFiActiveScanThrottleMask
{
  return self->_wcmWiFiActiveScanThrottleMask;
}

- (void)setWcmWiFiActiveScanThrottleMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (NSNumber)wcmWiFiActiveDwellTime
{
  return self->_wcmWiFiActiveDwellTime;
}

- (void)setWcmWiFiActiveDwellTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (BOOL)wcmBTSupportTDDFrameConfig
{
  return self->_wcmBTSupportTDDFrameConfig;
}

- (void)setWcmBTSupportTDDFrameConfig:(BOOL)a3
{
  self->_wcmBTSupportTDDFrameConfig = a3;
}

- (NSData)wcmBTAFHMapDefault
{
  return self->_wcmBTAFHMapDefault;
}

- (void)setWcmBTAFHMapDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (NSData)wcmBTB7AFHMap
{
  return self->_wcmBTB7AFHMap;
}

- (void)setWcmBTB7AFHMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (NSData)wcmBTB40AAFHMap
{
  return self->_wcmBTB40AAFHMap;
}

- (void)setWcmBTB40AAFHMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (NSData)wcmBTB40BAFHMap
{
  return self->_wcmBTB40BAFHMap;
}

- (void)setWcmBTB40BAFHMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (NSData)wcmBTB41A1AFHMap
{
  return self->_wcmBTB41A1AFHMap;
}

- (void)setWcmBTB41A1AFHMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (NSData)wcmBTB41A2AFHMap
{
  return self->_wcmBTB41A2AFHMap;
}

- (void)setWcmBTB41A2AFHMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (NSNumber)wcmBTPreferredRole
{
  return self->_wcmBTPreferredRole;
}

- (void)setWcmBTPreferredRole:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (NSNumber)wcmBTMaxNumberOfChannelsToAvoidForCellOOB
{
  return self->_wcmBTMaxNumberOfChannelsToAvoidForCellOOB;
}

- (void)setWcmBTMaxNumberOfChannelsToAvoidForCellOOB:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (NSData)wcmHPCellularBTAFHMapFixed
{
  return self->_wcmHPCellularBTAFHMapFixed;
}

- (void)setWcmHPCellularBTAFHMapFixed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (NSData)wcmHFBTChannelMapDefault
{
  return self->_wcmHFBTChannelMapDefault;
}

- (void)setWcmHFBTChannelMapDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (NSDictionary)wcmBTAntBlockEnableBandsDefault
{
  return self->_wcmBTAntBlockEnableBandsDefault;
}

- (void)setWcmBTAntBlockEnableBandsDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (unint64_t)wcmBTWCI2ModeSendMsgBitmap
{
  return self->_wcmBTWCI2ModeSendMsgBitmap;
}

- (void)setWcmBTWCI2ModeSendMsgBitmap:(unint64_t)a3
{
  self->_wcmBTWCI2ModeSendMsgBitmap = a3;
}

- (unint64_t)wcmBTWCI2ModeRecvMsgBitmap
{
  return self->_wcmBTWCI2ModeRecvMsgBitmap;
}

- (void)setWcmBTWCI2ModeRecvMsgBitmap:(unint64_t)a3
{
  self->_wcmBTWCI2ModeRecvMsgBitmap = a3;
}

- (NSNumber)wcmBTDefaultAntennaNonCoex
{
  return self->_wcmBTDefaultAntennaNonCoex;
}

- (void)setWcmBTDefaultAntennaNonCoex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (NSNumber)wcmBTAntennaConfigNonCoex
{
  return self->_wcmBTAntennaConfigNonCoex;
}

- (void)setWcmBTAntennaConfigNonCoex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (NSNumber)wcmBTAntennaConfigParam1NonCoex
{
  return self->_wcmBTAntennaConfigParam1NonCoex;
}

- (void)setWcmBTAntennaConfigParam1NonCoex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 624);
}

- (NSNumber)wcmBTAntennaConfigParam2NonCoex
{
  return self->_wcmBTAntennaConfigParam2NonCoex;
}

- (void)setWcmBTAntennaConfigParam2NonCoex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 632);
}

- (NSNumber)wcmBTDefaultAntenna
{
  return self->_wcmBTDefaultAntenna;
}

- (void)setWcmBTDefaultAntenna:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (NSNumber)wcmBTAntennaConfig
{
  return self->_wcmBTAntennaConfig;
}

- (void)setWcmBTAntennaConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (NSNumber)wcmBTAntennaConfigParam1
{
  return self->_wcmBTAntennaConfigParam1;
}

- (void)setWcmBTAntennaConfigParam1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (NSNumber)wcmBTAntennaConfigParam2
{
  return self->_wcmBTAntennaConfigParam2;
}

- (void)setWcmBTAntennaConfigParam2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 664);
}

- (NSNumber)wcmBTAntBlockDuration
{
  return self->_wcmBTAntBlockDuration;
}

- (void)setWcmBTAntBlockDuration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 672);
}

- (NSNumber)wcmCellularWCI2ModePolicy
{
  return self->_wcmCellularWCI2ModePolicy;
}

- (void)setWcmCellularWCI2ModePolicy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 680);
}

- (void)setWcmCellularWCI2ModePowerThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 688);
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdHigh
{
  return self->_wcmCellularWCI2ModeRBThresholdHigh;
}

- (void)setWcmCellularWCI2ModeRBThresholdHigh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 696);
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdLow
{
  return self->_wcmCellularWCI2ModeRBThresholdLow;
}

- (void)setWcmCellularWCI2ModeRBThresholdLow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 704);
}

- (void)setWcmCellularWCI2ModeLTETxDenial:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 712);
}

- (void)setWcmCellularWCI2ModeAPTTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 720);
}

- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimit
{
  return self->_wcmCellularWCI2ModeControllerTxPowerLimit;
}

- (void)setWcmCellularWCI2ModeControllerTxPowerLimit:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 728);
}

- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimit
{
  return self->_wcmCellularWCI2ModeWCI2PowerLimit;
}

- (void)setWcmCellularWCI2ModeWCI2PowerLimit:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 736);
}

- (void)setWcmCellularWCI2ModeLinkPathLossThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 744);
}

- (void)setWcmCellularWCI2ModeRBFilerAlpha:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdHigh
{
  return self->_wcmCellularWCI2ModeFilterRBThresholdHigh;
}

- (void)setWcmCellularWCI2ModeFilterRBThresholdHigh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 760);
}

- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdLow
{
  return self->_wcmCellularWCI2ModeFilterRBThresholdLow;
}

- (void)setWcmCellularWCI2ModeFilterRBThresholdLow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 768);
}

- (void)setWcmCellularWCI2ModeControllerTxPowerLimitTO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 776);
}

- (void)setWcmCellularWCI2ModeWCI2PowerLimitTO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 784);
}

- (void)setWcmCellularWCI2ModeMaxAllowedFrameDenials:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 792);
}

- (void)setWcmCellularWCI2ModeFrameDenialWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 800);
}

- (void)setWcmCellularWCI2ModeTxPowerThresholdAdvTx:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 808);
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdAdvTx
{
  return self->_wcmCellularWCI2ModeRBThresholdAdvTx;
}

- (void)setWcmCellularWCI2ModeRBThresholdAdvTx:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 816);
}

- (void)setWcmCellularWCI2ModeLTEMaxTxPowerHigh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 824);
}

- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerLow
{
  return self->_wcmCellularWCI2ModeLTEMaxTxPowerLow;
}

- (void)setWcmCellularWCI2ModeLTEMaxTxPowerLow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 832);
}

- (void)setWcmCellularWCI2ModeControllerLTERBThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 840);
}

- (void)setWcmCellularWCI2ModeLTEHarqnackratioThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 848);
}

- (void)setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 856);
}

- (unint64_t)wcmCellularLAACoexProtectCQIPeriod
{
  return self->_wcmCellularLAACoexProtectCQIPeriod;
}

- (void)setWcmCellularLAACoexProtectCQIPeriod:(unint64_t)a3
{
  self->_wcmCellularLAACoexProtectCQIPeriod = a3;
}

- (unint64_t)wcmCellularLAACoexThresholdIn
{
  return self->_wcmCellularLAACoexThresholdIn;
}

- (void)setWcmCellularLAACoexThresholdIn:(unint64_t)a3
{
  self->_wcmCellularLAACoexThresholdIn = a3;
}

- (unint64_t)wcmCellularLAACoexThresholdOut
{
  return self->_wcmCellularLAACoexThresholdOut;
}

- (void)setWcmCellularLAACoexThresholdOut:(unint64_t)a3
{
  self->_wcmCellularLAACoexThresholdOut = a3;
}

- (unint64_t)wcmCellularLAACoexDeactTimer
{
  return self->_wcmCellularLAACoexDeactTimer;
}

- (void)setWcmCellularLAACoexDeactTimer:(unint64_t)a3
{
  self->_wcmCellularLAACoexDeactTimer = a3;
}

- (unint64_t)wcmCellularLAACoexDeactStopTimer
{
  return self->_wcmCellularLAACoexDeactStopTimer;
}

- (void)setWcmCellularLAACoexDeactStopTimer:(unint64_t)a3
{
  self->_wcmCellularLAACoexDeactStopTimer = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7DLRange
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB7DLRange._begin;
  length = self->_wcmCellularCoexB7DLRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB7DLRange:(id)a3
{
  self->_wcmCellularCoexB7DLRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7ULRange
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB7ULRange._begin;
  length = self->_wcmCellularCoexB7ULRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB7ULRange:(id)a3
{
  self->_wcmCellularCoexB7ULRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40ARange
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB40ARange._begin;
  length = self->_wcmCellularCoexB40ARange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB40ARange:(id)a3
{
  self->_wcmCellularCoexB40ARange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40BRange
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB40BRange._begin;
  length = self->_wcmCellularCoexB40BRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB40BRange:(id)a3
{
  self->_wcmCellularCoexB40BRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A1Range
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB41A1Range._begin;
  length = self->_wcmCellularCoexB41A1Range._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB41A1Range:(id)a3
{
  self->_wcmCellularCoexB41A1Range = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A2Range
{
  double begin;
  double length;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_wcmCellularCoexB41A2Range._begin;
  length = self->_wcmCellularCoexB41A2Range._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB41A2Range:(id)a3
{
  self->_wcmCellularCoexB41A2Range = ($47645E746BBB427C021E7CC331F21488)a3;
}

- (NSArray)wcmCellularScanProtectionCellFrequencies
{
  return self->_wcmCellularScanProtectionCellFrequencies;
}

- (void)setWcmCellularScanProtectionCellFrequencies:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 904);
}

- (NSArray)wcmCellularScanProtectionWiFiChannels
{
  return self->_wcmCellularScanProtectionWiFiChannels;
}

- (void)setWcmCellularScanProtectionWiFiChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 912);
}

- (NSArray)wcmCellularScanProtectionWiFiChannelsWiFiEnh
{
  return self->_wcmCellularScanProtectionWiFiChannelsWiFiEnh;
}

- (void)setWcmCellularScanProtectionWiFiChannelsWiFiEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 920);
}

- (NSArray)wcmWiFiScanThrottlingChannelIndices
{
  return self->_wcmWiFiScanThrottlingChannelIndices;
}

- (void)setWcmWiFiScanThrottlingChannelIndices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 928);
}

- (NSNumber)wcmCellularScanProtectionWiFiMaxDuration
{
  return self->_wcmCellularScanProtectionWiFiMaxDuration;
}

- (void)setWcmCellularScanProtectionWiFiMaxDuration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 936);
}

- (NSArray)wcmCellularScanProtectionCellFrequenciesforBT
{
  return self->_wcmCellularScanProtectionCellFrequenciesforBT;
}

- (void)setWcmCellularScanProtectionCellFrequenciesforBT:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 944);
}

- (void)setWcmCellularWCI2PlatformPolicyBitmap:(unint64_t)a3
{
  self->_wcmCellularWCI2PlatformPolicyBitmap = a3;
}

- (NSDictionary)wcmGen9rFemDefaultMode2gWiFiCellularbands
{
  return self->_wcmGen9rFemDefaultMode2gWiFiCellularbands;
}

- (void)setWcmGen9rFemDefaultMode2gWiFiCellularbands:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 960);
}

- (NSDictionary)wcmGen9rFemDefaultMode5gWiFiCellularbands
{
  return self->_wcmGen9rFemDefaultMode5gWiFiCellularbands;
}

- (void)setWcmGen9rFemDefaultMode5gWiFiCellularbands:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 968);
}

- (void)setSKU
{
  _BYTE *v3;
  int v4;
  uint64_t v5;

  -[WCM_PlatformManager setWrmSku:](self, "setWrmSku:", 8);
  v3 = objc_msgSend((id)MGCopyAnswer(CFSTR("DeviceVariant"), 0), "UTF8String");
  if (v3)
  {
    v4 = (char)*v3;
    if (*v3)
    {
      if ((v4 - 65) > 3)
      {
        v5 = 8;
        NSLog(CFSTR("Unknown SKU \n"));
      }
      else
      {
        v5 = (v4 - 64);
        NSLog(&off_100205A30[v4 - 65]->isa);
      }
      -[WCM_PlatformManager setWrmSku:](self, "setWrmSku:", v5);
    }
  }
}

- (void)setPlatform
{
  uint64_t v3;
  WCM_PlatformManager *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = MGGetProductType(self, a2);
  -[WCM_PlatformManager setWrmPlatformId:](self, "setWrmPlatformId:", 1000);
  if (v3 > 2262113698)
  {
    if (v3 > 3215673113)
    {
      if (v3 > 3711192743)
      {
        if (v3 > 3863625341)
        {
          if (v3 > 4068102501)
          {
            if (v3 > 4201643248)
            {
              if (v3 == 4201643249)
              {
                v4 = self;
                v5 = 15;
                goto LABEL_295;
              }
              if (v3 == 4242862982)
              {
                v4 = self;
                v5 = 130;
                goto LABEL_295;
              }
            }
            else
            {
              if (v3 == 4068102502)
              {
                v4 = self;
                v5 = 265;
                goto LABEL_295;
              }
              if (v3 == 4172444931)
              {
                v4 = self;
                v5 = 174;
                goto LABEL_295;
              }
            }
          }
          else if (v3 > 3885279869)
          {
            if (v3 == 3885279870)
            {
              v4 = self;
              v5 = 11;
              goto LABEL_295;
            }
            if (v3 == 4025247511)
            {
              v4 = self;
              v5 = 175;
              goto LABEL_295;
            }
          }
          else
          {
            if (v3 == 3863625342)
            {
              v4 = self;
              v5 = 139;
              goto LABEL_295;
            }
            if (v3 == 3867318491)
            {
              v4 = self;
              v5 = 244;
              goto LABEL_295;
            }
          }
          goto LABEL_296;
        }
        if (v3 <= 3801472100)
        {
          if (v3 <= 3743999267)
          {
            if (v3 == 3711192744)
            {
              v4 = self;
              v5 = 141;
              goto LABEL_295;
            }
            if (v3 == 3742999858)
            {
              v4 = self;
              v5 = 229;
LABEL_295:
              -[WCM_PlatformManager setWrmPlatformId:](v4, "setWrmPlatformId:", v5);
              goto LABEL_296;
            }
            goto LABEL_296;
          }
          if (v3 == 3743999268)
          {
            v4 = self;
            v5 = 0;
            goto LABEL_295;
          }
          v6 = 3767261006;
LABEL_160:
          if (v3 == v6)
          {
            v4 = self;
            v5 = 223;
            goto LABEL_295;
          }
          goto LABEL_296;
        }
        if (v3 > 3825599859)
        {
          if (v3 == 3825599860)
          {
            v4 = self;
            v5 = 51;
            goto LABEL_295;
          }
          if (v3 == 3839750255)
          {
            v4 = self;
            v5 = 262;
            goto LABEL_295;
          }
          goto LABEL_296;
        }
        if (v3 != 3801472101)
        {
          if (v3 == 3819635030)
          {
            v4 = self;
            v5 = 227;
            goto LABEL_295;
          }
          goto LABEL_296;
        }
LABEL_210:
        v4 = self;
        v5 = 135;
        goto LABEL_295;
      }
      if (v3 <= 3571532205)
      {
        if (v3 <= 3361025852)
        {
          switch(v3)
          {
            case 3215673114:
              v4 = self;
              v5 = 129;
              goto LABEL_295;
            case 3228373941:
              v4 = self;
              v5 = 153;
              goto LABEL_295;
            case 3241053352:
              v4 = self;
              v5 = 169;
              goto LABEL_295;
          }
        }
        else if (v3 > 3455223060)
        {
          if (v3 == 3455223061)
          {
            v4 = self;
            v5 = 142;
            goto LABEL_295;
          }
          if (v3 == 3540156652)
          {
            v4 = self;
            v5 = 146;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 3361025853)
          {
            v4 = self;
            v5 = 156;
            goto LABEL_295;
          }
          if (v3 == 3397214291)
          {
            v4 = self;
            v5 = 128;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 > 3645319984)
      {
        if (v3 > 3677894690)
        {
          if (v3 == 3677894691)
          {
            v4 = self;
            v5 = 163;
            goto LABEL_295;
          }
          if (v3 == 3683904382)
          {
            v4 = self;
            v5 = 176;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 3645319985)
          {
            v4 = self;
            v5 = 125;
            goto LABEL_295;
          }
          if (v3 == 3663011141)
          {
            v4 = self;
            v5 = 230;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 <= 3599094682)
      {
        if (v3 == 3571532206)
        {
          v4 = self;
          v5 = 182;
          goto LABEL_295;
        }
        if (v3 == 3585085679)
        {
          v4 = self;
          v5 = 17;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
      if (v3 == 3599094683)
      {
        v4 = self;
        v5 = 138;
        goto LABEL_295;
      }
      if (v3 != 3636345305)
        goto LABEL_296;
      -[WCM_PlatformManager setWrmPlatformId:](self, "setWrmPlatformId:", 132);
LABEL_233:
      v4 = self;
      v5 = 133;
      goto LABEL_295;
    }
    if (v3 <= 2722529671)
    {
      if (v3 <= 2619317133)
      {
        if (v3 <= 2458172801)
        {
          switch(v3)
          {
            case 2262113699:
              v4 = self;
              v5 = 60;
              goto LABEL_295;
            case 2309863438:
              v4 = self;
              v5 = 19;
              goto LABEL_295;
            case 2385671069:
              v4 = self;
              v5 = 124;
              goto LABEL_295;
          }
        }
        else if (v3 > 2516717267)
        {
          if (v3 == 2516717268)
          {
            v4 = self;
            v5 = 126;
            goto LABEL_295;
          }
          if (v3 == 2614323575)
          {
            v4 = self;
            v5 = 123;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 2458172802)
          {
            v4 = self;
            v5 = 132;
            goto LABEL_295;
          }
          if (v3 == 2487868872)
          {
            v4 = self;
            v5 = 170;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 > 2634105756)
      {
        if (v3 > 2673319455)
        {
          if (v3 == 2673319456)
          {
            v4 = self;
            v5 = 140;
            goto LABEL_295;
          }
          if (v3 == 2688879999)
          {
            v4 = self;
            v5 = 25;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 2634105757)
          {
            v4 = self;
            v5 = 164;
            goto LABEL_295;
          }
          if (v3 == 2644487444)
          {
            v4 = self;
            v5 = 145;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 <= 2625074842)
      {
        if (v3 == 2619317134)
        {
          v4 = self;
          v5 = 167;
          goto LABEL_295;
        }
        if (v3 == 2622433984)
        {
          v4 = self;
          v5 = 162;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
      if (v3 == 2625074843)
      {
        v4 = self;
        v5 = 243;
        goto LABEL_295;
      }
      v8 = 2628394914;
LABEL_178:
      if (v3 == v8)
      {
        v4 = self;
        v5 = 151;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 <= 2943112656)
    {
      if (v3 <= 2795618602)
      {
        switch(v3)
        {
          case 2722529672:
            v4 = self;
            v5 = 7;
            goto LABEL_295;
          case 2751865418:
            v4 = self;
            v5 = 178;
            goto LABEL_295;
          case 2793418701:
            v4 = self;
            v5 = 50;
            goto LABEL_295;
        }
      }
      else if (v3 > 2940697644)
      {
        if (v3 == 2940697645)
        {
          v4 = self;
          v5 = 24;
          goto LABEL_295;
        }
        if (v3 == 2941181571)
        {
          v4 = self;
          v5 = 53;
          goto LABEL_295;
        }
      }
      else
      {
        if (v3 == 2795618603)
        {
          v4 = self;
          v5 = 56;
          goto LABEL_295;
        }
        if (v3 == 2903084588)
        {
          v4 = self;
          v5 = 143;
          goto LABEL_295;
        }
      }
      goto LABEL_296;
    }
    if (v3 <= 3101941569)
    {
      if (v3 <= 3001488777)
      {
        if (v3 == 2943112657)
        {
          v4 = self;
          v5 = 225;
          goto LABEL_295;
        }
        if (v3 == 2979575960)
        {
          v4 = self;
          v5 = 221;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
      if (v3 == 3001488778)
      {
        v4 = self;
        v5 = 14;
        goto LABEL_295;
      }
      v8 = 3054476161;
      goto LABEL_178;
    }
    if (v3 <= 3184375230)
    {
      if (v3 != 3101941570)
      {
        if (v3 == 3143587592)
        {
          v4 = self;
          v5 = 264;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
LABEL_229:
      v4 = self;
      v5 = 147;
      goto LABEL_295;
    }
    if (v3 == 3184375231)
    {
      v4 = self;
      v5 = 62;
      goto LABEL_295;
    }
    v9 = 3196158497;
LABEL_232:
    if (v3 != v9)
      goto LABEL_296;
    goto LABEL_233;
  }
  if (v3 > 1408738133)
  {
    if (v3 <= 1990293941)
    {
      if (v3 <= 1625227433)
      {
        if (v3 <= 1434404432)
        {
          switch(v3)
          {
            case 1408738134:
              v4 = self;
              v5 = 220;
              goto LABEL_295;
            case 1415625992:
              v4 = self;
              v5 = 177;
              goto LABEL_295;
            case 1419435331:
              v4 = self;
              v5 = 179;
              goto LABEL_295;
          }
        }
        else if (v3 > 1602181455)
        {
          if (v3 == 1602181456)
          {
            v4 = self;
            v5 = 222;
            goto LABEL_295;
          }
          if (v3 == 1608945770)
          {
            v4 = self;
            v5 = 159;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 1434404433)
          {
            v4 = self;
            v5 = 23;
            goto LABEL_295;
          }
          if (v3 == 1554479185)
          {
            v4 = self;
            v5 = 266;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 <= 1834147426)
      {
        if (v3 > 1756509289)
        {
          if (v3 == 1756509290)
          {
            v4 = self;
            v5 = 181;
            goto LABEL_295;
          }
          if (v3 == 1770142589)
          {
            v4 = self;
            v5 = 260;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 1625227434)
          {
            v4 = self;
            v5 = 154;
            goto LABEL_295;
          }
          if (v3 == 1644180312)
          {
            v4 = self;
            v5 = 180;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 > 1878257789)
      {
        if (v3 == 1878257790)
        {
          v4 = self;
          v5 = 131;
          goto LABEL_295;
        }
        if (v3 == 1895344378)
        {
          v4 = self;
          v5 = 144;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
      if (v3 == 1834147427)
      {
LABEL_238:
        v4 = self;
        v5 = 150;
        goto LABEL_295;
      }
      v7 = 1868379043;
      goto LABEL_225;
    }
    if (v3 > 2084894488)
    {
      if (v3 <= 2132302343)
      {
        if (v3 > 2089455187)
        {
          if (v3 == 2089455188)
          {
            v4 = self;
            v5 = 157;
            goto LABEL_295;
          }
          if (v3 == 2103978418)
          {
            v4 = self;
            v5 = 137;
            goto LABEL_295;
          }
        }
        else
        {
          if (v3 == 2084894489)
          {
            v4 = self;
            v5 = 261;
            goto LABEL_295;
          }
          if (v3 == 2085054105)
          {
            v4 = self;
            v5 = 228;
            goto LABEL_295;
          }
        }
        goto LABEL_296;
      }
      if (v3 <= 2159747552)
      {
        if (v3 == 2132302344)
        {
          v4 = self;
          v5 = 224;
          goto LABEL_295;
        }
        if (v3 == 2158787296)
        {
          v4 = self;
          v5 = 58;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
      if (v3 == 2159747553)
      {
        v4 = self;
        v5 = 10;
        goto LABEL_295;
      }
      v9 = 2236272848;
      goto LABEL_232;
    }
    if (v3 <= 2023824666)
    {
      if (v3 == 1990293942)
      {
        v4 = self;
        v5 = 241;
        goto LABEL_295;
      }
      if (v3 != 2001966017)
      {
        if (v3 == 2021146989)
        {
          v4 = self;
          v5 = 22;
          goto LABEL_295;
        }
        goto LABEL_296;
      }
LABEL_237:
      v4 = self;
      v5 = 134;
      goto LABEL_295;
    }
    if (v3 > 2078329140)
    {
      if (v3 == 2078329141)
      {
        v4 = self;
        v5 = 21;
        goto LABEL_295;
      }
      if (v3 == 2080700391)
      {
        v4 = self;
        v5 = 3;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 == 2023824667)
      goto LABEL_229;
    if (v3 != 2032616841)
      goto LABEL_296;
LABEL_94:
    v4 = self;
    v5 = 1;
    goto LABEL_295;
  }
  if (v3 > 810906662)
  {
    if (v3 > 1280441782)
    {
      if (v3 <= 1309571157)
      {
        if (v3 > 1293446024)
        {
          if (v3 == 1293446025)
          {
            v4 = self;
            v5 = 136;
            goto LABEL_295;
          }
          if (v3 == 1294429942)
          {
            v4 = self;
            v5 = 239;
            goto LABEL_295;
          }
          goto LABEL_296;
        }
        if (v3 == 1280441783)
        {
          v4 = self;
          v5 = 121;
          goto LABEL_295;
        }
        v6 = 1280909812;
        goto LABEL_160;
      }
      if (v3 <= 1371389548)
      {
        if (v3 == 1309571158)
        {
          v4 = self;
          v5 = 242;
          goto LABEL_295;
        }
        if (v3 != 1353145733)
          goto LABEL_296;
        goto LABEL_237;
      }
      if (v3 == 1371389549)
      {
        v4 = self;
        v5 = 5;
        goto LABEL_295;
      }
      v7 = 1373516433;
LABEL_225:
      if (v3 == v7)
      {
        v4 = self;
        v5 = 148;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 <= 910181309)
    {
      switch(v3)
      {
        case 810906663:
          v4 = self;
          v5 = 161;
          goto LABEL_295;
        case 820711327:
          v4 = self;
          v5 = 59;
          goto LABEL_295;
        case 851437781:
          v4 = self;
          v5 = 54;
          goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 > 1169082143)
    {
      if (v3 == 1169082144)
      {
        v4 = self;
        v5 = 13;
        goto LABEL_295;
      }
      if (v3 == 1234705395)
      {
        v4 = self;
        v5 = 2;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 != 910181310)
    {
      if (v3 == 1060988941)
      {
        v4 = self;
        v5 = 16;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    goto LABEL_94;
  }
  if (v3 <= 341800272)
  {
    if (v3 <= 133314239)
    {
      switch(v3)
      {
        case -1:
          NSLog(CFSTR("Unknown Product\n"));
          break;
        case 79936591:
          v4 = self;
          v5 = 61;
          goto LABEL_295;
        case 88647037:
          v4 = self;
          v5 = 120;
          goto LABEL_295;
      }
    }
    else if (v3 > 228444037)
    {
      if (v3 == 228444038)
      {
        v4 = self;
        v5 = 127;
        goto LABEL_295;
      }
      if (v3 == 330877086)
      {
        v4 = self;
        v5 = 57;
        goto LABEL_295;
      }
    }
    else
    {
      if (v3 == 133314240)
      {
        v4 = self;
        v5 = 52;
        goto LABEL_295;
      }
      if (v3 == 157833461)
      {
        v4 = self;
        v5 = 122;
        goto LABEL_295;
      }
    }
    goto LABEL_296;
  }
  if (v3 > 676119127)
  {
    if (v3 <= 746003605)
    {
      if (v3 == 676119128)
      {
        v4 = self;
        v5 = 240;
        goto LABEL_295;
      }
      if (v3 == 689804742)
      {
        v4 = self;
        v5 = 18;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    if (v3 != 746003606)
    {
      if (v3 == 749116821)
      {
        v4 = self;
        v5 = 263;
        goto LABEL_295;
      }
      goto LABEL_296;
    }
    goto LABEL_238;
  }
  if (v3 > 555503453)
  {
    if (v3 == 555503454)
    {
      v4 = self;
      v5 = 168;
      goto LABEL_295;
    }
    if (v3 == 574536383)
    {
      v4 = self;
      v5 = 55;
      goto LABEL_295;
    }
    goto LABEL_296;
  }
  if (v3 == 341800273)
    goto LABEL_210;
  if (v3 == 425046865)
  {
    v4 = self;
    v5 = 231;
    goto LABEL_295;
  }
LABEL_296:
  -[WCM_PlatformManager setSKU](self, "setSKU");
}

- (BOOL)isJapanSKU
{
  const void *v2;
  const void *v3;
  const char *v4;
  int v5;
  BOOL v6;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceVariant"), 0);
  v3 = v2;
  v4 = "is not";
  if (v2)
  {
    v5 = CFEqual(v2, CFSTR("B"));
    v6 = v5 != 0;
    if (v5)
      v4 = "is";
  }
  else
  {
    v6 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("This %s Japan SKU based on Device Variant %@"), v4, v3);
  return v6;
}

- (BOOL)isRowSKUB
{
  const void *v2;
  const void *v3;
  const char *v4;
  int v5;
  BOOL v6;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceVariant"), 0);
  v3 = v2;
  v4 = "is not";
  if (v2)
  {
    v5 = CFEqual(v2, CFSTR("B"));
    v6 = v5 != 0;
    if (v5)
      v4 = "is";
  }
  else
  {
    v6 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("This %s a ROW SKU BDevice based on Device Variant %@"), v4, v3);
  return v6;
}

- (BOOL)isRowSKUS
{
  const void *v2;
  const void *v3;
  const char *v4;
  int v5;
  BOOL v6;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceVariant"), 0);
  v3 = v2;
  v4 = "is not";
  if (v2)
  {
    v5 = CFEqual(v2, CFSTR("B"));
    v6 = v5 != 0;
    if (v5)
      v4 = "is";
  }
  else
  {
    v6 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("This %s a ROW SKU SDevice based on Device Variant %@"), v4, v3);
  return v6;
}

- (void)loadStaticPolicyFor:(int)a3
{
  double v5;
  NSMutableSet *v6;
  const __CFString *v7;

  -[NSMutableSet removeAllObjects](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "removeAllObjects");
  -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Mode"));
  -[WCM_PlatformManager setWcmWCI2FrameSyncAssertOffset:](self, "setWcmWCI2FrameSyncAssertOffset:", -60);
  -[WCM_PlatformManager setWcmWCI2FrameSyncAssertJitter:](self, "setWcmWCI2FrameSyncAssertJitter:", 3);
  -[WCM_PlatformManager setWcmWCI2MWSRxAssertOffset:](self, "setWcmWCI2MWSRxAssertOffset:", -40);
  -[WCM_PlatformManager setWcmWCI2MWSRxAssertJitter:](self, "setWcmWCI2MWSRxAssertJitter:", 4);
  -[WCM_PlatformManager setWcmWCI2MWSRxDeAssertOffset:](self, "setWcmWCI2MWSRxDeAssertOffset:", -40);
  -[WCM_PlatformManager setWcmWCI2MWSRxDeAssertJitter:](self, "setWcmWCI2MWSRxDeAssertJitter:", 4);
  -[WCM_PlatformManager setWcmWCI2MWSTxAssertOffset:](self, "setWcmWCI2MWSTxAssertOffset:", -50);
  -[WCM_PlatformManager setWcmWCI2MWSTxAssertJitter:](self, "setWcmWCI2MWSTxAssertJitter:", 4);
  -[WCM_PlatformManager setWcmWCI2MWSTxDeAssertOffset:](self, "setWcmWCI2MWSTxDeAssertOffset:", -50);
  -[WCM_PlatformManager setWcmWCI2MWSTxDeAssertJitter:](self, "setWcmWCI2MWSTxDeAssertJitter:", 4);
  -[WCM_PlatformManager setWcmWCI2MWSPatternAssertOffset:](self, "setWcmWCI2MWSPatternAssertOffset:", 0);
  -[WCM_PlatformManager setWcmWCI2MWSPatternAssertJitter:](self, "setWcmWCI2MWSPatternAssertJitter:", 0);
  -[WCM_PlatformManager setWcmWCI2MWSInactivityAssertOffset:](self, "setWcmWCI2MWSInactivityAssertOffset:", 6790);
  -[WCM_PlatformManager setWcmWCI2MWSInactivityAssertJitter:](self, "setWcmWCI2MWSInactivityAssertJitter:", 192);
  -[WCM_PlatformManager setWcmWCI2MWSScanFrequencyAssertOffset:](self, "setWcmWCI2MWSScanFrequencyAssertOffset:", 0);
  -[WCM_PlatformManager setWcmWCI2MWSScanFrequencyAssertJitter:](self, "setWcmWCI2MWSScanFrequencyAssertJitter:", 0);
  -[WCM_PlatformManager setWcmWCI2MWSPriorityAssertOffsetRequest:](self, "setWcmWCI2MWSPriorityAssertOffsetRequest:", 500);
  -[WCM_PlatformManager setWcmWiFiSupportFrameConfig:](self, "setWcmWiFiSupportFrameConfig:", 0);
  -[WCM_PlatformManager setWcmWiFiSupportWciSignalingConfig:](self, "setWcmWiFiSupportWciSignalingConfig:", 0);
  -[WCM_PlatformManager setWcmWiFiB7BlocklistChannels:](self, "setWcmWiFiB7BlocklistChannels:", &off_100242C48);
  -[WCM_PlatformManager setWcmWiFiB7WCI2EnabledChannels:](self, "setWcmWiFiB7WCI2EnabledChannels:", &off_100242C60);
  -[WCM_PlatformManager setWcmWiFiB40ABlocklistChannels:](self, "setWcmWiFiB40ABlocklistChannels:", &off_100242C78);
  -[WCM_PlatformManager setWcmWiFiB40AWCI2EnabledChannels:](self, "setWcmWiFiB40AWCI2EnabledChannels:", &off_100242C90);
  -[WCM_PlatformManager setWcmWiFiB40BBlocklistChannels:](self, "setWcmWiFiB40BBlocklistChannels:", &off_100242CA8);
  -[WCM_PlatformManager setWcmWiFiB40BWCI2EnabledChannels:](self, "setWcmWiFiB40BWCI2EnabledChannels:", &off_100242CC0);
  -[WCM_PlatformManager setWcmWiFiB41A1BlocklistChannels:](self, "setWcmWiFiB41A1BlocklistChannels:", &off_100242CD8);
  -[WCM_PlatformManager setWcmWiFiB41A1WCI2EnabledChannels:](self, "setWcmWiFiB41A1WCI2EnabledChannels:", &off_100242CF0);
  -[WCM_PlatformManager setWcmWiFiB41A2BlocklistChannels:](self, "setWcmWiFiB41A2BlocklistChannels:", &off_100242D08);
  -[WCM_PlatformManager setWcmWiFiB41A2WCI2EnabledChannels:](self, "setWcmWiFiB41A2WCI2EnabledChannels:", &off_100242D20);
  -[WCM_PlatformManager setWcmWiFiPriThresholdLow:](self, "setWcmWiFiPriThresholdLow:", &off_100231878);
  -[WCM_PlatformManager setWcmWiFiPriThresholdMed:](self, "setWcmWiFiPriThresholdMed:", &off_1002318A8);
  -[WCM_PlatformManager setWcmWiFiPriThresholdHigh:](self, "setWcmWiFiPriThresholdHigh:", &off_1002318D8);
  -[WCM_PlatformManager setWcmWiFiAntennaConfig:](self, "setWcmWiFiAntennaConfig:", &off_100242D68);
  -[WCM_PlatformManager setWcmWiFiAntennaCellPolicy:](self, "setWcmWiFiAntennaCellPolicy:", &off_100231950);
  -[WCM_PlatformManager setWcmWiFiAntennaConfigDefault:](self, "setWcmWiFiAntennaConfigDefault:", &off_100242DB0);
  -[WCM_PlatformManager setWcmWiFiAntennaCellPolicyDefault:](self, "setWcmWiFiAntennaCellPolicyDefault:", &off_100231950);
  -[WCM_PlatformManager setWcmBTSupportTDDFrameConfig:](self, "setWcmBTSupportTDDFrameConfig:", 0);
  -[WCM_PlatformManager setWcmBTAFHMapDefault:](self, "setWcmBTAFHMapDefault:", sub_10007CB14(&off_100242DC8));
  -[WCM_PlatformManager setWcmBTB7AFHMap:](self, "setWcmBTB7AFHMap:", sub_10007CB14(&off_100242DE0));
  -[WCM_PlatformManager setWcmBTB40AAFHMap:](self, "setWcmBTB40AAFHMap:", sub_10007CB14(&off_100242DF8));
  -[WCM_PlatformManager setWcmBTB40BAFHMap:](self, "setWcmBTB40BAFHMap:", sub_10007CB14(&off_100242E10));
  -[WCM_PlatformManager setWcmBTB41A1AFHMap:](self, "setWcmBTB41A1AFHMap:", sub_10007CB14(&off_100242E28));
  -[WCM_PlatformManager setWcmBTB41A2AFHMap:](self, "setWcmBTB41A2AFHMap:", sub_10007CB14(&off_100242E40));
  -[WCM_PlatformManager setWcmHPCellularBTAFHMapFixed:](self, "setWcmHPCellularBTAFHMapFixed:", sub_10007CB14(&off_100242E58));
  -[WCM_PlatformManager setWcmBTPreferredRole:](self, "setWcmBTPreferredRole:", &off_100231968);
  -[WCM_PlatformManager setWcmBTWCI2ModeSendMsgBitmap:](self, "setWcmBTWCI2ModeSendMsgBitmap:", 255);
  -[WCM_PlatformManager setWcmBTWCI2ModeRecvMsgBitmap:](self, "setWcmBTWCI2ModeRecvMsgBitmap:", 255);
  -[WCM_PlatformManager setWcmBTAntBlockDuration:](self, "setWcmBTAntBlockDuration:", &off_1002318F0);
  -[WCM_PlatformManager setWcmHFBTChannelMapDefault:](self, "setWcmHFBTChannelMapDefault:", sub_10007CB14(&off_100242E70));
  -[WCM_PlatformManager setWcmBTAntBlockEnableBandsDefault:](self, "setWcmBTAntBlockEnableBandsDefault:", &off_100248978);
  -[WCM_PlatformManager setWcmBTDefaultAntenna:](self, "setWcmBTDefaultAntenna:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmBTAntennaConfig:](self, "setWcmBTAntennaConfig:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmBTAntennaConfigParam1:](self, "setWcmBTAntennaConfigParam1:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  -[WCM_PlatformManager setWcmBTAntennaConfigParam2:](self, "setWcmBTAntennaConfigParam2:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  -[WCM_PlatformManager setWcmBTDefaultAntennaNonCoex:](self, "setWcmBTDefaultAntennaNonCoex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  -[WCM_PlatformManager setWcmBTAntennaConfigNonCoex:](self, "setWcmBTAntennaConfigNonCoex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
  -[WCM_PlatformManager setWcmBTAntennaConfigParam1NonCoex:](self, "setWcmBTAntennaConfigParam1NonCoex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  -[WCM_PlatformManager setWcmBTAntennaConfigParam2NonCoex:](self, "setWcmBTAntennaConfigParam2NonCoex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  -[WCM_PlatformManager setWcmCellularCoexB7DLRange:](self, "setWcmCellularCoexB7DLRange:", 2620.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB7ULRange:](self, "setWcmCellularCoexB7ULRange:", 2500.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB40ARange:](self, "setWcmCellularCoexB40ARange:", 2340.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB40BRange:](self, "setWcmCellularCoexB40BRange:", 2370.0, 2401.0);
  -[WCM_PlatformManager setWcmCellularCoexB41A1Range:](self, "setWcmCellularCoexB41A1Range:", 2495.0, 5.0);
  -[WCM_PlatformManager setWcmCellularCoexB41A2Range:](self, "setWcmCellularCoexB41A2Range:", 2500.0, 50.0);
  -[WCM_PlatformManager setWcmCellularWCI2ModePolicy:](self, "setWcmCellularWCI2ModePolicy:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", 219));
  -[WCM_PlatformManager setWcmCellularWCI2ModePowerThreshold:](self, "setWcmCellularWCI2ModePowerThreshold:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 18));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdHigh:](self, "setWcmCellularWCI2ModeRBThresholdHigh:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 41));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdLow:](self, "setWcmCellularWCI2ModeRBThresholdLow:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 37));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTETxDenial:](self, "setWcmCellularWCI2ModeLTETxDenial:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
  -[WCM_PlatformManager setWcmCellularWCI2ModeAPTTable:](self, "setWcmCellularWCI2ModeAPTTable:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimit:](self, "setWcmCellularWCI2ModeControllerTxPowerLimit:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 19));
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimit:](self, "setWcmCellularWCI2ModeWCI2PowerLimit:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 19));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLinkPathLossThreshold:](self, "setWcmCellularWCI2ModeLinkPathLossThreshold:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 107));
  LODWORD(v5) = 1028443341;
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBFilerAlpha:](self, "setWcmCellularWCI2ModeRBFilerAlpha:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdHigh:](self, "setWcmCellularWCI2ModeFilterRBThresholdHigh:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 41));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdLow:](self, "setWcmCellularWCI2ModeFilterRBThresholdLow:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 37));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimitTO:](self, "setWcmCellularWCI2ModeControllerTxPowerLimitTO:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimitTO:](self, "setWcmCellularWCI2ModeWCI2PowerLimitTO:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 150));
  -[WCM_PlatformManager setWcmCellularWCI2ModeMaxAllowedFrameDenials:](self, "setWcmCellularWCI2ModeMaxAllowedFrameDenials:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 25));
  -[WCM_PlatformManager setWcmCellularWCI2ModeFrameDenialWindow:](self, "setWcmCellularWCI2ModeFrameDenialWindow:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 200));
  -[WCM_PlatformManager setWcmCellularWCI2ModeTxPowerThresholdAdvTx:](self, "setWcmCellularWCI2ModeTxPowerThresholdAdvTx:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 19));
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdAdvTx:](self, "setWcmCellularWCI2ModeRBThresholdAdvTx:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 41));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEMaxTxPowerHigh:](self, "setWcmCellularWCI2ModeLTEMaxTxPowerHigh:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 30));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEMaxTxPowerLow:](self, "setWcmCellularWCI2ModeLTEMaxTxPowerLow:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 19));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerLTERBThreshold:](self, "setWcmCellularWCI2ModeControllerLTERBThreshold:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEHarqnackratioThreshold:](self, "setWcmCellularWCI2ModeLTEHarqnackratioThreshold:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:](self, "setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x100);
  -[WCM_PlatformManager setWcmCellularScanProtectionCellFrequencies:](self, "setWcmCellularScanProtectionCellFrequencies:", &off_100242ED0);
  -[WCM_PlatformManager setWcmCellularScanProtectionWiFiChannels:](self, "setWcmCellularScanProtectionWiFiChannels:", &off_100242F30);
  switch(a3)
  {
    case 0:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      sub_100113BDC(self);
      return;
    case 1:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      sub_100113E78(self);
      return;
    case 2:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      sub_1001274F4(self);
      return;
    case 3:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100127700(self);
      return;
    case 5:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100114114(self);
      return;
    case 7:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_1001143B4(self);
      return;
    case 10:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100114654(self);
      return;
    case 11:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100114B94(self);
      return;
    case 13:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100114E34(self);
      return;
    case 14:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_1001150D4(self);
      return;
    case 15:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LaaRcu1ThrottlingDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100115374(self);
      return;
    case 16:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100115614(self);
      return;
    case 17:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100115F90(self);
      return;
    case 18:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_10011690C(self);
      return;
    case 19:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100117288(self);
      return;
    case 20:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_1001148F4(self);
      return;
    case 21:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      sub_100117C04(self);
      return;
    case 22:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      sub_100119AE8(self);
      return;
    case 23:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      sub_10011A550(self);
      return;
    case 24:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      sub_100118618(self);
      return;
    case 25:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));
      sub_100119080(self);
      return;
    case 50:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      sub_10011D420(self);
      return;
    case 51:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      sub_10011C868(self);
      return;
    case 52:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      sub_10011AFB8(self);
      return;
    case 53:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      sub_10011BC10(self);
      return;
    case 54:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "GpsL1DesireLevelSupport"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGpsL1Level"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTConditionId"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly"));
      sub_100120468(self);
      return;
    case 55:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "GpsL1DesireLevelSupport"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGpsL1Level"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTConditionId"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly"));
      sub_10011F838(self);
      return;
    case 56:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTConditionId"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "GpsL1DesireLevelSupport"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGpsL1Level"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("COEX_MIC_RF_SUPPORT"));
      sub_10011DFD8(self);
      return;
    case 57:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPLLAIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTECDRXWiFiTimeSharing"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB21"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEDualSubCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21PolicyTuneup"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("hpcellularstatemonitorsupport"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTConditionId"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("IOKitCameraStateEvent"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "GpsL1DesireLevelSupport"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGpsL1Level"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiGen9rFemConfig2gWifiOnly"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("COEX_MIC_RF_SUPPORT"));
      sub_10011EC08(self);
      return;
    case 58:
    case 60:
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("MedtronicSupport");
      goto LABEL_66;
    case 59:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      sub_1000F3C2C(self);
      return;
    case 61:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      sub_1000F3E94(self);
      return;
    case 62:
    case 123:
      goto LABEL_5;
    case 120:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      sub_1000F3FC8(self);
      return;
    case 121:
    case 132:
    case 134:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
LABEL_5:
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("WiFiBTLimitedAggregation");
      goto LABEL_66;
    case 122:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      sub_1000F8060(self);
      return;
    case 124:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      sub_1000F3D60(self);
      return;
    case 125:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("WiFiBTeSCOLimitedAggregation11ax");
      goto LABEL_66;
    case 126:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      goto LABEL_69;
    case 127:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"));
      sub_1000FB1CC(self);
      return;
    case 128:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
LABEL_69:
      sub_1000FA9FC(self);
      return;
    case 129:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_1000FBE00(self);
      return;
    case 130:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_1000FCE64(self);
      return;
    case 131:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      sub_1000FD73C(self);
      return;
    case 133:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      sub_100100904(self);
      return;
    case 135:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      sub_100100B20(self);
      return;
    case 136:
    case 138:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("WiFiBTeSCOLimitedAggregation");
      goto LABEL_66;
    case 137:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      sub_100100D3C(self);
      return;
    case 139:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      sub_100101024(self);
      return;
    case 140:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV1_1Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_1000FB3AC(self);
      return;
    case 141:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBt2gEnvelopeIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_1000F8A80(self);
      return;
    case 142:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      goto LABEL_95;
    case 143:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      sub_1000F40FC(self);
      return;
    case 144:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      sub_1000F4A10(self);
      return;
    case 145:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      goto LABEL_95;
    case 146:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB21ClientAntennaBlocking"));
      sub_1000F9648(self);
      return;
    case 147:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      goto LABEL_95;
    case 148:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      sub_100101DE4(self);
      return;
    case 149:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      sub_1001030F8(self);
      return;
    case 150:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
LABEL_95:
      sub_1000F8194(self);
      return;
    case 151:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      sub_10010440C(self);
      return;
    case 152:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      sub_100105720(self);
      return;
    case 153:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      goto LABEL_124;
    case 154:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      sub_100107508(self);
      return;
    case 155:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      sub_100108C50(self);
      return;
    case 156:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
LABEL_124:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      sub_100106A34(self);
      return;
    case 157:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      sub_10010A398(self);
      return;
    case 158:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedGpsFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CTSacDriverNeedWiFiFreq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BBWCI2Type7mmWaveTxOn"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      sub_10010BAE0(self);
      return;
    case 159:
    case 160:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_10010130C(self);
      return;
    case 161:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      goto LABEL_150;
    case 162:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("PencilCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_100110C7C(self);
      return;
    case 163:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10010D228(self);
      return;
    case 164:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("PencilCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10011242C(self);
      return;
    case 165:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_1000F5DB8(self);
      return;
    case 166:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("PencilCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_1000F68C4(self);
      return;
    case 167:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
LABEL_150:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10010D228(self);
      return;
    case 168:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10010DD1C(self);
      return;
    case 169:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("PencilCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10010D228(self);
      return;
    case 170:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU2SupportIntegrated"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBt5GProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFigaroCoex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiEnhCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement"))
      {
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTCoex"));
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("HFBTOOBMASKING"));
      }
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("PencilCoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CFUseTddModeDuringFindMy"));
      sub_10010F4CC(self);
      return;
    case 171:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      sub_1000FEAC0(self);
      return;
    case 172:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtULOFDMA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTeSCOLimitedAggregation"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBTA2DPIndication"));
      if (!-[WCM_PlatformManager forceWiFiBTCoexToTDD](self, "forceWiFiBTCoexToTDD"))
        -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiBtProfile"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNeedWiFiStatus"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTuningForGpsBB20"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOffFreqUpdate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntSelStatsAWDStats"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20PolicyConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiWCI2BitmapV2Enabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEActiveScanPwrLmtEnabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB20LAAType5IndDisabled"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Bb20EndcSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiType7LTEMBAntBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiFVGHzPDHLS"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiAWDWCI2CoexBitmap"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaSelectionV2Coex"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularNWCfgCmdFilter"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTELAACoexSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularPowerLimiting"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WiFiOCLSupportFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AntennaTunningForGps"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("AlwaysSetGPSState"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MedtronicSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("EnableULCA"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22ClientAntennaBlocking"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("OclPlistInput"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisablePhyRateBasedRxPriReq"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 0x200);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LegacyNonCoexBandBitmapFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Type72GWiFiSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtectionBTseparate"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicySupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("SacPolicyJasperSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BB22BusAntMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CoexBBUnifiedSensorInfoSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("DisableBBLegacyGnssMessage"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("MavAntPolicyFramework"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WlanConditionId"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiScanProtectionModeSupport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiAssocProtectionModeSupport"));
      sub_1000FF3F0(self);
      return;
    case 173:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      sub_100121098(self);
      return;
    case 176:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100121190(self);
      return;
    case 177:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_10012141C(self);
      return;
    case 180:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      if (-[WCM_PlatformManager isRowSKUB](self, "isRowSKUB"))
        sub_1001216A8(self);
      else
        sub_100121934(self);
      return;
    case 181:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      if (-[WCM_PlatformManager isRowSKUS](self, "isRowSKUS"))
        sub_100121BC0(self);
      else
        sub_100121E4C(self);
      return;
    case 182:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_1001220D8(self);
      return;
    case 220:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100122388(self);
      return;
    case 221:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100122638(self);
      return;
    case 222:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100122C4C(self);
      return;
    case 223:
    case 224:
    case 225:
    case 230:
    case 231:
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("RCU1Support");
      goto LABEL_66;
    case 227:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100124A68(self);
      return;
    case 228:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100124454(self);
      return;
    case 229:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100123E40(self);
      return;
    case 238:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ Platform ID = %d "), 238);
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100126EE0(self);
      return;
    case 239:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100123850(self);
      return;
    case 240:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100123260(self);
      return;
    case 243:
    case 244:
    case 263:
    case 264:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      v6 = -[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures");
      v7 = CFSTR("RCU1R2Support");
LABEL_66:
      -[NSMutableSet addObject:](v6, "addObject:", v7);
      break;
    case 260:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100125690(self);
      break;
    case 261:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_10012507C(self);
      break;
    case 262:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_1001268CC(self);
      break;
    case 265:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_100125CA4(self);
      break;
    case 266:
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("LTEScanProtection"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("RCU1R2Support"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTUseC0B1AntennaConfig"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WCI2Type7ShortBit"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ProtectWiFiRanging"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WifiBtAgcCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularWatchFcmBcmAntennaReport"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("Wifi5gChannelMapping"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BLEAFHMapConversion"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("BTSeparateAGCCoexMode"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("ClkAlgnTDDFix"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("charging_desense"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("WatchReportRC1IssueChannel"));
      -[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", CFSTR("CellularRC1PolicyManager"));
      -[WCM_PlatformManager setWcmCellularWCI2PlatformPolicyBitmap:](self, "setWcmCellularWCI2PlatformPolicyBitmap:", -[WCM_PlatformManager wcmCellularWCI2PlatformPolicyBitmap](self, "wcmCellularWCI2PlatformPolicyBitmap") | 1);
      sub_1001262B8(self);
      break;
    default:
      return;
  }
}

@end

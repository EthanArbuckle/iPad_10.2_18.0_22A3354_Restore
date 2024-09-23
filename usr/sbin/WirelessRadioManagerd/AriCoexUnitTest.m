@implementation AriCoexUnitTest

- (void)reloadAriDriverSettingsFromPreferences
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID TypeID;
  CFTypeID v6;
  BOOL v7;
  _BOOL4 v8;
  const char *v9;
  _BOOL4 v10;
  CFTypeID v11;
  const char *v12;
  void *value;

  v3 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("AriDebug"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (v3)
  {
    v4 = v3;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v4, CFSTR("AriTestMode"), (const void **)&value)
        && (v6 = CFStringGetTypeID(), v6 == CFGetTypeID(value)))
      {
        v7 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0) == kCFCompareEqualTo;
        v8 = v7;
        v9 = "FALSE";
        if (v7)
          v9 = "TRUE";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI Test Mode read from preference %s"), v9);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI Driver setting(UnitTest mode) not found"));
        v8 = 0;
      }
      if (CFDictionaryGetValueIfPresent(v4, CFSTR("DisableCoexAri"), (const void **)&value))
      {
        v11 = CFStringGetTypeID();
        if (v11 == CFGetTypeID(value))
        {
          v7 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0) == kCFCompareEqualTo;
          v10 = v7;
          v12 = "FALSE";
          if (v7)
            v12 = "TRUE";
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Disable Coex ARI flag read from preference %s"), v12);
          goto LABEL_18;
        }
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI Driver setting(Disable Coex ARI) not found"));
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("AriDebug not Found"));
      v8 = 0;
    }
    v10 = 1;
LABEL_18:
    CFRelease(v4);
    goto LABEL_19;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("AriDebug not Found"));
  v8 = 0;
  v10 = 1;
LABEL_19:
  self->mUnitTest = v8;
  self->mDisableCoexARI = v10;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI Driver current preference setting: UnitTest=%d, DisableCoexARI=%d"), v8, v10);
}

- (void)setAriDriverSettingsToPreferences:(BOOL)a3
{
  const char *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *values;
  void *keys;

  v3 = "FALSE";
  if (a3)
    v3 = "TRUE";
  values = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v3);
  keys = CFSTR("AriTestMode");
  v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    v5 = v4;
    CFPreferencesSetAppValue(CFSTR("AriDebug"), v4, CFSTR("com.apple.WirelessRadioManager.debug"));
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.WirelessRadioManager.debug")))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("%s: Failed to sync the preferences."), "-[AriCoexUnitTest setAriDriverSettingsToPreferences:]");
}

- (AriCoexUnitTest)init
{
  AriCoexUnitTest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AriCoexUnitTest;
  v2 = -[AriCoexUnitTest init](&v4, "init");
  v2->mAntBlockPolicy = 0;
  -[AriCoexUnitTest reloadAriDriverSettingsFromPreferences](v2, "reloadAriDriverSettingsFromPreferences");
  return v2;
}

- (BOOL)isUnitTestRequested
{
  return self->mUnitTest;
}

- (BOOL)isAriDisabled
{
  return self->mDisableCoexARI;
}

- (id)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  xpc_object_t v9;
  xpc_object_t values[3];
  char *keys[3];

  keys[0] = "kMessageId";
  keys[1] = "kMessageArgs";
  keys[2] = (char *)a5;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  values[2] = a6;
  v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI Driver UnitTest: Create messageId(%lld): %@"), a3, v9);
  return v9;
}

- (id)createXpcMsg_LAAConfig
{
  id result;
  id v4;

  result = xpc_dictionary_create(0, 0, 0);
  if (result)
  {
    v4 = result;
    xpc_dictionary_set_BOOL(result, "WCMCellularSetLAAConfig_CoexEnable", 1);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ProtectCQIPeriod", 0x64uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ThresholdIn", 0x14uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ThresholdOut", 0xAuLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_DeactTimer", 0x1F4uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_DeactStopTimer", 0x1F4uLL);
    return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1211, v4, "kSubId", xpc_uint64_create(0));
  }
  return result;
}

- (id)createXpcMsg_RC1Config
{
  xpc_object_t v3;
  id result;
  id v5;

  v3 = xpc_uint64_create(0);
  result = xpc_dictionary_create(0, 0, 0);
  if (result)
  {
    v5 = result;
    xpc_dictionary_set_uint64(result, "WCMCellularSetLAAConfig_UwbRangingDuration", 0x9C40uLL);
    xpc_dictionary_set_uint64(v5, "WCMCellularSetLAAConfig_UwbNarrowBandDuration", 0xC350uLL);
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetLaaGpioThrottleReq_Enabled", 1uLL);
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetLaaGpioThrottleReq_Periodicity", 0x64uLL);
    return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1213, v5, "kSubId", v3);
  }
  return result;
}

- (id)createXpcMsg_ScanFreq
{
  xpc_object_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  _BYTE *v9;
  unint64_t v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  xpc_object_t values[2];
  _BYTE v18[128];
  char *keys[2];

  v3 = xpc_array_create(0, 0);
  *(_OWORD *)keys = *(_OWORD *)off_1002033C0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(&off_100241C88, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(&off_100241C88);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "count") == (id)2)
        {
          v9 = objc_msgSend(objc_msgSend(v8, "objectAtIndex:", 1), "integerValue");
          v10 = v9 - (_BYTE *)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", 0), "integerValue");
          values[0] = xpc_int64_create((int64_t)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", 0), "integerValue") + (v10 >> 1));
          values[1] = xpc_int64_create(v10);
          v11 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
          xpc_array_append_value(v3, v11);
        }
      }
      v5 = objc_msgSend(&off_100241C88, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1208, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_SpmiFeature_TxBlanking_PwrLmt
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Policy", 0x8FDAuLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_PowerThreshold", 0x12uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_RB_Threshold", 0x25uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold", 7uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials", 25);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_FrameDenialWindow", 200);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_APTTable", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit", 0x1EuLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_WCI2PowerLimit", 0x13uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold", 0x6BuLL);
  xpc_dictionary_set_double(v3, "kWCMCellularSetWCI2Mode_RBFilterAlpha", 0.05);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_FilterRBThreshold", 0x25uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO", 0x96uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_TxPowerThresholdForAdvTxNotice", 19);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_RbThresholdForAdvTxNotice", 37);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Controller_RB_Threshold", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold", 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_CoexTech", 9uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_NGC_TxDenialThresholdSlots", 7uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_NGC_MaxAllowedSlotDenials", 25);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_NGC_SlotsDenialWindow", 200);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1205, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_SetAllCC
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1234, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_SetCC1
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetCC_Enable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CoexTech", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CarrierId", 0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkCenterFrequency", 2560.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkBandwidth", 10.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkCenterFrequency", 2630.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkBandwidth", 10.0);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1217, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_SetCC2
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetCC_Enable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CoexTech", 0x40uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CarrierId", 0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkCenterFrequency", 2570.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkBandwidth", 10.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkCenterFrequency", 2640.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkBandwidth", 10.0);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1218, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_TimeShareConfig
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  __int128 v7;
  xpc_object_t values[2];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_CoexTech", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  v4 = xpc_array_create(0, 0);
  values[0] = xpc_int64_create(7);
  values[1] = xpc_int64_create(10);
  v7 = *(_OWORD *)off_1002033D0;
  v5 = xpc_dictionary_create((const char *const *)&v7, values, 2uLL);
  xpc_array_append_value(v4, v5);
  xpc_dictionary_set_value(v3, "kWCMCellularTImeShareConfig_BandInformationSet", v4);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1214, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_WiFiAntBlockingConfig
{
  WCM_AntBlockPowerLimitPolicy *mAntBlockPolicy;
  id v4;

  mAntBlockPolicy = self->mAntBlockPolicy;
  if (mAntBlockPolicy
    && (v4 = -[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 0)) != 0)
  {
    return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1225, v4, "kSubId", xpc_uint64_create(0));
  }
  else
  {
    return 0;
  }
}

- (id)createXpcMsg_UwbAntBlockingConfig
{
  WCM_AntBlockPowerLimitPolicy *mAntBlockPolicy;
  id v4;

  mAntBlockPolicy = self->mAntBlockPolicy;
  if (mAntBlockPolicy
    && (v4 = -[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 1)) != 0)
  {
    return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1226, v4, "kSubId", xpc_uint64_create(0));
  }
  else
  {
    return 0;
  }
}

- (id)createXpcMsg_CamAntBlockingConfig
{
  WCM_AntBlockPowerLimitPolicy *mAntBlockPolicy;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  xpc_object_t v7;
  void *v8;

  mAntBlockPolicy = self->mAntBlockPolicy;
  if (!mAntBlockPolicy)
    return 0;
  v4 = -[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 2);
  v5 = -[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 3);
  if (!(v4 | v5))
    return 0;
  v6 = (void *)v5;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = v7;
  if (v4)
    xpc_dictionary_set_value(v7, "kWCMCellularSetAntBlocking_FrontCameraPolicy", (xpc_object_t)v4);
  if (v6)
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy", v6);
  if (v8)
    return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1227, v8, "kSubId", xpc_uint64_create(0));
  else
    return 0;
}

- (id)createXpcMsg_AntBitmap
{
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t v6;

  v3 = xpc_array_create(0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB22AntMapping_:Updating antenna map params to cellular modem"));
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  for (i = 0; i != 10; ++i)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
    xpc_dictionary_set_uint64(v6, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", (int)objc_msgSend(objc_msgSend(&off_100241CA0, "objectAtIndex:", i), "intValue"));
    xpc_array_append_value(v3, v6);
  }
  xpc_dictionary_set_value(v4, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1215, v4, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_MiscConfig
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetMiscConfig_UwbInactivityDurationThreshold", 0x96uLL);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1230, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_TxActivityConfig
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetTxActivityConfig_TxEnvPowerThreshold", 320);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTxActivityConfig_TxEnvMinDuration", 0x14uLL);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetTxActivityConfig_TxStatsEnable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTxActivityConfig_TxStatsCadence", 0x12CuLL);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1231, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_CameraStateConfig
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCameraState", 9uLL);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1233, v3, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_AntennaTunerConfig:(unint64_t)a3 State:(unint64_t)a4 UseCase:(unint64_t)a5
{
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v8 = xpc_uint64_create(a4);
  v9 = xpc_uint64_create(a5);
  v10 = xpc_array_create(0, 0);
  xpc_array_append_value(v10, v8);
  xpc_array_append_value(v10, v9);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v11, "kWCMCellularTransparentMessage_ByteList", v10);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTransparentMessage_Type", a3);
  v12 = xpc_array_create(0, 0);
  xpc_array_append_value(v12, v11);
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessageInformationSet", v12);
  return -[AriCoexUnitTest sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1223, v13, "kSubId", xpc_uint64_create(0));
}

- (id)createXpcMsg_AntennaTunerConfig_WiFi
{
  return -[AriCoexUnitTest createXpcMsg_AntennaTunerConfig:State:UseCase:](self, "createXpcMsg_AntennaTunerConfig:State:UseCase:", 1, 3, 0);
}

- (id)createXpcMsg_AntennaTunerConfig_BT
{
  return -[AriCoexUnitTest createXpcMsg_AntennaTunerConfig:State:UseCase:](self, "createXpcMsg_AntennaTunerConfig:State:UseCase:", 2, 2, 2);
}

- (id)createXpcMsg_AntennaTunerConfig_UWB
{
  return -[AriCoexUnitTest createXpcMsg_AntennaTunerConfig:State:UseCase:](self, "createXpcMsg_AntennaTunerConfig:State:UseCase:", 3, 9, 1);
}

- (id)createXpcMsg_AntennaTunerConfig_GNSS
{
  return -[AriCoexUnitTest createXpcMsg_AntennaTunerConfig:State:UseCase:](self, "createXpcMsg_AntennaTunerConfig:State:UseCase:", 0, 1, 2);
}

@end

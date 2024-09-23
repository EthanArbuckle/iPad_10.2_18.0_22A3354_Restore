@implementation WCM_CellularController

- (void)handleMessage:(id)a3
{
  int64_t uint64;
  const __CFString *v6;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 387)
  {
    switch(uint64)
    {
      case 388:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Handle config message WCMCellularBBStateIndication"));
        -[WCM_CellularController handleDesenseBBStateIndication:](self, "handleDesenseBBStateIndication:", a3);
        break;
      case 399:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Handle config message WCMCellular_DesenseNetworkConfiguration"));
        -[WCM_CellularController handleDesenseNetworkConfig:](self, "handleDesenseNetworkConfig:", a3);
        break;
      case 2600:
LABEL_7:
        -[WCM_CellularController handleNetworkConfig:](self, "handleNetworkConfig:", a3);
        break;
      default:
LABEL_15:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Cellular Controller dropping message %llu"), uint64);
        break;
    }
  }
  else
  {
    switch(uint64)
    {
      case 300:
        goto LABEL_7;
      case 301:
        -[WCM_CellularController handleTxPower:](self, "handleTxPower:", a3);
        return;
      case 302:
        v6 = CFSTR("Just ignore WCMCellularLinkQuality for now");
        goto LABEL_12;
      case 303:
        -[WCM_CellularController handleThresholdEvent:](self, "handleThresholdEvent:", a3);
        return;
      case 304:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("BB Reset & Now Ready - Reset Coex Policies"));
        -[WCM_CellularController handlePowerState:](self, "handlePowerState:", 1);
        return;
      case 305:
        v6 = CFSTR("Just ignore WCMCellularScanFreqBandFilter for now");
LABEL_12:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v6);
        break;
      default:
        goto LABEL_15;
    }
  }
}

- (void)updateWCI2CoexPolicy:(unint64_t)a3
{
  unint64_t v5;
  void *v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ updateGPSStateBit function called by updateWCI2CoexPolicy with input policy: %lld."), a3);
  v5 = -[WCM_CellularController updateGPSStateBit:](self, "updateGPSStateBit:", a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: updateFrameSyncBit function called by updateWCI2CoexPolicy with input policy wci2CoexPolicyBitmapGPSUpdated: %lld."), v5);
  v6 = -[WCM_CellularController updateFrameSyncBit:](self, "updateFrameSyncBit:", v5);
  if ((void *)-[WCM_CellularController wci2CoexPolicyBitmap](self, "wci2CoexPolicyBitmap") != v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Updating WCI2 Policy from %lld to %lld"), -[WCM_CellularController wci2CoexPolicyBitmap](self, "wci2CoexPolicyBitmap"), v6);
    -[WCM_CellularController setWci2CoexPolicyBitmap:](self, "setWci2CoexPolicyBitmap:", v6);
    -[WCM_CellularController setAllPolicies](self, "setAllPolicies");
  }
  -[WCM_CellularController setAllCriticalCarriers](self, "setAllCriticalCarriers");
}

- (unint64_t)wci2CoexPolicyBitmap
{
  return *(int64_t *)((char *)&self->_rbThreshold + 4);
}

- (unint64_t)updateFrameSyncBit:(unint64_t)a3
{
  id v5;
  unsigned int v6;

  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: before clkAlgnTDDFreqCheck, wci2CoexPolicyBitmap=%lld"), a3);
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("ClkAlgnTDDFix")))
  {
    v6 = -[WCM_CellularController btClkAlgnFlag](self, "btClkAlgnFlag");
    a3 = a3 & 0xFFFFFFFFFFFFFFFELL | v6;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: clkAlgnEnableFlag is %d."), v6);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: after clkAlgnTDDFreqCheck, wci2CoexPolicyBitmap=%lld"), a3);
  return a3;
}

- (unint64_t)updateGPSStateBit:(unint64_t)a3
{
  id v5;
  unsigned int v6;
  unint64_t v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DLDebug_ GPS State Always Set Feature --- updateGPSStateBit function called."));
  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTunningForGps"))&& objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("AlwaysSetGPSState")))
  {
    v6 = objc_msgSend(v5, "gpsRadioActive");
    v7 = -[WCM_CellularController wci2CoexPolicyBitmap](self, "wci2CoexPolicyBitmap");
    if (v6)
    {
      a3 |= 0x8000uLL;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DLDebug_ GPS State Always Set Feature --- GPS Active with old bitmap %lld, new bitmap %lld"), v7, a3);
    }
    else
    {
      a3 &= ~0x8000uLL;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DLDebug_ GPS State Always Set Feature --- GPS inactive with old bitmap %lld, new bitmap %lld"), v7, a3);
    }
  }
  else if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTunningForGps"))&& objc_msgSend(v5, "gpsRadioActive"))
  {
    a3 |= 0x8000uLL;
  }
  return a3;
}

- (void)setAllPolicies
{
  id v3;
  id v4;
  xpc_object_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  float v9;

  v3 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v4 = objc_msgSend(v3, "platformManager");
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = -[WCM_CellularController wci2CoexPolicyBitmap](self, "wci2CoexPolicyBitmap");
  v7 = (unint64_t)objc_msgSend(v4, "wcmCellularWCI2PlatformPolicyBitmap");
  if (((v7 | v6) & 0x1000) != 0)
    v8 = (v7 | v6) & 0xFFFFFFFFFFFFFFEFLL;
  else
    v8 = v7 | v6;
  if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
  {
    v8 = -[WCM_CellularController updatePolicyForBB20:](self, "updatePolicyForBB20:", v8);
    if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("BB21PolicyTuneup")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB21: Turning off TX ACTIVE policy in BB21 platforms"));
      v8 &= ~2uLL;
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("clkAlgnTDDFreqCheck: The final wci2CoexPolicyBitmap from WRM to CommCentr is wci2CoexPolicyBitmap= %lld."), v8);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Policy", v8);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_PowerThreshold", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModePowerThreshold"), "integerValue"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_RB_Threshold", -[WCM_CellularController rbThreshold](self, "rbThreshold"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTETxDenial"), "integerValue"));
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials", (int64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeMaxAllowedFrameDenials"), "integerValue"));
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_FrameDenialWindow", (int64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeFrameDenialWindow"), "integerValue"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_APTTable", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeAPTTable"), "integerValue"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit", -[WCM_CellularController controllerTxPowerLimit](self, "controllerTxPowerLimit"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimit", -[WCM_CellularController wci2TxPowerLimit](self, "wci2TxPowerLimit"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLinkPathLossThreshold"), "integerValue"));
  objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeRBFilerAlpha"), "floatValue");
  xpc_dictionary_set_double(v5, "kWCMCellularSetWCI2Mode_RBFilterAlpha", v9);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_FilterRBThreshold", -[WCM_CellularController rbThreshold](self, "rbThreshold"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeControllerTxPowerLimitTO"), "integerValue"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeWCI2PowerLimitTO"), "integerValue"));
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_TxPowerThresholdForAdvTxNotice", (int64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeTxPowerThresholdAdvTx"), "integerValue"));
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_RbThresholdForAdvTxNotice", -[WCM_CellularController rbThreshold](self, "rbThreshold"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Controller_RB_Threshold", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeControllerLTERBThreshold"), "integerValue"));
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTEHarqnackratioThreshold"), "integerValue"));
  xpc_dictionary_set_BOOL(v5, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable", (BOOL)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeControllerLTEPowerLimitingEnable"), "BOOLValue"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA setAllPolicies-1-ULCA critical bitmap %d"), objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
  {
    -[WCM_CellularController setAllCriticalCarriers](self, "setAllCriticalCarriers");
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_CoexTech", -[WCM_CellularController getCoexTechForPolicy:](self, "getCoexTechForPolicy:", objc_msgSend(v3, "wcmCellular_CC1_Tech")));
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_NGC_TxDenialThresholdSlots", (uint64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTETxDenial"), "integerValue"));
    xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_NGC_MaxAllowedSlotDenials", (int64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeMaxAllowedFrameDenials"), "integerValue"));
    xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_NGC_SlotsDenialWindow", (int64_t)objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeFrameDenialWindow"), "integerValue"));
  }
  else
  {
    xpc_dictionary_set_BOOL(v5, "kWCMCellularSetWCI2Mode_Ext_enabled", (BOOL)objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_Enable"));
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Ext_critical_ul_ca_bitmap", (uint64_t)objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  }
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1205, v5);
  xpc_release(v5);
}

- (int64_t)rbThreshold
{
  return *(int64_t *)((char *)&self->_controllerTxPowerLimit + 4);
}

- (void)setGpsBandInfoToBB:(BOOL)a3 l5Enabled:(BOOL)a4 btA2DPEnabled:(BOOL)a5 l5Level:(unint64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("DisableBBLegacyGnssMessage")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Legacy GNSS messaging to BB is disabled in this platform"));
    return;
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Updating GPS band info params to cellular modem, L1=%d, L5=%d, a2dp=%d"), v9, v8, v7);
  if (!v7)
  {
    if (v8)
      v12 = 6;
    else
      v12 = 1;
    v13 = 1;
    if (v8 || v9)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_11:
    v13 = 0;
    v12 = 7;
    goto LABEL_12;
  }
  v12 = 5;
  v13 = 1;
LABEL_12:
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_Enabled", v13);
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_Band", v12);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTuningForGpsBB21")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Updating GPS L5 band level info params to cellular modem, l5Level=%d"), a6);
    xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_L5Level", a6);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Set GNSS param bitmask=%d"), v12);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1220, v11);
  xpc_release(v11);
}

- (void)sendBBCoexSensorMessage:(int)a3 band:(unsigned __int8)a4 usecase:(unsigned __int8)a5
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  xpc_object_t v9;
  xpc_object_t v10;
  char *v11;
  char *v12;
  _BYTE *v13;
  unsigned int v14;
  BOOL v15;
  xpc_object_t v16;
  xpc_object_t v17;
  size_t v18;
  xpc_object_t v19;
  WCM_CellularController *v20;
  xpc_object_t v21;
  xpc_object_t xarray;
  xpc_object_t value;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v21 = xpc_dictionary_create(0, 0, 0);
  value = xpc_uint64_create(v7);
  v9 = xpc_array_create(0, 0);
  v10 = xpc_dictionary_create(0, 0, 0);
  xarray = xpc_array_create(0, 0);
  v20 = self;
  v11 = (char *)&self->_cellularInstance1.primarydlBandwidth + 4;
  v12 = &v11[v7];
  v14 = v12[4];
  v13 = v12 + 4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21: Requests to send sensor info st %d band %d uc %d to BB %d %d"), v7, v6, v5, v11[v7], v14);
  if (v11[v7] != v6 || (*v13 != v5 ? (v15 = v6 == 0) : (v15 = 1), !v15))
  {
    v11[v7] = v6;
    *v13 = v5;
    v16 = xpc_uint64_create(v6);
    xpc_array_append_value(v9, v16);
    v17 = xpc_uint64_create(v5);
    xpc_array_append_value(v9, v17);
    xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_Type", value);
    xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_ByteList", v9);
    xpc_array_append_value(xarray, v10);
    xpc_dictionary_set_value(v21, "kWCMCellularTransparentMessageInformationSet", xarray);
    -[WCM_CellularController sendMessage:withArgs:](v20, "sendMessage:withArgs:", 1223, v21);
    if (xpc_array_get_count(v9))
    {
      v18 = 0;
      do
      {
        v19 = xpc_array_get_value(v9, v18);
        xpc_release(v19);
        ++v18;
      }
      while (xpc_array_get_count(v9) > v18);
    }
  }
  xpc_release(v10);
  xpc_release(value);
  xpc_release(v21);
  xpc_release(xarray);
  xpc_release(v9);
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4
{
  unsigned int v7;
  xpc_object_t v8;

  v7 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver"));
  v8 = xpc_uint64_create(-[WCM_CellularController activeSubId](self, "activeSubId"));
  if (v7)
    -[WCM_CellularController sendMessageToAriDriver:withArgs:withExtraKey:andExtraValue:](self, "sendMessageToAriDriver:withArgs:withExtraKey:andExtraValue:", a3, a4, "kSubId", v8);
  else
    -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", a3, a4, "kSubId", v8);
  xpc_release(v8);
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  objc_super v11;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    -[WCM_CellularController sendMessageToAriDriver:withArgs:withExtraKey:andExtraValue:](self, "sendMessageToAriDriver:withArgs:withExtraKey:andExtraValue:", a3, a4, "kSubId", a6);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WCM_CellularController;
    -[WCM_Controller sendMessage:withArgs:withExtraKey:andExtraValue:](&v11, "sendMessage:withArgs:withExtraKey:andExtraValue:", a3, a4, a5, a6);
  }
}

- (void)setAllCriticalCarriers
{
  id v3;
  void *v4;
  void *v5;
  $03B45E325E2BEB6367864A8B9A334110 *v6;
  $DA5954C7369382CD05C4DA3E529A5348 *v7;
  double var2;
  double var3;
  $DA5954C7369382CD05C4DA3E529A5348 *v10;
  double v11;
  double v12;
  id v13;
  _BOOL4 v14;
  int v15;
  id v16;
  _BOOL4 v17;
  int v18;
  unsigned int v19;

  v3 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v4 = -[WCM_CellularController getCoexTechForPolicy:](self, "getCoexTechForPolicy:", objc_msgSend(v3, "wcmCellular_CC1_Tech"));
  v5 = -[WCM_CellularController getCoexTechForPolicy:](self, "getCoexTechForPolicy:", objc_msgSend(v3, "wcmCellular_CC2_Tech"));
  v6 = -[WCM_CellularController getActiveULCAConfig](self, "getActiveULCAConfig");
  if ((objc_msgSend(v3, "wcmCellularCCSetToBB") & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: wcmCellularCCSetToBB = True, Critical carriers already set"));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: wcmCellularCCSetToBB = False, Start to set critical carriers"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC1CarrierId = %llu, new CC1CarrierId = %llu"), -[WCM_CellularController CC1CarrierId](self, "CC1CarrierId"), objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC1Tech = %llu, new CC1Tech = %llu"), -[WCM_CellularController CC1Tech](self, "CC1Tech"), v4);
  if (v6)
  {
    v7 = &v6->var0[v6->var2];
    var2 = v7->var2;
    var3 = v7->var3;
    v10 = &v6->var0[v6->var3];
    v11 = v10->var2;
    v12 = v10->var3;
  }
  else
  {
    var2 = 0.0;
    var3 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC1Freq/BW = %f/%f, new CC1Freq/BW = %f/%f"), qword_100271238, qword_100271240, *(_QWORD *)&var2, *(_QWORD *)&var3);
  v13 = -[WCM_CellularController CC1CarrierId](self, "CC1CarrierId");
  v14 = v13 != objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap")
     || (void *)-[WCM_CellularController CC1Tech](self, "CC1Tech") != v4;
  if (!objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    if (!v14)
      goto LABEL_22;
LABEL_21:
    -[WCM_CellularController setCriticalCarrier:forCarrierId:forTech:](self, "setCriticalCarrier:forCarrierId:forTech:", 1217, objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"), v4);
    -[WCM_CellularController setCC1CarrierId:](self, "setCC1CarrierId:", objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
    -[WCM_CellularController setCC1Tech:](self, "setCC1Tech:", v4);
    v15 = 1;
    goto LABEL_23;
  }
  if (*(double *)&qword_100271238 != var2)
  {
    if (var2 == 0.0 || var3 == 0.0)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (var3 != 0.0 && var2 != 0.0 && *(double *)&qword_100271240 != var3)
  {
LABEL_19:
    qword_100271238 = *(_QWORD *)&var2;
    qword_100271240 = *(_QWORD *)&var3;
    goto LABEL_21;
  }
LABEL_20:
  qword_100271238 = *(_QWORD *)&var2;
  qword_100271240 = *(_QWORD *)&var3;
  if (v14)
    goto LABEL_21;
LABEL_22:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: not change in CC1, skip CC1"));
  v15 = 0;
LABEL_23:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC2CarrierId = %llu, new CC2CarrierId = %llu"), -[WCM_CellularController CC2CarrierId](self, "CC2CarrierId"), objc_msgSend(v3, "wcmCellularWCI2Mode_CC2"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC2Tech = %llu, new CC2Tech = %llu"), -[WCM_CellularController CC2Tech](self, "CC2Tech"), v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: previous CC2Freq/BW = %f/%f, new CC2Freq/BW = %f/%f"), qword_100271248, qword_100271250, *(_QWORD *)&v11, *(_QWORD *)&v12);
  v16 = -[WCM_CellularController CC2CarrierId](self, "CC2CarrierId");
  v17 = v16 != objc_msgSend(v3, "wcmCellularWCI2Mode_CC2")
     || (void *)-[WCM_CellularController CC2Tech](self, "CC2Tech") != v5;
  if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    if (*(double *)&qword_100271248 == v11)
    {
      if (v12 == 0.0 || *(double *)&qword_100271250 == v12 || v11 == 0.0)
      {
LABEL_37:
        qword_100271248 = *(_QWORD *)&v11;
        qword_100271250 = *(_QWORD *)&v12;
        if (v17)
          goto LABEL_38;
LABEL_39:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("setAllCriticalCarriers: not change in CC2, skip CC2"));
        v18 = 0;
        goto LABEL_40;
      }
    }
    else if (v11 == 0.0 || v12 == 0.0)
    {
      goto LABEL_37;
    }
    qword_100271248 = *(_QWORD *)&v11;
    qword_100271250 = *(_QWORD *)&v12;
  }
  else if (!v17)
  {
    goto LABEL_39;
  }
LABEL_38:
  -[WCM_CellularController setCriticalCarrier:forCarrierId:forTech:](self, "setCriticalCarrier:forCarrierId:forTech:", 1218, objc_msgSend(v3, "wcmCellularWCI2Mode_CC2"), v5);
  -[WCM_CellularController setCC2CarrierId:](self, "setCC2CarrierId:", objc_msgSend(v3, "wcmCellularWCI2Mode_CC2"));
  -[WCM_CellularController setCC2Tech:](self, "setCC2Tech:", v5);
  v18 = 1;
LABEL_40:
  v19 = objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver"));
  if ((v15 | v18) == 1)
  {
    if (v19)
      -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1234, xpc_dictionary_create(0, 0, 0));
  }
  objc_msgSend(v3, "setWcmCellularCCSetToBB:", 1);
}

- (unint64_t)getCoexTechForPolicy:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 4;
      case 0x20uLL:
        v6 = -[WCM_CellularController activeSubId](self, "activeSubId") == 0;
        v3 = 8;
        v7 = 5;
LABEL_16:
        if (v6)
          return v7;
        break;
      case 0x40uLL:
        v5 = -[WCM_CellularController activeSubId](self, "activeSubId");
        v3 = 10;
        if (v5)
          return 11;
        break;
      default:
        return 0;
    }
  }
  else
  {
    v3 = 1;
    switch(a3)
    {
      case 1uLL:
        v4 = -[WCM_CellularController activeSubId](self, "activeSubId");
        v3 = 9;
        if (!v4)
          v3 = 0;
        break;
      case 2uLL:
        return v3;
      case 4uLL:
        v6 = -[WCM_CellularController activeSubId](self, "activeSubId") == 0;
        v3 = 6;
        v7 = 2;
        goto LABEL_16;
      case 8uLL:
        v3 = 3;
        break;
      default:
        return 0;
    }
  }
  return v3;
}

- (unint64_t)activeSubId
{
  return *(unint64_t *)((char *)&self->_activeConfig + 4);
}

- ($03B45E325E2BEB6367864A8B9A334110)getActiveULCAConfig
{
  return ($03B45E325E2BEB6367864A8B9A334110 *)((char *)-[WCM_CellularController activeConfig](self, "activeConfig") + 144);
}

- ($18E34B6F31A8113A84A5E642390E7364)activeConfig
{
  return *($18E34B6F31A8113A84A5E642390E7364 **)((char *)&self->_wifiTxPowerdBm + 4);
}

- (void)handleDesenseNetworkConfig:(id)a3
{
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  void *v8;
  int64_t count;
  unint64_t v10;
  xpc_object_t v11;
  uint64_t uint64;
  const __CFString *v13;
  xpc_object_t v14;
  void *v15;
  int64_t v16;
  char v17;
  unint64_t v18;
  xpc_object_t v19;
  uint64_t v20;
  int64_t int64;
  char v22;
  xpc_object_t v23;
  void *v24;
  int64_t v25;
  unint64_t v26;
  xpc_object_t v27;
  uint64_t v28;
  int64_t v29;
  xpc_object_t v30;
  void *v31;
  int64_t v32;
  unint64_t v33;
  xpc_object_t v34;
  uint64_t v35;
  int64_t v36;
  xpc_object_t v37;
  void *v38;
  int64_t v39;
  unint64_t v40;
  xpc_object_t v41;
  uint64_t v42;
  int64_t v43;
  xpc_object_t v44;
  void *v45;
  int64_t v46;
  unint64_t v47;
  xpc_object_t v48;
  uint64_t v49;
  int64_t v50;
  _QWORD block[6];

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicySupport")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018694;
    block[3] = &unk_100201B18;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "sacManager"), "getQueue"), block);
  }
  if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("charging_desense")))
  {
    v13 = CFSTR(" FCharging controller not enabled ignoring config message");
LABEL_12:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v13);
    return;
  }
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v13 = CFSTR("FCharging - nwConfig is NULL return");
    goto LABEL_12;
  }
  v6 = value;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging - total count is %d"), xpc_dictionary_get_count(value));
  v7 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_UplinkFrequency");
  if (v7)
  {
    v8 = v7;
    count = xpc_array_get_count(v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_UplinkFrequency - total count is %d"), count);
    if (count >= 1)
    {
      v10 = count + 1;
      do
      {
        v11 = xpc_array_get_value(v8, v10 - 2);
        uint64 = xpc_dictionary_get_uint64(v11, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Index %d - frequency %lld - bandwidth %lld "), v10 - 2, uint64, xpc_dictionary_get_int64(v11, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth"));
        --v10;
      }
      while (v10 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_UplinkFrequency - nwConfig is NULL"));
  }
  v14 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_SearchFrequency");
  if (v14)
  {
    v15 = v14;
    v16 = xpc_array_get_count(v14);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_SearchFrequency - total count is %d"), v16);
    if (v16 < 1)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v18 = v16 + 1;
      do
      {
        v19 = xpc_array_get_value(v15, v18 - 2);
        v20 = xpc_dictionary_get_uint64(v19, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64 = xpc_dictionary_get_int64(v19, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Index %d - frequency %lld - bandwidth %lld "), v18 - 2, v20, int64);
        if ((double)v20 / 1000000.0 + (double)int64 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band Index %d - frequency %lld - bandwidth %lld "), v18 - 2, v20, int64);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
          v17 = 1;
        }
        --v18;
      }
      while (v18 > 1);
    }
    v22 = v17;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_SearchFrequency - nwConfig is NULL"));
    v22 = 0;
  }
  v23 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_HoppingFrequency");
  if (v23)
  {
    v24 = v23;
    v25 = xpc_array_get_count(v23);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_HoppingFrequency - total count is %d"), v25);
    if (v25 >= 1)
    {
      v26 = v25 + 1;
      do
      {
        v27 = xpc_array_get_value(v24, v26 - 2);
        v28 = xpc_dictionary_get_uint64(v27, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        v29 = xpc_dictionary_get_int64(v27, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging %d - frequency %lld - bandwidth %lld "), v26 - 2, v28, v29);
        if ((double)v28 / 1000000.0 + (double)v29 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band Index %d - frequency %lld - bandwidth %lld "), v26 - 2, v28, v29);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
          v22 = 1;
        }
        --v26;
      }
      while (v26 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_HoppingFrequency - nwConfig is NULL"));
  }
  v30 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_NeighborFrequency");
  if (v30)
  {
    v31 = v30;
    v32 = xpc_array_get_count(v30);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_NeighborFrequency - total count is %d"), v32);
    if (v32 >= 1)
    {
      v33 = v32 + 1;
      do
      {
        v34 = xpc_array_get_value(v31, v33 - 2);
        v35 = xpc_dictionary_get_uint64(v34, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        v36 = xpc_dictionary_get_int64(v34, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Index %d - frequency %lld - bandwidth %lld "), v33 - 2, v35, v36);
        if ((double)v35 / 1000000.0 + (double)v36 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band Index %d - frequency %lld - bandwidth %lld "), v33 - 2, v35, v36);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
          v22 = 1;
        }
        --v33;
      }
      while (v33 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_NeighborFrequency - nwConfig is NULL"));
  }
  v37 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_RplmnFrequency");
  if (v37)
  {
    v38 = v37;
    v39 = xpc_array_get_count(v37);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_RplmnFrequency - total count is %d"), v39);
    if (v39 >= 1)
    {
      v40 = v39 + 1;
      do
      {
        v41 = xpc_array_get_value(v38, v40 - 2);
        v42 = xpc_dictionary_get_uint64(v41, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        v43 = xpc_dictionary_get_int64(v41, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Index %d - frequency %lld - bandwidth %lld "), v40 - 2, v42, v43);
        if ((double)v42 / 1000000.0 + (double)v43 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band Index %d - frequency %lld - bandwidth %lld "), v40 - 2, v42, v43);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
          v22 = 1;
        }
        --v40;
      }
      while (v40 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_RplmnFrequency - nwConfig is NULL"));
  }
  v44 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_DownlinkFrequency");
  if (v44)
  {
    v45 = v44;
    v46 = xpc_array_get_count(v44);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_DownlinkFrequency - total count is %d"), v46);
    if (v46 >= 1)
    {
      v47 = v46 + 1;
      do
      {
        v48 = xpc_array_get_value(v45, v47 - 2);
        v49 = xpc_dictionary_get_uint64(v48, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        v50 = xpc_dictionary_get_int64(v48, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Index %d - frequency %lld - bandwidth %lld "), v47 - 2, v49, v50);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging Frequency Upper bound  %lf "), (double)v49 / 1000000.0 + (double)v50 / 1000000.0 * 0.5);
        if ((double)v49 / 1000000.0 + (double)v50 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band Index %d - frequency %lld - bandwidth %lld "), v47 - 2, v49, v50);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
          v22 = 1;
        }
        --v47;
      }
      while (v47 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging kWCMCellular_DesenseFreqReport_DownlinkFrequency - nwConfig is NULL"));
  }
  self->_sensorInfo.usecase[2] = v22 & 1;
  -[WCM_CellularController fastChargingHandler:](self, "fastChargingHandler:");
}

- (void)sacHandleDesenseNetworkConfig:(id)a3
{
  id v5;
  uint64_t uint64;
  BOOL v7;
  unsigned __int8 v8;
  const __CFString *v9;
  xpc_object_t value;
  void *v11;
  xpc_object_t v12;
  const __CFString *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  id v16;
  xpc_object_t v17;
  xpc_object_t v18;
  id v19;
  xpc_object_t v20;
  xpc_object_t v21;
  id v22;
  xpc_object_t v23;
  xpc_object_t v24;
  id v25;
  xpc_object_t v26;
  xpc_object_t v27;
  id v28;

  v5 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "sacManager");
  uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicySupport")))v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (!v5)
      goto LABEL_11;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v5, "isTestMode");
  if ((v8 & 1) != 0)
  {
LABEL_9:
    if (objc_msgSend(v5, "isTestMode"))
    {
      v9 = CFSTR(" SAC Manager is in FrequencyTool Test mode, ignoring desense network config message");
LABEL_12:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v9);
      return;
    }
LABEL_11:
    v9 = CFSTR(" SAC Manager is not enabled, ignoring desense network config message");
    goto LABEL_12;
  }
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v9 = CFSTR("SAC - nwConfig is NULL return");
    goto LABEL_12;
  }
  v11 = value;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC - total count is %d"), xpc_dictionary_get_count(value));
  v12 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_UplinkFrequency");
  if (v12)
    v13 = CFSTR("SAC kWCMCellular_DesenseFreqReport_UplinkFrequency found, set subId=%d to active");
  else
    v13 = CFSTR("SAC kWCMCellular_DesenseFreqReport_UplinkFrequency is NULL, set subId=%d to inactive");
  objc_msgSend(v5, "sacSetCellularSubActiveState:onSubId:", v12 != 0, uint64);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v13, uint64);
  v14 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_DownlinkFrequency");
  if (v14)
  {
    v15 = v14;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_DownlinkFrequency - total count is %d"), xpc_array_get_count(v14));
    v16 = objc_alloc_init((Class)NSMutableArray);
    -[WCM_CellularController sacExtractDesenseFreq:message:](self, "sacExtractDesenseFreq:message:", v16, v15);
    objc_msgSend(v5, "sacUpdateCellularDownlinkFreqInfo:onSubId:", v16, uint64);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_DownlinkFrequency is NULL"));
  }
  v17 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_SearchFrequency");
  if (v17)
  {
    v18 = v17;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_SearchFrequency - total count is %d"), xpc_array_get_count(v17));
    v19 = objc_alloc_init((Class)NSMutableArray);
    -[WCM_CellularController sacExtractDesenseFreq:message:](self, "sacExtractDesenseFreq:message:", v19, v18);
    objc_msgSend(v5, "sacUpdateCellularSearchFreqInfo:onSubId:", v19, uint64);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_SearchFrequency is NULL"));
  }
  v20 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_HoppingFrequency");
  if (v20)
  {
    v21 = v20;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_HoppingFrequency - total count is %d"), xpc_array_get_count(v20));
    v22 = objc_alloc_init((Class)NSMutableArray);
    -[WCM_CellularController sacExtractDesenseFreq:message:](self, "sacExtractDesenseFreq:message:", v22, v21);
    objc_msgSend(v5, "sacUpdateCellularHoppingFreqInfo:onSubId:", v22, uint64);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_HoppingFrequency is NULL"));
  }
  v23 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_NeighborFrequency");
  if (v23)
  {
    v24 = v23;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_NeighborFrequency - total count is %d"), xpc_array_get_count(v23));
    v25 = objc_alloc_init((Class)NSMutableArray);
    -[WCM_CellularController sacExtractDesenseFreq:message:](self, "sacExtractDesenseFreq:message:", v25, v24);
    objc_msgSend(v5, "sacUpdateCellularNeighborFreqInfo:onSubId:", v25, uint64);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_NeighborFrequency  is NULL"));
  }
  v26 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_RplmnFrequency");
  if (v26)
  {
    v27 = v26;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_RplmnFrequency - total count is %d"), xpc_array_get_count(v26));
    v28 = objc_alloc_init((Class)NSMutableArray);
    -[WCM_CellularController sacExtractDesenseFreq:message:](self, "sacExtractDesenseFreq:message:", v28, v27);
    objc_msgSend(v5, "sacUpdateCellularRPLMNFreqInfo:onSubId:", v28, uint64);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC kWCMCellular_DesenseFreqReport_RplmnFrequency  is NULL"));
  }
  objc_msgSend(v5, "sacReportCellularVictimFreqListOnTargetSac:action:", 1, 1);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicyJasperSupport")))objc_msgSend(v5, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 1);
}

- (void)sacExtractDesenseFreq:(id)a3 message:(id)a4
{
  int64_t count;
  int64_t v7;
  size_t i;
  xpc_object_t value;
  uint64_t uint64;
  int64_t int64;
  FreqRangeInfo *v12;

  if (a3)
  {
    if (a4)
    {
      count = xpc_array_get_count(a4);
      if (count >= 1)
      {
        v7 = count;
        for (i = 0; i != v7; ++i)
        {
          value = xpc_array_get_value(a4, i);
          uint64 = xpc_dictionary_get_uint64(value, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
          int64 = xpc_dictionary_get_int64(value, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("   SAC Index %d - frequency %lld - bandwidth %lld "), i, uint64, int64);
          v12 = -[FreqRangeInfo initWithFreq:Bw:]([FreqRangeInfo alloc], "initWithFreq:Bw:", uint64, int64);
          objc_msgSend(a3, "addObject:", v12);

        }
      }
    }
  }
}

- (int64_t)wci2TxPowerLimit
{
  return *(_QWORD *)&self->_rc1priority;
}

- (unint64_t)updatePolicyForBB20:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = a3 & 0xFFFFFFFFFFFFEFCFLL | 0x30;
  if ((a3 & 0x1000) == 0)
    v3 = a3;
  if ((a3 & 0x200) != 0)
    v3 &= ~0x200uLL;
  if ((a3 & 0x4000) != 0)
    v3 &= ~0x4000uLL;
  if ((a3 & 0x10000) != 0)
    v3 &= ~0x10000uLL;
  if ((a3 & 0x4000) != 0)
    v3 &= ~0x4000uLL;
  if ((a3 & 0x8000) != 0)
    v4 = v3 & 0xFFFFFFFFFFFF7FFFLL;
  else
    v4 = v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB20 Policy updated for bb20 0x%lux"), v4);
  return v4;
}

- (double)ulCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 24);
}

- (void)setWci2CoexPolicyBitmap:(unint64_t)a3
{
  *(int64_t *)((char *)&self->_rbThreshold + 4) = a3;
}

- (double)dlCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 40);
}

- (double)dlBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 48);
}

- (int64_t)controllerTxPowerLimit
{
  return *(int64_t *)((char *)&self->_wci2TxPowerLimit + 4);
}

- (BOOL)btClkAlgnFlag
{
  return *(_BYTE *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 105);
}

- (WCM_CellularController)init
{
  WCM_CellularController *v2;
  WCM_CellularController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_CellularController;
  v2 = -[WCM_Controller init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    bzero(&v2->super.mProcessId + 1, 0xAB0uLL);
    bzero((char *)&v3->_cellularInstance0.primarydlBandwidth + 4, 0xAB0uLL);
    HIDWORD(v3->_cellularInstance0.cachedULBandwidth) = 127;
    HIDWORD(v3->_cellularInstance1.cachedULBandwidth) = 127;
    *(unint64_t *)((char *)&v3->_wifiTxPowerdBm + 4) = (unint64_t)(&v3->super.mProcessId + 1);
    HIDWORD(v3->_cellularInstance1.primarydlBandwidth) = -1;
  }
  v3->_sensorInfo.usecase[1] = 1;
  v3->_sensorInfo.usecase[2] = 0;
  -[WCM_CellularController setFastChargingHystersisTimer:](v3, "setFastChargingHystersisTimer:", 0);
  -[WCM_CellularController setBaseBandEnabledProtectionTimer:](v3, "setBaseBandEnabledProtectionTimer:", 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WCM_CellularController fastChargingHystersisTimer](self, "fastChargingHystersisTimer"))
  {
    -[NSTimer invalidate](-[WCM_CellularController fastChargingHystersisTimer](self, "fastChargingHystersisTimer"), "invalidate");
    -[WCM_CellularController setFastChargingHystersisTimer:](self, "setFastChargingHystersisTimer:", 0);
  }
  if (-[WCM_CellularController baseBandEnabledProtectionTimer](self, "baseBandEnabledProtectionTimer"))
  {
    -[NSTimer invalidate](-[WCM_CellularController baseBandEnabledProtectionTimer](self, "baseBandEnabledProtectionTimer"), "invalidate");
    -[WCM_CellularController setBaseBandEnabledProtectionTimer:](self, "setBaseBandEnabledProtectionTimer:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)WCM_CellularController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WCM_CellularController cellularConfig0<UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld> cellularConfig1<UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld> activeSubid(%lld)"), *(unint64_t *)((char *)&self->_cellularInstance0.frameOffset + 4), *(_QWORD *)((char *)&self->_cellularInstance0.ulCenterFreq + 4), *(_QWORD *)((char *)&self->_cellularInstance0.dlBandwidth + 4), *(_QWORD *)((char *)&self->_cellularInstance0.ulCenterFreq2 + 4), *(_QWORD *)((char *)&self->_cellularInstance0.ulBandwidth + 4), *(_QWORD *)((char *)&self->_cellularInstance0.dlCenterFreq + 4), *(_QWORD *)((char *)&self->_cellularInstance0.ulBandwidth2 + 4), *(_QWORD *)((char *)&self->_cellularInstance0.dlCenterFreq2 + 4), *(_QWORD *)((char *)&self->_cellularInstance0.dlBandwidth2 + 4), *(unint64_t *)((char *)&self->_cellularInstance0.tddULDLConfig + 4), *(_QWORD *)(&self->super.mProcessId + 1), *(unint64_t *)((char *)&self->_cellularInstance0.ulCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance0.dlCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance1.frameOffset + 4), *(_QWORD *)((char *)&self->_cellularInstance1.ulCenterFreq + 4), *(_QWORD *)((char *)&self->_cellularInstance1.dlBandwidth + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.ulCenterFreq2 + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.ulBandwidth + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.dlCenterFreq + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.ulBandwidth2 + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.dlCenterFreq2 + 4),
           *(_QWORD *)((char *)&self->_cellularInstance1.dlBandwidth2 + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.tddULDLConfig + 4),
           *(_QWORD *)((char *)&self->_cellularInstance0.primarydlBandwidth + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.ulCPConfig + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.dlCPConfig + 4),
           *($18E34B6F31A8113A84A5E642390E7364 **)((char *)&self->_activeConfig + 4));
}

- (unint64_t)ulCPConfig
{
  return **(_QWORD **)((char *)&self->_wifiTxPowerdBm + 4);
}

- (unint64_t)dlCPConfig
{
  return *(_QWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 8);
}

- (unint64_t)frameOffset
{
  return *(_QWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 16);
}

- (double)ulBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 32);
}

- (double)ulCenterFreq2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 56);
}

- (double)ulBandwidth2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 64);
}

- (double)dlCenterFreq2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 72);
}

- (double)dlBandwidth2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 80);
}

- (double)dlCenterFreqWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 160);
}

- (double)dlBandwidthWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 168);
}

- (double)ulCenterFreqWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 144);
}

- (double)ulBandwidthWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 152);
}

- (double)dlCenterFreqCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 160);
}

- (double)dlBandwidthCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 168);
}

- (double)ulCenterFreqCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 144);
}

- (double)ulBandwidthCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 152);
}

- (unint64_t)tddULDLConfig
{
  return *(_QWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 88);
}

- (unint64_t)subframeFormat
{
  return *(_QWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 96);
}

- (BOOL)tddBand
{
  return *(_BYTE *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 104);
}

- (double)cachedULCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 112);
}

- (double)cachedULBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 120);
}

- (int)bandInfoType
{
  return *(_DWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 128);
}

- (unint64_t)carrierId
{
  return *(_QWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 136);
}

- (void)sendMessageToAriDriver:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  xpc_object_t v9;
  id v10;
  xpc_object_t values[3];
  char *keys[2];
  const char *v13;

  *(_OWORD *)keys = *(_OWORD *)off_100204C48;
  v13 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  values[2] = a6;
  v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sending messageId(%lld) to WCM_AriCoexCommandDriver %@"), a3, v9);
  v10 = +[WCM_AriCoexCommandDriver singleton](WCM_AriCoexCommandDriver, "singleton");
  if (v10)
    objc_msgSend(v10, "handleEvent:", v9);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sending messageId to WCM_AriCoexCommandDriver failed. ARI Coex Driver does not exist"));
  xpc_release(values[0]);
  xpc_release(v9);
}

- (WCM_CellularController)initWithConnection:(id)a3 processId:(int)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCM_CellularController;
  -[WCM_Controller initWithConnection:processId:](&v6, "initWithConnection:processId:", a3, *(_QWORD *)&a4);
  return (WCM_CellularController *)-[WCM_CellularController handlePowerState:](self, "handlePowerState:", 1);
}

- (void)handlePowerState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v6 = v5;
  if (v3)
  {
    v7 = objc_msgSend(v5, "platformManager");
    -[WCM_CellularController setWci2TxPowerLimit:](self, "setWci2TxPowerLimit:", (int)objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeLTEMaxTxPowerLow"), "intValue"));
    -[WCM_CellularController setControllerTxPowerLimit:](self, "setControllerTxPowerLimit:", (int)objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeLTEMaxTxPowerHigh"), "intValue"));
    -[WCM_CellularController setRbThreshold:](self, "setRbThreshold:", (int)objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeRBThresholdHigh"), "intValue"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ updateGPSStateBit function called by handlePowerState with input policy as zero."));
    -[WCM_CellularController setWci2CoexPolicyBitmap:](self, "setWci2CoexPolicyBitmap:", -[WCM_CellularController updateGPSStateBit:](self, "updateGPSStateBit:", 0));
    -[WCM_CellularController setLteCDRXWiFiTDD:](self, "setLteCDRXWiFiTDD:", 0);
    -[WCM_CellularController setWifiCenterFreqMHz:](self, "setWifiCenterFreqMHz:", 0);
    -[WCM_CellularController setWifiBandwidthMHz:](self, "setWifiBandwidthMHz:", 0);
    -[WCM_CellularController setWifiTxPowerdBm:](self, "setWifiTxPowerdBm:", 0);
    -[WCM_CellularController setWatchAntPrefBand:](self, "setWatchAntPrefBand:", 7);
    -[WCM_CellularController setWatchAntPref:](self, "setWatchAntPref:", 0);
    -[WCM_CellularController setRc1priority:](self, "setRc1priority:", 8);
    -[WCM_CellularController setRc1duration:](self, "setRc1duration:", 0);
    -[WCM_CellularController setCC1CarrierId:](self, "setCC1CarrierId:", 0);
    -[WCM_CellularController setCC2CarrierId:](self, "setCC2CarrierId:", 0);
    -[WCM_CellularController setCC1Tech:](self, "setCC1Tech:", 0);
    -[WCM_CellularController setCC2Tech:](self, "setCC2Tech:", 0);
    -[WCM_CellularController setAllPolicies](self, "setAllPolicies");
    -[WCM_CellularController setNetworkConfigOfInterest](self, "setNetworkConfigOfInterest");
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("LTEScanProtection")))-[WCM_CellularController setScanFrequencyBandFilter:](self, "setScanFrequencyBandFilter:", objc_msgSend(v7, "wcmCellularScanProtectionCellFrequencies"));
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("LTELAACoexSupport")))
    {
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support"))
        && (v8 = objc_msgSend(v6, "rcu1Controller")) != 0)
      {
        -[WCM_CellularController updateBBRC1Params:channel:duration:priority:](self, "updateBBRC1Params:channel:duration:priority:", objc_msgSend(v8, "mRCU1PowerOn"), (int)objc_msgSend(v8, "mRCU1ChannelNum"), objc_msgSend(v8, "mRCU1OnDuration"), objc_msgSend(v8, "mRCU1UseCaseNum"));
      }
      else
      {
        -[WCM_CellularController setLAACoexConfig:](self, "setLAACoexConfig:", 4);
      }
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("CellularNeedWiFiStatus")))
    {
      v9 = objc_msgSend(v6, "wifiController");
      if (v9)
      {
        v10 = v9;
        if (objc_msgSend(v6, "audioBuiltInReceiver"))
          v11 = objc_msgSend(v10, "headTxPowerCapdBm");
        else
          v11 = objc_msgSend(v10, "bodyTxPowerCapdBm");
        -[WCM_CellularController updateWiFiStatusCenterFreq:bandwidth:txPower:](self, "updateWiFiStatusCenterFreq:bandwidth:txPower:", objc_msgSend(v10, "channelCenterFreqMHz"), objc_msgSend(v10, "channelBandwidthMHz"), v11);
      }
    }
    -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1200, 0);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1800);
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
    {
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("BB22BusAntMapping")))
      {
        -[WCM_CellularController setWci2TxAntMapBB22](self, "setWci2TxAntMapBB22");
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("BB21BusAntMapping")))
      {
        -[WCM_CellularController setWci2TxAntMapBB21](self, "setWci2TxAntMapBB21");
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("BB25A_Bus_Ant_Mapping")))
      {
        -[WCM_CellularController setTxAntMapInHouseBB25A](self, "setTxAntMapInHouseBB25A");
      }
      else
      {
        -[WCM_CellularController setWci2TxAntMap](self, "setWci2TxAntMap");
      }
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("BB21ClientAntennaBlocking")))
      {
        -[WCM_CellularController setClientAntBlockingParams](self, "setClientAntBlockingParams");
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("BB22ClientAntennaBlocking")))
      {
        -[WCM_CellularController setClientAntBlockingParams22](self, "setClientAntBlockingParams22");
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("MavAntPolicyFramework")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Handle cellular Power State: Calling mavAntPolicy sendMavConfigItems)"));
        objc_msgSend(objc_msgSend(v6, "mavAntPolicy"), "sendMavConfigitems");
      }
      else
      {
        -[WCM_CellularController setAntBlockingParams](self, "setAntBlockingParams");
      }
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
    {
      v12 = 0;
      v13 = (char *)&self->_cellularInstance1.primarydlBandwidth + 4;
      do
      {
        v14 = v13[v12];
        if (v13[v12] && (_DWORD)v14 != 255)
        {
          v15 = v13[v12 + 4];
          v13[v12] = -1;
          -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](self, "sendBBCoexSensorMessage:band:usecase:", v12, v14, v15);
        }
        ++v12;
      }
      while (v12 != 4);
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
    {
      v16 = +[WCM_AriCoexCommandDriver singleton](WCM_AriCoexCommandDriver, "singleton");
      if (v16)
      {
        v17 = v16;
        v18 = objc_msgSend(v7, "wrmPlatformId");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Handle Power State: Configure antenna blocking policy for platformId(%llu)"), v18);
        objc_msgSend(v17, "setAntennaBlockingPolicyForPlatformId:activeSubId:", v18, -[WCM_CellularController activeSubId](self, "activeSubId"));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Handle Power State: Configure antenna blocking policy for platformId(%u) failed, ARI Driver is NULL"), objc_msgSend(v7, "wrmPlatformId"));
      }
    }
    if (objc_msgSend(v6, "cellularRc1PolicyManager"))
      objc_msgSend(objc_msgSend(v6, "cellularRc1PolicyManager"), "handleCellularPowerState:", 1);
  }
  else if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    bzero(&self->super.mProcessId + 1, 0xAB0uLL);
    bzero((char *)&self->_cellularInstance0.primarydlBandwidth + 4, 0xAB0uLL);
  }
}

- (void)setCriticalCarrier:(unint64_t)a3 forCarrierId:(unint64_t)a4 forTech:(unint64_t)a5
{
  xpc_object_t v9;
  id v10;
  unint64_t v11;
  int *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void **v22;
  void *v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  xpc_dictionary_set_BOOL(v9, "kWCMCellularSetCC_Enable", (BOOL)objc_msgSend(v10, "wcmCellularWCI2Mode_Ext_Enable"));
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetCC_CoexTech", a5);
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetCC_CarrierId", a4);
  if (objc_msgSend(objc_msgSend(v10, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    v11 = -[WCM_CellularController activeSubId](self, "activeSubId");
    v12 = &OBJC_IVAR___WCM_CellularController__cellularInstance1;
    if (!v11)
      v12 = &OBJC_IVAR___WCM_CellularController__cellularInstance0;
    v13 = (char *)self + *v12;
    v14 = -2304;
    while (1)
    {
      v15 = &v13[v14];
      if (*(_DWORD *)&v13[v14 + 2480] == a4)
        break;
      v14 += 72;
      if (!v14)
      {
        v16 = 0.0;
        v17 = 0.0;
        v18 = 0.0;
        v19 = 0.0;
        goto LABEL_16;
      }
    }
    if (!objc_msgSend(objc_msgSend(v10, "activeCoexFeatures"), "containsObject:", CFSTR("CriticalCarrierIssueFreqRange")))goto LABEL_15;
    v20 = objc_msgSend(objc_msgSend(v10, "wifiController"), "channelCenterFreqMHz");
    v21 = objc_msgSend(objc_msgSend(v10, "wifiController"), "channelBandwidthMHz");
    if (a3 == 1217)
    {
      v22 = (void **)&v13[v14 + 2488];
    }
    else
    {
      if (a3 != 1218)
        goto LABEL_15;
      v22 = (void **)&v13[v14 + 2496];
    }
    v23 = *v22;
    v27 = 0.0;
    v28 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
    if (v23)
    {
      v24 = (double *)&v13[v14];
      objc_msgSend(v23, "cellFreqRangeWithIssueForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiLowFreq:wifiHighFreq:cellTxIssueRange:cellRxIssueRange:", &v27, &v25, v24[308] - v24[309] * 0.5, v24[308] + v24[309] * 0.5, *((double *)v15 + 306) - v24[307] * 0.5, *((double *)v15 + 306) + v24[307] * 0.5, (double)(v20 - (v21 >> 1)), (double)(v20 + (v21 >> 1)));
      v17 = v28;
      v16 = v27 + v28 * 0.5;
      v19 = v26;
      v18 = v25 + v26 * 0.5;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Critical carrier with partial frequency range: input critical carrier DL[%f, %f]MHz, UL[%f, %f]MHz"), *((_QWORD *)v24 + 308), *((_QWORD *)v24 + 309), *((_QWORD *)v15 + 306), *((_QWORD *)v24 + 307));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Critical carrier with partial frequency range: input WiFi frequency [%u, %u]MHz"), v20, v21);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Critical carrier with partial frequency range: output critical carrier DL[%f, %f]MHz, UL[%f, %f]MHz"), *(_QWORD *)&v18, *(_QWORD *)&v19, *(_QWORD *)&v16, *(_QWORD *)&v17);
LABEL_16:
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_UplinkCenterFrequency", v16);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_UplinkBandwidth", v17);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_DownlinkCenterFrequency", v18);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_DownlinkBandwidth", v19);
      goto LABEL_17;
    }
LABEL_15:
    v16 = *((double *)v15 + 306);
    v17 = *(double *)&v13[v14 + 2456];
    v18 = *(double *)&v13[v14 + 2464];
    v19 = *(double *)&v13[v14 + 2472];
    goto LABEL_16;
  }
LABEL_17:
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", a3, v9);
  xpc_release(v9);
}

- (BOOL)clkAlgnTDDFreqCheck
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v3 = -[WCM_CellularController tddBand](self, "tddBand");
  if (v3)
  {
    -[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim");
    v5 = v4;
    -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim");
    v7 = v6;
    -[WCM_CellularController ulCenterFreqCellVictim](self, "ulCenterFreqCellVictim");
    v9 = v8;
    -[WCM_CellularController ulBandwidthCellVictim](self, "ulBandwidthCellVictim");
    v11 = v10;
    -[WCM_CellularController ulCenterFreq](self, "ulCenterFreq");
    v13 = v12;
    -[WCM_CellularController ulBandwidth](self, "ulBandwidth");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f."), v5, v7, v9, v11, v13, v14);
    -[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim");
    v16 = v15;
    -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim");
    if (v16 + v17 * 0.5 <= 2370.0
      || (-[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim"),
          v19 = v18,
          -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim"),
          v19 + v20 * -0.5 >= 2400.0))
    {
      -[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim");
      v33 = v32;
      -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim");
      if (v33 + v34 * 0.5 <= 2496.0
        || (-[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim"),
            v36 = v35,
            -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim"),
            v36 + v37 * -0.5 >= 2506.0))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: Neither B40b nor B41A1. Return False."));
        LOBYTE(v3) = 0;
        return v3;
      }
      -[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim");
      v39 = v38;
      -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim");
      v41 = v40;
      -[WCM_CellularController ulCenterFreqCellVictim](self, "ulCenterFreqCellVictim");
      v43 = v42;
      -[WCM_CellularController ulBandwidthCellVictim](self, "ulBandwidthCellVictim");
      v45 = v44;
      -[WCM_CellularController ulCenterFreq](self, "ulCenterFreq");
      v47 = v46;
      -[WCM_CellularController ulBandwidth](self, "ulBandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f, Band41a1 (2496 - 2506)MHz identified."), v39, v41, v43, v45, v47, v48);
    }
    else
    {
      -[WCM_CellularController ulCenterFreqWiFiVictim](self, "ulCenterFreqWiFiVictim");
      v22 = v21;
      -[WCM_CellularController ulBandwidthWiFiVictim](self, "ulBandwidthWiFiVictim");
      v24 = v23;
      -[WCM_CellularController ulCenterFreqCellVictim](self, "ulCenterFreqCellVictim");
      v26 = v25;
      -[WCM_CellularController ulBandwidthCellVictim](self, "ulBandwidthCellVictim");
      v28 = v27;
      -[WCM_CellularController ulCenterFreq](self, "ulCenterFreq");
      v30 = v29;
      -[WCM_CellularController ulBandwidth](self, "ulBandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f, Band40b (2370 - 2400)MHz identified."), v22, v24, v26, v28, v30, v31);
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)updateWCI2TxPower:(int64_t)a3
{
  xpc_object_t v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  if (-[WCM_CellularController wci2TxPowerLimit](self, "wci2TxPowerLimit") != a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Updating WCI2 Power limit to %lld"), a3);
    -[WCM_CellularController setWci2TxPowerLimit:](self, "setWci2TxPowerLimit:", a3);
    -[WCM_CellularController setAllPolicies](self, "setAllPolicies");
  }
  xpc_release(v5);
}

- (void)updateControllerTxPower:(int64_t)a3
{
  if (-[WCM_CellularController controllerTxPowerLimit](self, "controllerTxPowerLimit") != a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Updating Controller Power limit to %lld"), a3);
    -[WCM_CellularController setControllerTxPowerLimit:](self, "setControllerTxPowerLimit:", a3);
    -[WCM_CellularController setAllPolicies](self, "setAllPolicies");
  }
}

- (void)updateWiFiStatusCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 txPower:(unint64_t)a5
{
  xpc_object_t v9;

  if (-[WCM_CellularController wifiCenterFreqMHz](self, "wifiCenterFreqMHz") == a3
    && -[WCM_CellularController wifiBandwidthMHz](self, "wifiBandwidthMHz") == a4
    && -[WCM_CellularController wifiTxPowerdBm](self, "wifiTxPowerdBm") == a5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Already set to centerFreqMhz(%ld) bandwidthMHz(%ld) txPowerdBm(%ld)"), a3, a4, a5);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Updating WiFi Status centerFreqMHz(%ld -> %ld) bandwidthMHz(%ld -> %ld) txPowerdBm(%ld -> %ld)"), -[WCM_CellularController wifiCenterFreqMHz](self, "wifiCenterFreqMHz"), a3, -[WCM_CellularController wifiBandwidthMHz](self, "wifiBandwidthMHz"), a4, -[WCM_CellularController wifiTxPowerdBm](self, "wifiTxPowerdBm"), a5);
    -[WCM_CellularController setWifiCenterFreqMHz:](self, "setWifiCenterFreqMHz:", a3);
    -[WCM_CellularController setWifiBandwidthMHz:](self, "setWifiBandwidthMHz:", a4);
    -[WCM_CellularController setWifiTxPowerdBm:](self, "setWifiTxPowerdBm:", a5);
    if (!(a4 | a3 | a5))
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("DLDebug_ CellularController is getting all 0s for WiFi Freq info."));
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_CenterFrequency", a3);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_ChannelBandwidth", a4);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_TxPower", a5);
    -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1210, v9);
    xpc_release(v9);
  }
}

- (void)updateWatchAntennaPref:(int)a3 watchAntPref:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  char *keys[2];
  xpc_object_t values;
  xpc_object_t object;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Updating watch antenna pref to cellular modem, coexBand %d, antenna %d"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  if ((_DWORD)v4)
  {
    if ((_DWORD)v5)
    {
      if (v5 >= 3)
      {
        if ((v5 - 3) > 1)
          return;
        v7 = 2;
        v8 = 41;
      }
      else
      {
        v7 = 1;
        v8 = 40;
      }
    }
    else
    {
      v7 = 2;
      v8 = 7;
    }
    if (-[WCM_CellularController watchAntPrefBand](self, "watchAntPrefBand") == (_DWORD)v5
      && -[WCM_CellularController watchAntPref](self, "watchAntPref") == (_DWORD)v4)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Already set watch antenna pref band(%ld) to antenna (%ld)"), v5, v4);
    }
    else
    {
      -[WCM_CellularController setWatchAntPrefBand:](self, "setWatchAntPrefBand:", v5);
      -[WCM_CellularController setWatchAntPref:](self, "setWatchAntPref:", v4);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Updating watch antenna pref to cellular modem, with antenna %d defaultAntPref %d"), v4, v7);
      v9 = xpc_dictionary_create(0, 0, 0);
      v10 = xpc_array_create(0, 0);
      values = xpc_int64_create(v8);
      object = xpc_int64_create(v4);
      *(_OWORD *)keys = *(_OWORD *)off_100204C60;
      v11 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
      xpc_dictionary_set_uint64(v9, "WCMCellularSetFCM_BCM_Antenna_Switching_RAT", 3uLL);
      xpc_array_append_value(v10, v11);
      xpc_dictionary_set_value(v9, "WCMCellularSetFCM_BCM_Antenna_Switching_PortMapInformationSet", v10);
      -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1212, v9);
      xpc_release(v11);
      xpc_release(values);
      xpc_release(object);
      xpc_release(v10);
      xpc_release(v9);
    }
  }
}

- (void)updateBBRC1Params:(BOOL)a3 channel:(unint64_t)a4 duration:(unint64_t)a5 priority:(unsigned int)a6
{
  _BOOL4 v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v7 = a4 == 5;
  if (!v7 || !a3)
    a5 = 0;
  if (v7 && a3)
    v9 = a6;
  else
    v9 = 8;
  if (-[WCM_CellularController rc1duration](self, "rc1duration") == a5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Already set rc1 duration to (%ld)"), a5);
  }
  else
  {
    v10 = (unsigned __int16)a5 | 0x10000;
    if ((_DWORD)v9 != 8)
      v10 = a5;
    if ((v9 & 2) != 0)
      v11 = (unsigned __int16)a5 | 0x3200000;
    else
      v11 = v10;
    -[WCM_CellularController setRC1Duration:](self, "setRC1Duration:", v11);
  }
  if (-[WCM_CellularController rc1priority](self, "rc1priority") == (_DWORD)v9)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Already set LAA Params to rc1priority to  (%ld)"), v9);
  else
    -[WCM_CellularController setLAACoexConfig:](self, "setLAACoexConfig:", v9);
}

- (void)fastChargingHandler:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  double v6;
  double v7;
  char v8;
  double v9;
  double v10;
  unsigned __int8 *v11;
  uint64_t v12;
  BOOL v13;

  v3 = a3;
  v5 = &self->super.mProcessId + 1;
  v6 = *(double *)((char *)&self->_cellularInstance0.ulBandwidth + 4);
  if (v6 > 0.0
    && (+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("FCharging :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), 0, *((_QWORD *)v5 + 3), *((_QWORD *)v5 + 4), *(_QWORD *)&v6, *((_QWORD *)v5 + 6), *((_QWORD *)v5 + 11), *((_QWORD *)v5 + 12), *(_QWORD *)v5, *((_QWORD *)v5 + 1), *((_QWORD *)v5 + 2)), v7 = *((double *)v5 + 6) * 0.5, *((double *)v5 + 5) + v7 <= 960.0))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging RRC state connected subid:%d -  [%d - frequency %lf , bandwidth %lf] "), 0, *((_QWORD *)v5 + 5), *(_QWORD *)&v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = *(double *)((char *)&self->_cellularInstance1.ulBandwidth + 4);
  if (v9 > 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("FCharging :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), 1, *(unint64_t *)((char *)&self->_cellularInstance1.frameOffset + 4), *(_QWORD *)((char *)&self->_cellularInstance1.ulCenterFreq + 4), *(_QWORD *)&v9, *(_QWORD *)((char *)&self->_cellularInstance1.dlCenterFreq + 4), *(_QWORD *)((char *)&self->_cellularInstance1.dlBandwidth2 + 4), *(unint64_t *)((char *)&self->_cellularInstance1.tddULDLConfig + 4), *(_QWORD *)((char *)&self->_cellularInstance0.primarydlBandwidth + 4), *(unint64_t *)((char *)&self->_cellularInstance1.ulCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance1.dlCPConfig + 4));
    v10 = *(double *)((char *)&self->_cellularInstance1.dlCenterFreq + 4) * 0.5;
    if (*(double *)((char *)&self->_cellularInstance1.ulBandwidth + 4) + v10 <= 960.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging RRC state connected subid:%d -  [%lf - frequency %lf , bandwidth %lf] "), &index, *(_QWORD *)((char *)&self->_cellularInstance1.ulBandwidth + 4), *(_QWORD *)&v10);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Low band detected"));
      v11 = &self->_sensorInfo.usecase[1];
      self->_sensorInfo.usecase[1] = 1;
      goto LABEL_15;
    }
  }
  v11 = &self->_sensorInfo.usecase[1];
  self->_sensorInfo.usecase[1] = 1;
  if ((v8 & 1) != 0)
  {
LABEL_15:
    v12 = 0;
    *v11 = 0;
    goto LABEL_16;
  }
  v12 = 1;
  v13 = v6 > 0.0 || !v3;
  if (!v13 && v9 <= 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Not attached but Low band detected in frequenies"));
    goto LABEL_15;
  }
LABEL_16:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("FCharging Call API to decide to start timer and set the charger value %d"), v12);
  -[WCM_CellularController fastChargingStateChangeHandler](self, "fastChargingStateChangeHandler");
}

- (void)fastChargingHystersisTimerHandler:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging:fastChargingHystersisTimerHandler - Expired %@"), +[NSThread currentThread](NSThread, "currentThread", a3));
  -[WCM_CellularController setFastChargingHystersisTimer:](self, "setFastChargingHystersisTimer:", 0);
  -[WCM_CellularController IOKIT_FastCharging_Iface_call:](self, "IOKIT_FastCharging_Iface_call:", self->_sensorInfo.usecase[1]);
}

- (void)baseBandProtectionTimerHandler:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FCharging - baseBandProtectionTimerHandler - Expired Thread Id %@"), +[NSThread currentThread](NSThread, "currentThread", a3));
  -[WCM_CellularController setBaseBandEnabledProtectionTimer:](self, "setBaseBandEnabledProtectionTimer:", 0);
  -[WCM_CellularController fastChargingStateChangeHandler](self, "fastChargingStateChangeHandler");
}

- (void)handleNetworkConfig:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCM_CellularController handleNetworkConfig message %@"), a3);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("Bb20EndcSupport")))-[WCM_CellularController handleNetworkConfig_bb20:](self, "handleNetworkConfig_bb20:", a3);
  else
    -[WCM_CellularController handleNetworkConfig_legacy:](self, "handleNetworkConfig_legacy:", a3);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("charging_desense")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR(" FCharging handleNetworkConfig Message recieved. low band in report %d"), self->_sensorInfo.usecase[2]);
    -[WCM_CellularController fastChargingHandler:](self, "fastChargingHandler:", self->_sensorInfo.usecase[2]);
  }
}

- (void)handleNetworkConfig_legacy:(id)a3
{
  xpc_object_t value;
  void *v6;
  int *v7;
  int *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t uint64;
  id v16;
  void *v17;
  char *v18;
  char *v19;
  __int128 v20;
  xpc_object_t v21;
  void *v22;
  int v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  int64_t count;
  char v30;
  unsigned int v31;
  unint64_t v32;
  xpc_object_t v33;
  void *v34;
  uint64_t v35;
  int64_t int64;
  double v37;
  double v38;
  const char *v39;
  double v40;
  double v41;
  double *v42;
  double *v43;
  double *v44;
  double v45;
  double v46;
  double *v47;
  double *v48;
  int *v49;
  int *v50;
  int64_t v51;
  int64_t v52;
  __objc2_class **p_superclass;
  WCM_CellularController *v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  double v62;
  double v63;
  unint64_t v64;
  _QWORD *v65;
  double *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  int v71;
  float *v72;
  int *v73;
  int *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  double v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  double v97;
  double v98;
  double v99;
  double v100;
  unsigned __int8 *v101;
  char *v102;
  id v103;
  xpc_object_t xdict;
  uint64_t v105;
  WCM_CellularController *v106;
  unsigned int v107;
  int *v108;
  char v109;
  double *v110;
  double *v111;
  double *v112;
  _QWORD applier[7];
  float32x2x2_t v114;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
    return;
  v6 = value;
  v103 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v7 = &self->super.mProcessId + 1;
  v8 = &self->super.mProcessId + 1;
  if (-[WCM_CellularController activeSubId](self, "activeSubId"))
    v8 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  v9 = *((double *)v8 + 3);
  v10 = *((double *)v8 + 5);
  v99 = *((double *)v8 + 4);
  v100 = *((double *)v8 + 6);
  v11 = *((double *)v8 + 7);
  v12 = *((double *)v8 + 9);
  v97 = *((double *)v8 + 8);
  v98 = *((double *)v8 + 10);
  v13 = -[WCM_CellularController activeSubId](self, "activeSubId");
  v14 = *((_QWORD *)v8 + 11);
  uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if (!xpc_dictionary_get_count(v6))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SUB%ld: goes out of interested frequency bands"), uint64);
  if (uint64)
    v7 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  *((_QWORD *)v7 + 12) = 0;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  v111 = (double *)(v7 + 16);
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((double *)v7 + 3) = (double)xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq");
  v112 = (double *)(v7 + 6);
  *((double *)v7 + 4) = xpc_dictionary_get_double(v6, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth");
  *((double *)v7 + 5) = (double)xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq");
  *((double *)v7 + 6) = xpc_dictionary_get_double(v6, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth");
  *((_QWORD *)v7 + 11) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_TTDUL_DL");
  *((_QWORD *)v7 + 12) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_SubFrameFormat");
  *((_QWORD *)v7 + 2) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_FrameOffset");
  v110 = (double *)(v7 + 10);
  *((_WORD *)v7 + 52) = 0;
  v16 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "initLTECoexMetrics");
  v18 = (char *)objc_msgSend(v17, "getLTECoexMetrics");
  v19 = v18;
  if (v18)
  {
    v18[20] = 0;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_OWORD *)(v18 + 40) = 0u;
  }
  v96 = (id)v13;
  v101 = (unsigned __int8 *)(v18 + 20);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
  {
    *((_QWORD *)v7 + 306) = 1;
    v20 = *(_OWORD *)(v7 + 10);
    *((_OWORD *)v7 + 9) = *(_OWORD *)(v7 + 6);
    *((_OWORD *)v7 + 10) = v20;
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_Enable:", 1);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 1);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA handleNetworkConfig-1-ULCA critical bitmap %d"), objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
    if (*((double *)v7 + 5) != 0.0)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SUB%ld:  ULCA Logging -  case kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq UL-(freq=%lf bw=%lf)  DL(freq=%lf, bw=%lf) "), uint64, *((_QWORD *)v7 + 18), *((_QWORD *)v7 + 19), *((_QWORD *)v7 + 20), *((_QWORD *)v7 + 21));
  }
  else
  {
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_Enable:", 0);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 1);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA handleNetworkConfig-2-ULCA critical bitmap %d"), objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"), v83, v86, v88, v90);
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000ACD30;
  applier[3] = &unk_100204C70;
  applier[4] = uint64;
  applier[5] = v7;
  xpc_dictionary_apply(v6, applier);
  v21 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  v105 = uint64;
  v106 = self;
  v95 = v14;
  v102 = v19;
  xdict = v6;
  if (v21)
  {
    v22 = v21;
    v23 = 1;
  }
  else
  {
    v24 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_TDSCDMABandInformationSet");
    if (v24)
    {
      v22 = v24;
      v23 = 2;
    }
    else
    {
      v25 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_GSMBandInformationSet");
      if (v25)
      {
        v22 = v25;
        v23 = 4;
      }
      else
      {
        v26 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_ONEXBandInformationSet");
        if (v26)
        {
          v22 = v26;
          v23 = 8;
        }
        else
        {
          v27 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_HDRBandInformationSet");
          if (v27)
          {
            v22 = v27;
            v23 = 16;
          }
          else
          {
            v28 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet");
            if (!v28)
            {
              v7[32] = 127;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("SUB%ld: unknown band info set"), uint64);
              goto LABEL_56;
            }
            v22 = v28;
            v23 = 32;
          }
        }
      }
    }
  }
  v7[32] = v23;
  count = xpc_array_get_count(v22);
  if (count >= 1)
  {
    v109 = 0;
    v30 = 0;
    v107 = 0;
    v31 = 0;
    v108 = v7 + 36;
    v32 = count + 1;
    do
    {
      v33 = xpc_array_get_value(v22, v32 - 2);
      if (v33)
      {
        v34 = v33;
        v35 = xpc_dictionary_get_uint64(v33, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask");
        int64 = xpc_dictionary_get_int64(v34, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq");
        v37 = xpc_dictionary_get_double(v34, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth");
        v38 = v37;
        v39 = "unknown";
        if (v35 == 2)
          v39 = "downlink";
        if (v35 == 1)
          v39 = "uplink";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("directionMask(%lld:%s) centerFreq(%lld) bandwidth(%lf)"), v35, v39, int64, *(_QWORD *)&v37);
        if (int64 >= 1)
        {
          if (v35 == 1)
          {
            v40 = (double)int64 / 1000.0;
            v41 = v38 / 1000000.0;
            v42 = (double *)(v7 + 6);
            if ((v30 & 1) != 0)
              v42 = (double *)(v7 + 14);
            v43 = (double *)(v7 + 16);
            if ((v30 & 1) == 0)
              v43 = (double *)(v7 + 8);
            *v42 = v40;
            *v43 = v41;
            if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
            {
              v44 = (double *)&v108[18 * v31];
              *v44 = v40;
              v44[1] = v41;
              ++v31;
            }
            v30 = 1;
          }
          else if (v35 == 2)
          {
            v45 = (double)int64 / 1000.0;
            v46 = v38 / 1000000.0;
            v47 = (double *)(v7 + 10);
            if ((v109 & 1) != 0)
              v47 = (double *)(v7 + 18);
            v48 = (double *)(v7 + 20);
            if ((v109 & 1) == 0)
              v48 = (double *)(v7 + 12);
            *v47 = v45;
            *v48 = v46;
            if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
            {
              v49 = &v108[18 * v107];
              *((double *)v49 + 2) = v45;
              *((double *)v49 + 3) = v46;
              v50 = &v108[18 * v31];
              v31 = v107;
              *(_QWORD *)v50 = 0;
              *((_QWORD *)v50 + 1) = 0;
              v109 = 1;
              ++v107;
            }
            else
            {
              v109 = 1;
            }
          }
        }
      }
      --v32;
    }
    while (v32 > 1);
    goto LABEL_57;
  }
LABEL_56:
  v107 = 0;
LABEL_57:
  if (*((_BYTE *)v7 + 104))
  {
    v51 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULCPConfig");
    v52 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLCPConfig");
    p_superclass = (__objc2_class **)(WRM_SCService + 8);
    v55 = v105;
    v54 = v106;
    if (*v112 != 0.0)
    {
      v56 = v52;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("SUB%ld: RRC-connected cell notification ULCP(%lld -> %lld) DLCP(%lld -> %lld)"), *v112, v105, *(_QWORD *)v7, v51, *((_QWORD *)v7 + 1), v52);
      if (v51 != 255)
        *(_QWORD *)v7 = v51;
      if (v56 != 255)
        *((_QWORD *)v7 + 1) = v56;
    }
  }
  else
  {
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    p_superclass = WRM_SCService.superclass;
    v55 = v105;
    v54 = v106;
  }
  v57 = *((_QWORD *)v7 + 3);
  v58 = *((_QWORD *)v7 + 4);
  *((_QWORD *)v7 + 338) = v57;
  *((_QWORD *)v7 + 339) = v58;
  v59 = *((_QWORD *)v7 + 5);
  v60 = *((_QWORD *)v7 + 6);
  *((_QWORD *)v7 + 340) = v59;
  *((_QWORD *)v7 + 341) = v60;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("SUB%ld: Network Config UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), v55, v57, v58, *((_QWORD *)v7 + 7), *((_QWORD *)v7 + 8), v59, v60, *((_QWORD *)v7 + 9), *((_QWORD *)v7 + 10), *((_QWORD *)v7 + 11), *((_QWORD *)v7 + 12), *(_QWORD *)v7, *((_QWORD *)v7 + 1), *((_QWORD *)v7 + 2));
  if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
  {
    *((_OWORD *)v7 + 9) = *(_OWORD *)(v7 + 6);
    v61 = v7 + 36;
    *((_QWORD *)v7 + 306) = v107;
    *((_BYTE *)v7 + 2692) = 0;
    *((_OWORD *)v7 + 10) = *(_OWORD *)(v7 + 10);
    v62 = *((double *)v7 + 7);
    if (v62 != 0.0)
    {
      v63 = *v111;
      if (*v111 != 0.0)
      {
        *(_OWORD *)(v7 + 58) = *(_OWORD *)(v7 + 18);
        *((double *)v7 + 27) = v62;
        *((double *)v7 + 28) = v63;
      }
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Logging   ----------"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Config   ----------"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Total valid entries =%d"), v7[612]);
    if (v7[612])
    {
      v64 = 0;
      v65 = v7 + 42;
      do
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Entry index %d ..UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)"), v64++, *(v65 - 3), *(v65 - 2), *(v65 - 1), *v65);
        v65 += 9;
      }
      while (v64 < v7[612]);
    }
    objc_msgSend(v103, "evaluateULCARestrictions");
    v66 = (double *)&v61[18 * v7[613]];
    v68 = v66[2];
    v67 = v66[3];
    *((double *)v7 + 5) = v68;
    *((double *)v7 + 6) = v67;
    v70 = *v66;
    v69 = v66[1];
    *((double *)v7 + 3) = *v66;
    *((double *)v7 + 4) = v69;
    if (v102)
    {
      if (v7[612] >= 2)
      {
        v71 = *((unsigned __int8 *)v7 + 2692);
        *v101 = v71;
        v72 = (float *)(v101 + 4);
        v114.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*((float64x2_t *)v7 + 10)));
        v114.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*((float64x2_t *)v7 + 9)));
        vst2_f32(v72, v114);
        if (v71)
        {
          *((_DWORD *)v101 + 5) = v70;
          *((_DWORD *)v101 + 6) = v68;
          *((_DWORD *)v101 + 7) = v69;
          *((_DWORD *)v101 + 8) = v67;
        }
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))
      {
        LODWORD(v84) = *((_DWORD *)v101 + 8);
        objc_msgSend(v103, "wRMCACoexSubmit_ULCACoexStates:ULCAPrimaryCarrierULFreq:ULCAPrimaryCarrierDLFreq:ULCAPrimaryCarrierULBW:ULCAPrimaryCarrierDLBW:ULCACriticalCarrierULFreq:ULCACriticalCarrierDLFreq:ULCACriticalCarrierULBW:ULCACriticalCarrierDLBW:", *v101, *((unsigned int *)v101 + 1), *((unsigned int *)v101 + 2), *((unsigned int *)v101 + 3), *((unsigned int *)v101 + 4), *((unsigned int *)v101 + 5), *((_QWORD *)v101 + 3), v84);
      }
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA After coex valuation   ----------"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA After coex valuation   ----------"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Critical carrier =%d"), v7[613]);
    v73 = &v61[18 * v7[613]];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)"), *(_QWORD *)v73, *((_QWORD *)v73 + 1), *((_QWORD *)v73 + 2), *((_QWORD *)v73 + 3));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("ULCA Final Frequencies for COEX consideration :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), v55, *((_QWORD *)v7 + 3), *((_QWORD *)v7 + 4), *((_QWORD *)v7 + 5), *((_QWORD *)v7 + 6), *((_QWORD *)v7 + 11), *((_QWORD *)v7 + 12), *(_QWORD *)v7, *((_QWORD *)v7 + 1), *((_QWORD *)v7 + 2));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Logging END  ----------"));
    objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularWCI2Mode_Ext_Enable:", 1);
    objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 1 << v7[613]);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA handleNetworkConfig-3-ULCA critical bitmap %d"), objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"), v85, v87, v89, v91, v92, v93, v94);
  }
  else
  {
    v74 = &v7[18 * v7[613] + 36];
    v76 = *((_QWORD *)v7 + 5);
    v75 = *((_QWORD *)v7 + 6);
    *((_QWORD *)v74 + 2) = v76;
    *((_QWORD *)v74 + 3) = v75;
    v78 = *((_QWORD *)v7 + 3);
    v77 = *((_QWORD *)v7 + 4);
    *(_QWORD *)v74 = v78;
    *((_QWORD *)v74 + 1) = v77;
    v79 = &v7[18 * v7[614] + 36];
    *((_QWORD *)v79 + 2) = v76;
    *((_QWORD *)v79 + 3) = v75;
    *(_QWORD *)v79 = v78;
    *((_QWORD *)v79 + 1) = v77;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Non-ULCA devices: Expected all to be PCC: Cell Victim Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), WiFi Victim Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)"), *(_QWORD *)v74, *((_QWORD *)v74 + 1), *((_QWORD *)v74 + 2), *((_QWORD *)v74 + 3), v78, v77, v76, v75);
  }
  if (*v110 == 0.0 || v10 != 0.0 && *v110 != v10)
  {
    *((_QWORD *)v7 + 14) = 0;
    *((_QWORD *)v7 + 15) = 0;
  }
  v80 = *v112;
  if (*v112 != 0.0)
  {
    v81 = *((_QWORD *)v7 + 4);
    *((double *)v7 + 14) = v80;
    *((_QWORD *)v7 + 15) = v81;
    -[WCM_CellularController setActiveConfig:](v54, "setActiveConfig:", v7);
    -[WCM_CellularController setActiveSubId:](v54, "setActiveSubId:", v55);
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton", v80), "activeCoexFeatures"), "containsObject:", CFSTR("CellularNWCfgCmdFilter"))&& (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")) & 1) == 0)
  {
    if (v10 == *v110
      && v9 == *v112
      && v12 == *((double *)v7 + 9)
      && v11 == *((double *)v7 + 7)
      && v100 == *((double *)v7 + 6)
      && v99 == *((double *)v7 + 4)
      && v98 == *((double *)v7 + 10)
      && v97 == *v111
      && v96 == (id)-[WCM_CellularController activeSubId](v54, "activeSubId", *v111, v97)
      && v95 == *((_QWORD *)v7 + 11))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("NW Config Parameters are the same, hence ignoring the network config command"));
      return;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("NW Config Parameters are NOT the same, hence handling the network config command"));
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ClkAlgnTDDFix")))
  {
    v82 = -[WCM_CellularController clkAlgnTDDFreqCheck](v54, "clkAlgnTDDFreqCheck");
    *((_BYTE *)v7 + 105) = v82;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: After sorting over all cells, setting cellularConfig->btClkAlgnFlag = %d"), v82);
  }
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "updateControllerState:", 300);
}

- (void)handleTxPower:(id)a3
{
  xpc_object_t value;
  void *v4;
  int64_t int64;
  int64_t v6;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v4 = value;
    int64 = xpc_dictionary_get_int64(value, "kWCMCellularTxPower_Level");
    v6 = xpc_dictionary_get_int64(v4, "kWCMCellularTxPower_Response");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Tx Power level(%lld) response(%lld)"), int64, v6);
    if (v6)
      objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleErrorReport:", 4);
  }
}

- (void)handleThresholdEvent:(id)a3
{
  xpc_object_t value;
  void *v5;
  int64_t int64;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    int64 = xpc_dictionary_get_int64(value, "kWCMCellularThresholdReached_EventType");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Threshold Event type(%lld) data(%lld)"), int64, xpc_dictionary_get_int64(v5, "kWCMCellularThresholdReached_EventData"));
    if (int64 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Reset frame denial related parameters"));
      -[WCM_CellularController setAllPolicies](self, "setAllPolicies");
    }
  }
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleErrorReport:", 4);
}

- (BOOL)isInCoexBand7LowerEdge
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;

  v3 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  -[WCM_CellularController ulCenterFreq](self, "ulCenterFreq");
  if (v4 == 0.0 || (-[WCM_CellularController ulBandwidth](self, "ulBandwidth"), v5 == 0.0))
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    -[WCM_CellularController ulCenterFreq](self, "ulCenterFreq");
    v7 = v6;
    -[WCM_CellularController ulBandwidth](self, "ulBandwidth");
    v9 = v8;
    -[WCM_CellularController dlCenterFreq](self, "dlCenterFreq");
    v11 = v10;
    -[WCM_CellularController dlBandwidth](self, "dlBandwidth");
    v13 = objc_msgSend(v3, "isBand7CoexActiveForULFreq:ulBW:dlFreq:dlBW:", v7, v9, v11, v12);
    if (v13)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("In CoexBand7LowerEdge"));
      LOBYTE(v13) = 1;
    }
  }
  return v13;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)getCombinedUplinkFreqRange
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
  if (v3 == 0.0 || (-[WCM_CellularController ulBandwidth2](self, "ulBandwidth2"), v4 == 0.0))
  {
    -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
    v24 = v23;
    -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
    v11 = v24 - v25 * 0.5;
    -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
    v27 = v26;
    -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
    v29 = v27 + v28 * 0.5;
  }
  else
  {
    -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
    v6 = v5;
    -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
    if (v6 >= v7)
    {
      -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
      v31 = v30;
      -[WCM_CellularController ulBandwidth2](self, "ulBandwidth2");
      v11 = v31 - v32 * 0.5;
      -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
      v34 = v33;
      -[WCM_CellularController ulBandwidth2](self, "ulBandwidth2");
      v15 = v34 + v35 * 0.5;
      -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
      v37 = v36;
      -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
      v19 = v37 - v38 * 0.5;
      -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
      v21 = v39;
      -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
    }
    else
    {
      -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
      v9 = v8;
      -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
      v11 = v9 - v10 * 0.5;
      -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
      v13 = v12;
      -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
      v15 = v13 + v14 * 0.5;
      -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
      v17 = v16;
      -[WCM_CellularController ulBandwidth2](self, "ulBandwidth2");
      v19 = v17 - v18 * 0.5;
      -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
      v21 = v20;
      -[WCM_CellularController ulBandwidth2](self, "ulBandwidth2");
    }
    v29 = v21 + v22 * 0.5;
    v40 = v19 - v15;
    if (v19 - v15 < 0.0)
      v40 = -(v19 - v15);
    if (v40 > 0.01)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("***********************************************************************************************"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("* PCC UL and SCC UL are not contiguous!!! However, go ahead by making a envelop frequency range"));
      -[WCM_CellularController cachedULCenterFreq](self, "cachedULCenterFreq");
      v42 = v41;
      -[WCM_CellularController cachedULBandwidth](self, "cachedULBandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("*   PCC: cachedULCenterFreq(%lf) cachedULBandwidth(%lf)"), v42, v43);
      -[WCM_CellularController ulCenterFreq2](self, "ulCenterFreq2");
      v45 = v44;
      -[WCM_CellularController ulBandwidth2](self, "ulBandwidth2");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("*   SCC: ulCenterFreq2(%lf) ulBandwidth2(%lf)"), v45, v46);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("***********************************************************************************************"));
    }
  }
  v47 = v29 - v11;
  v48 = v11;
  result.var1 = v47;
  result.var0 = v48;
  return result;
}

- (void)setNetworkConfigOfInterest
{
  xpc_object_t v3;
  uint64_t i;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t j;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  xpc_object_t v14;
  uint64_t k;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  size_t v24;
  xpc_object_t value;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  uint64_t m;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t object;
  xpc_object_t v39[6];
  xpc_object_t v40[6];
  xpc_object_t v41[6];
  xpc_object_t v42[6];
  xpc_object_t v43[6];
  xpc_object_t v44[6];
  xpc_object_t v45[6];
  xpc_object_t v46[5];
  xpc_object_t objects;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  uint64_t v52;
  xpc_object_t values;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  uint64_t v58;
  char *keys[2];
  __int128 v60;
  __int128 v61;

  *(_OWORD *)keys = *(_OWORD *)&off_100204C90;
  v60 = *(_OWORD *)&off_100204CA0;
  v61 = off_100204CB0;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ProtectWiFiRanging")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to whole band"));
    values = xpc_int64_create((uint64_t)((452.5 + 3800.0) * 0.5));
    v54 = xpc_int64_create((uint64_t)(3800.0 - 452.5));
    v55 = xpc_int64_create((uint64_t)((462.5 + 3800.0) * 0.5));
    v56 = xpc_int64_create((uint64_t)(3800.0 - 462.5));
    v57 = xpc_int64_create(3);
    objects = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    v3 = xpc_array_create(&objects, 1uLL);
    -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1202, v3);
    for (i = 0; i != 40; i += 8)
      xpc_release(*(xpc_object_t *)((char *)&values + i));
    xpc_release(objects);
    v5 = v3;
  }
  else if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
  {
    v6 = xpc_array_create(0, 0);
    values = xpc_int64_create(857);
    v54 = xpc_int64_create(115);
    v55 = xpc_int64_create(875);
    v56 = xpc_int64_create(169);
    v57 = xpc_int64_create(3);
    v58 = 0;
    v7 = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    xpc_array_append_value(v6, v7);
    for (j = 0; j != 21; ++j)
    {
      v9 = byte_1001DEC4A[j];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band-a %d"), v9);
      v10 = (double *)((char *)&unk_1001DC7E8 + 32 * v9);
      v11 = v10[2];
      v12 = v10[3] - v11;
      objects = xpc_int64_create((uint64_t)(v11 + v12 * 0.5));
      v48 = xpc_int64_create((uint64_t)v12);
      v13 = v10[1] - *v10;
      v49 = xpc_int64_create((uint64_t)(*v10 + v13 * 0.5));
      v50 = xpc_int64_create((uint64_t)v13);
      v51 = xpc_int64_create(3);
      v52 = 0;
      v14 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
      xpc_array_append_value(v6, v14);
    }
    for (k = 0; k != 4; ++k)
    {
      v16 = aMno[k];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band-b %d"), v16);
      v17 = (double *)((char *)&unk_1001DBDE8 + 32 * v16);
      v18 = v17[2];
      v19 = v17[3] - v18;
      objects = xpc_int64_create((uint64_t)(v18 + v19 * 0.5));
      v48 = xpc_int64_create((uint64_t)v19);
      v20 = v17[1] - *v17;
      v49 = xpc_int64_create((uint64_t)(*v17 + v20 * 0.5));
      v50 = xpc_int64_create((uint64_t)v20);
      v51 = xpc_int64_create(3);
      v52 = 0;
      v21 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
      xpc_array_append_value(v6, v21);
    }
    v22 = xpc_uint64_create(0);
    v23 = xpc_uint64_create(1uLL);
    -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1202, v6, "kSubId", v22);
    -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1202, v6, "kSubId", v23);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band2 %d"), xpc_array_get_count(v6));
    if (xpc_array_get_count(v6))
    {
      v24 = 0;
      do
      {
        value = xpc_array_get_value(v6, v24);
        xpc_release(value);
        ++v24;
      }
      while (xpc_array_get_count(v6) > v24);
    }
    xpc_release(v6);
    xpc_release(v22);
    v5 = v23;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band 7"));
    v46[0] = xpc_int64_create((uint64_t)((2570.0 - 2500.0) * 0.5 + 2500.0));
    v46[1] = xpc_int64_create((uint64_t)(2570.0 - 2500.0));
    v46[2] = xpc_int64_create((uint64_t)((2690.0 - 2620.0) * 0.5 + 2620.0));
    v46[3] = xpc_int64_create((uint64_t)(2690.0 - 2620.0));
    v46[4] = xpc_int64_create(3);
    object = xpc_dictionary_create((const char *const *)keys, v46, 5uLL);
    v26 = xpc_array_create(&object, 1uLL);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band 40"));
    values = xpc_int64_create((uint64_t)((2400.0 - 2300.0) * 0.5 + 2300.0));
    v54 = xpc_int64_create((uint64_t)(2400.0 - 2300.0));
    v55 = xpc_int64_create((uint64_t)((2400.0 - 2300.0) * 0.5 + 2300.0));
    v56 = xpc_int64_create((uint64_t)(2400.0 - 2300.0));
    v57 = xpc_int64_create(3);
    v58 = 0;
    v37 = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    xpc_array_append_value(v26, v37);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band 41A"));
    objects = xpc_int64_create(2522);
    v48 = xpc_int64_create(55);
    v49 = xpc_int64_create(2522);
    v50 = xpc_int64_create(55);
    v51 = xpc_int64_create(3);
    v52 = 0;
    v36 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
    xpc_array_append_value(v26, v36);
    v45[0] = xpc_int64_create(857);
    v45[1] = xpc_int64_create(115);
    v45[2] = xpc_int64_create(875);
    v45[3] = xpc_int64_create(169);
    v45[4] = xpc_int64_create(3);
    v45[5] = 0;
    v27 = xpc_dictionary_create((const char *const *)keys, v45, 5uLL);
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex")) & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to combined range for band 5, 8, 18, 19, 20, 26, 27 and bc10"));
      xpc_array_append_value(v26, v27);
    }
    v35 = v27;
    v44[0] = xpc_int64_create((uint64_t)((1980.0 - 1920.0) * 0.5 + 1920.0));
    v44[1] = xpc_int64_create((uint64_t)(1980.0 - 1920.0));
    v44[2] = xpc_int64_create((uint64_t)((2170.0 - 2110.0) * 0.5 + 2110.0));
    v44[3] = xpc_int64_create((uint64_t)(2170.0 - 2110.0));
    v44[4] = xpc_int64_create(3);
    v44[5] = 0;
    v28 = xpc_dictionary_create((const char *const *)keys, v44, 5uLL);
    v43[0] = xpc_int64_create((uint64_t)((1785.0 - 1710.0) * 0.5 + 1710.0));
    v43[1] = xpc_int64_create((uint64_t)(1785.0 - 1710.0));
    v43[2] = xpc_int64_create((uint64_t)((1880.0 - 1805.0) * 0.5 + 1805.0));
    v43[3] = xpc_int64_create((uint64_t)(1880.0 - 1805.0));
    v43[4] = xpc_int64_create(3);
    v43[5] = 0;
    v29 = xpc_dictionary_create((const char *const *)keys, v43, 5uLL);
    v42[0] = xpc_int64_create((uint64_t)((1755.0 - 1710.0) * 0.5 + 1710.0));
    v42[1] = xpc_int64_create((uint64_t)(1755.0 - 1710.0));
    v42[2] = xpc_int64_create((uint64_t)((2155.0 - 2110.0) * 0.5 + 2110.0));
    v42[3] = xpc_int64_create((uint64_t)(2155.0 - 2110.0));
    v42[4] = xpc_int64_create(3);
    v42[5] = 0;
    v30 = xpc_dictionary_create((const char *const *)keys, v42, 5uLL);
    v41[0] = xpc_int64_create((uint64_t)((1915.0 - 1850.0) * 0.5 + 1850.0));
    v41[1] = xpc_int64_create((uint64_t)(1915.0 - 1850.0));
    v41[2] = xpc_int64_create((uint64_t)((1995.0 - 1930.0) * 0.5 + 1930.0));
    v41[3] = xpc_int64_create((uint64_t)(1995.0 - 1930.0));
    v41[4] = xpc_int64_create(3);
    v41[5] = 0;
    v31 = xpc_dictionary_create((const char *const *)keys, v41, 5uLL);
    v40[0] = xpc_int64_create((uint64_t)((2025.0 - 2010.0) * 0.5 + 2010.0));
    v40[1] = xpc_int64_create((uint64_t)(2025.0 - 2010.0));
    v40[2] = xpc_int64_create((uint64_t)((2025.0 - 2010.0) * 0.5 + 2010.0));
    v40[3] = xpc_int64_create((uint64_t)(2025.0 - 2010.0));
    v40[4] = xpc_int64_create(3);
    v40[5] = 0;
    v32 = xpc_dictionary_create((const char *const *)keys, v40, 5uLL);
    v39[0] = xpc_int64_create((uint64_t)((1920.0 - 1880.0) * 0.5 + 1880.0));
    v39[1] = xpc_int64_create((uint64_t)(1920.0 - 1880.0));
    v39[2] = xpc_int64_create((uint64_t)((1920.0 - 1880.0) * 0.5 + 1880.0));
    v39[3] = xpc_int64_create((uint64_t)(1920.0 - 1880.0));
    v39[4] = xpc_int64_create(3);
    v39[5] = 0;
    v33 = xpc_dictionary_create((const char *const *)keys, v39, 5uLL);
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex")) & 1) != 0|| (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex")) & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiOCLSupport")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting network config of interest to band 1, 3, 4, 25, 34"));
      xpc_array_append_value(v26, v28);
      xpc_array_append_value(v26, v29);
      xpc_array_append_value(v26, v30);
      xpc_array_append_value(v26, v31);
      xpc_array_append_value(v26, v32);
      xpc_array_append_value(v26, v33);
    }
    -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1202, v26);
    for (m = 0; m != 5; ++m)
    {
      xpc_release(v46[m]);
      xpc_release(*(xpc_object_t *)((char *)&values + m * 8));
      xpc_release(*(xpc_object_t *)((char *)&objects + m * 8));
      xpc_release(v45[m]);
      xpc_release(v44[m]);
      xpc_release(v43[m]);
      xpc_release(v42[m]);
      xpc_release(v41[m]);
      xpc_release(v40[m]);
      xpc_release(v39[m]);
    }
    xpc_release(object);
    xpc_release(v37);
    xpc_release(v36);
    xpc_release(v35);
    xpc_release(v28);
    xpc_release(v29);
    xpc_release(v30);
    xpc_release(v31);
    xpc_release(v32);
    xpc_release(v33);
    v5 = v26;
  }
  xpc_release(v5);
}

- (void)setScanFrequencyBandFilter:(id)a3
{
  xpc_object_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  _BYTE *v11;
  unint64_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  xpc_object_t values;
  xpc_object_t object;
  _BYTE v22[128];
  char *keys[2];

  v5 = xpc_array_create(0, 0);
  *(_OWORD *)keys = *(_OWORD *)&off_100204CC0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "count") != (id)2)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid scan Freq len: %d"), objc_msgSend(v10, "count"));
          goto LABEL_11;
        }
        v11 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "integerValue");
        v12 = v11 - (_BYTE *)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "integerValue");
        values = xpc_int64_create((int64_t)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "integerValue") + (v12 >> 1));
        object = xpc_int64_create(v12);
        v13 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        xpc_array_append_value(v5, v13);
        xpc_release(values);
        xpc_release(object);
        xpc_release(v13);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:
  v14 = xpc_uint64_create(0);
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1208, v5, "kSubId", v14);
  xpc_release(v14);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("LTEDualSubCoexSupport")))
  {
    v15 = xpc_uint64_create(1uLL);
    -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1208, v5, "kSubId", v15);
    xpc_release(v15);
  }
  xpc_release(v5);
}

- (void)setLAACoexConfig:(int)a3
{
  uint64_t v3;
  id v5;
  xpc_object_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager");
  objc_msgSend(v5, "wcmCellularLAACoexProtectCQIPeriod");
  objc_msgSend(v5, "wcmCellularLAACoexThresholdIn");
  objc_msgSend(v5, "wcmCellularLAACoexThresholdOut");
  objc_msgSend(v5, "wcmCellularLAACoexDeactTimer");
  objc_msgSend(v5, "wcmCellularLAACoexDeactStopTimer");
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v6, "WCMCellularSetLAAConfig_CoexEnable", 1);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting LAA Coex Config for Cellular with RCU priority: %d"), v3);
  v7 = objc_msgSend(v5, "wcmCellularLAACoexProtectCQIPeriod");
  v8 = objc_msgSend(v5, "wcmCellularLAACoexThresholdIn");
  v9 = objc_msgSend(v5, "wcmCellularLAACoexThresholdOut");
  if ((v3 & 1) != 0)
  {
    v10 = 200;
    v11 = 200;
  }
  else
  {
    v10 = (uint64_t)objc_msgSend(v5, "wcmCellularLAACoexDeactTimer");
    v11 = (uint64_t)objc_msgSend(v5, "wcmCellularLAACoexDeactStopTimer");
  }
  if ((v3 & 7) != 0)
    v12 = 255;
  else
    v12 = (uint64_t)v7;
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ProtectCQIPeriod", v12);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ThresholdIn", (uint64_t)v8);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ThresholdOut", (uint64_t)v9);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_DeactTimer", v10);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_DeactStopTimer", v11);
  v13 = xpc_uint64_create(0);
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1211, v6, "kSubId", v13);
  -[WCM_CellularController setRc1priority:](self, "setRc1priority:", v3);
  xpc_release(v13);
  xpc_release(v6);
}

- (void)setRC1Duration:(unint64_t)a3
{
  id v5;
  xpc_object_t v6;
  xpc_object_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Setting RC1 duration in BB %d"), a3);
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = xpc_uint64_create(0);
  if (!objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
  {
    v8 = "kWCMCellularRC1Duration";
    v9 = v6;
    v10 = a3;
    goto LABEL_9;
  }
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("LaaRcu1ThrottlingDisabled")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("LAA to RCU1 Throttling disabled"));
  }
  else
  {
    v11 = WORD1(a3);
    if (WORD1(a3) != 1)
    {
      v12 = 1;
      goto LABEL_8;
    }
  }
  v12 = 0;
  v11 = 1;
LABEL_8:
  xpc_dictionary_set_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Enabled", v12);
  v10 = v11;
  v8 = "kWCMCellularSetLaaGpioThrottleReq_Periodicity";
  v9 = v6;
LABEL_9:
  xpc_dictionary_set_uint64(v9, v8, v10);
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_UwbRangingDuration", a3);
    xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_UwbNarrowBandDuration", 0);
  }
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1213, v6, "kSubId", v7);
  -[WCM_CellularController setRc1duration:](self, "setRc1duration:", a3);
  xpc_release(v7);
  xpc_release(v6);
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4
{
  -[WCM_CellularController configureCellularTimeShareConfigReqParamsWithCenterFreq:instance:bandwidth:](self, "configureCellularTimeShareConfigReqParamsWithCenterFreq:instance:bandwidth:", a3, 0, a4);
  -[WCM_CellularController configureCellularTimeShareConfigReqParamsWithCenterFreq:instance:bandwidth:](self, "configureCellularTimeShareConfigReqParamsWithCenterFreq:instance:bandwidth:", a3, 9, a4);
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 instance:(unsigned int)a4 bandwidth:(unint64_t)a5
{
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  char *keys[2];
  xpc_object_t values;
  xpc_object_t object;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("configureCellularTimeShareConfigReqParamsWithInstance is called. BB side timesharing will be configured. (centerFreq = %d, instance = %d, bandwidth = %d)"), a3, *(_QWORD *)&a4, a5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Updating time share config req params to cellular modem"));
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_CoexTech", a4);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  v10 = xpc_array_create(0, 0);
  values = xpc_int64_create(a3);
  object = xpc_int64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)&off_100204CD0;
  v11 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v10, v11);
  xpc_dictionary_set_value(v9, "kWCMCellularTImeShareConfig_BandInformationSet", v10);
  v12 = xpc_uint64_create(0);
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1214, v9, "kSubId", v12);
  xpc_release(values);
  xpc_release(object);
  xpc_release(v11);
  xpc_release(v10);
  xpc_release(v12);
  xpc_release(v9);
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 CoexTech:(unsigned int)a4 bandwidth:(unint64_t)a5 subId:(unint64_t)a6
{
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  char *keys[2];
  xpc_object_t values;
  xpc_object_t object;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("configureCellularTimeShareConfigReqParamsWithInstance is called. BB side timesharing will be configured. (centerFreq = %llu, CoexTech = 0x%X, bandwidth = %llu, subId = %llu)"), a3, *(_QWORD *)&a4, a5, a6);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_CoexTech", a4);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  v12 = xpc_array_create(0, 0);
  values = xpc_int64_create(a3);
  object = xpc_int64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)&off_100204CD0;
  v13 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v12, v13);
  xpc_dictionary_set_value(v11, "kWCMCellularTImeShareConfig_BandInformationSet", v12);
  v14 = xpc_uint64_create(a6);
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1214, v11, "kSubId", v14);
  xpc_release(values);
  xpc_release(object);
  xpc_release(v13);
  xpc_release(v12);
  xpc_release(v14);
  xpc_release(v11);
}

- (void)disableCellularTimeShareConfigReqSubId:(unint64_t)a3
{
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  char *keys[2];
  xpc_object_t values;
  xpc_object_t object;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Disable time share config req params to cellular modem SubId %llu"), a3);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetTimeShareConfig_Enable", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_CoexTech", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_LongDrxCycle", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 0);
  v6 = xpc_array_create(0, 0);
  values = xpc_int64_create(0);
  object = xpc_int64_create(0);
  *(_OWORD *)keys = *(_OWORD *)&off_100204CD0;
  v7 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v6, v7);
  xpc_dictionary_set_value(v5, "kWCMCellularTImeShareConfig_BandInformationSet", v6);
  v8 = xpc_uint64_create(a3);
  -[WCM_CellularController sendMessage:withArgs:withExtraKey:andExtraValue:](self, "sendMessage:withArgs:withExtraKey:andExtraValue:", 1214, v5, "kSubId", v8);
  xpc_release(values);
  xpc_release(object);
  xpc_release(v7);
  xpc_release(v6);
  xpc_release(v8);
  xpc_release(v5);
}

- (void)setAntBlockingParams
{
  unsigned int v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  void *v26;
  xpc_object_t v27;
  void *v28;
  xpc_object_t v29;
  xpc_object_t v30;
  void *v31;
  xpc_object_t v32;
  void *v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  unsigned int v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t object;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  xpc_object_t v61;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v3 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Updating antenna blocking params to cellular modem"));
  v4 = xpc_array_create(0, 0);
  v5 = xpc_array_create(0, 0);
  v6 = xpc_uint64_create(0xCAuLL);
  if (v2 <= 0xE && ((1 << v2) & 0x6800) != 0)
    xpc_array_append_value(v5, v6);
  v54 = xpc_uint64_create(0xC8uLL);
  xpc_array_append_value(v5, v54);
  v8 = xpc_uint64_create(0xC9uLL);
  if ((v2 | 4) == 0xF)
    xpc_array_append_value(v5, v8);
  v9 = xpc_uint64_create(0xA1uLL);
  if (v2 == 15)
    xpc_array_append_value(v5, v9);
  v51 = v9;
  v10 = xpc_dictionary_create(0, 0, 0);
  v46 = v5;
  xpc_dictionary_set_value(v10, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v5);
  xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
  object = v10;
  xpc_array_append_value(v4, v10);
  v11 = xpc_array_create(0, 0);
  v12 = v11;
  v60 = v4;
  v61 = v3;
  if (v2 == 14)
  {
    xpc_array_append_value(v11, v8);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v13, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v12);
    xpc_dictionary_set_uint64(v13, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 9uLL);
    v49 = v13;
    xpc_array_append_value(v4, v13);
  }
  else
  {
    v49 = xpc_dictionary_create(0, 0, 0);
  }
  v14 = xpc_array_create(0, 0);
  v15 = xpc_uint64_create(0xA0uLL);
  v16 = xpc_uint64_create(0xBFuLL);
  v52 = v12;
  v47 = v16;
  v48 = v15;
  if (v2 == 14)
  {
    v17 = v16;
    xpc_array_append_value(v14, v15);
    xpc_array_append_value(v14, v17);
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v14);
    xpc_dictionary_set_uint64(v18, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    v45 = v18;
    xpc_array_append_value(v60, v18);
  }
  else
  {
    v45 = xpc_dictionary_create(0, 0, 0);
  }
  v53 = v8;
  v55 = v6;
  v19 = xpc_array_create(0, 0);
  v20 = xpc_uint64_create(0xB6uLL);
  v21 = xpc_uint64_create(0x79uLL);
  v22 = xpc_uint64_create(0x90uLL);
  v23 = xpc_uint64_create(0x7AuLL);
  v24 = xpc_uint64_create(0x7BuLL);
  v25 = xpc_uint64_create(0x9EuLL);
  v26 = v61;
  v50 = v14;
  v58 = v21;
  v59 = v20;
  v57 = v22;
  if (v2 == 11)
  {
    xpc_array_append_value(v19, v20);
    xpc_array_append_value(v19, v21);
    xpc_array_append_value(v19, v22);
    xpc_array_append_value(v19, v23);
    xpc_array_append_value(v19, v24);
    xpc_array_append_value(v19, v25);
    v27 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v19);
    xpc_dictionary_set_uint64(v27, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 1uLL);
    v28 = v60;
    xpc_array_append_value(v60, v27);
    v43 = xpc_array_create(0, 0);
    v29 = xpc_dictionary_create(0, 0, 0);
    v42 = xpc_array_create(0, 0);
    xpc_uint64_create(0x7EuLL);
    v30 = xpc_dictionary_create(0, 0, 0);
    v31 = v46;
  }
  else
  {
    v41 = xpc_dictionary_create(0, 0, 0);
    v32 = xpc_array_create(0, 0);
    v28 = v60;
    v31 = v46;
    v43 = v32;
    if (v2 - 13 >= 2)
    {
      v40 = xpc_dictionary_create(0, 0, 0);
      v34 = v25;
    }
    else
    {
      v33 = v32;
      xpc_array_append_value(v32, v20);
      xpc_array_append_value(v33, v58);
      xpc_array_append_value(v33, v57);
      v34 = v25;
      xpc_array_append_value(v33, v25);
      v35 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(v35, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v33);
      xpc_dictionary_set_uint64(v35, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
      v40 = v35;
      xpc_array_append_value(v60, v35);
    }
    v36 = xpc_array_create(0, 0);
    v37 = xpc_uint64_create(0x7EuLL);
    v38 = v2 - 148;
    if (v2 - 148 <= 4 && v2 != 150)
      xpc_array_append_value(v36, v37);
    v39 = xpc_dictionary_create(0, 0, 0);
    v30 = v39;
    v42 = v36;
    if (v38 > 4)
    {
      v26 = v61;
      v25 = v34;
    }
    else
    {
      if (v38 != 2)
      {
        xpc_dictionary_set_value(v39, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v36);
        xpc_dictionary_set_uint64(v30, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
        xpc_array_append_value(v60, v30);
      }
      v26 = v61;
    }
    v29 = v40;
    v27 = v41;
  }
  xpc_dictionary_set_value(v26, "kWCMCellularSetAntBlocking_BandInformationSet", v28);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1216, v26);
  xpc_release(object);
  xpc_release(v27);
  xpc_release(v29);
  xpc_release(v49);
  xpc_release(v45);
  xpc_release(v30);
  xpc_release(v55);
  xpc_release(v53);
  xpc_release(v54);
  xpc_release(v51);
  xpc_release(v48);
  xpc_release(v47);
  xpc_release(v59);
  xpc_release(v58);
  xpc_release(v57);
  xpc_release(v23);
  xpc_release(v24);
  xpc_release(v25);
  xpc_release(v31);
  xpc_release(v19);
  xpc_release(v43);
  xpc_release(v52);
  xpc_release(v50);
  xpc_release(v42);
  xpc_release(v28);
  xpc_release(v26);
}

- (void)setClientAntBlockingParams22
{
  unsigned int v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  void *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  void *v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  void *v35;
  void *v36;
  xpc_object_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t object;
  xpc_object_t v59;
  unsigned int v60;
  xpc_object_t v61;
  xpc_object_t v62;
  xpc_object_t v63;
  xpc_object_t v65;
  void *v66;
  xpc_object_t v67;
  xpc_object_t v68;
  xpc_object_t v69;
  xpc_object_t v70;
  xpc_object_t v71;
  void *v72;
  xpc_object_t v73;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v67 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating WIFI antenna blocking params to cellular modem"));
  v3 = xpc_array_create(0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  v65 = xpc_uint64_create(0);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_ClientId", v65);
  v63 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_BlockVoice", v63);
  v62 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_TimeMultiplier", v62);
  v5 = xpc_array_create(0, 0);
  v6 = xpc_array_create(0, 0);
  v7 = xpc_uint64_create(0xCAuLL);
  v72 = v7;
  if (v2 - 22 >= 4)
  {
    object = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    xpc_array_append_value(v6, v7);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v6);
    xpc_dictionary_set_uint64(v8, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    object = v8;
    xpc_array_append_value(v5, v8);
  }
  v9 = xpc_array_create(0, 0);
  v57 = v9;
  v10 = v3;
  if ((v2 & 0xFFFFFFFE) == 0x18)
  {
    v11 = v9;
    xpc_array_append_value(v9, v72);
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v11);
    xpc_dictionary_set_uint64(v12, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 9uLL);
    v56 = v12;
    xpc_array_append_value(v5, v12);
  }
  else
  {
    v56 = xpc_dictionary_create(0, 0, 0);
  }
  v13 = xpc_array_create(0, 0);
  v14 = xpc_uint64_create(0xBFuLL);
  v15 = xpc_uint64_create(0xA0uLL);
  v53 = v15;
  v54 = v14;
  if (v2 - 22 >= 4)
  {
    v52 = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    v16 = v15;
    xpc_array_append_value(v13, v14);
    xpc_array_append_value(v13, v16);
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v17, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v13);
    xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    v52 = v17;
    xpc_array_append_value(v5, v17);
  }
  v73 = xpc_array_create(0, 0);
  v18 = v10;
  if (v2 - 154 <= 4 && v2 != 156)
    xpc_array_append_value(v73, v72);
  v19 = xpc_dictionary_create(0, 0, 0);
  v20 = v19;
  if (v2 - 154 <= 4 && v2 != 156)
  {
    xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v73);
    xpc_dictionary_set_uint64(v20, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    xpc_array_append_value(v5, v20);
  }
  v61 = v5;
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_BandInformationSet", v5);
  xpc_array_append_value(v10, v4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating RC1 antenna blocking params to cellular modem"));
  v21 = xpc_dictionary_create(0, 0, 0);
  v50 = xpc_uint64_create(1uLL);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_ClientId", v50);
  v49 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BlockVoice", v49);
  v48 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_TimeMultiplier", v48);
  v22 = xpc_array_create(0, 0);
  v23 = xpc_array_create(0, 0);
  v71 = xpc_uint64_create(0xBFuLL);
  v70 = xpc_uint64_create(0xA0uLL);
  v69 = xpc_dictionary_create(0, 0, 0);
  if (v2 - 23 <= 2)
  {
    xpc_array_append_value(v23, v70);
    xpc_array_append_value(v23, v71);
    xpc_dictionary_set_value(v69, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v23);
    xpc_dictionary_set_uint64(v69, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v22, v69);
  }
  v46 = v23;
  v51 = v20;
  v55 = v13;
  v59 = v6;
  v66 = v4;
  v24 = xpc_array_create(0, 0);
  v25 = xpc_uint64_create(0xC9uLL);
  v26 = xpc_dictionary_create(0, 0, 0);
  v60 = v2;
  if (v2 == 25)
  {
    xpc_array_append_value(v24, v25);
    xpc_dictionary_set_value(v26, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v24);
    xpc_dictionary_set_uint64(v26, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v22, v26);
  }
  v43 = v26;
  v44 = v25;
  v45 = v24;
  v47 = v22;
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BandInformationSet", v22);
  xpc_array_append_value(v18, v21);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating FC1 antenna blocking params to cellular modem"));
  v27 = xpc_dictionary_create(0, 0, 0);
  v42 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_ClientId", v42);
  v41 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_BlockVoice", v41);
  v40 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_TimeMultiplier", v40);
  v28 = v18;
  xpc_array_append_value(v18, v27);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB22:Updating FC2 antenna blocking params to cellular modem"));
  v29 = xpc_dictionary_create(0, 0, 0);
  v39 = xpc_uint64_create(3uLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_ClientId", v39);
  v38 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BlockVoice", v38);
  v37 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_TimeMultiplier", v37);
  v30 = xpc_array_create(0, 0);
  v31 = xpc_array_create(0, 0);
  v32 = xpc_uint64_create(0xA0uLL);
  v33 = xpc_uint64_create(0xBFuLL);
  v68 = xpc_uint64_create(0x9DuLL);
  v34 = xpc_dictionary_create(0, 0, 0);
  v35 = v32;
  v36 = v33;
  if (v60 == 22)
    goto LABEL_23;
  if (v60 == 25)
  {
    xpc_array_append_value(v31, v32);
    v35 = v33;
    v36 = v68;
LABEL_23:
    xpc_array_append_value(v31, v35);
    xpc_array_append_value(v31, v36);
    xpc_dictionary_set_value(v34, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v31);
    xpc_dictionary_set_uint64(v34, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v30, v34);
  }
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BandInformationSet", v30);
  xpc_array_append_value(v28, v29);
  xpc_dictionary_set_value(v67, "kWCMCellularSetAntBlocking_ClientInformationSet", v28);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1221, v67);
  xpc_release(object);
  xpc_release(v72);
  xpc_release(v59);
  xpc_release(v56);
  xpc_release(v57);
  xpc_release(v52);
  xpc_release(v54);
  xpc_release(v53);
  xpc_release(v55);
  xpc_release(v51);
  xpc_release(v73);
  xpc_release(v61);
  xpc_release(v66);
  xpc_release(v65);
  xpc_release(v63);
  xpc_release(v62);
  xpc_release(v43);
  xpc_release(v69);
  xpc_release(v44);
  xpc_release(v71);
  xpc_release(v70);
  xpc_release(v45);
  xpc_release(v46);
  xpc_release(v47);
  xpc_release(v21);
  xpc_release(v50);
  xpc_release(v49);
  xpc_release(v48);
  xpc_release(v27);
  xpc_release(v42);
  xpc_release(v41);
  xpc_release(v40);
  xpc_release(v34);
  xpc_release(v32);
  xpc_release(v33);
  xpc_release(v68);
  xpc_release(v31);
  xpc_release(v30);
  xpc_release(v29);
  xpc_release(v39);
  xpc_release(v38);
  xpc_release(v37);
  xpc_release(v67);
  xpc_release(v28);
}

- (void)setClientAntBlockingParams
{
  unsigned int v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  unsigned int v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  int v19;
  void *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  void *v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  void *v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  xpc_object_t v59;
  xpc_object_t v60;
  xpc_object_t v61;
  xpc_object_t v62;
  xpc_object_t v63;
  xpc_object_t v64;
  xpc_object_t v65;
  xpc_object_t v66;
  int v67;
  xpc_object_t v68;
  xpc_object_t v69;
  xpc_object_t v70;
  xpc_object_t v71;
  void *v72;
  xpc_object_t v73;
  xpc_object_t v74;
  xpc_object_t v75;
  xpc_object_t v76;
  xpc_object_t v77;
  xpc_object_t v78;
  xpc_object_t v79;
  xpc_object_t object;
  xpc_object_t v81;
  xpc_object_t v82;
  xpc_object_t v84;
  xpc_object_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  xpc_object_t xdict;
  xpc_object_t value;
  xpc_object_t v90;
  xpc_object_t v91;
  xpc_object_t v92;
  xpc_object_t v93;
  xpc_object_t v94;
  xpc_object_t v95;
  void *v96;
  xpc_object_t v97;
  xpc_object_t v98;
  void *v99;
  xpc_object_t v100;
  xpc_object_t v101;
  xpc_object_t v102;
  xpc_object_t v103;
  xpc_object_t v104;
  xpc_object_t v105;
  xpc_object_t v106;
  xpc_object_t v107;
  xpc_object_t v108;
  void *v109;
  xpc_object_t v110;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  xdict = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating WIFI antenna blocking params to cellular modem"));
  v110 = xpc_array_create(0, 0);
  v3 = xpc_dictionary_create(0, 0, 0);
  v86 = xpc_uint64_create(0);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_ClientId", v86);
  v85 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_BlockVoice", v85);
  v84 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_TimeMultiplier", v84);
  v4 = xpc_array_create(0, 0);
  v5 = xpc_array_create(0, 0);
  v6 = xpc_uint64_create(0xCAuLL);
  v7 = v2 - 16;
  v99 = v6;
  if (v2 - 16 >= 4)
  {
    object = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    xpc_array_append_value(v5, v6);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v5);
    xpc_dictionary_set_uint64(v8, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    object = v8;
    xpc_array_append_value(v4, v8);
  }
  v9 = xpc_array_create(0, 0);
  v10 = xpc_uint64_create(0x78uLL);
  v11 = xpc_uint64_create(0x79uLL);
  v12 = xpc_uint64_create(0x7AuLL);
  v78 = xpc_uint64_create(0x90uLL);
  v13 = xpc_uint64_create(0x9EuLL);
  v109 = v4;
  v79 = v11;
  v77 = v13;
  v72 = v10;
  v96 = v12;
  if (v2 == 17)
  {
    v14 = v13;
    xpc_array_append_value(v9, v10);
    xpc_array_append_value(v9, v11);
    v15 = v14;
LABEL_7:
    xpc_array_append_value(v9, v15);
    v16 = xpc_dictionary_create(0, 0, 0);
LABEL_8:
    xpc_dictionary_set_value(v16, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v9);
    xpc_dictionary_set_uint64(v16, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    xpc_array_append_value(v109, v16);
    goto LABEL_9;
  }
  v15 = v12;
  if ((v2 | 2) == 0x12)
    goto LABEL_7;
  v16 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 3)
    goto LABEL_8;
LABEL_9:
  v81 = v9;
  v17 = xpc_array_create(0, 0);
  v18 = xpc_uint64_create(0x9FuLL);
  v82 = v5;
  v74 = v18;
  if (v2 == 144)
  {
    v19 = 0;
    v20 = v18;
    goto LABEL_13;
  }
  if (v2 == 131)
  {
    v19 = 1;
    v20 = v99;
LABEL_13:
    xpc_array_append_value(v17, v20);
    v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v17);
    xpc_dictionary_set_uint64(v21, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 6uLL);
    v73 = v21;
    xpc_array_append_value(v109, v21);
    v105 = xpc_array_create(0, 0);
    v67 = 0;
    goto LABEL_19;
  }
  v73 = xpc_dictionary_create(0, 0, 0);
  v105 = xpc_array_create(0, 0);
  if (v2 == 146)
  {
    xpc_array_append_value(v105, v99);
    v19 = 0;
    v67 = 1;
  }
  else
  {
    v67 = 0;
    v19 = 0;
  }
LABEL_19:
  v98 = xpc_uint64_create(0xA8uLL);
  v97 = xpc_uint64_create(0xB8uLL);
  v22 = xpc_uint64_create(0xC2uLL);
  if (v19)
  {
    xpc_array_append_value(v105, v96);
    xpc_array_append_value(v105, v98);
    xpc_array_append_value(v105, v97);
    xpc_array_append_value(v105, v22);
  }
  v71 = v22;
  v23 = v17;
  v101 = xpc_dictionary_create(0, 0, 0);
  if (v2 == 146 || v2 == 131)
  {
    xpc_dictionary_set_value(v101, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v105);
    xpc_dictionary_set_uint64(v101, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v109, v101);
  }
  v24 = xpc_array_create(0, 0);
  v25 = xpc_uint64_create(0xA0uLL);
  v26 = xpc_uint64_create(0xBFuLL);
  v69 = v25;
  v70 = v24;
  v68 = v26;
  if ((v19 & 1) != 0)
  {
    v27 = v26;
    xpc_array_append_value(v24, v25);
    xpc_array_append_value(v24, v27);
    v28 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v28, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v24);
    xpc_dictionary_set_uint64(v28, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    v63 = v28;
    xpc_array_append_value(v109, v28);
  }
  else
  {
    v63 = xpc_dictionary_create(0, 0, 0);
  }
  v75 = v23;
  if (v7 < 4 || v2 - 131 <= 0xF && ((1 << (v2 + 125)) & 0xA001) != 0)
    xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_BandInformationSet", v109);
  xpc_array_append_value(v110, v3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating RC1 antenna blocking params to cellular modem"));
  v29 = xpc_dictionary_create(0, 0, 0);
  v65 = xpc_uint64_create(1uLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_ClientId", v65);
  v64 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BlockVoice", v64);
  v62 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_TimeMultiplier", v62);
  v108 = xpc_array_create(0, 0);
  v95 = xpc_array_create(0, 0);
  v94 = xpc_uint64_create(0xCAuLL);
  v93 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 3)
  {
    xpc_array_append_value(v95, v94);
    xpc_dictionary_set_value(v93, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v95);
    xpc_dictionary_set_uint64(v93, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_array_append_value(v108, v93);
  }
  v30 = xpc_array_create(0, 0);
  v31 = xpc_uint64_create(0xBFuLL);
  v90 = xpc_uint64_create(0xA0uLL);
  v92 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 2)
  {
    xpc_array_append_value(v30, v31);
    if (v2 == 16)
      xpc_array_append_value(v30, v90);
    xpc_dictionary_set_value(v92, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v30);
    xpc_dictionary_set_uint64(v92, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v108, v92);
  }
  v32 = xpc_array_create(0, 0);
  v33 = xpc_uint64_create(0xC9uLL);
  v34 = xpc_dictionary_create(0, 0, 0);
  v76 = v16;
  v56 = v34;
  if (v2 == 17)
  {
    v35 = v34;
    xpc_array_append_value(v32, v33);
    xpc_dictionary_set_value(v35, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v32);
    xpc_dictionary_set_uint64(v35, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v108, v35);
LABEL_40:
    xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BandInformationSet", v108);
    goto LABEL_41;
  }
  if (v7 <= 3)
    goto LABEL_40;
LABEL_41:
  xpc_array_append_value(v110, v29);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating FC1 antenna blocking params to cellular modem"));
  v36 = xpc_dictionary_create(0, 0, 0);
  v57 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_ClientId", v57);
  v55 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_BlockVoice", v55);
  v54 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_TimeMultiplier", v54);
  v104 = xpc_array_create(0, 0);
  v107 = xpc_array_create(0, 0);
  v106 = xpc_uint64_create(0xCAuLL);
  v102 = xpc_uint64_create(0xC8uLL);
  value = xpc_uint64_create(0xC9uLL);
  v103 = xpc_dictionary_create(0, 0, 0);
  v87 = v3;
  if (v7 < 2)
    goto LABEL_44;
  if (v2 == 18)
  {
LABEL_45:
    xpc_array_append_value(v107, v106);
LABEL_50:
    xpc_dictionary_set_value(v103, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v107);
    xpc_dictionary_set_uint64(v103, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_array_append_value(v104, v103);
    xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_BandInformationSet", v104);
    xpc_array_append_value(v110, v36);
    goto LABEL_51;
  }
  if (v2 == 19)
  {
LABEL_44:
    xpc_array_append_value(v107, v106);
    xpc_array_append_value(v107, v102);
    if (v2 == 18)
      goto LABEL_45;
  }
  if ((v2 & 0xFFFFFFFE) == 0x16)
  {
    xpc_array_append_value(v107, v106);
    xpc_array_append_value(v107, v102);
    xpc_array_append_value(v107, value);
  }
  if (v2 <= 0x17 && ((1 << v2) & 0xCF0000) != 0)
    goto LABEL_50;
LABEL_51:
  v58 = v33;
  v60 = v31;
  v61 = v30;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating FC2 antenna blocking params to cellular modem"));
  v37 = xpc_dictionary_create(0, 0, 0);
  v53 = xpc_uint64_create(3uLL);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_ClientId", v53);
  v52 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_BlockVoice", v52);
  v51 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_TimeMultiplier", v51);
  v38 = xpc_array_create(0, 0);
  v39 = xpc_array_create(0, 0);
  v40 = xpc_uint64_create(0xA0uLL);
  v100 = xpc_uint64_create(0xBFuLL);
  v41 = xpc_dictionary_create(0, 0, 0);
  if (v2 == 23 || v2 == 16)
  {
    xpc_array_append_value(v39, v40);
    xpc_array_append_value(v39, v100);
    xpc_dictionary_set_value(v41, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v39);
    xpc_dictionary_set_uint64(v41, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v38, v41);
    xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_BandInformationSet", v38);
    xpc_array_append_value(v110, v37);
  }
  v50 = v40;
  v59 = v32;
  v66 = v29;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21:Updating JPN REG CLIENT antenna blocking params to cellular modem"));
  v42 = xpc_dictionary_create(0, 0, 0);
  v49 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_ClientId", v49);
  v48 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_BlockVoice", v48);
  v47 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_TimeMultiplier", v47);
  v43 = xpc_array_create(0, 0);
  v44 = xpc_array_create(0, 0);
  v45 = xpc_uint64_create(0xC8uLL);
  v91 = xpc_uint64_create(0xC9uLL);
  v46 = xpc_dictionary_create(0, 0, 0);
  if (v67)
  {
    xpc_array_append_value(v44, v45);
    xpc_array_append_value(v44, v91);
    xpc_dictionary_set_value(v46, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v44);
    xpc_dictionary_set_uint64(v46, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 6uLL);
    xpc_array_append_value(v43, v46);
    xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_BandInformationSet", v43);
    xpc_array_append_value(v110, v42);
  }
  xpc_dictionary_set_value(xdict, "kWCMCellularSetAntBlocking_ClientInformationSet", v110);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1221, xdict);
  xpc_release(object);
  xpc_release(v99);
  xpc_release(v82);
  xpc_release(v109);
  xpc_release(v76);
  xpc_release(v72);
  xpc_release(v79);
  xpc_release(v96);
  xpc_release(v78);
  xpc_release(v77);
  xpc_release(v81);
  xpc_release(v73);
  xpc_release(v74);
  xpc_release(v75);
  xpc_release(v101);
  xpc_release(v105);
  xpc_release(v63);
  xpc_release(v69);
  xpc_release(v68);
  xpc_release(v70);
  xpc_release(v98);
  xpc_release(v97);
  xpc_release(v71);
  xpc_release(v87);
  xpc_release(v86);
  xpc_release(v85);
  xpc_release(v84);
  xpc_release(v93);
  xpc_release(v92);
  xpc_release(v56);
  xpc_release(v94);
  xpc_release(v60);
  xpc_release(v58);
  xpc_release(v90);
  xpc_release(v95);
  xpc_release(v61);
  xpc_release(v59);
  xpc_release(v108);
  xpc_release(v66);
  xpc_release(v65);
  xpc_release(v64);
  xpc_release(v62);
  xpc_release(v103);
  xpc_release(v106);
  xpc_release(v102);
  xpc_release(value);
  xpc_release(v107);
  xpc_release(v104);
  xpc_release(v36);
  xpc_release(v57);
  xpc_release(v55);
  xpc_release(v54);
  xpc_release(v41);
  xpc_release(v100);
  xpc_release(v50);
  xpc_release(v39);
  xpc_release(v38);
  xpc_release(v37);
  xpc_release(v53);
  xpc_release(v52);
  xpc_release(v51);
  xpc_release(v46);
  xpc_release(v45);
  xpc_release(v91);
  xpc_release(v44);
  xpc_release(v43);
  xpc_release(v42);
  xpc_release(v49);
  xpc_release(v48);
  xpc_release(v47);
  xpc_release(xdict);
  xpc_release(v110);
}

- (void)setWci2TxAntMap
{
  xpc_object_t v3;
  xpc_object_t v4;
  id v5;
  uint64_t i;
  xpc_object_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  xpc_object_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  xpc_object_t value;

  v3 = xpc_array_create(0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20:Updating antenna map params to cellular modem"));
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if ((objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", CFSTR("BBWCI2Type7mmWaveTxOn")) & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Enable type7 mmWave TX on bit"));
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
    for (i = 0; i != 10; ++i)
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v7, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
      v8 = i - 5 < 2;
      if (i == 4)
        v8 = 0;
      if ((i & 0x7E) == 2)
        v9 = 3;
      else
        v9 = v8;
      if (i == 1)
        v10 = 2;
      else
        v10 = v9;
      xpc_dictionary_set_uint64(v7, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v10);
      xpc_array_append_value(v3, v7);
    }
  }
  else
  {
    for (j = -3; j != 7; ++j)
    {
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v12, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j + 3);
      v13 = (j + 3);
      if ((unint64_t)(j + 3) <= 6)
        v14 = 0;
      else
        v14 = j;
      if (v13 == 6)
        v14 = 1;
      if (v13 == 5)
        v15 = 2;
      else
        v15 = v14;
      if ((((_BYTE)j + 2) & 0xFC) != 0)
        v16 = v15;
      else
        v16 = j + 2;
      xpc_dictionary_set_uint64(v12, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v16);
      xpc_array_append_value(v3, v12);
    }
  }
  xpc_dictionary_set_value(v4, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1215, v4);
  if (xpc_array_get_count(v3))
  {
    v17 = 0;
    do
    {
      value = xpc_array_get_value(v3, v17);
      xpc_release(value);
      ++v17;
    }
    while (v17 < xpc_array_get_count(v3));
  }
  xpc_release(v3);
  xpc_release(v4);
}

- (void)setWci2TxAntMapBB21
{
  int v2;
  xpc_object_t v3;
  xpc_object_t v4;
  NSDictionary *v5;
  NSDictionary *v6;
  uint64_t i;
  xpc_object_t v8;
  NSArray *v9;
  uint64_t v10;
  size_t v11;
  xpc_object_t value;
  NSDictionary *v13;
  NSDictionary *v14;
  uint64_t n;
  xpc_object_t v16;
  NSArray *v17;
  uint64_t v18;
  NSDictionary *v19;
  NSDictionary *v20;
  uint64_t k;
  xpc_object_t v22;
  NSArray *v23;
  uint64_t v24;
  NSDictionary *v25;
  NSDictionary *v26;
  uint64_t m;
  xpc_object_t v28;
  NSArray *v29;
  uint64_t v30;
  NSDictionary *v31;
  NSDictionary *v32;
  uint64_t j;
  xpc_object_t v34;
  NSArray *v35;
  uint64_t v36;
  xpc_object_t xdict;
  _QWORD v39[7];
  _QWORD v40[7];
  _QWORD v41[7];
  _QWORD v42[7];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[7];
  _QWORD v48[7];
  _QWORD v49[7];
  _QWORD v50[7];
  _QWORD v51[7];
  _QWORD v52[7];
  _QWORD v53[7];
  _QWORD v54[7];
  _QWORD v55[7];
  _QWORD v56[7];
  _QWORD v57[7];
  _QWORD v58[7];

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v3 = xpc_array_create(0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21WCI2AntDebug_:Updating antenna map params to cellular modem"));
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BBWCI2Type7mmWaveTxOn")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB21WCI2AntDebug_: Enable ARBuffer mmW TX on bit"));
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  }
  xdict = v4;
  if (v2 <= 20)
  {
    if ((v2 - 16) < 4)
    {
      v49[0] = CFSTR("Ant-1");
      v50[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
      v49[1] = CFSTR("Ant-2");
      v50[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v49[2] = CFSTR("Ant-3");
      v50[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
      v49[3] = CFSTR("Ant-4");
      v50[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v49[4] = CFSTR("Ant-7");
      v50[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
      v49[5] = CFSTR("Ant-8");
      v50[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8);
      v49[6] = CFSTR("Ant-9");
      v50[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9);
      v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 7);
      v47[0] = CFSTR("Ant-1");
      v48[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      v47[1] = CFSTR("Ant-2");
      v48[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v47[2] = CFSTR("Ant-3");
      v48[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v47[3] = CFSTR("Ant-4");
      v48[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
      v47[4] = CFSTR("Ant-7");
      v48[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      v47[5] = CFSTR("Ant-8");
      v48[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v47[6] = CFSTR("Ant-9");
      v48[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 7);
      for (i = 0; i != 10; ++i)
      {
        v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v8, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
        v9 = -[NSDictionary allKeysForObject:](v5, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", i));
        if (-[NSArray count](v9, "count"))
          v10 = (int)objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0)), "intValue");
        else
          v10 = 0;
        xpc_dictionary_set_uint64(v8, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v10);
        xpc_array_append_value(v3, v8);
      }
      goto LABEL_10;
    }
LABEL_43:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("BB21: platformID not defined to configure CellTxAntIdx over the bus"));
    goto LABEL_10;
  }
  if (v2 > 143)
  {
    if (v2 == 146)
    {
      v53[0] = CFSTR("Ant-1a");
      v54[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
      v53[1] = CFSTR("Ant-1b");
      v54[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v53[2] = CFSTR("Ant-2a");
      v54[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
      v53[3] = CFSTR("Ant-2b");
      v54[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v53[4] = CFSTR("Ant-3a");
      v54[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
      v53[5] = CFSTR("Ant-3b");
      v54[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
      v53[6] = CFSTR("Ant-4");
      v54[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
      v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 7);
      v51[0] = CFSTR("Ant-1a");
      v52[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      v51[1] = CFSTR("Ant-1b");
      v52[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
      v51[2] = CFSTR("Ant-2a");
      v52[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v51[3] = CFSTR("Ant-2b");
      v52[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
      v51[4] = CFSTR("Ant-3a");
      v52[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v51[5] = CFSTR("Ant-3b");
      v52[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
      v51[6] = CFSTR("Ant-4");
      v52[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
      v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 7);
      for (j = 0; j != 10; ++j)
      {
        v34 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v34, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j);
        v35 = -[NSDictionary allKeysForObject:](v31, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", j));
        if (-[NSArray count](v35, "count"))
          v36 = (int)objc_msgSend(-[NSDictionary objectForKey:](v32, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v35, "objectAtIndexedSubscript:", 0)), "intValue");
        else
          v36 = 0;
        xpc_dictionary_set_uint64(v34, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v36);
        xpc_array_append_value(v3, v34);
      }
    }
    else
    {
      if (v2 != 144)
        goto LABEL_43;
      v57[0] = CFSTR("Ant-1a");
      v58[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
      v57[1] = CFSTR("Ant-1b");
      v58[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v57[2] = CFSTR("Ant-2");
      v58[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
      v57[3] = CFSTR("Ant-3a");
      v58[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v57[4] = CFSTR("Ant-3b");
      v58[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
      v57[5] = CFSTR("Ant-4");
      v58[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
      v57[6] = CFSTR("Ant-5T");
      v58[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
      v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 7);
      v55[0] = CFSTR("Ant-1a");
      v56[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      v55[1] = CFSTR("Ant-1b");
      v56[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
      v55[2] = CFSTR("Ant-2");
      v56[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
      v55[3] = CFSTR("Ant-3a");
      v56[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
      v55[4] = CFSTR("Ant-3b");
      v56[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
      v55[5] = CFSTR("Ant-4");
      v56[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
      v55[6] = CFSTR("Ant-5T");
      v56[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
      v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 7);
      for (k = 0; k != 10; ++k)
      {
        v22 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v22, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", k);
        v23 = -[NSDictionary allKeysForObject:](v19, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", k));
        if (-[NSArray count](v23, "count"))
          v24 = (int)objc_msgSend(-[NSDictionary objectForKey:](v20, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 0)), "intValue");
        else
          v24 = 0;
        xpc_dictionary_set_uint64(v22, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v24);
        xpc_array_append_value(v3, v22);
      }
    }
  }
  else if (v2 == 21)
  {
    v45[0] = CFSTR("Ant-1");
    v46[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
    v45[1] = CFSTR("Ant-2");
    v46[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v45[2] = CFSTR("Ant-3");
    v46[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
    v45[3] = CFSTR("Ant-4");
    v46[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v45[4] = CFSTR("Ant-6");
    v46[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
    v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
    v43[0] = CFSTR("Ant-1");
    v44[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v43[1] = CFSTR("Ant-2");
    v44[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
    v43[2] = CFSTR("Ant-3");
    v44[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v43[3] = CFSTR("Ant-4");
    v44[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
    v43[4] = CFSTR("Ant-6");
    v44[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
    for (m = 0; m != 10; ++m)
    {
      v28 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v28, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", m);
      v29 = -[NSDictionary allKeysForObject:](v25, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", m));
      if (-[NSArray count](v29, "count"))
        v30 = (int)objc_msgSend(-[NSDictionary objectForKey:](v26, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", 0)), "intValue");
      else
        v30 = 0;
      xpc_dictionary_set_uint64(v28, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v30);
      xpc_array_append_value(v3, v28);
    }
  }
  else
  {
    if (v2 != 131)
      goto LABEL_43;
    v41[0] = CFSTR("Ant-1a");
    v42[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
    v41[1] = CFSTR("Ant-1b");
    v42[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v41[2] = CFSTR("Ant-2a");
    v42[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8);
    v41[3] = CFSTR("Ant-2b");
    v42[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v41[4] = CFSTR("Ant-3a");
    v42[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
    v41[5] = CFSTR("Ant-3b");
    v42[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
    v41[6] = CFSTR("Ant-4");
    v42[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
    v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 7);
    v39[0] = CFSTR("Ant-1a");
    v40[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v39[1] = CFSTR("Ant-1b");
    v40[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
    v39[2] = CFSTR("Ant-2a");
    v40[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v39[3] = CFSTR("Ant-2b");
    v40[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
    v39[4] = CFSTR("Ant-3a");
    v40[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v39[5] = CFSTR("Ant-3b");
    v40[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
    v39[6] = CFSTR("Ant-4");
    v40[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 7);
    for (n = 0; n != 10; ++n)
    {
      v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v16, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", n);
      v17 = -[NSDictionary allKeysForObject:](v13, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", n));
      if (-[NSArray count](v17, "count"))
        v18 = (int)objc_msgSend(-[NSDictionary objectForKey:](v14, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0)), "intValue");
      else
        v18 = 0;
      xpc_dictionary_set_uint64(v16, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v18);
      xpc_array_append_value(v3, v16);
    }
  }
LABEL_10:
  xpc_dictionary_set_value(xdict, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1215, xdict);
  if (xpc_array_get_count(v3))
  {
    v11 = 0;
    do
    {
      value = xpc_array_get_value(v3, v11);
      xpc_release(value);
      ++v11;
    }
    while (v11 < xpc_array_get_count(v3));
  }
  xpc_release(v3);
  xpc_release(xdict);
}

- (void)ConstructAntennaMapXpcMsg:(id)a3 AntPhyIdxDict:(id)a4 AntSpmiIdxDict:(id)a5
{
  uint64_t i;
  xpc_object_t v9;
  id v10;
  uint64_t v11;

  if (a3 && a4 && a5)
  {
    for (i = 0; i != 10; ++i)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
      v10 = objc_msgSend(a4, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", i));
      if (objc_msgSend(v10, "count"))
        v11 = (int)objc_msgSend(objc_msgSend(a5, "objectForKey:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)), "intValue");
      else
        v11 = 0;
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v11);
      xpc_array_append_value(a3, v9);
    }
  }
}

- (void)setWci2TxAntMapBB22
{
  unsigned int v2;
  xpc_object_t v3;
  xpc_object_t v4;
  BOOL v5;
  NSDictionary *v6;
  NSDictionary *v7;
  uint64_t j;
  xpc_object_t v9;
  NSArray *v10;
  uint64_t v11;
  NSDictionary *v12;
  NSDictionary *v13;
  uint64_t i;
  xpc_object_t v15;
  NSArray *v16;
  uint64_t v17;
  NSDictionary *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  size_t v22;
  xpc_object_t value;
  xpc_object_t xdict;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[7];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[7];
  _QWORD v37[7];
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[7];
  _QWORD v43[7];
  _QWORD v44[7];
  _QWORD v45[7];
  _QWORD v46[7];
  _QWORD v47[7];
  _QWORD v48[7];
  _QWORD v49[7];
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[6];

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v3 = xpc_array_create(0, 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB22AntMapping_:Updating antenna map params to cellular modem"));
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BBWCI2Type7mmWaveTxOn")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB22WCI2AntDebug_: Enable ARBuffer mmW TX on bit"));
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  }
  v5 = v2 > 0x39 || ((1 << v2) & 0x3FC000003C00000) == 0;
  xdict = v4;
  if (v5)
  {
    switch(v2)
    {
      case 0x9Au:
      case 0x9Bu:
      case 0x9Du:
      case 0x9Eu:
        v52[0] = CFSTR("Ant-1");
        v53[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v52[1] = CFSTR("Ant-2a");
        v53[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
        v52[2] = CFSTR("Ant-2b");
        v53[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v52[3] = CFSTR("Ant-3");
        v53[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v52[4] = CFSTR("Ant-4a");
        v53[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v52[5] = CFSTR("Ant-4b");
        v53[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
        v50[0] = CFSTR("Ant-1");
        v51[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v50[1] = CFSTR("Ant-2a");
        v51[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v50[2] = CFSTR("Ant-2b");
        v51[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v50[3] = CFSTR("Ant-3");
        v51[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
        v50[4] = CFSTR("Ant-4a");
        v51[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v50[5] = CFSTR("Ant-4b");
        v51[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 6);
        for (i = 0; i != 10; ++i)
        {
          v15 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v15, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
          v16 = -[NSDictionary allKeysForObject:](v12, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", i));
          if (-[NSArray count](v16, "count"))
            v17 = (int)objc_msgSend(-[NSDictionary objectForKey:](v13, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0)), "intValue");
          else
            v17 = 0;
          xpc_dictionary_set_uint64(v15, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v17);
          xpc_array_append_value(v3, v15);
        }
        break;
      case 0xA2u:
        v44[0] = CFSTR("Ant-1a");
        v45[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
        v44[1] = CFSTR("Ant-1b");
        v45[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v44[2] = CFSTR("Ant-2a");
        v45[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v44[3] = CFSTR("Ant-2b");
        v45[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v44[4] = CFSTR("Ant-3a");
        v45[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v44[5] = CFSTR("Ant-3b");
        v45[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v44[6] = CFSTR("Ant-4");
        v45[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 7);
        v42[0] = CFSTR("Ant-1a");
        v43[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
        v42[1] = CFSTR("Ant-1b");
        v43[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v42[2] = CFSTR("Ant-2a");
        v43[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v42[3] = CFSTR("Ant-2b");
        v43[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v42[4] = CFSTR("Ant-3a");
        v43[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v42[5] = CFSTR("Ant-3b");
        v43[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v42[6] = CFSTR("Ant-4");
        v43[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v19 = v43;
        v20 = v42;
        goto LABEL_25;
      case 0xA4u:
        v40[0] = CFSTR("Ant-1a");
        v41[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
        v40[1] = CFSTR("Ant-1b");
        v41[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v40[2] = CFSTR("Ant-2");
        v41[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v40[3] = CFSTR("Ant-3a");
        v41[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v40[4] = CFSTR("Ant-3b");
        v41[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v40[5] = CFSTR("Ant-4");
        v41[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
        v38[0] = CFSTR("Ant-1a");
        v39[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
        v38[1] = CFSTR("Ant-1b");
        v39[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v38[2] = CFSTR("Ant-2");
        v39[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v38[3] = CFSTR("Ant-3a");
        v39[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v38[4] = CFSTR("Ant-3b");
        v39[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v38[5] = CFSTR("Ant-4");
        v39[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v19 = v39;
        v20 = v38;
        goto LABEL_23;
      case 0xA6u:
        v36[0] = CFSTR("Ant-1a");
        v37[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v36[1] = CFSTR("Ant-1b");
        v37[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v36[2] = CFSTR("Ant-2");
        v37[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v36[3] = CFSTR("Ant-3a");
        v37[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v36[4] = CFSTR("Ant-3b");
        v37[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v36[5] = CFSTR("Ant-4");
        v37[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v36[6] = CFSTR("Ant-5T");
        v37[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
        v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
        v34[0] = CFSTR("Ant-1a");
        v35[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
        v34[1] = CFSTR("Ant-1b");
        v35[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v34[2] = CFSTR("Ant-2");
        v35[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v34[3] = CFSTR("Ant-3a");
        v35[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v34[4] = CFSTR("Ant-3b");
        v35[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v34[5] = CFSTR("Ant-4");
        v35[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v19 = v35;
        v20 = v34;
LABEL_23:
        v21 = 6;
        goto LABEL_26;
      case 0xACu:
        v32[0] = CFSTR("Ant-1a");
        v33[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
        v32[1] = CFSTR("Ant-1b");
        v33[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v32[2] = CFSTR("Ant-2a");
        v33[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v32[3] = CFSTR("Ant-2b");
        v33[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v32[4] = CFSTR("Ant-3a");
        v33[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v32[5] = CFSTR("Ant-3b");
        v33[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v32[6] = CFSTR("Ant-4");
        v33[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
        v30[0] = CFSTR("Ant-1a");
        v31[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
        v30[1] = CFSTR("Ant-1b");
        v31[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
        v30[2] = CFSTR("Ant-2a");
        v31[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
        v30[3] = CFSTR("Ant-2b");
        v31[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
        v30[4] = CFSTR("Ant-3a");
        v31[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
        v30[5] = CFSTR("Ant-3b");
        v31[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
        v30[6] = CFSTR("Ant-4");
        v31[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
        v19 = v31;
        v20 = v30;
LABEL_25:
        v21 = 7;
        goto LABEL_26;
      default:
        if ((v2 & 0xFFFFFFFD) == 0xA8)
        {
          v28[0] = CFSTR("Ant-1");
          v29[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
          v28[1] = CFSTR("Ant-2b");
          v29[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
          v28[2] = CFSTR("Ant-3");
          v29[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
          v28[3] = CFSTR("Ant-4b");
          v29[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
          v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
          v26[0] = CFSTR("Ant-1");
          v27[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
          v26[1] = CFSTR("Ant-2b");
          v27[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
          v26[2] = CFSTR("Ant-3");
          v27[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
          v26[3] = CFSTR("Ant-4b");
          v27[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
          v19 = v27;
          v20 = v26;
          v21 = 4;
LABEL_26:
          -[WCM_CellularController ConstructAntennaMapXpcMsg:AntPhyIdxDict:AntSpmiIdxDict:](self, "ConstructAntennaMapXpcMsg:AntPhyIdxDict:AntSpmiIdxDict:", v3, v18, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21, v4));
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("BB22: platformID not defined to configure CellTxAntIdx over the bus"));
        }
        break;
    }
  }
  else
  {
    v48[0] = CFSTR("Ant-1");
    v49[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
    v48[1] = CFSTR("Ant-2");
    v49[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v48[2] = CFSTR("Ant-3");
    v49[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3);
    v48[3] = CFSTR("Ant-4");
    v49[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v48[4] = CFSTR("Ant-7");
    v49[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7);
    v48[5] = CFSTR("Ant-8");
    v49[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8);
    v48[6] = CFSTR("Ant-9");
    v49[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9);
    v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 7);
    v46[0] = CFSTR("Ant-1");
    v47[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v46[1] = CFSTR("Ant-2");
    v47[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v46[2] = CFSTR("Ant-3");
    v47[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v46[3] = CFSTR("Ant-4");
    v47[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6);
    v46[4] = CFSTR("Ant-7");
    v47[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v46[5] = CFSTR("Ant-8");
    v47[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2);
    v46[6] = CFSTR("Ant-9");
    v47[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
    v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 7);
    for (j = 0; j != 10; ++j)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j);
      v10 = -[NSDictionary allKeysForObject:](v6, "allKeysForObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", j));
      if (-[NSArray count](v10, "count"))
        v11 = (int)objc_msgSend(-[NSDictionary objectForKey:](v7, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0)), "intValue");
      else
        v11 = 0;
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v11);
      xpc_array_append_value(v3, v9);
    }
  }
  xpc_dictionary_set_value(xdict, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1215, xdict);
  if (xpc_array_get_count(v3))
  {
    v22 = 0;
    do
    {
      value = xpc_array_get_value(v3, v22);
      xpc_release(value);
      ++v22;
    }
    while (v22 < xpc_array_get_count(v3));
  }
  xpc_release(v3);
  xpc_release(xdict);
}

- (void)submitAWDMetricsforNetworkConfiguration
{
  int v3;
  id v4;
  void *v5;
  char *v6;
  float64x2_t *v7;
  unsigned __int8 *v8;
  float *v9;
  float *v10;
  int v11;
  float64x2_t *v12;
  id v13;
  uint64_t v14;
  float32x2x2_t v15;
  float32x2x2_t v16;

  v3 = 20;
  if (-[WCM_CellularController activeSubId](self, "activeSubId"))
    v3 = 2756;
  v4 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "initLTECoexMetrics");
  v6 = (char *)objc_msgSend(v5, "getLTECoexMetrics");
  if (v6)
  {
    v7 = (float64x2_t *)((char *)self + v3);
    v8 = (unsigned __int8 *)(v6 + 20);
    *(_OWORD *)(v6 + 24) = 0u;
    v6[20] = 0;
    *(_OWORD *)(v6 + 40) = 0u;
    if (LODWORD(v7[153].f64[0]) >= 2)
    {
      v11 = BYTE4(v7[168].f64[0]);
      *v8 = v11;
      v15.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v7[10]));
      v15.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v7[9]));
      v9 = (float *)(v6 + 24);
      vst2_f32(v9, v15);
      if (v11)
      {
        v12 = (float64x2_t *)((char *)v7 + 72 * SHIDWORD(v7[153].f64[0]) + 144);
        v16.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v12[1]));
        v16.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*v12));
        v10 = (float *)(v6 + 40);
        vst2_f32(v10, v16);
      }
    }
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ANTSELSTATSAWDSTATSCAMigration")))
    {
      v13 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
      LODWORD(v14) = *((_DWORD *)v8 + 8);
      objc_msgSend(v13, "wRMCACoexSubmit_ULCACoexStates:ULCAPrimaryCarrierULFreq:ULCAPrimaryCarrierDLFreq:ULCAPrimaryCarrierULBW:ULCAPrimaryCarrierDLBW:ULCACriticalCarrierULFreq:ULCACriticalCarrierDLFreq:ULCACriticalCarrierULBW:ULCACriticalCarrierDLBW:", *v8, *((unsigned int *)v8 + 1), *((unsigned int *)v8 + 2), *((unsigned int *)v8 + 3), *((unsigned int *)v8 + 4), *((unsigned int *)v8 + 5), *((_QWORD *)v8 + 3), v14);
    }
  }
}

- (void)handleNetworkConfig_bb20:(id)a3
{
  id v5;
  int *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t uint64;
  int *v14;
  int *v15;
  void *v16;
  int v17;
  int v18;
  unsigned int v19;
  size_t v20;
  size_t v21;
  unsigned int v22;
  size_t count;
  size_t v24;
  size_t v25;
  size_t v26;
  BOOL v27;
  BOOL v32;
  uint64_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  size_t v37;
  size_t v38;
  size_t v39;
  size_t v40;
  int64_t v41;
  unsigned int v42;
  uint64_t v43;
  int64_t v44;
  xpc_object_t v45;
  int v46;
  uint64_t v48;
  int64_t v49;
  double v50;
  double v51;
  const char *v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  int64_t int64;
  xpc_object_t v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  int64_t v65;
  int64_t v66;
  WCM_CellularController *v67;
  void *v68;
  __objc2_class **p_superclass;
  int *v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  int *v78;
  __int128 v79;
  uint64_t v80;
  double v81;
  double v82;
  uint64_t v83;
  unsigned int v84;
  xpc_object_t v85;
  xpc_object_t v86;
  uint64_t v87;
  id v88;
  double v89;
  double v90;
  double v91;
  int *v92;
  WCM_CellularController *v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  xpc_object_t v97;
  xpc_object_t v98;
  xpc_object_t v99;
  xpc_object_t v100;
  char v101;
  xpc_object_t xdict;
  xpc_object_t xarray;
  char v104;
  size_t v105;
  unsigned int v106;
  xpc_object_t value;
  unsigned int v108;
  _QWORD applier[7];

  xdict = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!xdict)
    return;
  v5 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
  v6 = &self->super.mProcessId + 1;
  if (-[WCM_CellularController activeSubId](self, "activeSubId"))
    v6 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  v7 = *((double *)v6 + 3);
  v8 = *((double *)v6 + 5);
  v9 = *((double *)v6 + 6);
  v10 = *((double *)v6 + 7);
  v89 = *((double *)v6 + 8);
  v11 = *((double *)v6 + 9);
  v90 = *((double *)v6 + 10);
  v91 = *((double *)v6 + 4);
  v12 = -[WCM_CellularController activeSubId](self, "activeSubId");
  v87 = *((_QWORD *)v6 + 11);
  v88 = (id)v12;
  uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if (!xpc_dictionary_get_count(xdict))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SUB%ld: goes out of interested frequency bands"), uint64);
  v14 = &self->super.mProcessId + 1;
  v96 = uint64;
  if (uint64)
    v14 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  *((_QWORD *)v14 + 12) = 0;
  *((_OWORD *)v14 + 4) = 0u;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((double *)v14 + 3) = (double)xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq");
  *((double *)v14 + 4) = xpc_dictionary_get_double(xdict, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth");
  *((double *)v14 + 5) = (double)xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq");
  *((double *)v14 + 6) = xpc_dictionary_get_double(xdict, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth");
  *((_QWORD *)v14 + 11) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_TTDUL_DL");
  *((_QWORD *)v14 + 12) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_SubFrameFormat");
  *((_QWORD *)v14 + 2) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_FrameOffset");
  *((_OWORD *)v14 + 9) = *(_OWORD *)(v14 + 6);
  v15 = v14 + 36;
  *((_WORD *)v14 + 52) = 0;
  *((_QWORD *)v14 + 306) = 1;
  *((_OWORD *)v14 + 10) = *(_OWORD *)(v14 + 10);
  v14[44] = *((_QWORD *)v14 + 17);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_Enable:", 1);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 0);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "setWcmCellularCCSetToBB:", 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA handleNetworkConfig-1-ULCA critical bitmap %d"), objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  if (*((double *)v14 + 5) != 0.0)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("SUB%ld:  ULCA Logging -  case kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq UL-(freq=%lf bw=%lf)  DL(freq=%lf, bw=%lf) "), uint64, *((_QWORD *)v14 + 18), *((_QWORD *)v14 + 19), *((_QWORD *)v14 + 20), *((_QWORD *)v14 + 21));
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000B363C;
  applier[3] = &unk_100204C70;
  applier[4] = uint64;
  applier[5] = v14;
  v16 = xdict;
  xpc_dictionary_apply(xdict, applier);
  value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_TDSCDMABandInformationSet");
  if (value)
  {
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v17 = 2;
LABEL_21:
    v14[32] = v17;
    goto LABEL_22;
  }
  value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_GSMBandInformationSet");
  if (value)
  {
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v17 = 4;
    goto LABEL_21;
  }
  value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_ONEXBandInformationSet");
  if (value)
  {
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v17 = 8;
    goto LABEL_21;
  }
  value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_HDRBandInformationSet");
  if (value)
  {
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v17 = 16;
    goto LABEL_21;
  }
  value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet");
  if (value)
  {
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v17 = 32;
    goto LABEL_21;
  }
  v85 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  if (v85)
    value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  else
    value = 0;
  v86 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
  if (v86)
    value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20 NGC Bandinfo present lte %d NGC %d "), v85 != 0, v86 != 0);
  if (!v86 && v85)
  {
    v14[32] = 1;
    v16 = xdict;
    v99 = 0;
    v100 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
LABEL_169:
    v108 = 0;
    goto LABEL_22;
  }
  if (!v85 && v86)
  {
    v14[32] = 64;
    v16 = xdict;
    v99 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
    v100 = 0;
    goto LABEL_169;
  }
  if (v85 == 0 || v86 == 0)
  {
    v14[32] = 127;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("SUB%ld: Band Info parsing second pass result -- unknown band info set"));
    v99 = 0;
    v100 = 0;
    v108 = 0;
    v16 = xdict;
  }
  else
  {
    v16 = xdict;
    v100 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
    v99 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
    v108 = 1;
  }
LABEL_22:
  v18 = v14[32];
  v93 = self;
  v92 = &self->super.mProcessId + 1;
  if (v18 != 1 && v18 != 64)
  {
    if ((v108 & 1) == 0)
    {
      if (v18 == 127)
        goto LABEL_120;
      v97 = 0;
      v98 = 0;
      goto LABEL_68;
    }
LABEL_29:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20 bandinfotype is ENDC"));
    if (xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet"))
      v98 = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet");
    else
      v98 = 0;
    if (xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet"))
      v97 = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet");
    else
      v97 = 0;
    v22 = 0;
    count = 0;
    if (v98 && v97 && v100)
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      if (v99)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20 carrierIdInformation for LTE and NR Present"));
        count = xpc_array_get_count(v98);
        v24 = xpc_array_get_count(v97);
        v25 = xpc_array_get_count(v100);
        v26 = xpc_array_get_count(v99);
        if (v25)
          v27 = count == 0;
        else
          v27 = 1;
        v22 = !v27 && v25 == count && v26 == v24 && v26 != 0 && v24 != 0;
      }
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB20 Band and Carrier Info counts for lte and NR, parseCondition, with valid xpc container %d %d %d %d %d"), v25, count, v26, v24, v22);
    if (!v22)
      goto LABEL_120;
LABEL_68:
    xarray = 0;
    goto LABEL_80;
  }
  if (v108)
    goto LABEL_29;
  if (v18 == 1 && xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet"))
    xarray = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet");
  else
    xarray = 0;
  if (v14[32] == 64 && xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet"))
    xarray = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet");
  v19 = 0;
  v20 = 0;
  if (value)
  {
    v21 = 0;
    if (xarray)
    {
      v20 = xpc_array_get_count(xarray);
      v21 = xpc_array_get_count(value);
      v19 = 1;
    }
  }
  else
  {
    v21 = 0;
  }
  if (v21)
    v32 = v20 == 0;
  else
    v32 = 1;
  if (v32)
    v19 = 0;
  if (v21 == v20)
    v33 = v19;
  else
    v33 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB20 CarrierIdSet Bandinfotype %d Carrier count %d BandInfo Count %d parseCondition %d"), v14[32], v20, v21, v33);
  if ((_DWORD)v33)
  {
    v97 = 0;
    v98 = 0;
LABEL_80:
    v34 = xpc_array_get_count(value);
    if ((v108 & objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("Bb20EndcSupport"))) == 1)
    {
      v35 = xpc_array_get_count(v100);
      v36 = xpc_array_get_count(v99);
      v37 = (v36 + v35);
      v38 = v36;
      v39 = v35;
    }
    else
    {
      v38 = 0;
      v39 = 0;
      v37 = v34;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20 CarrierIdSet %d %d %d %d"), v108, v37, v39, v38);
    if ((_DWORD)v37)
    {
      v40 = 0;
      v104 = 0;
      v41 = 0;
      v94 = 0;
      v101 = 0;
      v106 = 0;
      v42 = 0;
      v43 = v37;
      v105 = v39;
      v95 = -(uint64_t)v39;
      while (v108)
      {
        if (v40 >= v105)
        {
          int64 = xpc_array_get_int64(v97, v95 + v40);
          v59 = xpc_array_get_value(v99, v95 + v40);
          v45 = v59;
          v14[32] = 64;
          if ((v104 & 1) == 0)
            v42 = v106;
          v104 = 1;
          v41 = int64;
          if (!v59)
            goto LABEL_118;
          goto LABEL_97;
        }
        v44 = xpc_array_get_int64(v98, v40);
        v45 = xpc_array_get_value(v100, v40);
        v14[32] = 1;
        v41 = v44;
        if (v45)
          goto LABEL_97;
LABEL_118:
        if (v43 == ++v40)
          goto LABEL_121;
      }
      v45 = xpc_array_get_value(value, v40);
      v46 = v14[32];
      if (v46 == 64 || v46 == 1)
        v41 = xpc_array_get_int64(xarray, v40);
      if (!v45)
        goto LABEL_118;
LABEL_97:
      v48 = xpc_dictionary_get_uint64(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask");
      v49 = xpc_dictionary_get_int64(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq");
      v50 = xpc_dictionary_get_double(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth");
      v51 = v50;
      v52 = "unknown";
      if (v48 == 2)
        v52 = "downlink";
      if (v48 == 1)
        v52 = "uplink";
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("directionMask(%d:%s) centerFreq(%ld) bandwidth(%lf) carrierId(%d) index(%d)"), v48, v52, v49, *(_QWORD *)&v50, v41, v40);
      if (v49 >= 1)
      {
        if (v48 == 1)
        {
          v53 = (double)v49 / 1000.0;
          v54 = v51 / 1000000.0;
          v55 = 6;
          if ((v101 & 1) != 0)
            v55 = 14;
          v56 = 16;
          if ((v101 & 1) == 0)
            v56 = 8;
          *(double *)&v14[v55] = v53;
          *(double *)&v14[v56] = v54;
          v57 = &v15[18 * v42];
          *(double *)v57 = v53;
          *((double *)v57 + 1) = v54;
          v57[16] = v14[32];
          v57[8] = v41;
          ++v42;
          v101 = 1;
        }
        else if (v48 == 2)
        {
          v60 = (double)v49 / 1000.0;
          v61 = v51 / 1000000.0;
          v62 = 10;
          if ((v94 & 1) != 0)
            v62 = 18;
          v63 = 12;
          if ((v94 & 1) != 0)
            v63 = 20;
          *(double *)&v14[v62] = v60;
          *(double *)&v14[v63] = v61;
          v64 = &v15[18 * v106];
          *((double *)v64 + 2) = v60;
          *((double *)v64 + 3) = v61;
          v64[16] = v14[32];
          ++v106;
          v94 = 1;
        }
      }
      goto LABEL_118;
    }
  }
LABEL_120:
  v106 = 0;
LABEL_121:
  if (*((_BYTE *)v14 + 104))
  {
    v65 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULCPConfig");
    v66 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLCPConfig");
    v68 = v5;
    v67 = v93;
    p_superclass = (__objc2_class **)(WRM_SCService + 8);
    v70 = v92;
    if (*((double *)v14 + 3) != 0.0)
    {
      v71 = v66;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("SUB%lld: RRC-connected cell notification ULCP(%lld -> %lld) DLCP(%lld -> %lld)"), v96, *(_QWORD *)v14, v65, *((_QWORD *)v14 + 1), v66);
      if (v65 != 255)
        *(_QWORD *)v14 = v65;
      if (v71 != 255)
        *((_QWORD *)v14 + 1) = v71;
    }
  }
  else
  {
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    v68 = v5;
    v67 = v93;
    p_superclass = WRM_SCService.superclass;
    v70 = v92;
  }
  v72 = *((_QWORD *)v14 + 3);
  v73 = *((_QWORD *)v14 + 4);
  *((_QWORD *)v14 + 338) = v72;
  *((_QWORD *)v14 + 339) = v73;
  v74 = *((_QWORD *)v14 + 5);
  v75 = *((_QWORD *)v14 + 6);
  *((_QWORD *)v14 + 340) = v74;
  *((_QWORD *)v14 + 341) = v75;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("SUB%lld: Network Config UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), v96, v72, v73, *((_QWORD *)v14 + 7), *((_QWORD *)v14 + 8), v74, v75, *((_QWORD *)v14 + 9), *((_QWORD *)v14 + 10), *((_QWORD *)v14 + 11), *((_QWORD *)v14 + 12), *(_QWORD *)v14, *((_QWORD *)v14 + 1), *((_QWORD *)v14 + 2));
  *((_QWORD *)v14 + 306) = v106;
  *((_BYTE *)v14 + 2692) = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Logging   ----------"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Config   ----------"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Total valid entries =%d"), v14[612]);
  if (v14[612])
  {
    v76 = 0;
    do
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Entry index %ld ..UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), carrierid(%d), bandInfoType(%d)"), v76++, *(_QWORD *)v15, *((_QWORD *)v15 + 1), *((_QWORD *)v15 + 2), *((_QWORD *)v15 + 3), v15[8], v15[16]);
      v15 += 18;
    }
    while (v76 < v14[612]);
  }
  -[WCM_CellularController setActiveSubId:](v67, "setActiveSubId:", -[WCM_CellularController subSelector](v67, "subSelector"));
  if (-[WCM_CellularController activeSubId](v67, "activeSubId"))
    v70 = (int *)&v67->_cellularInstance0.primarydlBandwidth + 1;
  -[WCM_CellularController setActiveConfig:](v67, "setActiveConfig:", v70);
  objc_msgSend(v68, "evaluateULCARestrictions");
  v77 = v70[613];
  v78 = &v70[18 * (int)v77 + 36];
  v79 = *(_OWORD *)v78;
  *(_OWORD *)(v70 + 10) = *((_OWORD *)v78 + 1);
  *(_OWORD *)(v70 + 6) = v79;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: After ULCA evaluation, CC1 (cellularConfig->activeULCAConfig.criticalCarrier) = %d, CC2 (cellularConfig->activeULCAConfig.criticalCarrieridxWiFiVictim)=%d, CCn79 (cellularConfig->activeULCAConfig.criticalCarrieridxNR79) = %d"), v77, v70[614], v70[615]);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA After coex valuation   ----------"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Critical carrier found = %d, index = %d"), *((unsigned __int8 *)v70 + 2692), v70[613]);
  v80 = (uint64_t)&v70[18 * v70[613] + 36];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), bandInfoType=%d"), *(_QWORD *)v80, *(_QWORD *)(v80 + 8), *(_QWORD *)(v80 + 16), *(_QWORD *)(v80 + 24), *(unsigned int *)(v80 + 64));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("ULCA Final Frequencies for COEX consideration :- SUB%lld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld"), v96, *((_QWORD *)v70 + 3), *((_QWORD *)v70 + 4), *((_QWORD *)v70 + 5), *((_QWORD *)v70 + 6), *((_QWORD *)v70 + 11), *((_QWORD *)v70 + 12), *(_QWORD *)v70, *((_QWORD *)v70 + 1), *((_QWORD *)v70 + 2));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("-------- ULCA Logging END  ----------"));
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularWCI2Mode_Ext_Enable:", 1);
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", v70[18 * v70[613] + 44]);
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularWCI2Mode_CC2:", v70[18 * v70[614] + 44]);
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellular_CC1_Tech:", v70[18 * v70[613] + 52]);
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellular_CC2_Tech:", v70[18 * v70[614] + 52]);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("wcmCellular_CC1_Tech = %llu, wcmCellular_CC2_Tech = %llu"), objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "wcmCellular_CC1_Tech"), objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "wcmCellular_CC2_Tech"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA handleNetworkConfig-3-ULCA critical bitmap / carrierId %lld"), objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "setWcmCellularCCSetToBB:", 0);
  -[WCM_CellularController submitAWDMetricsforNetworkConfiguration](v67, "submitAWDMetricsforNetworkConfiguration");
  v81 = *((double *)v70 + 5);
  if (v81 == 0.0 || v8 != 0.0 && v81 != v8)
  {
    *((_QWORD *)v70 + 14) = 0;
    *((_QWORD *)v70 + 15) = 0;
  }
  v82 = *((double *)v70 + 3);
  if (v82 != 0.0)
  {
    v83 = *((_QWORD *)v70 + 4);
    *((double *)v70 + 14) = v82;
    *((_QWORD *)v70 + 15) = v83;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("CellularNWCfgCmdFilter"))&& (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")) & 1) == 0)
  {
    if (v8 == *((double *)v70 + 5)
      && v7 == *((double *)v70 + 3)
      && v11 == *((double *)v70 + 9)
      && v10 == *((double *)v70 + 7)
      && v9 == *((double *)v70 + 6)
      && v91 == *((double *)v70 + 4)
      && v90 == *((double *)v70 + 10)
      && v89 == *((double *)v70 + 8)
      && v88 == (id)-[WCM_CellularController activeSubId](v67, "activeSubId")
      && v87 == *((_QWORD *)v70 + 11))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("NW Config Parameters are the same, hence ignoring the network config command"));
      return;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("NW Config Parameters are NOT the same, hence handling the network config command"));
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("ClkAlgnTDDFix")))
  {
    v84 = -[WCM_CellularController clkAlgnTDDFreqCheck](v67, "clkAlgnTDDFreqCheck");
    *((_BYTE *)v70 + 105) = v84;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("clkAlgnTDDFreqCheck: After sorting over all cells, setting cellularConfig->btClkAlgnFlag = %d"), v84);
  }
  if (objc_msgSend(objc_msgSend(v68, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Receive update of Cell Config, update critical caller, wcmCellularCCSetToBB = %d"), objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "wcmCellularCCSetToBB"));
    -[WCM_CellularController setAllCriticalCarriers](v67, "setAllCriticalCarriers");
  }
  objc_msgSend(objc_msgSend(p_superclass + 444, "singleton"), "updateControllerState:", 300);
}

- (unint64_t)subSelector
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v10;

  v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  if (v3)
  {
    v4 = (uint64_t)objc_msgSend(v3, "getUserDataPreferredSlot");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB20 subSelector  active sub %d "), v4);
  }
  else
  {
    v4 = 1;
  }
  v5 = *(double *)((char *)&self->_cellularInstance0.frameOffset + 4);
  v6 = *(double *)((char *)&self->_cellularInstance1.frameOffset + 4);
  v10 = 0x100010000000101;
  if (v4 == 1)
  {
    v7 = (uint64_t *)((char *)&v10 + 4);
  }
  else
  {
    if (v4 != 2)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v7 = &v10;
  }
  v8 = *((unsigned __int8 *)v7 + 2 * (v5 != 0.0) + (v6 != 0.0));
LABEL_10:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BB20 subSelector rrc states %d %d, selected sub %llu"), v5 != 0.0, v6 != 0.0, v8, v10);
  return v8;
}

- (void)sendBBCameraState:(int)a3 state:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v5;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  size_t v13;
  xpc_object_t value;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = xpc_uint64_create(v5);
  v9 = xpc_array_create(0, 0);
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB23: Requests to send camera info type %d enabled? %d"), v5, v4);
  v12 = xpc_uint64_create(v4);
  xpc_array_append_value(v9, v12);
  xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_Type", v8);
  xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_ByteList", v9);
  xpc_array_append_value(v11, v10);
  xpc_dictionary_set_value(v7, "kWCMCellularTransparentMessageInformationSet", v11);
  -[WCM_CellularController sendMessage:withArgs:](self, "sendMessage:withArgs:", 1223, v7);
  if (xpc_array_get_count(v9))
  {
    v13 = 0;
    do
    {
      value = xpc_array_get_value(v9, v13);
      xpc_release(value);
      ++v13;
    }
    while (xpc_array_get_count(v9) > v13);
  }
  xpc_release(v10);
  xpc_release(v8);
  xpc_release(v7);
  xpc_release(v11);
  xpc_release(v9);
}

- (void)setWci2TxPowerLimit:(int64_t)a3
{
  *(_QWORD *)&self->_rc1priority = a3;
}

- (void)setControllerTxPowerLimit:(int64_t)a3
{
  *(int64_t *)((char *)&self->_wci2TxPowerLimit + 4) = a3;
}

- (void)setRbThreshold:(int64_t)a3
{
  *(int64_t *)((char *)&self->_controllerTxPowerLimit + 4) = a3;
}

- (BOOL)lteCDRXWiFiTDD
{
  return self->_sensorInfo.usecase[0];
}

- (void)setLteCDRXWiFiTDD:(BOOL)a3
{
  self->_sensorInfo.usecase[0] = a3;
}

- (BOOL)enableFastCharging
{
  return self->_sensorInfo.usecase[1];
}

- (void)setEnableFastCharging:(BOOL)a3
{
  self->_sensorInfo.usecase[1] = a3;
}

- (BOOL)lowBandInABSReportFastCharging
{
  return self->_sensorInfo.usecase[2];
}

- (void)setLowBandInABSReportFastCharging:(BOOL)a3
{
  self->_sensorInfo.usecase[2] = a3;
}

- (NSTimer)baseBandEnabledProtectionTimer
{
  return *(NSTimer **)((char *)&self->_wci2CoexPolicyBitmap + 4);
}

- (void)setBaseBandEnabledProtectionTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 5548);
}

- (NSTimer)fastChargingHystersisTimer
{
  return *(NSTimer **)((char *)&self->_baseBandEnabledProtectionTimer + 4);
}

- (void)setFastChargingHystersisTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 5556);
}

- (unint64_t)wifiCenterFreqMHz
{
  return *(unint64_t *)((char *)&self->_fastChargingHystersisTimer + 4);
}

- (void)setWifiCenterFreqMHz:(unint64_t)a3
{
  *(NSTimer **)((char *)&self->_fastChargingHystersisTimer + 4) = (NSTimer *)a3;
}

- (unint64_t)wifiBandwidthMHz
{
  return *(unint64_t *)((char *)&self->_wifiCenterFreqMHz + 4);
}

- (void)setWifiBandwidthMHz:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_wifiCenterFreqMHz + 4) = a3;
}

- (unint64_t)wifiTxPowerdBm
{
  return *(unint64_t *)((char *)&self->_wifiBandwidthMHz + 4);
}

- (void)setWifiTxPowerdBm:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_wifiBandwidthMHz + 4) = a3;
}

- (int)watchAntPref
{
  return *(_DWORD *)&self->_lteCDRXWiFiTDD;
}

- (void)setWatchAntPref:(int)a3
{
  *(_DWORD *)&self->_lteCDRXWiFiTDD = a3;
}

- (int)watchAntPrefBand
{
  return self->_watchAntPref;
}

- (void)setWatchAntPrefBand:(int)a3
{
  self->_watchAntPref = a3;
}

- (void)setActiveConfig:(id *)a3
{
  *(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) = (unint64_t)a3;
}

- (void)setActiveSubId:(unint64_t)a3
{
  *($18E34B6F31A8113A84A5E642390E7364 **)((char *)&self->_activeConfig + 4) = ($18E34B6F31A8113A84A5E642390E7364 *)a3;
}

- (unint64_t)rc1duration
{
  return *(unint64_t *)((char *)&self->_activeSubId + 4);
}

- (void)setRc1duration:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_activeSubId + 4) = a3;
}

- (int)rc1priority
{
  return self->_watchAntPrefBand;
}

- (void)setRc1priority:(int)a3
{
  self->_watchAntPrefBand = a3;
}

- (unint64_t)CC1CarrierId
{
  return *(unint64_t *)((char *)&self->_rc1duration + 4);
}

- (void)setCC1CarrierId:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rc1duration + 4) = a3;
}

- (unint64_t)CC2CarrierId
{
  return *(unint64_t *)((char *)&self->_CC1CarrierId + 4);
}

- (void)setCC2CarrierId:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC1CarrierId + 4) = a3;
}

- (unint64_t)CC1Tech
{
  return *(unint64_t *)((char *)&self->_CC2CarrierId + 4);
}

- (void)setCC1Tech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC2CarrierId + 4) = a3;
}

- (unint64_t)CC2Tech
{
  return *(unint64_t *)((char *)&self->_CC1Tech + 4);
}

- (void)setCC2Tech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC1Tech + 4) = a3;
}

@end

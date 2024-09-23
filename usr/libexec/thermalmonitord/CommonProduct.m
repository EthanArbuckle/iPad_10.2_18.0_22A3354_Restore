@implementation CommonProduct

- (void)tryTakeAction
{
  NSMutableArray *listofComponentControl;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(listofComponentControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "testLoadingIndexLevel");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[CPMSHelper publishDetailedMitigationArrayToCPMS](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "publishDetailedMitigationArrayToCPMS");
  -[ArcController update](self->_arcController, "update");
}

- (int)maxControlEffort
{
  NSMutableArray *listOfSupervisorControl;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  void *i;
  signed int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0x80000000;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = 0x80000000;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(listOfSupervisorControl);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "controlEffort");
      if (v6 <= v8)
        v6 = v8;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (void)handleMCSThermalPressure
{
  signed int v2;
  signed int v5;
  int v6;
  int v9;
  NSObject *v10;
  int v12;
  NSObject *v13;
  int v15;
  int v16;

  v2 = -[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("mTPL"));
  if (v2 != dword_1000A2420 && v2 != -12700 && v2 != -1)
  {
    v9 = v2;
    sub_10002E320(v2);
    dword_1000A2420 = v9;
    v10 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> mTPL = %d", (uint8_t *)&v15, 8u);
    }
  }
  v5 = -[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("mTLL"));
  v6 = dword_1000A2424;
  if (v5 != dword_1000A2424 && v5 != -12700 && v5 != -1)
  {
    v12 = v5;
    sub_10002E330(v5);
    dword_1000A2424 = v12;
    v13 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> mTLL = %d", (uint8_t *)&v15, 8u);
      v6 = dword_1000A2424;
    }
    else
    {
      v6 = v12;
    }
  }
  qword_1000A2478 = v6;
  sub_100008A64();
}

- (void)emitThermalTrendNotifications
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;

  v2 = -[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("mTTT"));
  v3 = -[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("mTRC"));
  v4 = v3;
  if (v2 != dword_1000A2428)
  {
    if (v2 == -1)
      return;
    goto LABEL_9;
  }
  if (v3 != dword_1000A242C && v2 != -1)
  {
LABEL_9:
    objc_msgSend((id)qword_1000A2488, "updatetimeToMitigateNotification:AndReasonCode:", v2, v3);
    dword_1000A2428 = v2;
    dword_1000A242C = v4;
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      v8 = 1024;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Time to Mitigate = %d, Mitigation reason code = %d", (uint8_t *)v7, 0xEu);
    }
  }
}

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return (self->_PMUtcalAdjustMask >> a3) & 1;
}

- (int)totalSensors
{
  return self->_totalSensorCount;
}

- (int)numberOfFields
{
  return 7;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  uint64_t v4;
  __CFString *result;
  const __CFAllocator *v6;
  int64_t thermalPressureLevel;
  const __CFAllocator *v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
      v3 = kCFAllocatorDefault;
      v4 = qword_1000A2478;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), v4);
    case 1:
      v3 = kCFAllocatorDefault;
      v4 = 100;
      if (!byte_10009A1F0)
        v4 = 0;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), v4);
    case 2:
      v6 = kCFAllocatorDefault;
      thermalPressureLevel = self->thermalPressureLevel;
      return (__CFString *)CFStringCreateWithFormat(v6, 0, CFSTR("%d"), thermalPressureLevel);
    case 3:
      v6 = kCFAllocatorDefault;
      thermalPressureLevel = self->_chargerState;
      return (__CFString *)CFStringCreateWithFormat(v6, 0, CFSTR("%d"), thermalPressureLevel);
    case 4:
      v8 = kCFAllocatorDefault;
      v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
      goto LABEL_13;
    case 5:
      v8 = kCFAllocatorDefault;
      v9 = -[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage");
      goto LABEL_13;
    case 6:
      v8 = kCFAllocatorDefault;
      v9 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
LABEL_13:
      result = (__CFString *)CFStringCreateWithFormat(v8, 0, CFSTR("%d"), v9);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)updatePowerzoneTelemetry
{
  -[PowerZoneTelemetry queryData](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "queryData");
}

- (void)updateLifetimeServo
{
  LifetimeServoController *lifetimeServoController;

  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController)
    -[LifetimeServoController updateForTempMax:tempAverage:](lifetimeServoController, "updateForTempMax:tempAverage:", -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax"), -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage"));
}

- (void)updateDisplayDriver:(BOOL)a3
{
  uint64_t v4;
  _BOOL4 haveUsedDeferral;
  BOOL *p_haveUsedDeferral;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFTypeID v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[5];
  int v24;
  int v25;
  int v26;
  int valuePtr;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  int v30;

  if (qword_1000A2E30)
  {
    v4 = *((unsigned int *)&qword_1000A29AC + self->tsfdIndex);
    if (a3)
    {
      p_haveUsedDeferral = &self->_haveUsedDeferral;
      haveUsedDeferral = self->_haveUsedDeferral;
      self->_blendStillNeeded = 1;
      if (haveUsedDeferral)
      {
        AssertionID = 0;
        v7 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("com.apple.thermalmonitord"), CFSTR("Keeping system awake while performing display temperature ramp"), 0, 0, 5.0, CFSTR("TimeoutActionTurnOff"), &AssertionID);
        if ((_DWORD)v7)
        {
          v8 = v7;
          v9 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_100055A94(v8, v9);
        }
        self->_blendStillNeeded = 0;
        v10 = (const __CFNumber *)IOMobileFramebufferCopyProperty(qword_1000A2E30, CFSTR("InitialPanelTemperature"));
        v11 = v10;
        if (v10 && (v12 = CFGetTypeID(v10), v12 == CFNumberGetTypeID()))
        {
          valuePtr = 0;
          CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
          v13 = (int)((float)valuePtr * 0.0000152587891 * 100.0);
          if (byte_1000A2480)
          {
            v14 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v30 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> TSFD seed %d", buf, 8u);
            }
          }
          v15 = 0;
          v16 = 0;
          v17 = v4 - v13;
          if ((int)v4 < v13)
            v17 = v4 - v13 + 7;
          v18 = v17 >> 3;
          do
          {
            v19 = dispatch_time(0, v15);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100049EF0;
            block[3] = &unk_10007D200;
            v24 = v13;
            v25 = v16;
            v26 = v18;
            block[4] = self;
            dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
            ++v16;
            v15 += 250000000;
          }
          while (v16 != 8);
          if (!v11)
            goto LABEL_27;
        }
        else
        {
          v21 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_100055A28((uint64_t)v11, v21, v22);
            if (!v11)
            {
LABEL_27:
              if (AssertionID)
                IOPMAssertionRelease(AssertionID);
              return;
            }
          }
          else if (!v11)
          {
            goto LABEL_27;
          }
        }
        CFRelease(v11);
        goto LABEL_27;
      }
    }
    else if (!self->_blendStillNeeded || (p_haveUsedDeferral = &self->_haveUsedDeferral, self->_haveUsedDeferral))
    {
      -[CommonProduct writeAllCornerTemperatures:](self, "writeAllCornerTemperatures:", v4);
      return;
    }
    v20 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> defer TSFD seed once", buf, 2u);
    }
    *p_haveUsedDeferral = 1;
  }
}

- (void)updateContextualClamp
{
  ContextualClampController *contextualClampController;

  contextualClampController = self->contextualClampController;
  if (contextualClampController)
    -[ContextualClampController update](contextualClampController, "update");
}

- (void)updateAccessories:(BOOL)a3
{
  -[AccessoryHelper updateFilter:](self->accessoryHelper, "updateFilter:", a3);
}

- (int)thermalState
{
  return self->thermalState;
}

- (void)probeAllSupervisorControlLoadingIndex
{
  -[TableDrivenDecisionTree evaluateDecisionTree](self->decisionTree, "evaluateDecisionTree");
  -[CommonProduct evaluteMitigationMaxLoadingIndex](self, "evaluteMitigationMaxLoadingIndex");
}

- (int)powerSensors
{
  return self->_powerSensorCount;
}

- (BOOL)isSendingMaxTempToDisplayDriverEnabled
{
  return self->sendMaxTemp;
}

- (int)gasGaugeBatteryTemperature
{
  return 3000;
}

- (void)evaluteMitigationMaxLoadingIndex
{
  int v3;
  uint64_t v4;
  unint64_t componentThermalStatusLevel;
  id v6;
  TGraphSampler *v7;
  unint64_t previousOSThermalNotificationLevel;
  const __CFString *v9;
  TGraphSampler *v10;

  if (byte_1000A2481)
  {
    -[CommonProduct handleMCSThermalPressure](self, "handleMCSThermalPressure");
    -[CommonProduct emitThermalTrendNotifications](self, "emitThermalTrendNotifications");
    return;
  }
  v3 = -[CommonProduct getHighestSkinTemp](self, "getHighestSkinTemp");
  self->thermalState = v3;
  if (v3 == 1)
  {
    self->thermalTrap = 1;
    v4 = 12;
    goto LABEL_7;
  }
  if (v3 == 2)
  {
    self->thermalTrap = 1;
    v4 = 16;
LABEL_7:
    qword_1000A2478 = v4;
    goto LABEL_12;
  }
  if ((unint64_t)qword_1000A2478 <= 0xB)
    componentThermalStatusLevel = self->componentThermalStatusLevel;
  else
    componentThermalStatusLevel = 11;
  qword_1000A2478 = componentThermalStatusLevel;
  v4 = -[CommonProduct getPotentialForcedThermalLevel:](self, "getPotentialForcedThermalLevel:");
  qword_1000A2478 = v4;
  self->thermalTrap = 0;
LABEL_12:
  v6 = sub_10002E2E4(v4);
  self->thermalPressureLevel = (int64_t)v6;
  if (v6 != (id)self->previousThermalPressureLevel)
  {
    v7 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
    -[TGraphSampler updatePowerlogLiteMode:pressureLevel:](v7, "updatePowerlogLiteMode:pressureLevel:", qword_1000A2478, self->thermalPressureLevel);
    -[TGraphSampler updateAppleCareState:value:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updateAppleCareState:value:", 1, LODWORD(self->thermalPressureLevel));
    self->previousThermalPressureLevel = self->thermalPressureLevel;
  }
  if (qword_1000A2478 != self->previousOSThermalNotificationLevel)
  {
    if (byte_10009A1F0)
      sub_10002E29C(qword_1000A2478);
    if (!self->needsAppleConnectThermalTrapLogging)
      goto LABEL_25;
    previousOSThermalNotificationLevel = self->previousOSThermalNotificationLevel;
    if (previousOSThermalNotificationLevel > 0xB || (unint64_t)qword_1000A2478 <= 0xB)
    {
      if (previousOSThermalNotificationLevel < 0xC || (unint64_t)qword_1000A2478 > 0xB)
        goto LABEL_25;
      v9 = CFSTR("ThermalUIAlertExit");
    }
    else
    {
      v9 = CFSTR("ThermalUIAlertEnter");
    }
    -[CommonProduct logTrapEntryForAC:](self, "logTrapEntryForAC:", v9);
LABEL_25:
    self->previousOSThermalNotificationLevel = qword_1000A2478;
    v10 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
    -[TGraphSampler updatePowerlogMiscState:value:](v10, "updatePowerlogMiscState:value:", 0, qword_1000A2478);
  }
}

- (int)dieTempMaxMax
{
  return sub_100006CA4(self->_maximumDieTempSensorIndexSet, (int *)&qword_1000A29AC, 0);
}

- (int)dieTempMaxAverage
{
  return sub_100006CA4(self->_averageDieTempSensorIndexSet, (int *)&qword_1000A29AC, 0);
}

- (int)dieTempFilteredMaxAverage
{
  NSArray *filteredAverageDieTempSensorIndexSet;

  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet)
    LODWORD(filteredAverageDieTempSensorIndexSet) = sub_100006CA4(filteredAverageDieTempSensorIndexSet, (int *)&qword_1000A29AC, byte_1000A28A8);
  return (int)filteredAverageDieTempSensorIndexSet;
}

- (int)desiredLoopInterval
{
  self->_reducedRateModeActive = 0;
  return -1;
}

- (id)initProduct:(id)a3
{
  char *v4;
  _DWORD *v5;
  NSObject *v6;
  id v7;
  const __CFDictionary *v8;
  _BOOL4 v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  KeyboardHelper *v18;
  NSObject *v19;
  MitigationController *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  PackagePowerCC *v25;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  CpuPiecewiseCC *v28;
  const __CFNumber *v29;
  CpuCC *v30;
  double v31;
  CpuPiecewiseCC *v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  __objc2_class **v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  RadioPowerCC *v51;
  RadioPowerCC *v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  ThermalLevelCC *v57;
  id v58;
  id v59;
  const __CFDictionary *v60;
  const __CFDictionary *v61;
  const void *Value;
  const void *v63;
  RefreshRateCC *v64;
  id v65;
  FanCC *v66;
  id v67;
  WiFiCC *v68;
  id v69;
  AudioAmpCC *v70;
  const __CFDictionary *v71;
  const __CFDictionary *v72;
  _BOOL4 v73;
  __objc2_class **v74;
  id v75;
  id v76;
  SpeakerCC *v77;
  id v78;
  __objc2_class *v79;
  id v80;
  id v81;
  const __CFArray *v82;
  const __CFArray *v83;
  const __CFArray *v84;
  unsigned int v85;
  NSObject *v86;
  int v87;
  NSObject *v88;
  uint64_t v89;
  const __CFArray *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  NSObject *v97;
  CFIndex v98;
  const __CFDictionary *ValueAtIndex;
  const void *v100;
  const __CFArray *v101;
  const __CFArray *v102;
  CFIndex Count;
  CFIndex v104;
  CFIndex i;
  SupervisorControl *v106;
  uint64_t v107;
  NSObject *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  NSObject *v117;
  AccessoryHelper *v118;
  NSObject *v119;
  _BOOL4 v120;
  const char *v121;
  id v122;
  id v123;
  CFTypeID v124;
  unsigned int v125;
  uint64_t MainDisplay;
  NSObject *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  id v135;
  id v136;
  CFTypeID v137;
  id v138;
  id v139;
  CFTypeID v140;
  id v141;
  id v142;
  const __CFString *v144;
  const __CFString *v145;
  const __CFString *v146;
  const __CFString *v147;
  uint64_t v148;
  _DWORD *v149;
  __int128 v150;
  int v151;
  unsigned int valuePtr;
  objc_super v153;
  uint8_t buf[4];
  uint64_t v155;

  v153.receiver = self;
  v153.super_class = (Class)CommonProduct;
  v4 = -[CommonProduct init](&v153, "init");
  if (!v4)
    return v4;
  *((_QWORD *)v4 + 2) = objc_alloc_init((Class)NSMutableArray);
  *((_QWORD *)v4 + 3) = objc_alloc_init((Class)NSMutableArray);
  *((_QWORD *)v4 + 4) = 0x143E00000000;
  *((_DWORD *)v4 + 10) = 0;
  v5 = v4 + 40;
  *((_DWORD *)v4 + 14) = 0;
  v4[8] = 0;
  v4[312] = 0;
  *((_QWORD *)v4 + 9) = 0;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 8) = 0;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((_QWORD *)v4 + 48) = dispatch_queue_create("com.apple.ThermalMonitor.mainQueue", v6);
  -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v4);
  v7 = objc_msgSend((id)qword_1000A2E38, "requestListID");
  v8 = (const __CFDictionary *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("generalProductConfig"));
  v9 = sub_100034150(v8, CFSTR("noDisplay"));
  v10 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("powerZoneParams"));
  v11 = sub_100034150(v8, CFSTR("usesSMCSensorExchange"));
  byte_1000A2DC0 = v11;
  if (v11)
  {
    -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 10, CFSTR("zETM"), 10);
    v12 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Using SensorExchangeHelper", buf, 2u);
    }
  }
  v13 = sub_100034150(v8, CFSTR("usesACSK"));
  byte_1000A2481 = v13;
  if (v13)
  {
    v14 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Using ACSK", buf, 2u);
    }
  }
  v15 = sub_100034150(v8, CFSTR("usesKeyboardHelper"));
  byte_1000A2483 = v15;
  if (v15)
  {
    v16 = sub_100034150(v8, CFSTR("needsCLPCClient"));
    v17 = qword_1000A28A0;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Uses CLPC framework", buf, 2u);
        v17 = qword_1000A28A0;
      }
      byte_1000A2484 = 1;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Using Keyboard Helper", buf, 2u);
    }
    v18 = objc_alloc_init(KeyboardHelper);
    *((_QWORD *)v4 + 34) = v18;
    if (v18)
    {
      -[KeyboardHelper registerForKeyboardEvents](v18, "registerForKeyboardEvents");
      if (sub_100034150(v8, CFSTR("usesFolioHelper")))
      {
        v19 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice> Using Folio Helper", buf, 2u);
        }
        objc_msgSend(*((id *)v4 + 34), "registerForFolioEvents");
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000558BC();
    }
  }
  if (!sub_100034150(v8, CFSTR("skipMitigationController")))
  {
    v4[44] = sub_100034150(v8, CFSTR("needsFastDieControl"));
    v20 = [MitigationController alloc];
    v21 = v4[44];
    v22 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("powerSaveParams"));
    v23 = v21;
    v5 = v4 + 40;
    qword_1000A2E38 = -[MitigationController initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:](v20, "initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:", v23, v9, v22, v10);
  }
  v24 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("packageComponentControl"));
  if (v24)
  {
    v25 = -[PackagePowerCC initWithParams:]([PackagePowerCC alloc], "initWithParams:", v24);
  }
  else
  {
    v26 = (const __CFDictionary *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("cpuComponentControl"));
    if (v26)
    {
      v27 = v26;
      *(_DWORD *)buf = 0;
      sub_1000048B0(v26, CFSTR("controllerVersion"), kCFNumberIntType, buf);
      if (*(_DWORD *)buf == 2)
      {
        v28 = -[CpuPiecewiseCC initWithParams:listID:needspowerZones:]([CpuPiecewiseCC alloc], "initWithParams:listID:needspowerZones:", v27, v7, v10 != 0);
      }
      else
      {
        valuePtr = 1065353216;
        v29 = (const __CFNumber *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("Power_Scale"));
        if (v29)
          CFNumberGetValue(v29, kCFNumberIntType, &valuePtr);
        v30 = [CpuCC alloc];
        LODWORD(v31) = valuePtr;
        v28 = -[CpuCC initWithParams:powerScale:listID:needspowerZones:](v30, "initWithParams:powerScale:listID:needspowerZones:", v27, v7, v10 != 0, v31);
      }
      v32 = v28;
      objc_msgSend(*((id *)v4 + 2), "addObject:", v28);

    }
    v33 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("socComponentControl"));
    if (!v33)
      goto LABEL_36;
    v25 = -[SocCC initWithParams:listID:]([SocCC alloc], "initWithParams:listID:", v33, v7);
  }
  objc_msgSend(*((id *)v4 + 2), "addObject:", v25);

LABEL_36:
  valuePtr = 0;
  sub_1000048B0(v8, CFSTR("radioControllerType"), kCFNumberIntType, &valuePtr);
  v35 = valuePtr;
  v36 = off_10007C578;
  switch(valuePtr)
  {
    case 0u:
      goto LABEL_56;
    case 3u:
      goto LABEL_38;
    case 4u:
      v36 = off_10007C570;
LABEL_38:
      v37 = objc_msgSend(objc_alloc(*v36), "initWithRunLoopAndParams:withParams:", objc_msgSend(a3, "localMainRunloop"), objc_msgSend(a3, "getConfigurationFor:", CFSTR("radioComponentControl")));
      if (v37)
      {
        v38 = v37;
        objc_msgSend(*((id *)v4 + 2), "addObject:", v37);

      }
      goto LABEL_56;
    case 5u:
      v148 = (uint64_t)&v148;
      v149 = v5;
      v46 = 0;
      v144 = CFSTR("radioModemBandComponentControl");
      v145 = CFSTR("radioFR2RFCGComponentControl");
      v146 = CFSTR("radioFR2RFBCComponentControl");
      v147 = CFSTR("radioFR2RFBandComponentControl");
      *(_QWORD *)&v34 = 138412290;
      v150 = v34;
      break;
    default:
      v39 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055858(v35, v39, v40, v41, v42, v43, v44, v45);
      goto LABEL_56;
  }
  do
  {
    if (byte_1000A2480)
    {
      v47 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v48 = (uint64_t)*(&v144 + v46);
        *(_DWORD *)buf = v150;
        v155 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "<Notice> Getting configuration and initializing RadioPowerCC type: %@", buf, 0xCu);
      }
    }
    v49 = (uint64_t)*(&v144 + v46);
    v50 = objc_msgSend(a3, "getConfigurationFor:", v49, v144, v145, v146, v147, v148);
    if (!v50)
    {
      v53 = qword_1000A28A0;
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        goto LABEL_52;
      *(_DWORD *)buf = v150;
      v155 = v49;
      v54 = v53;
      v55 = "<Error> No configuration found for RadioPowerCC name: %@";
      goto LABEL_55;
    }
    v51 = -[RadioPowerCC initWithRunLoopAndParams:withMitigationType:withParams:]([RadioPowerCC alloc], "initWithRunLoopAndParams:withMitigationType:withParams:", objc_msgSend(a3, "localMainRunloop"), dword_100061EF0[v46], v50);
    if (v51)
    {
      v52 = v51;
      objc_msgSend(*((id *)v4 + 2), "addObject:", v51);

      goto LABEL_52;
    }
    v56 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v150;
      v155 = v49;
      v54 = v56;
      v55 = "<Error> Failed to initialize RadioPowerCC name: %@";
LABEL_55:
      _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
    }
LABEL_52:
    ++v46;
  }
  while (v46 != 4);
  v5 = v149;
LABEL_56:
  v57 = -[ThermalLevelCC initWithProduct:]([ThermalLevelCC alloc], "initWithProduct:", v4);
  objc_msgSend(*((id *)v4 + 2), "addObject:", v57);

  v58 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("backlightComponentControl"));
  if (v58)
  {
    v59 = objc_msgSend(v4, "newBacklightComponentController:", v58);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v59);

  }
  v60 = (const __CFDictionary *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("refreshRateComponentControl"));
  if (v60)
  {
    v61 = v60;
    Value = CFDictionaryGetValue(v60, CFSTR("RefreshRate"));
    if (Value)
    {
      v63 = Value;
      v64 = -[RefreshRateCC initWithParams:]([RefreshRateCC alloc], "initWithParams:", v61);
      -[RefreshRateCC initRefreshRateTable:](v64, "initRefreshRateTable:", v63);
      objc_msgSend(*((id *)v4 + 2), "addObject:", v64);

    }
  }
  v65 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("fanComponentControl"));
  if (v65)
  {
    v66 = -[FanCC initWithParams:]([FanCC alloc], "initWithParams:", v65);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v66);

  }
  v67 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("wifiComponentControl"));
  if (v67)
  {
    v68 = -[WiFiCC initWithParams:]([WiFiCC alloc], "initWithParams:", v67);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v68);

  }
  v69 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("audioAmpComponentControl"));
  if (v69)
  {
    v70 = -[AudioAmpCC initWithParams:]([AudioAmpCC alloc], "initWithParams:", v69);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v70);

  }
  v71 = (const __CFDictionary *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("arcComponentControl"));
  if (v71)
  {
    v72 = v71;
    v73 = sub_100034150(v71, CFSTR("usesArcPowerCC"));
    v74 = off_10007C4C8;
    if (v73)
      v74 = &off_10007C4D0;
    v75 = objc_msgSend(objc_alloc(*v74), "initWithParams:product:", v72, v4);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v75);

  }
  v76 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("speakerComponentControl"));
  if (v76)
  {
    v77 = -[SpeakerCC initWithParams:]([SpeakerCC alloc], "initWithParams:", v76);
    objc_msgSend(*((id *)v4 + 2), "addObject:", v77);

  }
  objc_msgSend(v4, "registerDisplayNotification");
  objc_msgSend(v4, "registerChargerNotification");
  if (!sub_100034150(v8, CFSTR("noChargingControl")))
  {
    if (sub_100034150(v8, CFSTR("usesLinkCharger")))
    {
      v78 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("linkChargerComponentControl"));
      v79 = LinkChargerCC;
      goto LABEL_78;
    }
    v80 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("powerSourceComponentControl"));
    if (v80)
    {
      v78 = v80;
      v79 = PowerSourceCC;
LABEL_78:
      v81 = objc_msgSend([v79 alloc], "initWithParams:", v78);
      objc_msgSend(*((id *)v4 + 2), "addObject:", v81);

    }
  }
  v82 = (const __CFArray *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("Sensors"));
  *((_DWORD *)v4 + 74) = CFArrayGetCount(v82);
  -[HidSensors loadProductTemperatureParameters:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "loadProductTemperatureParameters:", v82);
  v83 = (const __CFArray *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("powerSensors"));
  if (v83)
  {
    v84 = v83;
    if (CFArrayGetCount(v83) >= 1)
    {
      *((_DWORD *)v4 + 75) = CFArrayGetCount(v84);
      -[HidSensors loadProductPowerParameters:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "loadProductPowerParameters:", v84);
    }
  }
  v85 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TP0Z"));
  *((_DWORD *)v4 + 8) = v85;
  if (v85 == -1 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10005582C();
  if (sub_1000048B0(v8, CFSTR("requiredCalibrationResistorSamples"), kCFNumberIntType, v5))
  {
    if (byte_1000A2480)
    {
      v86 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v87 = *v5;
        *(_DWORD *)buf = 67109120;
        LODWORD(v155) = v87;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "<Notice> Required Tcal samples: %d", buf, 8u);
      }
    }
  }
  byte_1000A28A8 = sub_100034150(v8, CFSTR("hasInternalSensorFiltering"));
  v88 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "<Notice> Has internally filtered sensors", buf, 2u);
  }
  *((_QWORD *)v4 + 42) = objc_msgSend(v4, "copyDieTempSensorIndexSetForFourthChar:sensors:filteredOnly:", 97, v82, 0);
  *((_QWORD *)v4 + 41) = objc_msgSend(v4, "copyDieTempSensorIndexSetForFourthChar:sensors:filteredOnly:", 120, v82, 0);
  if (byte_1000A28A8)
  {
    v89 = 97;
    v90 = v82;
    v91 = 1;
  }
  else
  {
    v89 = 102;
    v90 = v82;
    v91 = 0;
  }
  *((_QWORD *)v4 + 43) = objc_msgSend(v4, "copyDieTempSensorIndexSetForFourthChar:sensors:filteredOnly:", v89, v90, v91);
  if (byte_1000A2480)
  {
    v92 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v93 = *((_QWORD *)v4 + 42);
      *(_DWORD *)buf = 138412290;
      v155 = v93;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "<Notice> avg die: %@", buf, 0xCu);
      if (byte_1000A2480)
      {
        v92 = qword_1000A28A0;
        goto LABEL_98;
      }
    }
    else
    {
LABEL_98:
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        v94 = *((_QWORD *)v4 + 41);
        *(_DWORD *)buf = 138412290;
        v155 = v94;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "<Notice> max die: %@", buf, 0xCu);
        v95 = byte_1000A2480;
      }
      else
      {
        v95 = 1;
      }
      v96 = *((_QWORD *)v4 + 43);
      if (v96)
      {
        if (v95)
        {
          v97 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v155 = v96;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "<Notice> filtered average die: %@", buf, 0xCu);
          }
        }
      }
    }
  }
  *((_QWORD *)v4 + 38) = 0;
  if (CFArrayGetCount(v82) >= 1)
  {
    v98 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v82, v98);
      v100 = CFDictionaryGetValue(ValueAtIndex, CFSTR("4CharCode"));
      if (v98 != *((_DWORD *)v4 + 8) && objc_msgSend(v4, "fourCharCodeNeedsPMUtcal:", v100))
        *((_QWORD *)v4 + 38) |= 1 << v98;
      ++v98;
    }
    while (CFArrayGetCount(v82) > v98);
  }
  v101 = (const __CFArray *)objc_msgSend(v4, "copyHotspotsArray:", a3);
  if (v101)
  {
    v102 = v101;
    Count = CFArrayGetCount(v101);
    if (Count >= 1)
    {
      v104 = Count;
      for (i = 0; i != v104; ++i)
      {
        v106 = -[SupervisorControl initWithMitigationType:paramInfo:]([SupervisorControl alloc], "initWithMitigationType:paramInfo:", (i + 18), CFArrayGetValueAtIndex(v102, i));
        objc_msgSend(*((id *)v4 + 3), "addObject:", v106);

      }
    }
    CFRelease(v102);
  }
  v151 = 0;
  sub_1000048B0(v8, CFSTR("solarContextType"), kCFNumberIntType, &v151);
  if ((v151 - 1) < 2)
  {
    -[ContextAwareThermalManager createNewSolarContext:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "createNewSolarContext:", 0);
    if (v151 != 2)
    {
      v107 = 1;
      goto LABEL_125;
    }
    goto LABEL_121;
  }
  if ((v151 - 3) < 2)
  {
    v107 = 1;
    -[ContextAwareThermalManager createNewSolarContext:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "createNewSolarContext:", 1);
    if (v151 != 4)
    {
LABEL_125:
      objc_msgSend(objc_msgSend(v4, "findComponent:", 0), "setSolarDetectorPresent:", v107);
      goto LABEL_126;
    }
LABEL_121:
    v107 = 1;
    objc_msgSend(objc_msgSend(v4, "findComponent:", 0), "setSolarBehaviorSuppressed:", 1);
    goto LABEL_125;
  }
  v107 = 0;
  if (!v151)
    goto LABEL_125;
LABEL_126:
  v4[105] = v151 == 0;
  if (sub_100034150(v8, CFSTR("usesInPocketContext")))
  {
    if ((_os_feature_enabled_impl("powerexperienced", "RestrictedPerfMode") & 1) != 0)
    {
      v108 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "<Notice> In-pocket context disabled due to restricted perf mode", buf, 2u);
      }
    }
    else
    {
      -[ContextAwareThermalManager createNewInPocketContext:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "createNewInPocketContext:", objc_msgSend(a3, "getConfigurationFor:", CFSTR("inPocketContextParams")));
    }
  }
  if (sub_100034150(v8, CFSTR("shouldDispatchVirtualTemp")))
  {
    -[HidSensors enableDispatchVirtualTemp](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "enableDispatchVirtualTemp");
    -[HidSensors initLocationStrings](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "initLocationStrings");
  }
  if (sub_100034150(v8, CFSTR("enableSending2DTempGridToDisplayDriver")))
    -[HidSensors enableSending2DTempGridToDisplayDriver](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "enableSending2DTempGridToDisplayDriver");
  if (sub_100034150(v8, CFSTR("enableSendingMaxTempToDisplayDriver")))
    objc_msgSend(v4, "enableSendingMaxTempToDisplayDriver");
  v4[104] = sub_100034150(v8, CFSTR("canForceThermalLevels"));
  *((_QWORD *)v4 + 6) = -[TableDrivenDecisionTree initWithComponentControllers:hotspotControllers:decisionTreeTable:]([TableDrivenDecisionTree alloc], "initWithComponentControllers:hotspotControllers:decisionTreeTable:", *((_QWORD *)v4 + 2), *((_QWORD *)v4 + 3), objc_msgSend(a3, "getConfigurationFor:", CFSTR("DecisionTreeTable")));
  if (sub_100034150(v8, CFSTR("monitorsCameraSensors")))
  {
    v109 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("SS0F"));
    v110 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("SS0C"));
    if ((_DWORD)v109 == -1)
      v109 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK0F"));
    if ((_DWORD)v110 == -1)
    {
      v110 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK0C"));
      if ((v109 & 0x80000000) == 0)
        goto LABEL_144;
    }
    else
    {
      if ((v109 & 0x80000000) != 0)
        goto LABEL_157;
LABEL_144:
      if ((v110 & 0x80000000) == 0)
      {
        *((_QWORD *)v4 + 12) = -[CameraTS initWithFrontCameraSensorIdx:rearCameraSensorIdx:]([CameraTS alloc], "initWithFrontCameraSensorIdx:rearCameraSensorIdx:", v109, v110);
        v111 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK1F"));
        if ((v111 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableFrontIRCameraNotifications:", v111);
        v112 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK2F"));
        if ((v112 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableFrontRomeoNTCNotifications:", v112);
        v113 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK3F"));
        if ((v113 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableFrontRigelDieNotifications:", v113);
        v114 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK1C"));
        if ((v114 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableRearCameraTeleNotifications:", v114);
        v115 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK2C"));
        if ((v115 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableRearCameraSuperWideNotifications:", v115);
        v116 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TK3C"));
        if ((v116 & 0x80000000) == 0)
          objc_msgSend(*((id *)v4 + 12), "enableRearCameraJasperNotifications:", v116);
        goto LABEL_159;
      }
    }
LABEL_157:
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055800();
  }
LABEL_159:
  if (sub_100034150(v8, CFSTR("monitorsRadioSensors"))
    && (objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TB0R")) & 0x80000000) == 0
    && (objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TB1R")) & 0x80000000) == 0)
  {
    +[RadioTS sharedInstance](RadioTS, "sharedInstance");
  }
  v117 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "<Notice> Checking for needsAccessoryHelper", buf, 2u);
  }
  if (sub_100034150(v8, CFSTR("needsAccessoryHelper")))
  {
    v118 = -[AccessoryHelper initWithProduct:]([AccessoryHelper alloc], "initWithProduct:", v4);
    *((_QWORD *)v4 + 33) = v118;
    v119 = qword_1000A28A0;
    v120 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
    if (v118)
    {
      if (v120)
      {
        *(_WORD *)buf = 0;
        v121 = "<Notice> Created AccessoryHelper";
        goto LABEL_171;
      }
    }
    else if (v120)
    {
      *(_WORD *)buf = 0;
      v121 = "<Notice> Failed to create AccessoryHelper";
LABEL_171:
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, v121, buf, 2u);
    }
  }
  if (sub_100034150(v8, CFSTR("needsLifetimeServo")))
  {
    v122 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("lifetimeServoParams"));
    if (v122 && (v123 = v122, v124 = CFGetTypeID(v122), v124 == CFDictionaryGetTypeID()))
    {
      *((_QWORD *)v4 + 44) = -[LifetimeServoController initWithParams:sensorList:]([LifetimeServoController alloc], "initWithParams:sensorList:", v123, v82);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000557D4();
    }
  }
  else
  {
    *((_QWORD *)v4 + 44) = 0;
    if (sub_100034150(v8, CFSTR("needsLTSStatePersistence")))
      *((_QWORD *)v4 + 45) = objc_alloc_init(LifetimeServoStatePersistence);
    else
      *((_QWORD *)v4 + 45) = 0;
  }
  v4[106] = sub_100034150(v8, CFSTR("needsAppleConnectThermalTrapLogging"));
  qword_1000A2E30 = 0;
  *((_WORD *)v4 + 56) = 0;
  if (sub_100034150(v8, CFSTR("needsPushingTSFDtoDisplayDriver")))
  {
    v125 = objc_msgSend(v4, "sensorIndexFromList:fourCharCode:", v82, CFSTR("TSFD"));
    *((_DWORD *)v4 + 27) = v125;
    if (v125 == -1)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055744();
    }
    else
    {
      MainDisplay = IOMobileFramebufferGetMainDisplay(&qword_1000A2E30);
      if ((_DWORD)MainDisplay || !qword_1000A2E30)
      {
        v127 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100055770(MainDisplay, v127, v128, v129, v130, v131, v132, v133);
        qword_1000A2E30 = 0;
      }
    }
    if (byte_1000A2480)
    {
      v134 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v155 = qword_1000A2E30;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "<Notice> IOMFB: %@", buf, 0xCu);
      }
    }
  }
  if (-[HidSensors isSending2DTempGridToDisplayDriverEnabled](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isSending2DTempGridToDisplayDriverEnabled"))
  {
    objc_msgSend(v4, "setup2DGridDisplayDriver");
  }
  if (sub_100034150(v8, CFSTR("needsContextualClamp")))
  {
    v135 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("contextualClampParams"));
    if (v135 && (v136 = v135, v137 = CFGetTypeID(v135), v137 == CFDictionaryGetTypeID()))
    {
      *((_QWORD *)v4 + 31) = -[ContextualClampController initWithParams:backlightController:product:]([ContextualClampController alloc], "initWithParams:backlightController:product:", v136, objc_msgSend(v4, "findComponent:", 0), v4);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055718();
    }
  }
  else
  {
    *((_QWORD *)v4 + 31) = 0;
  }
  if (sub_100034150(v8, CFSTR("needsArcControl")))
  {
    v138 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("arcControlParams"));
    if (v138 && (v139 = v138, v140 = CFGetTypeID(v138), v140 == CFDictionaryGetTypeID()))
    {
      *((_QWORD *)v4 + 32) = -[ArcController initWithParams:product:]([ArcController alloc], "initWithParams:product:", v139, v4);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000556EC();
    }
  }
  else
  {
    *((_QWORD *)v4 + 32) = 0;
  }
  *(_QWORD *)(v4 + 236) = 0xB0000000ALL;
  sub_1000048B0(v8, CFSTR("forcedThermalLevelLower"), kCFNumberIntType, v4 + 236);
  sub_1000048B0(v8, CFSTR("forcedThermalLevelUpper"), kCFNumberIntType, v4 + 240);
  if (objc_msgSend(v4, "shouldSuppressStandardBehaviors:", v8))
    objc_msgSend(v4, "suppressStandardBehaviors");
  v141 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("lowTempMitigationLimits"));
  *((_QWORD *)v4 + 36) = v141;
  if (v141)
  {
    objc_msgSend(v4, "registerDefaultsDomain");
    objc_msgSend(*((id *)v4 + 49), "addObserver:forKeyPath:options:context:", v4, CFSTR("ppmSimulationMode"), 1, v4);
  }
  v142 = objc_msgSend(a3, "getConfigurationFor:", CFSTR("thermalMitigationLimits"));
  *((_QWORD *)v4 + 35) = v142;
  if (v142 || byte_1000A2481)
  {
    objc_msgSend(v4, "registerDefaultsDomain");
    objc_msgSend(*((id *)v4 + 49), "setObject:forKey:", 0, CFSTR("thermalSimulationMode"));
    objc_msgSend(*((id *)v4 + 49), "synchronize");
    objc_msgSend(*((id *)v4 + 49), "addObserver:forKeyPath:options:context:", v4, CFSTR("thermalSimulationMode"), 1, v4);
  }
  byte_1000A2E29 = 0;
  objc_msgSend(v4, "registerDefaultsDomain");
  objc_msgSend(*((id *)v4 + 49), "addObserver:forKeyPath:options:context:", v4, CFSTR("watchdogUpdates"), 1, v4);
  byte_1000A2E2A = sub_100034150(v8, CFSTR("needsPowerZoneTelemetry"));
  +[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance");
  *((_DWORD *)v4 + 22) = 1;
  sub_1000048B0(v8, CFSTR("moderatePressureVersion"), kCFNumberIntType, v4 + 88);
  -[CPMSHelper setProduct:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "setProduct:", v4);
  return v4;
}

- (void)registerDefaultsDomain
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000483DC;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A2418 != -1)
    dispatch_once(&qword_1000A2418, block);
}

- (void)simulateLightThermalPressure
{
  objc_msgSend((id)qword_1000A2488, "setLightPressureOverride:", 1);
  objc_msgSend((id)qword_1000A2488, "updateThermalPressureLevelNotification:shouldForceThermalPressure:", 0, 1);
}

- (void)removeLightPressureOverride
{
  objc_msgSend((id)qword_1000A2488, "setLightPressureOverride:", 0);
}

- (void)setHiPFeatureEnabled:(BOOL)a3
{
  byte_10009A1F1 = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("thermalSimulationMode")))
  {
    -[CommonProduct putDeviceInThermalSimulationMode:](self, "putDeviceInThermalSimulationMode:", objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("ppmSimulationMode")))
  {
    -[CommonProduct putDeviceInLowTempSimulationMode:](self, "putDeviceInLowTempSimulationMode:", objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("watchdogUpdates")))
  {
    -[CommonProduct thermalUpdatesToWatchdogEnabled:](self, "thermalUpdatesToWatchdogEnabled:", objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000558E8();
    v11.receiver = self;
    v11.super_class = (Class)CommonProduct;
    -[CommonProduct observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
  }
}

- (void)thermalUpdatesToWatchdogEnabled:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;

  v4 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change watchdog updates mode to %@", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("false"));
  byte_10009A1F2 = v5 ^ 1;
  if (byte_1000A2480)
  {
    v6 = v5;
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "en";
      if (v6)
        v8 = "dis";
      v9 = 136315138;
      v10 = (id)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Watchdog Thermal Updates %sabled", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)putDeviceInThermalSimulationMode:(id)a3
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t i;
  id v9;
  double v10;
  unsigned __int8 v11;
  unsigned int v12;
  int v13;
  id v14;

  v5 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change thermal mode to %@", (uint8_t *)&v13, 0xCu);
  }
  if (a3)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("off")))
    {
      -[CommonProduct clearLoadingIndexOverrides](self, "clearLoadingIndexOverrides");
      -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride");
      -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 1);
      byte_1000A2E29 = 0;
      dword_1000A2AE8 = 0;
      return;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("nominal")))
    {
      memset(&qword_1000A2E18, 100, 17);
      -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride");
      -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 0);
      byte_1000A2E29 = 1;
      v6 = 1065353216;
LABEL_15:
      dword_1000A2AE8 = v6;
      return;
    }
  }
  -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 0);
  byte_1000A2E29 = 1;
  v7 = -[NSDictionary valueForKeyPath:](self->simulatedThermalMitigationLimits, "valueForKeyPath:", a3);
  for (i = 0; i != 17; ++i)
  {
    v9 = objc_msgSend(v7, "valueForKey:", *(&off_10007E368 + i));
    if (v9)
      *((_BYTE *)&qword_1000A2E18 + i) = objc_msgSend(v9, "integerValue");
  }
  if (a3)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("light")))
    {
      -[CommonProduct simulateLightThermalPressure](self, "simulateLightThermalPressure");
      v6 = 0x40000000;
      goto LABEL_15;
    }
    v11 = objc_msgSend(a3, "isEqualToString:", CFSTR("moderate"));
    LODWORD(v10) = 3.0;
    if ((v11 & 1) != 0
      || (v12 = objc_msgSend(a3, "isEqualToString:", CFSTR("heavy"), v10), LODWORD(v10) = 4.0, v12))
    {
      dword_1000A2AE8 = LODWORD(v10);
    }
  }
  -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride", v10);
}

- (void)putDeviceInLowTempSimulationMode:(id)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;

  v5 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change low temp mode to %@", (uint8_t *)&v13, 0xCu);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("off")))
  {
    sub_100035DB0(0);
    sub_100035578(0);
    sub_100035310();
    sub_1000353C8();
    sub_100034AE4();
    nullsub_1();
    sub_1000347EC();
    sub_100034C0C();
  }
  else
  {
    sub_100035DB0(1);
    sub_100035578(1);
    v6 = -[NSDictionary valueForKeyPath:](self->simulatedLowTempMitigationLimits, "valueForKeyPath:", a3);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "valueForKey:", CFSTR("Ra"));
      if (v8)
      {
        sub_100035268((int)objc_msgSend(v8, "integerValue"));
      }
      else
      {
        v9 = objc_msgSend(v7, "valueForKey:", CFSTR("wRa"));
        if (v9)
          sub_100035320((int)objc_msgSend(v9, "integerValue"));
      }
      v10 = objc_msgSend(v7, "valueForKey:", CFSTR("soc"));
      if (v10)
      {
        v11 = v10;
        sub_100034AD8((uint64_t)objc_msgSend(v10, "integerValue"));
        sub_1000347E0((uint64_t)objc_msgSend(v11, "integerValue"));
        sub_100034A34((int)objc_msgSend(v11, "integerValue"));
      }
      v12 = objc_msgSend(v7, "valueForKey:", CFSTR("TG0B"));
      if (v12)
        sub_100034AF4((uint64_t)CFSTR("TG0B"), (int)objc_msgSend(v12, "integerValue"));
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055914();
    }
  }
}

- (void)dealloc
{
  NSArray *filteredAverageDieTempSensorIndexSet;
  objc_super v4;

  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet)

  notify_cancel(self->_displayToken);
  notify_cancel(self->_chargerToken);

  v4.receiver = self;
  v4.super_class = (Class)CommonProduct;
  -[CommonProduct dealloc](&v4, "dealloc");
}

- (id)copyDieTempSensorIndexSetForFourthChar:(char)a3 sensors:(__CFArray *)a4 filteredOnly:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  id v9;
  CFIndex v10;
  const __CFDictionary *ValueAtIndex;
  id v12;

  v5 = a5;
  v7 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  if (CFArrayGetCount(a4) >= 1)
  {
    v10 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
      if (-[CommonProduct fourCharCodeMatchesDieTempType:fourCharCode:](self, "fourCharCodeMatchesDieTempType:fourCharCode:", v7, CFDictionaryGetValue(ValueAtIndex, CFSTR("4CharCode")))&& (!v5|| -[HidSensors getFilterTimeConstantForSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getFilterTimeConstantForSensor:", v10) >= 1))
      {
        objc_msgSend(v9, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      }
      ++v10;
    }
    while (CFArrayGetCount(a4) > v10);
  }
  if (objc_msgSend(v9, "count"))
    v12 = objc_msgSend(v9, "copy");
  else
    v12 = 0;

  return v12;
}

- (BOOL)fourCharCodeMatchesDieTempType:(char)a3 fourCharCode:(__CFString *)a4
{
  int CString;
  BOOL result;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  char buffer[2];
  unsigned __int8 v13;
  char v14;
  char v15;

  if (!a4)
    return 0;
  CString = CFStringGetCString(a4, buffer, 16, 0x8000100u);
  result = 0;
  if (CString && buffer[0] == 84)
  {
    v7 = buffer[1] - 80;
    v8 = v7 > 0x23;
    v9 = (1 << v7) & 0x901AA0001;
    v10 = v8 || v9 == 0;
    if (v10 || v13 != 99 && v13 - 48 > 9)
      return 0;
    return v14 == a3 && v15 == 0;
  }
  return result;
}

- (BOOL)fourCharCodeNeedsPMUtcal:(__CFString *)a3
{
  int CString;
  char buffer[3];
  unsigned __int8 v6;
  char v7;

  if (!a3)
    goto LABEL_7;
  CString = CFStringGetCString(a3, buffer, 16, 0x8000100u);
  if (CString)
  {
    LOBYTE(CString) = 0;
    if (buffer[0] == 84 && buffer[1] == 80)
    {
      if (v6 != 100 && v6 - 65 > 0x19)
      {
LABEL_7:
        LOBYTE(CString) = 0;
        return CString;
      }
      LOBYTE(CString) = v7 == 0;
    }
  }
  return CString;
}

- (BOOL)mitigationsFullyReleased
{
  NSMutableArray *listofComponentControl;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(listofComponentControl);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "releaseMaxLI") < 0x64)
          return 0;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (int)getChargerState
{
  return self->_chargerState;
}

- (void)registerDisplayNotification
{
  OS_dispatch_queue *thermalQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  thermalQueue = self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004902C;
  v4[3] = &unk_10007D0E8;
  objc_copyWeak(&v5, &location);
  sub_1000358D8("com.apple.iokit.hid.displayStatus", &self->_displayToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerChargerNotification
{
  OS_dispatch_queue *thermalQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  thermalQueue = self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100049144;
  v4[3] = &unk_10007D0E8;
  objc_copyWeak(&v5, &location);
  sub_1000358D8("com.apple.system.powermanagement.poweradapter", &self->_chargerToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)clearControlEffortOverrides
{
  NSMutableArray *listOfSupervisorControl;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableArray *listofComponentControl;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(listOfSupervisorControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "setAllowCEOverride:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  listofComponentControl = self->listofComponentControl;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(listofComponentControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)j), "setAllowCEOverride:", 0);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }
}

- (void)clearLoadingIndexOverrides
{
  NSMutableArray *listofComponentControl;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  listofComponentControl = self->listofComponentControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(listofComponentControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "setAllowLIOverride:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)createConnectionToCT
{
  objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 4), "createConnectionToCT");
}

- (void)emitThermalMitigationNotifications
{
  float v2;
  int v3;
  NSObject *v5;
  int v6;
  _DWORD v7[2];

  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("mxTM"));
  v3 = (int)v2;
  if (dword_1000A2430 != (int)v2 && v3 != -1)
  {
    objc_msgSend((id)qword_1000A2488, "updateThermalMitigationNotification:", (int)v2);
    dword_1000A2430 = v3;
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal Mitigation = %d", (uint8_t *)v7, 8u);
      v6 = dword_1000A2430;
    }
    else
    {
      v6 = v3;
    }
    kdebug_trace(728039452, v6, v3, 0, 0);
  }
}

- (void)logTrapEntryForAC:(id)a3
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", a3, 0);
  objc_msgSend(v3, "addObjectsFromArray:", GetThermalState());
  logEventForAppleCare(v3);

}

- (id)findComponent:(int)a3
{
  uint64_t v3;
  NSMutableArray *listOfSupervisorControl;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *listofComponentControl;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = *(_QWORD *)&a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(listOfSupervisorControl);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "isEqualMType:", v3) & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    listofComponentControl = self->listofComponentControl;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
LABEL_11:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(listofComponentControl);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_msgSend(v10, "isEqualMType:", v3) & 1) != 0)
          break;
        if (v13 == (id)++v15)
        {
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          v10 = 0;
          if (v13)
            goto LABEL_11;
          return v10;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

- (void)getAllComponentID:(__SCPreferences *)a3
{
  __CFArray *Mutable;
  NSMutableArray *listofComponentControl;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableArray *listOfSupervisorControl;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  listofComponentControl = self->listofComponentControl;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(listofComponentControl);
        CFArrayAppendValue(Mutable, objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "nameofComponent"));
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(listOfSupervisorControl);
        CFArrayAppendValue(Mutable, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), "nameofComponent"));
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
  SCPreferencesSetValue(a3, CFSTR("listComponentID_CLTMV2"), Mutable);
  SCPreferencesCommitChanges(a3);
  CFRelease(Mutable);
}

- (int)getCurrentMaxLIForComponent:(unsigned int)a3
{
  return objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", *(_QWORD *)&a3), "getReleaseMaxLI");
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  return -[BackLightCCSingle initWithParams:]([BackLightCCSingle alloc], "initWithParams:", a3);
}

- (void)enableSendingMaxTempToDisplayDriver
{
  self->sendMaxTemp = 1;
}

- (iir_filter_t)getFilterValues
{
  return -[HidSensors getFilterTable](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getFilterTable");
}

- (int)getHighestSkinTemp
{
  NSMutableArray *listOfSupervisorControl;
  id v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *i;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(listOfSupervisorControl);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "getThermalStateofHotspot");
      if (v8 > v5)
        v5 = v8;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (unint64_t)getMaxSensorValue
{
  NSMutableArray *listOfSupervisorControl;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  float v7;
  void *i;
  void *v9;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    v7 = 100.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(listOfSupervisorControl);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "calculateTargetDifference");
        if (v10 < v7)
        {
          v7 = v10;
          v5 = v9;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "hotspotTemperature");
  return (unint64_t)(float)(v11 * 100.0);
}

- (BOOL)isInternalInstall
{
  if (qword_1000A2438 != -1)
    dispatch_once(&qword_1000A2438, &stru_10007E2F0);
  return byte_1000A2434;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100055940();
}

- (int)compute2DGridTemps
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10005596C();
  return 0;
}

- (int)computeMaxCGTemp
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100055998();
  return -1;
}

- (int)getFrontDisplayCenterTemperature
{
  return 3500;
}

- (void)writeAllCornerTemperatures:(int)a3
{
  double v3;
  signed int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  double v16;
  _QWORD v17[4];

  v3 = (double)a3 / 100.0;
  v4 = vcvtd_n_s64_f64(v3, 0x10uLL);
  v17[0] = v4;
  v17[1] = v4;
  v17[2] = v4;
  v17[3] = v4;
  v5 = IOMobileFramebufferSetParameter(qword_1000A2E30, 0, 4, v17);
  if ((_DWORD)v5)
  {
    v6 = v5;
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000559C4(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (byte_1000A2480)
  {
    v14 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = v3 * 65536.0 * 0.0000152587891;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Pushed TSFD=%0.2f", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)sendMaxTempToDisplayDriver:(int)a3
{
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _DWORD v30[7];
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;

  if (qword_1000A2E30)
  {
    v29 = 0u;
    memset(v30, 0, sizeof(v30));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    v10 = 0u;
    v9 = 0u;
    v8 = 0u;
    v7 = 2;
    LOBYTE(v8) = 2;
    v3 = (double)a3 / 100.0;
    v4 = (double)*((int *)&qword_1000A29AC + self->tsfdIndex);
    LODWORD(v29) = (int)v3 << 16;
    v5 = v4 / 100.0;
    HIDWORD(v28) = (int)(v4 / 100.0) << 16;
    if (IOMobileFramebufferSetBlock(qword_1000A2E30, 1, &v7, 384, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055B20();
    }
    else if (byte_1000A2480)
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v32 = v3;
        v33 = 2048;
        v34 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Sent max temp = %0.2f and center temp TSFD = %0.2f to the display driver", buf, 0x16u);
      }
    }
  }
}

- (void)send2DGridTempsToDisplayDriver:(int *)a3
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int *v10;
  int *v11;
  int v12;
  NSObject *v13;
  __int16 v14[2];
  int v15;
  char v16[352];
  uint64_t v17;

  if (qword_1000A2E30)
  {
    bzero(v16, 0x708uLL);
    v15 = 1;
    v16[0] = 2;
    v5 = objc_msgSend(-[CommonProduct getGridX](self, "getGridX"), "count");
    v6 = objc_msgSend(-[CommonProduct getGridY](self, "getGridY"), "count");
    if ((v6 & 0x80000000) == 0)
    {
      v7 = 0;
      v8 = (int *)&v17;
      do
      {
        v9 = v5 + 1;
        v10 = v8;
        v11 = a3;
        if ((v5 & 0x80000000) == 0)
        {
          do
          {
            v12 = *v11++;
            *v10++ = (v12 << 16) / 100;
            --v9;
          }
          while (v9);
        }
        ++v7;
        a3 += (int)(v5 + 1);
        v8 += 18;
      }
      while (v7 != v6 + 1);
    }
    if (IOMobileFramebufferSetBlock(qword_1000A2E30, 2, &v15, 1804, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055B4C();
    }
    else if (byte_1000A2480)
    {
      v13 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> Sent the 2D gridVT to the display driver", (uint8_t *)v14, 2u);
      }
    }
  }
}

- (void)setup2DGridDisplayDriver
{
  id v3;
  id v4;
  signed int v5;
  signed int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t i;
  unsigned int v10;
  NSObject *v11;
  uint8_t v12[4];
  int v13;
  _BYTE v14[1800];

  if (qword_1000A2E30)
  {
    v3 = -[CommonProduct getGridX](self, "getGridX");
    v4 = -[CommonProduct getGridY](self, "getGridY");
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(v4, "count");
    bzero(v14, 0x708uLL);
    v7 = 0;
    v13 = 1;
    v14[0] = 4;
    do
    {
      if (v7 >= v5)
        v8 = 0;
      else
        v8 = objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v7), "intValue");
      *(_DWORD *)&v14[4 * v7++ + 1648] = v8;
    }
    while (v7 != 17);
    for (i = 0; i != 17; ++i)
    {
      if (i >= v6)
        v10 = 0;
      else
        v10 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", i), "intValue");
      *(_DWORD *)&v14[4 * i + 1716] = v10;
    }
    if (IOMobileFramebufferSetBlock(qword_1000A2E30, 2, &v13, 1804, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055BA4();
    }
    else if (byte_1000A2480)
    {
      v11 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> Sent the  grid to the display driver", v12, 2u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100055B78();
  }
}

- (id)getGridX
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100055BD0();
  return 0;
}

- (id)getGridY
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100055BFC();
  return 0;
}

- (void)overrideLifetimeServoParam:(id)a3 value:(int)a4
{
  uint64_t v4;
  LifetimeServoController *lifetimeServoController;
  LifetimeServoStatePersistence *lifetimeServoStatePersistence;

  v4 = *(_QWORD *)&a4;
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController)
    -[LifetimeServoController overrideParam:value:](lifetimeServoController, "overrideParam:value:", a3, *(_QWORD *)&a4);
  lifetimeServoStatePersistence = self->lifetimeServoStatePersistence;
  if (lifetimeServoStatePersistence)
    -[LifetimeServoStatePersistence overrideParam:value:](lifetimeServoStatePersistence, "overrideParam:value:", a3, v4);
}

- (int)arcModuleTemperature
{
  return 3000;
}

- (int)arcVirtualTemperature
{
  return 3000;
}

- (void)overrideArcParam:(id)a3 value:(int)a4
{
  -[ArcController overrideParam:value:](self->_arcController, "overrideParam:value:", a3, *(_QWORD *)&a4);
}

- (void)updateControlEffortFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[CommonProduct findComponent:](self, "findComponent:");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setControlEffort:", v4);
    objc_msgSend(v8, "setAllowCEOverride:", 1);
  }
  v9 = -[CommonProduct findComponent:](self, "findComponent:", v5);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setControlEffort:", v4);
    objc_msgSend(v10, "setAllowCEOverride:", 1);
  }
}

- (void)updateHotSpotPIDTargetFor:(int)a3 :(unsigned int)a4
{
  id v5;
  double v6;

  v5 = -[CommonProduct findComponent:](self, "findComponent:", *(_QWORD *)&a3);
  *(float *)&v6 = (float)a4 / 100.0;
  objc_msgSend(v5, "overrideTargetTemperature:", v6);
}

- (void)removeHotspotTargetOverrides
{
  NSMutableArray *listOfSupervisorControl;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(listOfSupervisorControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "resetTargetTemperature");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)applyAlternateHotSpotTargets:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *listOfSupervisorControl;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(listOfSupervisorControl);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "applyAlternateTarget:", v3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)updateMaxLIFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = -[CommonProduct findComponent:](self, "findComponent:", *(_QWORD *)&a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setAllowLIOverride:", 0);
    objc_msgSend(v6, "setMaxLoadingIndex:releaseIndex:", v4, v4);
    objc_msgSend(v6, "setAllowLIOverride:", 1);
  }
}

- (void)updateSleepTargetFor:(int)a3 :(unsigned int)a4
{
  id v5;
  double v6;

  v5 = -[CommonProduct findComponent:](self, "findComponent:", *(_QWORD *)&a3);
  if (v5)
  {
    *(float *)&v6 = (float)a4 / 100.0;
    objc_msgSend(v5, "setTHERMAL_TRAP_SLEEP:", v6);
  }
}

- (void)updateTrapTargetFor:(int)a3 :(unsigned int)a4
{
  id v5;
  double v6;

  v5 = -[CommonProduct findComponent:](self, "findComponent:", *(_QWORD *)&a3);
  if (v5)
  {
    *(float *)&v6 = (float)a4 / 100.0;
    objc_msgSend(v5, "setTHERMAL_TRAP_LOAD:", v6);
  }
}

- (unint64_t)getPotentialForcedThermalLevel:(unint64_t)a3
{
  NSMutableArray *listOfSupervisorControl;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (byte_10009A1F0)
  {
    if (self->canForceThermalLevels)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      listOfSupervisorControl = self->listOfSupervisorControl;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = 0;
        v10 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(listOfSupervisorControl);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            v8 |= objc_msgSend(v12, "shouldForceThermalLevelForThreshold:", 0);
            v9 |= objc_msgSend(v12, "shouldForceThermalLevelForThreshold:", 1);
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
        if (((v9 | v8) & 1) != 0)
        {
          v13 = 236;
          if ((v9 & 1) != 0)
            v13 = 240;
          return *(int *)((char *)&self->super.isa + v13);
        }
      }
    }
  }
  return a3;
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  NSMutableArray *listOfSupervisorControl;
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(listOfSupervisorControl);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "shouldEnforceLightThermalPressure");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (int)getModeratePressureVersion
{
  return self->moderatePressureToLevelVersion;
}

- (int)sensorIndexFromList:(__CFArray *)a3 fourCharCode:(__CFString *)a4
{
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;

  LODWORD(v4) = -1;
  if (a3 && a4)
  {
    if (CFArrayGetCount(a3) < 1)
    {
LABEL_9:
      LODWORD(v4) = -1;
    }
    else
    {
      v4 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v4);
        if (ValueAtIndex)
        {
          Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("4CharCode"));
          if (Value)
          {
            if (CFStringCompare(Value, a4, 0) == kCFCompareEqualTo)
              break;
          }
        }
        if (CFArrayGetCount(a3) <= ++v4)
          goto LABEL_9;
      }
    }
  }
  return v4;
}

- (__CFArray)copyHotspotsArray:(id)a3
{
  __CFArray *v3;
  __CFArray *v4;

  v3 = (__CFArray *)objc_msgSend(a3, "getConfigurationFor:", CFSTR("hotspots"));
  v4 = v3;
  if (v3)
    CFRetain(v3);
  return v4;
}

- (void)replaceOrAppendHotspotEntry:(__CFDictionary *)a3 existingHotspots:(__CFArray *)a4
{
  const __CFString *Value;
  const __CFString *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v12;
  void *newValues;
  CFRange v14;

  newValues = a3;
  Value = (const __CFString *)CFDictionaryGetValue(a3, CFSTR("description"));
  if (Value)
  {
    v7 = Value;
    Count = CFArrayGetCount(a4);
    if (Count < 1)
    {
LABEL_7:
      CFArrayAppendValue(a4, a3);
    }
    else
    {
      v9 = Count;
      v10 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
        if (ValueAtIndex)
        {
          v12 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("description"));
          if (CFStringCompare(v12, v7, 0) == kCFCompareEqualTo)
            break;
        }
        if (v9 == ++v10)
          goto LABEL_7;
      }
      v14.location = v10;
      v14.length = 1;
      CFArrayReplaceValues(a4, v14, (const void **)&newValues, 1);
    }
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
  _BOOL8 v3;
  LifetimeServoController *lifetimeServoController;

  v3 = a3;
  -[ContextAwareThermalManager updateSystemPowerState:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "updateSystemPowerState:", a3);
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController)
    -[LifetimeServoController updateSystemPowerState:](lifetimeServoController, "updateSystemPowerState:", v3);
}

- (BOOL)canSystemSleep
{
  return 1;
}

- (BOOL)shouldSuppressStandardBehaviors:(__CFDictionary *)a3
{
  CFPropertyListRef v4;
  NSObject *v5;
  CFTypeID v6;
  const __CFArray *Value;
  const __CFArray *v8;
  CFIndex v9;
  const __CFNumber *ValueAtIndex;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v17;
  _BOOL4 v18;
  uint8_t v19;
  _BYTE v20[15];
  uint8_t v21;
  _BYTE v22[11];
  int valuePtr;
  uint8_t buf[4];
  CFPropertyListRef v25;

  v4 = CFPreferencesCopyValue(CFSTR("FProgramNumber"), CFSTR("com.apple.demo-settings"), CFSTR("mobile"), kCFPreferencesCurrentHost);
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> FContext %@", buf, 0xCu);
    }
  }
  valuePtr = 0;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue((CFNumberRef)v4, kCFNumberIntType, &valuePtr))
      {
        Value = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("suppressionFContexts"));
        if (Value)
        {
          v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            v9 = 0;
            while (1)
            {
              ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, v9);
              if (ValueAtIndex)
              {
                *(_DWORD *)buf = 0;
                if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, buf))
                {
                  if (*(_DWORD *)buf == -1 || *(_DWORD *)buf == valuePtr)
                  {
                    v18 = 1;
                    goto LABEL_29;
                  }
                }
                else
                {
                  v13 = qword_1000A28A0;
                  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                    sub_100055C5C(&v21, v22, v13);
                }
              }
              else
              {
                v12 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                  sub_100055C28(&v19, v20, v12);
              }
              if (++v9 >= CFArrayGetCount(v8))
                goto LABEL_27;
            }
          }
          goto LABEL_37;
        }
        if (!byte_1000A2480)
        {
LABEL_37:
          v18 = 0;
          goto LABEL_29;
        }
        v17 = qword_1000A28A0;
        v18 = 0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext array", buf, 2u);
          goto LABEL_37;
        }
LABEL_29:
        CFRelease(v4);
        goto LABEL_30;
      }
    }
  }
  if (byte_1000A2480)
  {
    v14 = qword_1000A28A0;
    v18 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext key", buf, 2u);
  }
LABEL_27:
  v18 = 0;
LABEL_28:
  if (v4)
    goto LABEL_29;
LABEL_30:
  if (byte_1000A2480)
  {
    v15 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> suppressStandardBehaviors %d", buf, 8u);
    }
  }
  return v18;
}

- (int)canaryTempSensorIndex
{
  return -1;
}

- (int)canaryTempThreshold
{
  return -32768;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return *(&off_10007E310 + a3);
}

- (int)calibrationResistorSensor
{
  return self->calibrationResistorSensor;
}

- (int)calibrationResistorTempDefault
{
  return self->calibrationResistorTempDefault;
}

- (unsigned)requiredCalibrationResistorSamples
{
  return self->requiredCalibrationResistorSamples;
}

- (unint64_t)componentThermalStatusLevel
{
  return self->componentThermalStatusLevel;
}

- (void)setComponentThermalStatusLevel:(unint64_t)a3
{
  self->componentThermalStatusLevel = a3;
}

- (NSMutableArray)listofComponentControl
{
  return self->listofComponentControl;
}

- (NSMutableArray)listOfSupervisorControl
{
  return self->listOfSupervisorControl;
}

- (void)setThermalState:(int)a3
{
  self->thermalState = a3;
}

- (BOOL)isBackLightOn
{
  return self->_isBackLightOn;
}

- (void)setIsBackLightOn:(BOOL)a3
{
  self->_isBackLightOn = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)chargerToken
{
  return self->_chargerToken;
}

- (void)setChargerToken:(int)a3
{
  self->_chargerToken = a3;
}

- (int)chargerState
{
  return self->_chargerState;
}

- (void)setChargerState:(int)a3
{
  self->_chargerState = a3;
}

- (OS_dispatch_queue)thermalQueue
{
  return self->_thermalQueue;
}

- (void)setThermalQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (int64_t)thermalPressureLevel
{
  return self->thermalPressureLevel;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (BOOL)isCPMSMitigationEnabled
{
  return self->_isCPMSMitigationEnabled;
}

- (void)setIsCPMSMitigationEnabled:(BOOL)a3
{
  self->_isCPMSMitigationEnabled = a3;
}

@end

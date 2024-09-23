@implementation ContextualClampController

- (int)numberOfFields
{
  return 9;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  unint64_t coldPressureState;
  __CFString *result;
  const __CFAllocator *v6;
  uint64_t rearCameraPowered;

  switch(a3)
  {
    case 0:
      v3 = kCFAllocatorDefault;
      coldPressureState = self->_coldPressureState;
      goto LABEL_13;
    case 1:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_rearCameraPowered;
      goto LABEL_11;
    case 2:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_lowTempPerfCapCPU;
      goto LABEL_11;
    case 3:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_lowTempPerfCapGPU;
      goto LABEL_11;
    case 4:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_lowTempPerfCapBL;
      goto LABEL_11;
    case 5:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_lowTempSyntheticSOC;
      goto LABEL_11;
    case 6:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_batteryRaValueTrue;
      goto LABEL_11;
    case 7:
      v6 = kCFAllocatorDefault;
      rearCameraPowered = self->_frontCameraPowered;
LABEL_11:
      result = (__CFString *)CFStringCreateWithFormat(v6, 0, CFSTR("%d"), rearCameraPowered);
      break;
    case 8:
      v3 = kCFAllocatorDefault;
      coldPressureState = self->_peakPowerPressureLevel;
LABEL_13:
      result = (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%lld"), coldPressureState);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)update
{
  OS_dispatch_queue *clampQueue;
  _QWORD block[5];

  if (self->_product)
  {
    clampQueue = self->_clampQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000098B0;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)clampQueue, block);
  }
}

- (void)updateInternal
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  AgingController *agingController;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  int batteryRaValueTrue;
  TableDrivenLowTempController *lowTempClampBL;
  int v20;
  unint64_t coldPressureState;
  int v22;
  int coldThresholdHysteresis;
  int coldThresholdModerate;
  unint64_t v25;
  NSObject *v26;
  TableDrivenLowTempController *lowTempClampPeakPowerPressure;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  TableDrivenLowTempController *lowTempClampStrobe;
  int v33;
  int v34;
  NSObject *v35;
  CFNumberRef v36;
  CFNumberRef v37;
  TableDrivenLowTempController *lowTempClampPPMBaseline;
  int v39;
  int v40;
  NSObject *v41;
  CFArrayRef v42;
  CFArrayRef v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE cf[14];
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;

  v3 = -[CommonProduct gasGaugeBatteryTemperature](self->_product, "gasGaugeBatteryTemperature");
  v4 = sub_10000906C();
  self->_lowTempSyntheticSOC = v4;
  if (self->_syntheticSOCType == 1)
  {
    v5 = sub_1000347FC();
    v6 = (int)((double)v5 * 0.4 + (double)(int)v4 * 0.6 + 0.5);
    self->_lowTempSyntheticSOC = v6;
    if (byte_1000A2480)
    {
      v7 = v5;
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)cf = 67109632;
        *(_DWORD *)&cf[4] = v4;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v7;
        v54 = 1024;
        v55 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: UI SOC %d, GG SOC %d ==> synthetic SOC %d", cf, 0x14u);
      }
    }
  }
  agingController = self->_agingController;
  if (agingController)
  {
    v10 = sub_1000353D8();
    -[AgingController takeActionOnUPO:forWRa:](agingController, "takeActionOnUPO:forWRa:", v10, sub_100034EB4());
  }
  if (self->_isAgeAware)
  {
    if (self->_deviceUsesWeightedRa)
    {
      if (byte_1000A2480)
      {
        v11 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(_QWORD *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> %s Using weighted Ra\n", cf, 0xCu);
        }
      }
      v12 = sub_100034EB4();
    }
    else
    {
      if (byte_1000A2480)
      {
        v14 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(_QWORD *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> %s Using max Ra\n", cf, 0xCu);
        }
      }
      v12 = sub_100035080();
    }
    v13 = v12;
    self->_batteryRaValueTrue = v12;
    v15 = sub_1000353D8();
    v16 = v15;
    if (dword_10009A2F8 < 0)
      dword_10009A2F8 = v15;
    if (byte_1000A2480)
    {
      v17 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        batteryRaValueTrue = self->_batteryRaValueTrue;
        *(_DWORD *)cf = 67109888;
        *(_DWORD *)&cf[4] = batteryRaValueTrue;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v13;
        v54 = 1024;
        v55 = v13;
        v56 = 1024;
        v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Ra true %d, effective Ra %d, effective Max Ra %d, count %d", cf, 0x1Au);
      }
    }
    if (!v16)
      goto LABEL_26;
  }
  else
  {
    v13 = 0;
  }
  lowTempClampBL = self->_lowTempClampBL;
  if (!lowTempClampBL)
  {
LABEL_26:
    v20 = 100;
    goto LABEL_27;
  }
  v20 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:](lowTempClampBL, "outputForBatteryTemperature:stateOfCharge:batteryRaValue:", v3, v4, v13);
LABEL_27:
  if (self->_lowTempPerfCapCPU != 100
    || self->_lowTempPerfCapGPU != 100
    || v20 != self->_lowTempPerfCapBL
    || self->_lowTempPerfCapCPULegacy != 100)
  {
    self->_lowTempPerfCapGPU = 100;
    self->_lowTempPerfCapBL = v20;
    *(_QWORD *)&self->_lowTempPerfCapCPULegacy = 0x6400000064;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }
  coldPressureState = self->_coldPressureState;
  switch(coldPressureState)
  {
    case 0x1EuLL:
      coldThresholdHysteresis = self->_coldThresholdHysteresis;
      if ((int)v3 <= coldThresholdHysteresis + self->_coldThresholdHeavy)
        goto LABEL_45;
      coldThresholdModerate = self->_coldThresholdModerate;
LABEL_41:
      v22 = coldThresholdModerate + coldThresholdHysteresis;
LABEL_42:
      if ((int)v3 <= v22)
        v25 = 20;
      else
        v25 = 0;
      goto LABEL_49;
    case 0x14uLL:
      if ((int)v3 <= self->_coldThresholdHeavy)
        goto LABEL_45;
      coldThresholdHysteresis = self->_coldThresholdModerate;
      coldThresholdModerate = self->_coldThresholdHysteresis;
      goto LABEL_41;
    case 0uLL:
      if ((int)v3 > self->_coldThresholdHeavy)
      {
        v22 = self->_coldThresholdModerate;
        goto LABEL_42;
      }
LABEL_45:
      v25 = 30;
      goto LABEL_49;
  }
  v26 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053910(coldPressureState, v26);
  v25 = 0;
LABEL_49:
  lowTempClampPeakPowerPressure = self->_lowTempClampPeakPowerPressure;
  if (lowTempClampPeakPowerPressure
    && (v28 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:](lowTempClampPeakPowerPressure, "outputForBatteryTemperature:stateOfCharge:batteryRaValue:", v3, v4, v13)) != 0)
  {
    v29 = v28;
    if (sub_1000355B4(self->_chargerService))
      v30 = 0;
    else
      v30 = v29;
  }
  else
  {
    v30 = 0;
  }
  if (self->_peakPowerPressureLevel != v30)
  {
    v31 = v30;
    self->_peakPowerPressureLevel = v30;
    if (byte_10009A1F0)
    {
      -[TGraphSampler updateAppleCareState:value:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updateAppleCareState:value:", 4, v30);
      if (notify_set_state(self->_peakPowerPressureNotificationToken, v31))
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000538E4();
      }
      else if (notify_post("com.apple.system.peakpowerpressurelevel")
             && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_1000538B8();
      }
    }
  }
  if (v25 != self->_coldPressureState)
  {
    self->_coldPressureState = v25;
    if (byte_10009A1F0)
    {
      -[TGraphSampler updateAppleCareState:value:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updateAppleCareState:value:", 2, v25);
      if (notify_set_state(self->_coldPressureNotificationToken, v25))
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000538E4();
      }
      else if (notify_post("com.apple.system.thermalpressurelevel.cold")
             && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_1000538B8();
      }
    }
  }
  lowTempClampStrobe = self->_lowTempClampStrobe;
  if (lowTempClampStrobe)
  {
    v33 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:](lowTempClampStrobe, "outputForBatteryTemperature:stateOfCharge:batteryRaValue:", v3, self->_lowTempSyntheticSOC, v13);
    if (v33 != self->_lowTempMaxStrobe)
    {
      if (byte_10009A1F0)
      {
        v34 = v33;
        self->_lowTempMaxStrobe = v33;
        if (byte_1000A2480)
        {
          v35 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)cf = 67109120;
            *(_DWORD *)&cf[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: max strobe now %d", cf, 8u);
          }
        }
        v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempMaxStrobe);
        if (v36)
        {
          v37 = v36;
          if (IORegistryEntrySetCFProperty(self->_strobeService, CFSTR("CameraStrobeMaxLoad"), v36)
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_10005388C();
          }
          CFRelease(v37);
        }
      }
    }
  }
  lowTempClampPPMBaseline = self->_lowTempClampPPMBaseline;
  if (lowTempClampPPMBaseline)
  {
    v39 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:](lowTempClampPPMBaseline, "outputForBatteryTemperature:stateOfCharge:batteryRaValue:", v3, self->_lowTempSyntheticSOC, v13);
    if (v39 != self->_lowTempPPMBaseline)
    {
      if (byte_10009A1F0)
      {
        v40 = v39;
        self->_lowTempPPMBaseline = v39;
        if (byte_1000A2480)
        {
          v41 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)cf = 67109120;
            *(_DWORD *)&cf[4] = v40;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: PPM baseline now %d", cf, 8u);
          }
        }
        *(_QWORD *)cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempPPMBaseline);
        if (*(_QWORD *)cf)
        {
          v42 = CFArrayCreate(kCFAllocatorDefault, (const void **)cf, 1, &kCFTypeArrayCallBacks);
          if (v42)
          {
            v43 = v42;
            v44 = IORegistryEntrySetCFProperty(self->_ppmService, CFSTR("BaselineSystemCapability"), v42);
            if ((_DWORD)v44)
            {
              v45 = v44;
              v46 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                sub_100053828(v45, v46, v47, v48, v49, v50, v51, v52);
            }
            CFRelease(v43);
          }
          CFRelease(*(CFTypeRef *)cf);
        }
      }
    }
  }
}

- (ContextualClampController)init
{
  return -[ContextualClampController initWithParams:backlightController:product:](self, "initWithParams:backlightController:product:", 0, 0, 0);
}

- (ContextualClampController)initWithParams:(id)a3 backlightController:(id)a4 product:(id)a5
{
  ContextualClampController *v8;
  ContextualClampController *v9;
  dispatch_queue_t v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  _BOOL4 isAgeAware;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  AgingController *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  signed int v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  int syntheticSOCType;
  id v42;
  TableDrivenLowTempController *v43;
  const __CFDictionary *v44;
  io_service_t MatchingService;
  id v46;
  TableDrivenLowTempController *v47;
  const __CFDictionary *v48;
  io_service_t v49;
  unsigned int v50;
  const __CFDictionary *v51;
  const __CFDictionary *v52;
  id v53;
  NSObject *clampQueue;
  void **v56;
  uint64_t v57;
  id (*v58)(uint64_t, int);
  void *v59;
  id v60;
  id out_token;
  _QWORD v62[4];
  id v63;
  int token;
  objc_super v65;
  uint8_t buf[4];
  _BYTE v67[10];
  id v68;

  v65.receiver = self;
  v65.super_class = (Class)ContextualClampController;
  v8 = -[ContextualClampController init](&v65, "init");
  v9 = v8;
  if (!v8)
    return v9;
  v8->_product = (CommonProduct *)a5;
  v8->_backlightController = (BackLightCC *)a4;
  v10 = dispatch_queue_create("com.apple.ThermalMonitor.context.clamp", 0);
  v9->_odeonFloorCPUPower = 0;
  v9->_clampQueue = (OS_dispatch_queue *)v10;
  v9->_frontCameraPowered = 0;
  v9->_odeonEnabled = 0;
  v9->_oasisEnabled = 0;
  v9->_oasisFloorCPUPower = 0;
  v11 = objc_msgSend((id)qword_1000A2E38, "requestListID");
  v9->_cameraFloorCPU = 0;
  v9->_mitigationControllerListID = v11;
  v9->_cameraFloorPackagePower = 0;
  v9->_cameraFloorGPU = 0;
  v9->_usesPackagePowerControl = 0;
  v9->_coldPressureState = 0;
  v9->_peakPowerPressureLevel = 0;
  *(_QWORD *)&v9->_lowTempPerfCapCPU = 0x6400000064;
  v9->_lowTempPerfCapBL = 100;
  v9->_lowTempPPMBaseline = 100;
  *(_QWORD *)&v9->_syntheticSOCType = 0;
  v9->_ppmService = 0;
  v9->_cameraFloorDetails = 0;
  v9->_hasCameraFloorDetails = 0;
  *(_QWORD *)((char *)&v9->_lowTempSyntheticSOC + 1) = 0;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000534D4();
    v13 = 0;
    goto LABEL_82;
  }
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("cameraFloorCPU"), kCFNumberIntType, &v9->_cameraFloorCPU);
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("cameraFloorGPU"), kCFNumberIntType, &v9->_cameraFloorGPU);
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("cameraFloorPackagePower"), kCFNumberIntType, &v9->_cameraFloorPackagePower);
  if (v9->_cameraFloorPackagePower >= 1)
    v9->_usesPackagePowerControl = 1;
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("odFloorCPU"), kCFNumberIntType, &v9->_odeonFloorCPUPower);
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("oasisFloorCPU"), kCFNumberIntType, &v9->_oasisFloorCPUPower);
  if (sub_100034168((const __CFDictionary *)a3, CFSTR("usesCameraFloorPackageDetails"), 0))
  {
    v12 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: using detailed budgets for package power camera floor", buf, 2u);
    }
    v9->_cameraFloorDetails = 0x63616D666C6F6F72;
    v9->_hasCameraFloorDetails = 1;
  }
  v13 = sub_100034168((const __CFDictionary *)a3, CFSTR("usesFrontCameraFloors"), 0);
  v9->_isAgeAware = objc_msgSend(a3, "objectForKey:", CFSTR("isAgeAware")) != 0;
  v14 = objc_msgSend(a3, "valueForKey:", CFSTR("useWeightedRa"));
  v9->_deviceUsesWeightedRa = v14 != 0;
  v15 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    isAgeAware = v9->_isAgeAware;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v67 = isAgeAware;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v14 != 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: isAgeAware %d useWeightedRa %d\n", buf, 0xEu);
  }
  v9->_backlightCapIsSoft = v9->_isAgeAware;
  v17 = objc_msgSend(a3, "objectForKey:", CFSTR("lowParamsBL"));
  if (v17)
    v9->_lowTempClampBL = -[TableDrivenLowTempController initWithParams:]([TableDrivenLowTempController alloc], "initWithParams:", v17);
  v18 = objc_msgSend(a3, "objectForKey:", CFSTR("batteryParams"));
  LODWORD(out_token) = 0;
  token = 0;
  if (!v18)
  {
    if (byte_1000A2480)
    {
      v21 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> No Battery parameters set for platform", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  if (byte_1000A2480)
  {
    v19 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v67 = "-[ContextualClampController initWithParams:backlightController:product:]";
      *(_WORD *)&v67[8] = 2112;
      v68 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice> %s Aging Controller params: %@", buf, 0x16u);
    }
  }
  if (objc_msgSend(v18, "objectForKey:", CFSTR("usesAgingController"))
    && objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("usesAgingController")), "BOOLValue")&& (sub_10003559C() & 1) == 0)
  {
    v22 = [AgingController alloc];
    v23 = sub_100034EB4();
    v9->_agingController = -[AgingController initWithParams:currentWRa:currentUPOCount:](v22, "initWithParams:currentWRa:currentUPOCount:", v18, v23, sub_1000353D8());
  }
  else
  {
    v20 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Aging controller disabled for platform", buf, 2u);
    }
  }
  v24 = objc_msgSend(v18, "objectForKey:", CFSTR("wRaP0LimitsPerChemId"));
  if (!v24)
  {
LABEL_32:
    v28 = 500;
    goto LABEL_38;
  }
  v25 = sub_100034E84();
  v26 = objc_msgSend(v24, "objectForKey:", -[NSNumber stringValue](+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25), "stringValue"));
  if (v26)
  {
    v27 = objc_msgSend(v26, "intValue");
  }
  else
  {
    v29 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("-1"));
    v30 = qword_1000A28A0;
    v31 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v31)
        sub_100053760(v25, v30, v32, v33, v34, v35, v36, v37);
      v28 = -1;
      goto LABEL_38;
    }
    if (v31)
      sub_1000537C4(v25, v30, v32, v33, v34, v35, v36, v37);
    v27 = objc_msgSend(v29, "intValue");
  }
  v28 = v27;
LABEL_38:
  if (notify_register_check("com.apple.system.batteryHealth.p0Threshold", (int *)&out_token))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000536F4();
  }
  else
  {
    if (notify_set_state((int)out_token, v28))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100053688();
    }
    else
    {
      notify_post("com.apple.system.batteryHealth.p0Threshold");
    }
    if (byte_1000A2480)
    {
      v38 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v67 = v28;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "<Notice> p0Threshold set to %llu\n", buf, 0xCu);
      }
    }
  }
  if (notify_register_check("com.apple.system.batteryHealth.UPOAware", &token))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005361C();
  }
  else
  {
    if (notify_set_state(token, 0x4E4FuLL))
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000535B0();
    }
    else
    {
      notify_post("com.apple.system.batteryHealth.UPOAware");
    }
    if (byte_1000A2480)
    {
      v39 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<Notice> Battery Health is influenced by UPO mitigation count", buf, 2u);
      }
    }
  }
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("syntheticSOCType"), kCFNumberIntType, &v9->_syntheticSOCType);
  if (byte_1000A2480)
  {
    v40 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      syntheticSOCType = v9->_syntheticSOCType;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v67 = syntheticSOCType;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: syntheticSOCType %d", buf, 8u);
    }
  }
  v42 = objc_msgSend(a3, "objectForKey:", CFSTR("lowParamsStrobe"));
  if (v42)
  {
    v43 = -[TableDrivenLowTempController initWithParams:]([TableDrivenLowTempController alloc], "initWithParams:", v42);
    v9->_lowTempClampStrobe = v43;
    if (v43)
    {
      v44 = IOServiceMatching("AppleDieTempController");
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v44);
      v9->_strobeService = MatchingService;
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100053584();

        v9->_lowTempClampStrobe = 0;
      }
    }
  }
  v46 = objc_msgSend(a3, "objectForKey:", CFSTR("lowParamsPPMBaseline"));
  if (v46)
  {
    v47 = -[TableDrivenLowTempController initWithParams:]([TableDrivenLowTempController alloc], "initWithParams:", v46);
    v9->_lowTempClampPPMBaseline = v47;
    if (v47)
    {
      v48 = IOServiceMatching("ApplePPM");
      v49 = IOServiceGetMatchingService(kIOMainPortDefault, v48);
      v9->_ppmService = v49;
      if (!v49)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100053558();

        v9->_lowTempClampPPMBaseline = 0;
      }
    }
  }
  v50 = sub_1000340B8("IOPMPowerSource", CFSTR("BatteryInstalled"), kCFBooleanTrue);
  v9->_chargerService = v50;
  if (!v50 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10005352C();
  v51 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("lowNotificationLimits"));
  v52 = v51;
  if (v51)
  {
    sub_1000048B0(v51, CFSTR("tempLimit1"), kCFNumberIntType, &v9->_coldThresholdModerate);
    sub_1000048B0(v52, CFSTR("tempLimit2"), kCFNumberIntType, &v9->_coldThresholdHeavy);
    sub_1000048B0(v52, CFSTR("tempLimitHysteresis"), kCFNumberIntType, &v9->_coldThresholdHysteresis);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100053500();
  }
  v53 = objc_msgSend(a3, "objectForKey:", CFSTR("lowParamsPeakPower"));
  if (v53)
    v9->_lowTempClampPeakPowerPressure = -[TableDrivenLowTempController initWithParams:]([TableDrivenLowTempController alloc], "initWithParams:", v53);
LABEL_82:
  objc_initWeak((id *)buf, v9);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10003A3DC;
  v62[3] = &unk_10007D0E8;
  objc_copyWeak(&v63, (id *)buf);
  sub_1000358D8("com.apple.isp.backcamerapower", &v9->_rearCameraPowerStateToken, v9->_clampQueue, v62);
  sub_1000358D8("com.apple.isp.backtelecamerapower", &v9->_rearTeleCameraPowerStateToken, v9->_clampQueue, v62);
  sub_1000358D8("com.apple.isp.backsuperwidecamerapower", &v9->_rearSuperWideCameraPowerStateToken, v9->_clampQueue, v62);
  if (v13)
  {
    objc_initWeak(&out_token, v9);
    clampQueue = v9->_clampQueue;
    v56 = _NSConcreteStackBlock;
    v57 = 3221225472;
    v58 = sub_10003A42C;
    v59 = &unk_10007D0E8;
    objc_copyWeak(&v60, &out_token);
    sub_1000358D8("com.apple.isp.frontcamerapower", &v9->_frontCameraPowerStateToken, clampQueue, &v56);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&out_token);
  }
  if (notify_register_check("com.apple.system.thermalpressurelevel.cold", &v9->_coldPressureNotificationToken)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000534A8();
  }
  if (notify_register_check("com.apple.system.peakpowerpressurelevel", &v9->_peakPowerPressureNotificationToken)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10005347C();
  }
  -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance", v56, v57, v58, v59), "addtGraphDataSource:", v9);
  objc_destroyWeak(&v63);
  objc_destroyWeak((id *)buf);
  return v9;
}

- (void)updateMaxLIFloorsAndCeilings
{
  uint64_t cameraFloorGPU;
  uint64_t cameraFloorCPU;
  uint64_t v5;
  NSObject *v6;
  int v7;
  BackLightCC *backlightController;
  uint64_t lowTempPerfCapBL;
  NSObject *v10;
  int lowTempPerfCapGPU;
  int lowTempPerfCapCPU;
  int v13;
  _BOOL4 v14;
  _BOOL4 odeonEnabled;
  _BOOL4 oasisEnabled;
  int v17;
  _BYTE v18[10];
  _BYTE v19[6];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;

  if (byte_10009A1F0)
  {
    if (self->_rearCameraPowered || self->_frontCameraPowered)
    {
      cameraFloorCPU = self->_cameraFloorCPU;
      cameraFloorGPU = self->_cameraFloorGPU;
      v5 = 1;
    }
    else
    {
      cameraFloorCPU = 0;
      v5 = 0;
      cameraFloorGPU = 0;
    }
    if (self->_usesPackagePowerControl)
    {
      -[ContextualClampController updatePackageFloorsAndCeilings:](self, "updatePackageFloorsAndCeilings:", v5);
    }
    else
    {
      if (byte_1000A2480)
      {
        v6 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v7 = self->_cameraFloorCPU;
          v17 = 136315394;
          *(_QWORD *)v18 = "-[ContextualClampController updateMaxLIFloorsAndCeilings]";
          *(_WORD *)&v18[8] = 1024;
          *(_DWORD *)v19 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: [%s] Setting CPU kDVD1 to floor value%d\n", (uint8_t *)&v17, 0x12u);
        }
      }
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerFloor:fromDecisionSource:", cameraFloorCPU, self->_mitigationControllerListID);
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:forDVD1Contributor:", self->_lowTempPerfCapCPU, 2);
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:fromDecisionSource:", self->_lowTempPerfCapCPU, self->_mitigationControllerListID);
      objc_msgSend((id)qword_1000A2E38, "updateCPU");
      objc_msgSend((id)qword_1000A2E38, "setGPUPowerFloor:fromDecisionSource:", cameraFloorGPU, self->_mitigationControllerListID);
      objc_msgSend((id)qword_1000A2E38, "setGPUPowerCeiling:fromDecisionSource:", self->_lowTempPerfCapGPU, self->_mitigationControllerListID);
      objc_msgSend((id)qword_1000A2E38, "updateGPU");
    }
    backlightController = self->_backlightController;
    lowTempPerfCapBL = self->_lowTempPerfCapBL;
    if (self->_backlightCapIsSoft)
      -[BackLightCC setMaxLICeilingSoft:](backlightController, "setMaxLICeilingSoft:", lowTempPerfCapBL);
    else
      -[BackLightCC setMaxLICeiling:](backlightController, "setMaxLICeiling:", lowTempPerfCapBL);
    if (byte_1000A2480)
    {
      v10 = qword_1000A28A0;
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      lowTempPerfCapCPU = self->_lowTempPerfCapCPU;
      lowTempPerfCapGPU = self->_lowTempPerfCapGPU;
      v13 = self->_lowTempPerfCapBL;
      v14 = self->_rearCameraPowered || self->_frontCameraPowered;
      v17 = 67110400;
      *(_DWORD *)v18 = cameraFloorCPU;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = lowTempPerfCapCPU;
      *(_WORD *)v19 = 1024;
      *(_DWORD *)&v19[2] = cameraFloorGPU;
      v20 = 1024;
      v21 = lowTempPerfCapGPU;
      v22 = 1024;
      v23 = v13;
      v24 = 1024;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: CPU [%d, %d], GPU [%d, %d], BL [%d] (camera %d)", (uint8_t *)&v17, 0x26u);
      if (byte_1000A2480)
      {
        v10 = qword_1000A28A0;
LABEL_22:
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          odeonEnabled = self->_odeonEnabled;
          oasisEnabled = self->_oasisEnabled;
          v17 = 67109376;
          *(_DWORD *)v18 = odeonEnabled;
          *(_WORD *)&v18[4] = 1024;
          *(_DWORD *)&v18[6] = oasisEnabled;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Odeon %d Oasis %d", (uint8_t *)&v17, 0xEu);
        }
      }
    }
  }
}

- (void)updatePackageFloorsAndCeilings:(BOOL)a3
{
  uint64_t cameraFloorPackagePower;
  NSObject *v4;
  _DWORD v5[2];

  if (a3)
    cameraFloorPackagePower = self->_cameraFloorPackagePower;
  else
    cameraFloorPackagePower = 0;
  if (self->_hasCameraFloorDetails)
  {
    objc_msgSend((id)qword_1000A2E38, "setPackagePowerBudgetDirect:withDetails:", cameraFloorPackagePower, self->_cameraFloorDetails);
  }
  else
  {
    objc_msgSend((id)qword_1000A2E38, "setPackagePowerFloor:fromDecisionSource:", cameraFloorPackagePower, self->_mitigationControllerListID);
    objc_msgSend((id)qword_1000A2E38, "updatePackage");
  }
  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = cameraFloorPackagePower;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: PackagePowerFloor [%d]", (uint8_t *)v5, 8u);
    }
  }
}

- (void)handleRearCameraPowerStateNotification:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  unint64_t v8;

  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: rear camera state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  v6 = a3 != 0;
  if (self->_rearCameraPowered != v6)
  {
    self->_rearCameraPowered = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }
}

- (void)handleFrontCameraPowerStateNotification:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  unint64_t v8;

  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: front camera state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  v6 = a3 != 0;
  if (self->_frontCameraPowered != v6)
  {
    self->_frontCameraPowered = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }
}

- (void)handleOdeonStateNotification:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  unint64_t v8;

  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Odeon state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  v6 = a3 != 0;
  if (self->_odeonEnabled != v6)
  {
    self->_odeonEnabled = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }
}

- (void)handleOasisStateNotification:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  unint64_t v8;

  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Oasis state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  v6 = a3 != 0;
  if (self->_oasisEnabled != v6)
  {
    self->_oasisEnabled = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }
}

- (BOOL)isRearCameraPowered
{
  return self->_rearCameraPowered;
}

- (BOOL)isFrontCameraPowered
{
  return self->_frontCameraPowered;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 8)
    return 0;
  else
    return off_10007E168[a3];
}

- (int)rearCameraPowerStateToken
{
  return self->_rearCameraPowerStateToken;
}

- (void)setRearCameraPowerStateToken:(int)a3
{
  self->_rearCameraPowerStateToken = a3;
}

- (int)rearTeleCameraPowerStateToken
{
  return self->_rearTeleCameraPowerStateToken;
}

- (void)setRearTeleCameraPowerStateToken:(int)a3
{
  self->_rearTeleCameraPowerStateToken = a3;
}

- (int)rearSuperWideCameraPowerStateToken
{
  return self->_rearSuperWideCameraPowerStateToken;
}

- (void)setRearSuperWideCameraPowerStateToken:(int)a3
{
  self->_rearSuperWideCameraPowerStateToken = a3;
}

- (int)frontCameraPowerStateToken
{
  return self->_frontCameraPowerStateToken;
}

- (void)setFrontCameraPowerStateToken:(int)a3
{
  self->_frontCameraPowerStateToken = a3;
}

- (int)odeonStateToken
{
  return self->_odeonStateToken;
}

- (void)setOdeonStateToken:(int)a3
{
  self->_odeonStateToken = a3;
}

- (int)oasisStateToken
{
  return self->_oasisStateToken;
}

- (void)setOasisStateToken:(int)a3
{
  self->_oasisStateToken = a3;
}

- (OS_dispatch_queue)clampQueue
{
  return self->_clampQueue;
}

- (void)setClampQueue:(id)a3
{
  self->_clampQueue = (OS_dispatch_queue *)a3;
}

@end

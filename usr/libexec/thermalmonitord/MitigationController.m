@implementation MitigationController

- (int)numberOfFields
{
  return 20;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  uint64_t packageLowPowerTarget;
  const __CFAllocator *v5;
  uint64_t v6;

  switch(a3)
  {
    case 0:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_packageLowPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 1:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController SGXLevel](self, "SGXLevel");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 2:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = 100;
      if (!self->_powerSaveActive)
        packageLowPowerTarget = 0;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 3:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_maxCPUPower;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 4:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_maxGPUPower;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 5:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_currentCPUPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 6:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_currentGPUPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 7:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getCurrentCPUPower](self, "getCurrentCPUPower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 8:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getCurrentGPUPower](self, "getCurrentGPUPower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 9:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getCurrentPackagePower](self, "getCurrentPackagePower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 10:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController CPULevel](self, "CPULevel");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 11:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_currentCPULowPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 12:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_packagePowerZoneTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    case 13:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController DVD1Level](self, "DVD1Level");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 14:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getPackagePowerZoneMetric](self, "getPackagePowerZoneMetric");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 15:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getPackageCPUPowerTarget](self, "getPackageCPUPowerTarget");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 16:
      v5 = kCFAllocatorDefault;
      v6 = -[MitigationController getPackageGPUPowerTarget](self, "getPackageGPUPowerTarget");
      return (__CFString *)CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v6);
    case 17:
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->_currentHipPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
    default:
      if ((a3 & 0xFFFFFFFC) != 0x10)
        return 0;
      v3 = kCFAllocatorDefault;
      packageLowPowerTarget = self->DVD1Contributors[a3 - 16].DVD1LevelSentPrevious;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), packageLowPowerTarget);
  }
}

- (int)getCLPCWriteToReadPower_8_24_mW:(__CFString *)a3
{
  io_registry_entry_t clpcService;
  NSObject *v6;
  int v8;

  clpcService = self->clpcService;
  if (!clpcService || !self->_usesPowerZoneControl)
    return -1;
  v8 = 0;
  if ((sub_100006FB0(clpcService, a3, &v8) & 1) == 0)
  {
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051F04(a3, v6);
  }
  return (int)(float)((float)((float)v8 * 0.000000059605) * 1000.0);
}

- (int)getPackagePowerZoneMetric
{
  int result;

  *(float *)&dword_1000A2B24 = (float)result;
  if (!self->_usesPackageControl)
    return -1;
  return result;
}

- (int)getPackageGPUPowerTarget
{
  if (self->_usesPowerZoneControl)
  else
    return -1;
}

- (int)getPackageCPUPowerTarget
{
  if (self->_usesPowerZoneControl)
  else
    return -1;
}

- (int)getCurrentPackagePower
{
  float v2;

  if (!self->_usesPowerZoneControl)
    return -1;
  -[PowerZoneTelemetry getCurrentPackagePower](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getCurrentPackagePower");
  return (int)(float)(v2 * 1000.0);
}

- (int)getCurrentGPUPower
{
  int result;
  io_registry_entry_t sgxDevice;
  int v5;

  result = 0;
  v5 = 0;
  if (!self->_noDisplay)
  {
    sgxDevice = self->sgxDevice;
    if (sgxDevice)
    {
      sub_100007070(sgxDevice, CFSTR("FilteredGPUPower"), &v5, 1);
      result = v5;
    }
    else
    {
      result = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100052028();
        result = 0;
      }
    }
  }
  *(float *)dword_1000A2AC0 = (float)result / 1000.0;
  return result;
}

- (int)getCurrentCPUPower
{
  int result;

  *(float *)&dword_1000A2B20 = (float)result / 1000.0;
  if (!self->_usesPowerZoneControl)
    return -1;
  return result;
}

- (int)SGXLevel
{
  return self->SGXLevel;
}

- (int)DVD1Level
{
  return self->DVD1Level;
}

- (int)CPULevel
{
  return self->CPULevel;
}

- (id)initForFastLoop:(BOOL)a3 noDisplay:(BOOL)a4 powerSaveParams:(id)a5 powerZoneParams:(id)a6
{
  MitigationController *v10;
  MitigationController *v11;
  uint64_t i;
  _DWORD *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *cpuMitigationQueue;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  NSObject *v22;
  int powerSaveMaxDVD1;
  int powerSaveCPUPowerTarget;
  int powerSavePackagePowerTarget;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;

  v32.receiver = self;
  v32.super_class = (Class)MitigationController;
  v10 = -[MitigationController init](&v32, "init");
  v11 = v10;
  if (v10)
  {
    v10->listPosition = 1;
    memset_pattern16(v10->ceilingListDVD1, &unk_1000618D0, 0x18uLL);
    memset_pattern16(v11->ceilingListCPU, &unk_1000618D0, 0x18uLL);
    memset_pattern16(v11->ceilingListSGX, &unk_1000618D0, 0x18uLL);
    memset_pattern16(v11->ceilingListPackage, &unk_1000618E0, 0x18uLL);
    for (i = 0; i != 24; i += 4)
    {
      v13 = (_DWORD *)((char *)v11 + i);
      v13[34] = 0;
      v13[40] = 0;
      v13[46] = 0;
    }
    v11->cpuMitigationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.cpuMitigationQueue", 0);
    v11->gpuMitigationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.gpuMitigationQueue", 0);
    v11->packageControlQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.packageControlQueue", 0);
    v11->_noDisplay = a4;
    if (!a4)
      v11->sgxDevice = sub_1000340B8("IOAcceleratorES", 0, 0);
    v14 = sub_1000340B8("AppleCLPC", 0, 0);
    v11->clpcService = v14;
    if (!v14 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051ED8();
    v15 = sub_1000340B8("ApplePMGR", 0, 0);
    v11->pmgrService = v15;
    if (!v15 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051EAC();
    v11->graphicsUpdateInFlight = 0;
    v11->connectsToDieTempCtlDriver = a3;
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 18, CFSTR("zETM"), 18);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 27, CFSTR("zETM"), 27);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 0, CFSTR("zETM"), 0);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 24, CFSTR("zETM"), 24);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 25, CFSTR("zETM"), 25);
    }
    if (a6)
    {
      v11->_maxCPUPower = objc_msgSend(objc_msgSend(a6, "objectForKey:", CFSTR("CPUMaxPower")), "intValue");
      v11->_maxGPUPower = objc_msgSend(objc_msgSend(a6, "objectForKey:", CFSTR("GPUMaxPower")), "intValue");
      v11->_maxPackagePower = objc_msgSend(objc_msgSend(a6, "objectForKey:", CFSTR("PackageMaxPower")), "intValue");
      v11->_usesPowerZoneControl = 1;
      v11->_usesPackageControl = objc_msgSend(objc_msgSend(a6, "objectForKey:", CFSTR("usesPackageControl")), "BOOLValue");
      -[MitigationController setGPUPowerZoneTarget:](v11, "setGPUPowerZoneTarget:", 100);
    }
    if (a5)
    {
      objc_initWeak(&location, v11);
      cpuMitigationQueue = v11->cpuMitigationQueue;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10003229C;
      v29[3] = &unk_10007D0E8;
      objc_copyWeak(&v30, &location);
      sub_1000358D8("com.apple.system.lowpowermode", &v11->_powerSaveToken, cpuMitigationQueue, v29);
      v17 = v11->cpuMitigationQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10003230C;
      v27[3] = &unk_10007D0E8;
      objc_copyWeak(&v28, &location);
      sub_1000358D8("com.apple.system.highpowermode", &v11->_proModeToken, v17, v27);
      if (v11->_usesPowerZoneControl)
      {
        if (v11->_usesPackageControl)
        {
          v18 = objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("PackageLowPowerTarget")), "intValue");
          v19 = 224;
        }
        else
        {
          v18 = objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("CPULowPowerTarget")), "intValue");
          v19 = 216;
        }
      }
      else
      {
        v18 = objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("maxCPU")), "intValue");
        v19 = 212;
      }
      *(_DWORD *)((char *)&v11->super.isa + v19) = v18;
      v20 = objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("maxGPU")), "intValue");
      if (v11->connectsToDieTempCtlDriver)
        v21 = v20;
      else
        v21 = 100;
      v11->_powerSaveMaxSGX = v21;
      if (byte_1000A2480)
      {
        v22 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          powerSaveMaxDVD1 = v11->_powerSaveMaxDVD1;
          powerSaveCPUPowerTarget = v11->_powerSaveCPUPowerTarget;
          powerSavePackagePowerTarget = v11->_powerSavePackagePowerTarget;
          *(_DWORD *)buf = 136316162;
          v34 = "-[MitigationController initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:]";
          v35 = 1024;
          v36 = powerSaveMaxDVD1;
          v37 = 1024;
          v38 = v21;
          v39 = 1024;
          v40 = powerSaveCPUPowerTarget;
          v41 = 1024;
          v42 = powerSavePackagePowerTarget;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<Notice> %s: powerSave params %d DVD1, %d SGX, LPM CPU power target %d, LPM package power target %d", buf, 0x24u);
        }
      }
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      v11->_powerSaveActive = 0;
    }
    v11->DVD1Level = -1;
    *(_QWORD *)&v11->CPULevel = -1;
    *(_OWORD *)&v11->DVD1Contributors[0].DVD1LevelRequested = xmmword_1000618C0;
    *(_OWORD *)&v11->DVD1Contributors[2].DVD1LevelRequested = xmmword_1000618C0;
    v11->_cpmsMitigationsEnabled = 0;
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v11);
  }
  return v11;
}

- (BOOL)getGPUUtilization:(int *)a3
{
  int v3;
  io_registry_entry_t sgxDevice;
  BOOL v5;
  NSObject *v6;
  int v7;
  uint8_t v9[16];

  *a3 = 0;
  v3 = byte_1000A2398;
  if (!self->_noDisplay)
  {
    sgxDevice = self->sgxDevice;
    if (sgxDevice)
      v5 = byte_1000A2398 == 0;
    else
      v5 = 0;
    if (v5)
    {
      v7 = sub_100007070(sgxDevice, CFSTR("GetGPUUtilization"), a3, 1);
      v3 = v7 ^ 1;
      byte_1000A2398 = v7 ^ 1;
    }
    else
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "<Error> Cannot Get GPUUtilization", v9, 2u);
        v3 = byte_1000A2398;
      }
    }
  }
  return v3 == 0;
}

- (int)requestListID
{
  int result;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];

  result = self->listPosition;
  if (result > 5 || result == 0)
  {
    self->listPosition = 0;
    v5 = qword_1000A28A0;
    v6 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    result = 0;
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "<Error> MC: End of list", v7, 2u);
      result = self->listPosition;
    }
  }
  self->listPosition = result + 1;
  return result;
}

- (void)setCPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  uint64_t v4;

  v4 = 64;
  if (!self->_usesPowerZoneControl)
    v4 = 40;
  *(_DWORD *)((char *)&self->super.isa + 4 * a4 + v4) = a3;
}

- (void)setCPUPowerCeiling:(int)a3 forDVD1Contributor:(int)a4
{
  self->DVD1Contributors[a4].DVD1LevelRequested = a3;
}

- (void)setGPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  self->ceilingListSGX[a4] = a3;
}

- (void)setCPUPowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListCPU[a4] = a3;
}

- (float)getCLPCPackagePowerCPUSplitFraction
{
  io_registry_entry_t clpcService;
  float v3;
  NSObject *v4;
  int v6;

  clpcService = self->clpcService;
  if (clpcService)
  {
    v6 = 0;
    if ((sub_100007070(clpcService, CFSTR("~pkg-power-split-cpu-fraction"), &v6, 1) & 1) != 0)
    {
      return (float)v6 * 0.000015259;
    }
    else
    {
      v4 = qword_1000A28A0;
      v3 = 0.5;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100051FA8(v4);
    }
  }
  else
  {
    v3 = 0.5;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051F7C();
  }
  return v3;
}

- (int)getCPUTargetPower
{
  return self->_currentRealCPUPowerTarget;
}

- (int)getGPUTargetPower
{
  return self->_currentRealGPUPowerTarget;
}

- (int)getPackageTargetPower
{
  return self->_packagePowerZoneTarget;
}

- (int)getCurrentCPULoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxCPUPower + 1;
}

- (int)getCurrentGPULoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxGPUPower + 1;
}

- (int)getCurrentPackageLoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxPackagePower + 1;
}

- (void)setGPUPowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListGPU[a4] = a3;
}

- (void)updateCPU
{
  OS_dispatch_queue *cpuMitigationQueue;
  _QWORD block[5];

  if (!byte_1000A2481)
  {
    cpuMitigationQueue = self->cpuMitigationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000326A0;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)cpuMitigationQueue, block);
  }
}

- (void)updateGPU
{
  OS_dispatch_queue *gpuMitigationQueue;
  _QWORD block[5];

  if (!byte_1000A2481 && !self->graphicsUpdateInFlight)
  {
    gpuMitigationQueue = self->gpuMitigationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032AD8;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)gpuMitigationQueue, block);
  }
}

- (void)setCPUPowerZoneTarget:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 != -1)
  {
    v12 = v3;
    v8 = 1374389535 * self->_maxCPUPower * a3;
    v9 = (v8 >> 37) + ((unint64_t)v8 >> 63);
    self->_currentRealCPUPowerTarget = v9;
    if (self->_isHipEngaged && self->_currentHipPowerTarget != v9)
    {
      if (a3 <= 99)
        v11 = v9;
      else
        v11 = 65000;
      self->_currentHipPowerTarget = self->_currentRealCPUPowerTarget;
    }
    else
    {
      if (a3 <= 99)
        v10 = v9;
      else
        v10 = 65000;
      if (self->_currentHipPowerTarget != 65000)
      {
        self->_currentHipPowerTarget = 65000;
      }
    }
  }
}

- (void)setGPUPowerZoneTarget:(int)a3
{
  uint64_t v3;
  unsigned int v4;

  if (a3 != -1)
  {
    v3 = 1374389535 * self->_maxGPUPower * a3;
    v4 = (v3 >> 37) + ((unint64_t)v3 >> 63);
    self->_currentRealGPUPowerTarget = v4;
    if (a3 == 100)
      -[MitigationController setMaxGraphicsDrivePowerTarget:](self, "setMaxGraphicsDrivePowerTarget:", 65000);
    else
      -[MitigationController setMaxGraphicsDrivePowerTarget:](self, "setMaxGraphicsDrivePowerTarget:", v4);
  }
}

- (void)setPackagePowerZoneTarget
{
  uint64_t v2;
  int CPULevel;
  uint64_t v4;
  int v5;
  int SGXLevel;
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  CPULevel = self->CPULevel;
  v4 = 1374389535 * self->_maxCPUPower * CPULevel;
  v5 = (v4 >> 37) + ((unint64_t)v4 >> 63);
  self->_currentRealCPUPowerTarget = v5;
  SGXLevel = self->SGXLevel;
  v7 = 1374389535 * self->_maxGPUPower * SGXLevel;
  v8 = (v7 >> 37) + ((unint64_t)v7 >> 63);
  self->_currentRealGPUPowerTarget = v8;
  if (CPULevel > 99)
    v5 = 65000;
  if (SGXLevel > 99)
    v8 = 65000;
  v9 = v8 + v5;
  if (v9 >= 65000)
    v10 = 65000;
  else
    v10 = v9;
  if (v10 != self->_packagePowerZoneTarget)
  {
    LODWORD(v2) = vcvtd_n_s64_f64((double)v10 / 1000.0, 0x18uLL);
    if (self->_isHipEngaged && self->_currentHipPowerTarget != v10)
    {
      self->_currentHipPowerTarget = v10;
    }
    else
    {
      if (self->_currentHipPowerTarget != 65000)
      {
        self->_currentHipPowerTarget = 65000;
      }
    }
    self->_packagePowerZoneTarget = v10;
  }
}

- (void)setCPMSMitigationsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;

  if (self->_usesPackageControl)
  {
    v3 = a3;
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "dis";
      if (v3)
        v6 = "en";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %sabling CPMS mitigations in MitigationController", (uint8_t *)&v7, 0xCu);
    }
    self->_cpmsMitigationsEnabled = v3;
  }
}

- (void)setPackagePowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  self->ceilingListPackage[a4] = a3;
}

- (void)setPackagePowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListPackage[a4] = a3;
}

- (void)setPackagePowerBudgetDirect:(int)a3 withDetails:(unint64_t)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_cpmsMitigationsEnabled)
  {
    -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "addToCPMSMitigationArray:withDetails:forComponent:", *(_QWORD *)&a3, a4, 13);
  }
  else
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052054(v4, v5, v6);
  }
}

- (void)updatePackage
{
  OS_dispatch_queue *packageControlQueue;
  _QWORD block[5];

  packageControlQueue = self->packageControlQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003304C;
  block[3] = &unk_10007D248;
  block[4] = self;
  dispatch_async((dispatch_queue_t)packageControlQueue, block);
}

- (void)setMaxPackagePower:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];

  if (self->_usesPackageControl)
  {
    if (byte_1000A2480)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Setting max package power in mitigation controller: %d", (uint8_t *)v6, 8u);
      }
    }
    self->_maxPackagePower = a3;
  }
}

- (void)setMaxGraphicsDrivePowerTarget:(int)a3
{
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFNumberRef v7;
  NSObject *v8;
  int currentGPUPowerTarget;
  NSObject *v10;
  int valuePtr;
  uint8_t buf[4];
  int v13;

  if (!self->_noDisplay)
  {
    self->graphicsUpdateInFlight = 1;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, CFSTR("SetMaxGPUAbsolutePower"), kCFBooleanTrue);
    valuePtr = a3;
    self->_currentGPUPowerTarget = a3;
    v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(Mutable, CFSTR("AbsoluteTarget"), v6);
      if (byte_1000A2480)
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          currentGPUPowerTarget = self->_currentGPUPowerTarget;
          *(_DWORD *)buf = 67109120;
          v13 = currentGPUPowerTarget;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> GPUCC Set GPU power to %d", buf, 8u);
        }
      }
      if (IORegistryEntrySetCFProperties(self->sgxDevice, Mutable))
      {
        v10 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000520C8(a3, v10);
      }
      CFRelease(v7);
    }
    CFRelease(Mutable);
    self->graphicsUpdateInFlight = 0;
  }
}

- (void)setMaxCPUPowerTarget:(int)a3 useLegacyPath:(BOOL)a4 setProperty:(__CFString *)a5
{
  int *p_currentCPUPowerTarget;
  _BOOL4 v7;
  double v9;
  __CFDictionary *Mutable;
  CFNumberRef v11;
  __CFString *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int valuePtr;
  uint8_t buf[4];
  int v19;

  self->_currentCPUPowerTarget = a3;
  p_currentCPUPowerTarget = &self->_currentCPUPowerTarget;
  if (self->clpcService)
  {
    v7 = a4;
    v9 = 16777216.0;
    if (a4)
      v9 = 65536.0;
    valuePtr = ((float)a3 / 1000.0 * v9);
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v11 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v11)
    {
      if (v7)
        v12 = CFSTR("CPUPowerTarget");
      else
        v12 = a5;
      CFDictionaryAddValue(Mutable, v12, v11);
      if (IORegistryEntrySetCFProperties(self->clpcService, Mutable))
      {
        v15 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052164(p_currentCPUPowerTarget, v15, v16);
      }
      else if (byte_1000A2480)
      {
        v13 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *p_currentCPUPowerTarget;
          *(_DWORD *)buf = 67109120;
          v19 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> CPUCC Set CPU power to %d", buf, 8u);
        }
      }
    }
    CFRelease(v11);
    CFRelease(Mutable);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100052138();
  }
}

- (void)setCPULowPowerTarget:(int)a3
{
  int *p_currentCPULowPowerTarget;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int valuePtr;
  uint8_t buf[4];
  int v13;

  p_currentCPULowPowerTarget = &self->_currentCPULowPowerTarget;
  if (self->_currentCPULowPowerTarget != a3)
  {
    self->_currentCPULowPowerTarget = a3;
    if (self->clpcService)
    {
      valuePtr = vcvtd_n_u64_f64((float)a3 / 1000.0, 0x18uLL);
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      if (v6)
      {
        if (IORegistryEntrySetCFProperties(self->clpcService, Mutable))
        {
          v9 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_1000521D8(p_currentCPULowPowerTarget, v9, v10);
        }
        else if (byte_1000A2480)
        {
          v7 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *p_currentCPULowPowerTarget;
            *(_DWORD *)buf = 67109120;
            v13 = v8;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> CPUCC Set CPU low power target to %d", buf, 8u);
          }
        }
      }
      CFRelease(v6);
      CFRelease(Mutable);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100052138();
    }
  }
}

- (void)setPackageLowPowerTarget
{
  uint64_t v2;
  int powerSavePackagePowerTarget;

  if (self->_powerSaveActive)
    powerSavePackagePowerTarget = self->_powerSavePackagePowerTarget;
  else
    powerSavePackagePowerTarget = 65000;
  if (powerSavePackagePowerTarget != self->_packageLowPowerTarget && self->_powerSavePackagePowerTarget != 255000)
  {
    LODWORD(v2) = vcvtd_n_s64_f64((double)powerSavePackagePowerTarget / 1000.0, 0x18uLL);
    self->_packageLowPowerTarget = powerSavePackagePowerTarget;
  }
}

- (void)setDieTempControllerProperty:(__CFString *)a3 level:(int)a4 scaleToFixedPoint:(BOOL)a5
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  if (dword_1000A239C || (dword_1000A239C = sub_1000340B8("AppleDieTempController", 0, 0)) != 0)
  {
    -[MitigationController setServiceProperty:key:value:scaleToFixedPoint:](self, "setServiceProperty:key:value:scaleToFixedPoint:");
  }
  else
  {
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005224C(v6, v7, v8);
  }
}

- (int)setServiceProperty:(unsigned int)a3 key:(__CFString *)a4 value:(int)a5 scaleToFixedPoint:(BOOL)a6
{
  int v8;
  CFNumberRef v9;
  CFNumberRef v10;
  mach_error_t v11;
  NSObject *v13;
  NSObject *v14;
  int valuePtr;

  valuePtr = a5;
  if (a6)
  {
    if (a5 <= 99)
      v8 = (a5 << 16) / 100;
    else
      v8 = 0x10000;
    valuePtr = v8;
  }
  v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    v10 = v9;
    v11 = IORegistryEntrySetCFProperty(a3, a4, v9);
    if (v11)
    {
      v14 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100052344((uint64_t)a4, v11, v14);
    }
    CFRelease(v10);
  }
  else
  {
    v13 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000522C0((uint64_t)a4, &valuePtr, v13);
    return 5;
  }
  return v11;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  __CFString **v3;

  if (a3 < 0x12)
  {
    v3 = &off_10007E000[a3];
    return *v3;
  }
  if ((a3 & 0xFFFFFFFC) == 0x10)
  {
    v3 = &off_10007DFE0[a3 - 16];
    return *v3;
  }
  return 0;
}

- (void)setDVD1Level:(int)a3
{
  self->DVD1Level = a3;
}

- (void)setCPULevel:(int)a3
{
  self->CPULevel = a3;
}

- (void)setSGXLevel:(int)a3
{
  self->SGXLevel = a3;
}

- (BOOL)graphicsUpdateInFlight
{
  return self->graphicsUpdateInFlight;
}

- (void)setGraphicsUpdateInFlight:(BOOL)a3
{
  self->graphicsUpdateInFlight = a3;
}

- (int)powerSaveToken
{
  return self->_powerSaveToken;
}

- (void)setPowerSaveToken:(int)a3
{
  self->_powerSaveToken = a3;
}

- (BOOL)powerSaveActive
{
  return self->_powerSaveActive;
}

- (void)setPowerSaveActive:(BOOL)a3
{
  self->_powerSaveActive = a3;
}

- (int)proModeToken
{
  return self->_proModeToken;
}

- (void)setProModeToken:(int)a3
{
  self->_proModeToken = a3;
}

- (BOOL)proModeActive
{
  return self->_proModeActive;
}

- (void)setProModeActive:(BOOL)a3
{
  self->_proModeActive = a3;
}

- (int)CPUPower
{
  return self->_CPUPower;
}

- (int)GPUPower
{
  return self->_GPUPower;
}

@end

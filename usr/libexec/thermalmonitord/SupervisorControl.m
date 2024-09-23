@implementation SupervisorControl

- (int)numberOfFields
{
  return 2;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  uint64_t integrator;

  if (a3 == 1)
  {
    v3 = kCFAllocatorDefault;
    integrator = (int)self->super.integrator;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), integrator);
  }
  if (!a3)
  {
    v3 = kCFAllocatorDefault;
    integrator = self->super.controlEffort;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), integrator);
  }
  return 0;
}

- (unsigned)releaseMaxLIForComponent:(int)a3 releaseRate:(int)a4
{
  return objc_msgSend(-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", a3), "getReleaseMaxLI:releaseRate:", self->forcedThermalPressureLevelLight.isTriggered, *(_QWORD *)&a4);
}

- (unsigned)maxLIForComponent:(int)a3
{
  return objc_msgSend(-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", a3), "getMaxLI:", self->super.controlEffort);
}

- (SupervisorControl)initWithMitigationType:(int)a3 paramInfo:(__CFDictionary *)a4
{
  uint64_t v5;
  char *v6;
  SupervisorControl *v7;
  const void *Value;
  void *v10;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)SupervisorControl;
  v6 = -[PidComponent initPIDWith:](&v11, "initPIDWith:", a4);
  v7 = (SupervisorControl *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 92) = 0x80000000;
    v6[100] = 0;
    *((_QWORD *)v6 + 13) = 0x80000000;
    v6[112] = 0;
    *(_QWORD *)(v6 + 116) = 0x80000000;
    v6[124] = 0;
    *((_DWORD *)v6 + 17) = 0;
    v6[128] = 0;
    *((_DWORD *)v6 + 11) = v5;
    *((_DWORD *)v6 + 22) = 0;
    *((_DWORD *)v6 + 21) = 1077936128;
    *((_DWORD *)v6 + 19) = -1082130432;
    *((_DWORD *)v6 + 20) = -1082130432;
    *((_QWORD *)v6 + 19) = 0;
    v6[160] = 0;
    *((_DWORD *)v6 + 37) = -1082130432;
    if (a4)
    {
      v10 = v6 + 120;
      Value = CFDictionaryGetValue(a4, CFSTR("description"));
      v7->super.nameofComponent = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d %@ "), v5, Value);
      sub_1000048B0(a4, CFSTR("THERMAL_TRAP_LOAD"), kCFNumberFloatType, &v7->previousHotSpotTemperature);
      sub_1000048B0(a4, CFSTR("THERMAL_TRAP_SLEEP"), kCFNumberFloatType, &v7->THERMAL_TRAP_LOAD);
      sub_1000048B0(a4, CFSTR("ReleaseHysteresis"), kCFNumberFloatType, &v7->THERMAL_TRAP_SLEEP);
      sub_1000048B0(a4, CFSTR("ForcedThermalLevelTarget0"), kCFNumberFloatType, &v7->tState);
      sub_1000048B0(a4, CFSTR("ForcedThermalLevelTarget0Hysteresis"), kCFNumberFloatType, v7->forcedThermalLevel);
      sub_1000048B0(a4, CFSTR("ForcedThermalLevelTarget1"), kCFNumberFloatType, &v7->forcedThermalLevel[0].isTriggered);
      sub_1000048B0(a4, CFSTR("ForcedThermalLevelTarget1Hysteresis"), kCFNumberFloatType, &v7->forcedThermalLevel[1]);
      sub_1000048B0(a4, CFSTR("ForcedThermalPressureLevelLightTarget"), kCFNumberFloatType, &v7->forcedThermalLevel[1].isTriggered);
      sub_1000048B0(a4, CFSTR("ForcedThermalPressureLevelLightHysteresis"), kCFNumberFloatType, v10);
      sub_1000048B0(a4, CFSTR("seedingSource"), kCFNumberIntType, &v7->seedingSource);
      sub_1000048B0(a4, CFSTR("alternateTarget"), kCFNumberFloatType, &v7->_alternateTarget);
    }
    v7->_powerlogKeyCE = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("CE%d"), v5);
    v7->_targetNominal = v7->super.TARGET;
  }
  return v7;
}

- (void)setDecisionTableSection:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString **v6;
  __objc2_class *v7;
  os_log_t *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  CFTypeID v12;
  MaxLoadIndexTableSectionVariable *v13;
  CFTypeID v14;
  uint64_t v15;
  MaxLoadIndexTableSectionPiecewiseLinear *v16;
  id v17;
  __CFString **v18;
  os_log_t *v19;
  id v20;
  const __CFString *v21;
  __objc2_class *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  MaxLoadIndexTableSectionVariable *v28;
  uint64_t v30;
  char v31;
  _BYTE v32[15];
  char v33;
  _BYTE v34[15];
  char v35;
  _BYTE v36[15];

  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 17);
  v5 = 0;
  v6 = &off_10007E368;
  v7 = &OBJC_METACLASS___tmaebd0dcfb4dfe66d8a830ae2ac995fbc;
  v8 = (os_log_t *)&qword_1000A28A0;
  v9 = CFSTR("dtFormatType");
  do
  {
    v10 = objc_msgSend(a3, "valueForKey:", v6[v5]);
    if (v10)
    {
      v11 = v10;
      v12 = CFGetTypeID(v10);
      if (v12 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v11) == 256)
      {
        v13 = -[MaxLoadIndexTableSectionVariable initWithDecisionTreeSection:]([MaxLoadIndexTableSectionVariable alloc], "initWithDecisionTreeSection:", v11);
      }
      else
      {
        v14 = CFGetTypeID(v11);
        if (v14 != CFDictionaryGetTypeID())
        {
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
            sub_100056320(&v33, v34);
          goto LABEL_22;
        }
        if (objc_msgSend(objc_msgSend(v11, "objectForKey:", v9), "unsignedIntegerValue") != (id)1)
        {
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
            sub_1000562F4(&v35, v36);
          goto LABEL_22;
        }
        if (v5 == 5)
          v15 = 100;
        else
          v15 = 101;
        v30 = v15;
        v16 = [MaxLoadIndexTableSectionPiecewiseLinear alloc];
        v17 = a3;
        v18 = v6;
        v19 = v8;
        v20 = v4;
        v21 = v9;
        v22 = v7;
        v23 = objc_msgSend(v11, "objectForKey:", CFSTR("controlEfforts"));
        v24 = objc_msgSend(v11, "objectForKey:", CFSTR("maxLIs"));
        v25 = v23;
        v7 = v22;
        v9 = v21;
        v4 = v20;
        v8 = v19;
        v6 = v18;
        a3 = v17;
        v13 = -[MaxLoadIndexTableSectionPiecewiseLinear initWithDecisionTreeSectionControlEfforts:maxLIs:unconstrainedMaxLI:](v16, "initWithDecisionTreeSectionControlEfforts:maxLIs:unconstrainedMaxLI:", v25, v24, v30);
      }
    }
    else
    {
      v26 = objc_alloc(&v7[92]);
      if (v5 == 5)
        v27 = 100;
      else
        v27 = 101;
      v13 = (MaxLoadIndexTableSectionVariable *)objc_msgSend(v26, "initWithConstantMaxLI:", v27);
    }
    v28 = v13;
    if (v13)
    {
      objc_msgSend(v4, "addObject:", v13);

      goto LABEL_24;
    }
LABEL_22:
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      sub_1000562C8(&v31, v32);
LABEL_24:
    ++v5;
  }
  while (v5 != 17);
  self->_maxLoadIndexTable = (NSArray *)objc_msgSend(v4, "copy");

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SupervisorControl;
  -[PidComponent dealloc](&v2, "dealloc");
}

- (void)updateHotSpotTemperatureAndStatus:(float)a3
{
  float TARGET;

  self->hotspotTemperature = *((float *)&self->super.controlEffort + 1);
  *((float *)&self->super.controlEffort + 1) = a3;
  TARGET = self->super.TARGET;
  if (self->forcedThermalPressureLevelLight.isTriggered)
    TARGET = TARGET - self->THERMAL_TRAP_SLEEP;
  self->forcedThermalPressureLevelLight.isTriggered = TARGET < a3;
}

- (void)calculateControlEffort:(float)a3
{
  double v3;

  *(float *)&v3 = a3;
  -[SupervisorControl calculateControlEffort:trigger:](self, "calculateControlEffort:trigger:", *(double *)&a3, v3);
}

- (void)calculateControlEffort:(float)a3 trigger:(float)a4
{
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  SupervisorControl **v11;
  SupervisorControl *v12;
  __objc2_class *v13;
  SupervisorControl *v14;
  __objc2_class *v15;

  *(float *)&v7 = a4;
  -[SupervisorControl updateHotSpotTemperatureAndStatus:](self, "updateHotSpotTemperatureAndStatus:", v7);
  if (-[SupervisorControl isHotspotFirstEngaged](self, "isHotspotFirstEngaged") && self->seedingSource)
  {
    v8 = -[SupervisorControl seedControlEffort](self, "seedControlEffort");
    *(float *)&v9 = a4;
    -[PidComponent applySeedToIntegratorFromControlEffort:currentTemperature:](self, "applySeedToIntegratorFromControlEffort:currentTemperature:", v8, v9);
    self->super.controlEffort = v8;
    return;
  }
  v10 = vabds_f32(a3, a4);
  if (v10 < 0.01)
  {
    v14 = self;
    v15 = SupervisorControl;
    v11 = &v14;
LABEL_9:
    *(float *)&v10 = a3;
    objc_msgSendSuper2((objc_super *)v11, "calculateControlEffort:", v10, v12, v13, v14, v15);
    return;
  }
  if (self->forcedThermalPressureLevelLight.isTriggered
    || !-[PidComponent isIntegratorAtMin](self, "isIntegratorAtMin"))
  {
    v12 = self;
    v13 = SupervisorControl;
    v11 = &v12;
    goto LABEL_9;
  }
}

- (unsigned)seedControlEffort
{
  SupervisorControl *v2;
  uint64_t v3;
  id v4;
  id v5;
  int v6;
  signed int v7;
  NSObject *v8;
  const char *v9;
  signed int v10;
  int v12;
  int v13;
  __int16 v14;
  signed int v15;
  __int16 v16;
  int v17;

  v2 = self;
  v3 = -[SupervisorControl chooseEffectiveSeedingSource](self, "chooseEffectiveSeedingSource");
  if ((v3 - 3) <= 3u)
  {
    LOBYTE(v2) = -[SupervisorControl computePackageCEforSeedingSource:](v2, "computePackageCEforSeedingSource:", v3);
    return v2;
  }
  if ((_DWORD)v3 == 2)
  {
    v4 = objc_msgSend((id)qword_1000A2E38, "getCPUTargetPower");
    v5 = objc_msgSend((id)qword_1000A2E38, "getGPUTargetPower");
  }
  else
  {
    if ((_DWORD)v3 != 1)
    {
      v4 = 0;
      goto LABEL_12;
    }
    v4 = objc_msgSend((id)qword_1000A2E38, "getCurrentCPUPower");
    v5 = objc_msgSend((id)qword_1000A2E38, "getCurrentGPUPower");
  }
  v6 = (int)v5;
  if ((int)v4 < (int)v5)
  {
    v7 = objc_msgSend((id)qword_1000A2E38, "getCurrentGPULoadingIndex:", v5);
    LODWORD(v2) = objc_msgSend(-[NSArray objectAtIndex:](v2->_maxLoadIndexTable, "objectAtIndex:", 1), "getControlEffortForMaxLI:", v7);
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109632;
        v13 = v6;
        v14 = 1024;
        v15 = v7;
        v16 = 1024;
        v17 = (int)v2;
        v9 = "<Notice> Seeding from GPU power %d, seed maxLI %d, CE %d";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x14u);
        return v2;
      }
    }
    return v2;
  }
LABEL_12:
  v10 = objc_msgSend((id)qword_1000A2E38, "getCurrentCPULoadingIndex:", v4);
  LODWORD(v2) = objc_msgSend(-[NSArray objectAtIndex:](v2->_maxLoadIndexTable, "objectAtIndex:", 0), "getControlEffortForMaxLI:", v10);
  if (byte_1000A2480)
  {
    v8 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109632;
      v13 = (int)v4;
      v14 = 1024;
      v15 = v10;
      v16 = 1024;
      v17 = (int)v2;
      v9 = "<Notice> Seeding from CPU power %d, seed maxLI %d, CE %d";
      goto LABEL_15;
    }
  }
  return v2;
}

- (unsigned)chooseEffectiveSeedingSource
{
  int v2;
  float v3;
  float v4;
  float v5;
  float v6;
  BOOL v7;
  char v8;
  float v9;

  v2 = self->seedingSource - 1;
  LOBYTE(self) = 1;
  switch(v2)
  {
    case 0:
      return self;
    case 1:
      -[PowerZoneTelemetry getCpuPowerZoneLimited](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getCpuPowerZoneLimited");
      if (v3 <= 0.0
        && (-[PowerZoneTelemetry getGpuPowerZoneLimited](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getGpuPowerZoneLimited"), v4 <= 0.0)&& (-[PowerZoneTelemetry getPackagePowerZoneLimited](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getPackagePowerZoneLimited"), v5 <= 0.0))
      {
        LOBYTE(self) = 2;
      }
      else
      {
        LOBYTE(self) = 1;
      }
      break;
    case 2:
      LOBYTE(self) = 3;
      break;
    case 3:
      -[PowerZoneTelemetry getPackagePowerZoneLimited](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getPackagePowerZoneLimited");
      v7 = v6 <= 0.0;
      v8 = 3;
      goto LABEL_12;
    case 4:
      LOBYTE(self) = 5;
      break;
    case 5:
      -[PowerZoneTelemetry getPackagePowerZoneLimited](+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance"), "getPackagePowerZoneLimited");
      v7 = v9 <= 0.0;
      v8 = 5;
LABEL_12:
      if (v7)
        LOBYTE(self) = 4;
      else
        LOBYTE(self) = v8;
      break;
    default:
      LODWORD(self) = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if ((_DWORD)self)
      {
        sub_10005634C();
        LOBYTE(self) = 0;
      }
      break;
  }
  return self;
}

- (int)computePackageCEforSeedingSource:(unsigned __int8)a3
{
  id v4;
  id v5;
  signed int v6;
  int v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  signed int v12;
  __int16 v13;
  int v14;

  switch(a3)
  {
    case 5u:
      v4 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
      break;
    case 4u:
      v4 = objc_msgSend((id)qword_1000A2E38, "getPackageTargetPower");
      break;
    case 3u:
      v4 = (id)-[SupervisorControl computePackageCurrentSeedPower](self, "computePackageCurrentSeedPower");
      break;
    default:
      v5 = 0;
      goto LABEL_9;
  }
  v5 = v4;
LABEL_9:
  v6 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackageLoadingIndex:", v5);
  v7 = objc_msgSend(-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", 12), "getControlEffortForMaxLI:", v6);
  if (byte_1000A2480)
  {
    v8 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109632;
      v10[1] = (_DWORD)v5;
      v11 = 1024;
      v12 = v6;
      v13 = 1024;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Seeding from Package power %d, seed maxLI %d, CE %d", (uint8_t *)v10, 0x14u);
    }
  }
  return v7;
}

- (int)computePackageCurrentSeedPower
{
  float v2;
  float v3;
  signed int v4;
  signed int v5;
  int v6;
  int v7;
  signed int v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  signed int v13;
  __int16 v14;
  double v15;
  __int16 v16;
  int v17;

  objc_msgSend((id)qword_1000A2E38, "getCLPCPackagePowerCPUSplitFraction");
  v3 = v2;
  v4 = objc_msgSend((id)qword_1000A2E38, "getCurrentCPUPower");
  v5 = objc_msgSend((id)qword_1000A2E38, "getCurrentGPUPower");
  if (v4 > v5)
  {
    v6 = v4;
  }
  else
  {
    v3 = 1.0 - v3;
    v6 = v5;
  }
  v7 = (int)(float)((float)v6 / v3);
  if (byte_1000A2480)
  {
    v8 = v5;
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109888;
      v11[1] = v4;
      v12 = 1024;
      v13 = v8;
      v14 = 2048;
      v15 = v3;
      v16 = 1024;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> cpuPower: %d, gpuPower: %d, splitFraction: %f, computedPackagePower: %d", (uint8_t *)v11, 0x1Eu);
    }
  }
  return v7;
}

- (float)calculateTargetDifference
{
  return self->super.TARGET - *((float *)&self->super.controlEffort + 1);
}

- (int)getThermalStateofHotspot
{
  float previousHotSpotTemperature;
  int v3;
  float v4;
  float THERMAL_TRAP_LOAD;
  float releaseHysteresis;

  previousHotSpotTemperature = self->previousHotSpotTemperature;
  if (previousHotSpotTemperature >= 0.0)
  {
    v4 = *((float *)&self->super.controlEffort + 1);
    THERMAL_TRAP_LOAD = self->THERMAL_TRAP_LOAD;
    if (v4 >= THERMAL_TRAP_LOAD)
    {
      v3 = 2;
    }
    else
    {
      releaseHysteresis = self->releaseHysteresis;
      if (v4 < previousHotSpotTemperature)
      {
        if (LODWORD(releaseHysteresis) != 1)
        {
          if (LODWORD(releaseHysteresis) != 2)
          {
LABEL_9:
            v3 = 0;
            self->releaseHysteresis = 0.0;
            return v3;
          }
          LODWORD(self->releaseHysteresis) = 1;
          v4 = *((float *)&self->super.controlEffort + 1);
          previousHotSpotTemperature = self->previousHotSpotTemperature;
        }
        if ((float)(v4 + self->THERMAL_TRAP_SLEEP) >= previousHotSpotTemperature)
          return 1;
        goto LABEL_9;
      }
      if (LODWORD(releaseHysteresis) == 2 && (float)(v4 + self->THERMAL_TRAP_SLEEP) >= THERMAL_TRAP_LOAD)
        return 2;
      v3 = 1;
    }
    LODWORD(self->releaseHysteresis) = v3;
    return v3;
  }
  return 0;
}

- (BOOL)hotspotIsEngaged
{
  return self->forcedThermalPressureLevelLight.isTriggered;
}

- (BOOL)isHotspotFirstEngaged
{
  BOOL result;
  objc_super v4;

  result = 0;
  if (-[SupervisorControl didWeCrossTargetTemp](self, "didWeCrossTargetTemp"))
  {
    v4.receiver = self;
    v4.super_class = (Class)SupervisorControl;
    if (-[PidComponent isIntegratorAtMin](&v4, "isIntegratorAtMin"))
      return 1;
  }
  return result;
}

- (BOOL)didWeCrossTargetTemp
{
  float TARGET;

  TARGET = self->super.TARGET;
  return self->hotspotTemperature <= TARGET && *((float *)&self->super.controlEffort + 1) > TARGET;
}

- (BOOL)shouldForceThermalLevelForThreshold:(int)a3
{
  int *p_tState;
  float v4;
  int *v5;
  BOOL *v6;
  int v7;
  BOOL result;

  p_tState = &self->tState;
  v4 = *((float *)&self->tState + 3 * a3);
  if (v4 <= 0.0)
    return 0;
  v5 = &p_tState[3 * a3];
  v7 = *((unsigned __int8 *)v5 + 8);
  v6 = (BOOL *)(v5 + 2);
  if (v7)
    v4 = v4 - *(float *)&p_tState[3 * a3 + 1];
  result = *((float *)&self->super.controlEffort + 1) >= v4;
  *v6 = result;
  return result;
}

- (BOOL)shouldEnforceLightThermalPressure
{
  BOOL *p_isTriggered;
  float v3;
  BOOL result;

  p_isTriggered = &self->forcedThermalLevel[1].isTriggered;
  v3 = *(float *)&self->forcedThermalLevel[1].isTriggered;
  if (v3 <= 0.0)
    return 0;
  if (LOBYTE(self->forcedThermalPressureLevelLight.triggerHysteresis))
    v3 = v3 - self->forcedThermalPressureLevelLight.triggerTarget;
  result = *((float *)&self->super.controlEffort + 1) >= v3;
  p_isTriggered[8] = result;
  return result;
}

- (void)overrideTargetTemperature:(float)a3
{
  NSObject *v5;
  int mitigationType;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;

  self->super.TARGET = a3;
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      mitigationType = self->super.mitigationType;
      v7 = 136315650;
      v8 = "-[SupervisorControl overrideTargetTemperature:]";
      v9 = 1024;
      v10 = mitigationType;
      v11 = 2048;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: hotspot %d, target %0.2f", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)resetTargetTemperature
{
  float targetNominal;
  NSObject *v4;
  int mitigationType;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  double v11;

  targetNominal = self->_targetNominal;
  self->super.TARGET = targetNominal;
  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      mitigationType = self->super.mitigationType;
      v6 = 136315650;
      v7 = "-[SupervisorControl resetTargetTemperature]";
      v8 = 1024;
      v9 = mitigationType;
      v10 = 2048;
      v11 = targetNominal;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> %s: hotspot %d, target %0.2f", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)applyAlternateTarget:(BOOL)a3
{
  float alternateTarget;
  NSObject *v5;
  int mitigationType;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;

  alternateTarget = self->_alternateTarget;
  if (alternateTarget >= 0.0)
  {
    if (!a3)
      alternateTarget = self->_targetNominal;
    self->super.TARGET = alternateTarget;
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      mitigationType = self->super.mitigationType;
      v7 = 136315650;
      v8 = "-[SupervisorControl applyAlternateTarget:]";
      v9 = 1024;
      v10 = mitigationType;
      v11 = 2048;
      v12 = alternateTarget;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: Updated hotspot %d, target %0.2f", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  const __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("Control Effort%@");
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, v3, self->super.nameofComponent);
  }
  if (a3 == 1)
  {
    v3 = CFSTR("Integrator%@");
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, v3, self->super.nameofComponent);
  }
  return 0;
}

- (__CFString)getPowerlogKey
{
  return self->_powerlogKeyCE;
}

- (int)getPowerlogFieldCurrentValue
{
  return self->super.controlEffort;
}

- (float)hotspotTemperature
{
  return *((float *)&self->super.controlEffort + 1);
}

- (float)THERMAL_TRAP_LOAD
{
  return self->previousHotSpotTemperature;
}

- (void)setTHERMAL_TRAP_LOAD:(float)a3
{
  self->previousHotSpotTemperature = a3;
}

- (float)THERMAL_TRAP_SLEEP
{
  return self->THERMAL_TRAP_LOAD;
}

- (void)setTHERMAL_TRAP_SLEEP:(float)a3
{
  self->THERMAL_TRAP_LOAD = a3;
}

@end

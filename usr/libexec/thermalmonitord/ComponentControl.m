@implementation ComponentControl

- (void)testLoadingIndexLevel
{
  BOOL v3;

  if (sub_100003134())
  {
    -[ComponentControl refreshTGraphTelemetry](self, "refreshTGraphTelemetry");
    if (!byte_1000A2481)
      -[ComponentControl refreshCPMSTGraphTelemetry](self, "refreshCPMSTGraphTelemetry");
  }
  -[ComponentControl refreshFunctionalTelemetry](self, "refreshFunctionalTelemetry");
  -[ComponentControl updateSensorExchangeTelemetry](self, "updateSensorExchangeTelemetry");
  if (byte_10009A1F0)
    v3 = byte_1000A2481 == 0;
  else
    v3 = 0;
  if (v3)
  {
    if (-[ComponentControl shouldDoCPMSActions](self, "shouldDoCPMSActions"))
      -[ComponentControl defaultCPMSAction](self, "defaultCPMSAction");
    else
      -[ComponentControl defaultAction](self, "defaultAction");
  }
}

- (int)numberOfFields
{
  return 6;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  uint64_t v4;
  __CFString *result;
  uint64_t isCPMSControlActive;

  switch(a3)
  {
    case 0:
      v3 = kCFAllocatorDefault;
      v4 = 72;
      goto LABEL_9;
    case 1:
      v3 = kCFAllocatorDefault;
      v4 = 76;
      goto LABEL_9;
    case 2:
      v3 = kCFAllocatorDefault;
      v4 = 84;
      goto LABEL_9;
    case 3:
      v3 = kCFAllocatorDefault;
      isCPMSControlActive = self->isCPMSControlActive;
      goto LABEL_10;
    case 4:
      v3 = kCFAllocatorDefault;
      v4 = 132;
      goto LABEL_9;
    case 5:
      v3 = kCFAllocatorDefault;
      v4 = 136;
LABEL_9:
      isCPMSControlActive = *(unsigned int *)((char *)&self->super.super.isa + v4);
LABEL_10:
      result = (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), isCPMSControlActive);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isEqualMType:(int)a3
{
  return -[PidComponent mitigationType](self, "mitigationType") == a3;
}

- (void)setMaxLoadingIndex:(unsigned int)a3 releaseIndex:(unsigned int)a4
{
  if (!*((_BYTE *)&self->super.controlEffort + 4))
  {
    self->currentLoadingIndex = a3;
    self->previousValue = a4;
  }
}

- (int)getReleaseMaxLI
{
  return self->previousValue;
}

- (ComponentControl)initWithCC:(int)a3 :(__CFDictionary *)a4
{
  uint64_t v5;
  ComponentControl *v6;
  ComponentControl *v7;
  objc_super v9;

  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)ComponentControl;
  v6 = -[PidComponent initPIDWith:](&v9, "initPIDWith:", a4);
  v7 = v6;
  if (v6)
  {
    *((_BYTE *)&v6->super.controlEffort + 4) = 0;
    *(_DWORD *)&v6->allowLIOverride = 0;
    v6->currentLoadingIndex = 100;
    v6->previousValue = 100;
    v6->super.mitigationType = v5;
    v6->super.nameofComponent = 0;
    v6->maxLoadingIndex = 100;
    v6->releaseMaxLI = 999;
    sub_1000048B0(a4, CFSTR("MaxReleaseRate"), kCFNumberIntType, &v6->releaseMaxLI);
    v7->_powerlogKeyMaxLI = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Max LI%d"), v5);
    v7->_nominalPowerTarget = 0;
    v7->_maxPower = 0;
    v7->powerTarget = 0;
    v7->currentPower = 0;
    v7->isCPMSControlActive = 0;
    LOBYTE(v7->_minPower) = 0;
    v7->mitigationDetails = 0;
    v7->initialCPMSBudgetSent = 0;
  }
  return v7;
}

- (void)defaultAction
{
  NSObject *v2;

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_1000510F4(v2);
}

- (void)defaultCPMSAction
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unint64_t v11;

  v3 = -[ComponentControl computePowerTarget](self, "computePowerTarget");
  if (self->initialCPMSBudgetSent)
  {
    if (self->previousValue != self->maxLoadingIndex)
    {
      if ((_DWORD)v3 != -[ComponentControl powerTarget](self, "powerTarget"))
      {
        -[ComponentControl setPowerTarget:](self, "setPowerTarget:", v3);
        if (byte_1000A2480)
        {
          v4 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v6 = 138412802;
            v7 = -[PidComponent nameofComponent](self, "nameofComponent");
            v8 = 1024;
            v9 = -[ComponentControl powerTarget](self, "powerTarget");
            v10 = 2048;
            v11 = -[ComponentControl mitigationDetails](self, "mitigationDetails");
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> DefaultCPMSAction for %@, set powerTarget:%u with details: %llu", (uint8_t *)&v6, 0x1Cu);
          }
        }
        -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "addToCPMSMitigationArray:withDetails:forComponent:", -[ComponentControl powerTarget](self, "powerTarget"), -[ComponentControl mitigationDetails](self, "mitigationDetails"), -[PidComponent mitigationType](self, "mitigationType"));
      }
      self->maxLoadingIndex = self->previousValue;
    }
  }
  else
  {
    if (byte_1000A2480)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412802;
        v7 = -[PidComponent nameofComponent](self, "nameofComponent");
        v8 = 1024;
        v9 = v3;
        v10 = 2048;
        v11 = -[ComponentControl mitigationDetails](self, "mitigationDetails");
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Initial CPMS budget sent for %@, set powerTarget:%u with details: %llu", (uint8_t *)&v6, 0x1Cu);
      }
    }
    -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "addToCPMSMitigationArray:withDetails:forComponent:", v3, -[ComponentControl mitigationDetails](self, "mitigationDetails"), -[PidComponent mitigationType](self, "mitigationType"));
    self->initialCPMSBudgetSent = 1;
  }
}

- (unsigned)computePowerTarget
{
  unsigned int result;
  unsigned int maxPower;
  int v5;
  unsigned int previousValue;

  result = self->releaseRate;
  maxPower = self->_maxPower;
  v5 = self->_nominalPowerTarget - maxPower;
  if (v5 >= 1)
  {
    previousValue = self->previousValue;
    if (previousValue <= 0x64)
      return previousValue * v5 / 0x64 + maxPower;
  }
  return result;
}

- (void)refreshCPMSTGraphTelemetry
{
  if (-[ComponentControl shouldDoCPMSActions](self, "shouldDoCPMSActions"))
    -[CPMSHelper requestCurrentPowerCallbackForComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "requestCurrentPowerCallbackForComponent:", -[PidComponent mitigationType](self, "mitigationType"));
}

- (BOOL)shouldDoCPMSActions
{
  _BOOL4 v3;

  v3 = -[ComponentControl isCPMSControlEnabled](self, "isCPMSControlEnabled");
  if (v3)
    LOBYTE(v3) = -[ComponentControl isCPMSControlActive](self, "isCPMSControlActive");
  return v3;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  NSObject *v4;
  unsigned int nominalPowerTarget;
  unsigned int maxPower;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;

  if (!a3)
  {
    -[ComponentControl setIsCPMSControlEnabled:](self, "setIsCPMSControlEnabled:");
LABEL_6:
    -[ComponentControl resetCPMSMitigationState](self, "resetCPMSMitigationState");
    return;
  }
  -[ComponentControl setIsCPMSControlEnabled:](self, "setIsCPMSControlEnabled:", 1);
  -[CPMSHelper updateCPMSClientState:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "updateCPMSClientState:", -[PidComponent mitigationType](self, "mitigationType"));
  if (!-[CPMSHelper isCPMSSupportedClient:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "isCPMSSupportedClient:", -[PidComponent mitigationType](self, "mitigationType")))
  {
    if (byte_1000A2480)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 67109120;
        v11 = -[PidComponent mitigationType](self, "mitigationType");
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> mitigationType:%u is not a supported cpms client!", (uint8_t *)&v10, 8u);
      }
    }
    goto LABEL_6;
  }
  if (!LOBYTE(self->_minPower))
  {
    self->_nominalPowerTarget = -[CPMSHelper getMaxPowerForComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "getMaxPowerForComponent:", -[PidComponent mitigationType](self, "mitigationType"));
    self->_maxPower = -[CPMSHelper getMinPowerForComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "getMinPowerForComponent:", -[PidComponent mitigationType](self, "mitigationType"));
    self->releaseRate = self->_nominalPowerTarget;
  }
  nominalPowerTarget = self->_nominalPowerTarget;
  maxPower = self->_maxPower;
  if (nominalPowerTarget)
    v7 = nominalPowerTarget >= maxPower;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      v10 = 67109632;
      v11 = nominalPowerTarget;
      v12 = 1024;
      v13 = maxPower;
      v14 = 1024;
      v15 = -[PidComponent mitigationType](self, "mitigationType");
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "<Error> Invalid power range (max:%d min%d) for mitigationType:%u", (uint8_t *)&v10, 0x14u);
    }
    goto LABEL_6;
  }
  if (byte_1000A2480)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109120;
      v11 = -[PidComponent mitigationType](self, "mitigationType");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Setting CPMS control Active for mitigationType:%u", (uint8_t *)&v10, 8u);
    }
  }
  -[ComponentControl setIsCPMSControlActive:](self, "setIsCPMSControlActive:", 1);
}

- (void)updatePowerParameters:(__CFDictionary *)a3
{
  NSObject *v5;
  __CFString *v6;
  unsigned int releaseRate;
  unsigned int nominalPowerTarget;
  unsigned int maxPower;
  int v10;
  __CFString *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  if (a3)
  {
    if (CFDictionaryContainsKey(a3, CFSTR("maxThermalPower")))
    {
      LOBYTE(self->_minPower) = 1;
      sub_1000048B0(a3, CFSTR("maxPower"), kCFNumberIntType, &self->releaseRate);
      sub_1000048B0(a3, CFSTR("maxThermalPower"), kCFNumberIntType, &self->_nominalPowerTarget);
      sub_1000048B0(a3, CFSTR("minThermalPower"), kCFNumberIntType, &self->_maxPower);
      if (byte_1000A2480)
      {
        v5 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v6 = -[PidComponent nameofComponent](self, "nameofComponent");
          releaseRate = self->releaseRate;
          nominalPowerTarget = self->_nominalPowerTarget;
          maxPower = self->_maxPower;
          v10 = 138413058;
          v11 = v6;
          v12 = 1024;
          v13 = releaseRate;
          v14 = 1024;
          v15 = nominalPowerTarget;
          v16 = 1024;
          v17 = maxPower;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Updated %@ power params with nominal:%d max: %d min: %d", (uint8_t *)&v10, 0x1Eu);
        }
      }
    }
  }
}

- (void)resetCPMSMitigationState
{
  if (!LOBYTE(self->_minPower))
  {
    self->_maxPower = 0;
    self->_nominalPowerTarget = 0;
  }
  -[ComponentControl setInitialCPMSBudgetSent:](self, "setInitialCPMSBudgetSent:", 0);
  -[ComponentControl setIsCPMSControlActive:](self, "setIsCPMSControlActive:", 0);
}

- (int)getReleaseRate
{
  return self->releaseMaxLI;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 5)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, off_10007DD30[a3], self->super.nameofComponent);
}

- (__CFString)getPowerlogKey
{
  return self->_powerlogKeyMaxLI;
}

- (int)getPowerlogFieldCurrentValue
{
  return self->currentLoadingIndex;
}

- (BOOL)allowLIOverride
{
  return *((_BYTE *)&self->super.controlEffort + 4);
}

- (void)setAllowLIOverride:(BOOL)a3
{
  *((_BYTE *)&self->super.controlEffort + 4) = a3;
}

- (unsigned)maxLoadingIndex
{
  return self->currentLoadingIndex;
}

- (void)setMaxLoadingIndex:(unsigned int)a3
{
  self->currentLoadingIndex = a3;
}

- (unsigned)currentLoadingIndex
{
  return *(_DWORD *)&self->allowLIOverride;
}

- (void)setCurrentLoadingIndex:(unsigned int)a3
{
  *(_DWORD *)&self->allowLIOverride = a3;
}

- (unsigned)releaseMaxLI
{
  return self->previousValue;
}

- (void)setReleaseMaxLI:(unsigned int)a3
{
  self->previousValue = a3;
}

- (unsigned)releaseRate
{
  return self->releaseMaxLI;
}

- (void)setReleaseRate:(unsigned int)a3
{
  self->releaseMaxLI = a3;
}

- (BOOL)isCPMSControlEnabled
{
  return self->isCPMSControlEnabled;
}

- (void)setIsCPMSControlEnabled:(BOOL)a3
{
  self->isCPMSControlEnabled = a3;
}

- (BOOL)isCPMSControlActive
{
  return self->isCPMSControlActive;
}

- (void)setIsCPMSControlActive:(BOOL)a3
{
  self->isCPMSControlActive = a3;
}

- (unsigned)powerTarget
{
  return self->powerTarget;
}

- (void)setPowerTarget:(unsigned int)a3
{
  self->powerTarget = a3;
}

- (unsigned)currentPower
{
  return self->currentPower;
}

- (void)setCurrentPower:(unsigned int)a3
{
  self->currentPower = a3;
}

- (unint64_t)mitigationDetails
{
  return self->mitigationDetails;
}

- (void)setMitigationDetails:(unint64_t)a3
{
  self->mitigationDetails = a3;
}

- (BOOL)initialCPMSBudgetSent
{
  return self->initialCPMSBudgetSent;
}

- (void)setInitialCPMSBudgetSent:(BOOL)a3
{
  self->initialCPMSBudgetSent = a3;
}

@end

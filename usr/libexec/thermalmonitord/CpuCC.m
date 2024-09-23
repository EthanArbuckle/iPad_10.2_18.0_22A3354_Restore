@implementation CpuCC

- (CpuCC)initWithParams:(__CFDictionary *)a3 powerScale:(float)a4 listID:(int)a5 needspowerZones:(BOOL)a6
{
  CpuCC *v10;
  CpuCC *v11;
  unsigned int *p_usesPowerZoneControl;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CpuCC;
  v10 = -[ComponentControl initWithCC::](&v16, "initWithCC::", 2, a3);
  v11 = v10;
  if (v10)
  {
    *(&v10->super.currentPower + 1) = 101;
    v10->kDVD1Level = a5;
    *(float *)&v10->prevCpu.cpu_ticks[3] = a4;
    v10->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d CPU "), 2);
    v11->listIDPos = mach_host_self();
    v11->super.super.boundCheckLow = 0;
    v11->super.super.boundCheckHigh = 101;
    *(_QWORD *)&v11->host = 0;
    *(_QWORD *)&v11->currCpu.cpu_ticks[1] = 0;
    *(_QWORD *)&v11->currCpu.cpu_ticks[3] = 0;
    *(_QWORD *)&v11->prevCpu.cpu_ticks[1] = 0;
    p_usesPowerZoneControl = (unsigned int *)&v11->_usesPowerZoneControl;
    if (sub_1000048B0(a3, CFSTR("minReachableLoadIndex"), kCFNumberIntType, &v11->_usesPowerZoneControl))
    {
      v13 = *p_usesPowerZoneControl;
      *(float *)&v14 = 100.0 / (float)(100 - *p_usesPowerZoneControl);
      v11->_minReachableLoadIndex = v14;
      v11->_directMapSlope = 0.5 - (float)(*(float *)&v14 * (float)v13);
    }
    LOBYTE(v11->timeActive) = a6;
  }
  return v11;
}

- (void)defaultAction
{
  objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:forDVD1Contributor:", *(&self->super.currentPower + 1), 0);
  objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:fromDecisionSource:", *(&self->super.currentPower + 1), self->kDVD1Level);
  objc_msgSend((id)qword_1000A2E38, "updateCPU");
}

- (unsigned)getUserUsage
{
  host_cpu_load_info *p_host;
  NSObject *v4;
  uint64_t v5;
  natural_t v6;
  unint64_t v7;
  mach_msg_type_number_t host_info_outCnt;

  host_info_outCnt = 4;
  p_host = (host_cpu_load_info *)&self->host;
  if (host_statistics(self->listIDPos, 3, (host_info_t)&self->host, &host_info_outCnt))
  {
    v4 = qword_1000A28A0;
    LODWORD(v5) = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v5)
    {
      sub_100050014(v4);
      LODWORD(v5) = 0;
    }
  }
  else
  {
    v6 = self->currCpu.cpu_ticks[2]
       + self->host
       - (self->currCpu.cpu_ticks[3]
        + self->prevCpu.cpu_ticks[2])
       + self->currCpu.cpu_ticks[0]
       - self->prevCpu.cpu_ticks[0];
    v7 = self->currCpu.cpu_ticks[1] - self->prevCpu.cpu_ticks[1] + v6;
    *(host_cpu_load_info *)((char *)&self->currCpu + 12) = *p_host;
    return 100 * (unint64_t)v6 / v7;
  }
  return v5;
}

- (void)refreshTGraphTelemetry
{
  self->powerScale = (float)-[CpuCC getUserUsage](self, "getUserUsage");
}

- (void)refreshFunctionalTelemetry
{
  unsigned int currentLoadingIndex;
  float v3;

  currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != 101)
  {
    v3 = self->_directMapSlope + (float)(*(float *)&self->_minReachableLoadIndex * (float)currentLoadingIndex);
    currentLoadingIndex = (int)v3 & ~((int)v3 >> 31);
  }
  *(&self->super.currentPower + 1) = currentLoadingIndex;
  *(_DWORD *)&self->super.allowLIOverride = self->super.currentLoadingIndex;
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CpuCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CpuCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CpuCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return CFSTR("CPU - timeActive");
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CpuCC;
    return -[ComponentControl copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CpuCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CpuCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%.3f"), self->powerScale);
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CpuCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }
}

- (BOOL)useDirectMap
{
  return BYTE1(self->timeActive);
}

- (void)setUseDirectMap:(BOOL)a3
{
  BYTE1(self->timeActive) = a3;
}

- (unsigned)minReachableLoadIndex
{
  return *(_DWORD *)&self->_usesPowerZoneControl;
}

- (void)setMinReachableLoadIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_usesPowerZoneControl = a3;
}

- (float)directMapSlope
{
  return *(float *)&self->_minReachableLoadIndex;
}

- (void)setDirectMapSlope:(float)a3
{
  *(float *)&self->_minReachableLoadIndex = a3;
}

- (float)directMapIntercept
{
  return self->_directMapSlope;
}

- (void)setDirectMapIntercept:(float)a3
{
  self->_directMapSlope = a3;
}

@end

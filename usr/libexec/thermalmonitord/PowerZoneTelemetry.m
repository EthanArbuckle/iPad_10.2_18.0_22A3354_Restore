@implementation PowerZoneTelemetry

- (void)queryData
{
  vm_address_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t lastCLPCReadingTimestamp;
  vm_address_t v7;
  unint64_t v8;
  float v9;
  vm_address_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t Samples;
  __CFDictionary *v29;
  const void *SamplesDelta;
  uint64_t v31;
  _QWORD v32[6];
  size_t v33;
  vm_address_t outputStruct;

  v33 = -3;
  outputStruct = 0;
  if (IOConnectCallMethod(self->clpcConnect, 6u, 0, 0, 0, 0, 0, 0, &outputStruct, &v33))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F75C();
    return;
  }
  if (v33 <= 0x6F)
  {
    vm_deallocate(mach_task_self_, outputStruct, v33);
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F6AC();
    return;
  }
  v3 = outputStruct;
  if (*(_QWORD *)(outputStruct + 8) == v33)
  {
    v4 = *(_QWORD *)(outputStruct + 24);
    v5 = mach_absolute_time();
    lastCLPCReadingTimestamp = self->lastCLPCReadingTimestamp;
    self->lastCLPCReadingTimestamp = v5;
    v7 = outputStruct;
    if (v4 >= *(_QWORD *)(v3 + 8))
    {
LABEL_23:
      if (v7 | v33)
        vm_deallocate(mach_task_self_, v7, v33);
      if (self->gpuChannels && self->gpuSubscription)
      {
        v27 = mach_absolute_time();
        Samples = IOReportCreateSamples(self->gpuSubscription, self->gpuChannels, 0);
        if (!Samples)
        {
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004F7B4();
          return;
        }
        v29 = (__CFDictionary *)Samples;
        SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->lastGPUReading, Samples, 0);
        CFRelease(self->lastGPUReading);
        v31 = v27 - self->lastGPUReadingTimestamp;
        self->lastGPUReading = v29;
        self->lastGPUReadingTimestamp = v27;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000033D8;
        v32[3] = &unk_10007D6C0;
        v32[4] = self;
        v32[5] = v31;
        IOReportIterate(SamplesDelta, v32);
        if (SamplesDelta)
          CFRelease(SamplesDelta);
      }
      dword_1000A2B04 = LODWORD(self->packagePowerZoneLimited);
      return;
    }
    v8 = v5 - lastCLPCReadingTimestamp;
    v9 = (float)v8;
    while (1)
    {
      v10 = v7 + v4;
      v11 = *(_DWORD *)(v7 + v4);
      if (v11 == 14)
      {
        v17 = *(_DWORD *)(v10 + 16);
        if (v17 == 1)
        {
          v23 = *(_QWORD *)(v10 + 24);
          v24 = qword_10009A060;
          v25 = *(_OWORD *)(v10 + 16);
          xmmword_10009A048 = *(_OWORD *)v10;
          *(_OWORD *)algn_10009A058 = v25;
          v26 = v23 - v24;
          v22 = (float)v26;
          self->cluster1FastDieLimitedMhz = (float)v26;
          if (!v26)
            goto LABEL_17;
        }
        else
        {
          if (v17)
            goto LABEL_17;
          v18 = *(_QWORD *)(v10 + 24);
          v19 = qword_10009A040;
          v20 = *(_OWORD *)(v10 + 16);
          xmmword_10009A028 = *(_OWORD *)v10;
          *(_OWORD *)algn_10009A038 = v20;
          v21 = v18 - v19;
          v22 = (float)v21;
          self->cluster0FastDieLimitedMhz = (float)v21;
          if (!v21)
            goto LABEL_17;
        }
        self->cpuFastDieLimitedMhz = (unint64_t)v22;
      }
      else
      {
        if (v11 != 13)
        {
          if (v7 | v33)
            vm_deallocate(mach_task_self_, v7, v33);
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004F6D8();
          return;
        }
        v12 = *(_QWORD *)(v10 + 16) - qword_10009A010;
        v13 = *(_QWORD *)(v10 + 32) - qword_10009A020;
        v14 = *(_QWORD *)(v10 + 24) - unk_10009A018;
        v16 = *(_OWORD *)v10;
        v15 = *(_OWORD *)(v10 + 16);
        qword_10009A020 = *(_QWORD *)(v10 + 32);
        xmmword_10009A000 = v16;
        *(_OWORD *)&qword_10009A010 = v15;
        self->cpuPowerZoneLimited = (float)v14 / v9;
        *(float *)&v15 = (float)(unint64_t)v13 / (self->tbfactor * (double)v8);
        self->packagePowerZoneLimited = (float)(unint64_t)v12 / v9;
        LODWORD(self->currentPackagePower) = v15;
      }
LABEL_17:
      v4 += *(_QWORD *)(v10 + 8);
      if (v4 >= *(_QWORD *)(v3 + 8))
        goto LABEL_23;
    }
  }
  vm_deallocate(mach_task_self_, outputStruct, v33);
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004F730();
}

- (int)numberOfFields
{
  return 5;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%f"), *(float *)((char *)&self->super.isa + qword_100060A90[a3]));
}

- (float)getCurrentPackagePower
{
  return self->currentPackagePower;
}

+ (id)sharedInstance
{
  if (qword_10009A3A8 != -1)
    dispatch_once(&qword_10009A3A8, &stru_10007D698);
  return (id)qword_10009A3B0;
}

- (PowerZoneTelemetry)init
{
  PowerZoneTelemetry *v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  vm_address_t v5;
  unint64_t v6;
  vm_address_t v7;
  int v8;
  __int128 v9;
  __int128 v10;
  int v11;
  __int128 v12;
  __int128 v13;
  CFMutableDictionaryRef v14;
  const void *v15;
  __CFDictionary *gpuChannels;
  __IOReportSubscriptionCF *gpuSubscription;
  unint64_t v18;
  unint64_t v19;
  mach_timebase_info info;
  vm_size_t size;
  vm_address_t address;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PowerZoneTelemetry;
  v2 = -[PowerZoneTelemetry init](&v24, "init");
  if (!v2)
    return v2;
  v3 = IOServiceMatching("AppleCLPC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  v2->appleCLPCService = MatchingService;
  size = -3;
  address = 0;
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F680();
    goto LABEL_38;
  }
  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->clpcConnect))
  {
    if ((byte_10009A3B8 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F788();
      byte_10009A3B8 = 1;
    }
LABEL_8:
    IOObjectRelease(v2->appleCLPCService);
    goto LABEL_38;
  }
  if (IOConnectCallMethod(v2->clpcConnect, 6u, 0, 0, 0, 0, 0, 0, &address, &size))
  {
    IOObjectRelease(v2->appleCLPCService);
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F75C();
    goto LABEL_38;
  }
  if (size <= 0x6F)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F6AC();
    goto LABEL_38;
  }
  v5 = address;
  if (*(_QWORD *)(address + 8) != size)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F730();
LABEL_38:

    return 0;
  }
  v6 = *(_QWORD *)(address + 24);
  for (v2->lastCLPCReadingTimestamp = mach_absolute_time(); v6 < *(_QWORD *)(v5 + 8); v6 += *(_QWORD *)(v7 + 8))
  {
    v7 = address + v6;
    v8 = *(_DWORD *)(address + v6);
    if (v8 == 14)
    {
      v11 = *(_DWORD *)(v7 + 16);
      if (v11 == 1)
      {
        v13 = *(_OWORD *)(v7 + 16);
        xmmword_10009A048 = *(_OWORD *)v7;
        *(_OWORD *)algn_10009A058 = v13;
      }
      else if (!v11)
      {
        v12 = *(_OWORD *)(v7 + 16);
        xmmword_10009A028 = *(_OWORD *)v7;
        *(_OWORD *)algn_10009A038 = v12;
      }
    }
    else
    {
      if (v8 != 13)
      {
        IOObjectRelease(v2->appleCLPCService);
        vm_deallocate(mach_task_self_, address, size);
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F6D8();
        goto LABEL_38;
      }
      v9 = *(_OWORD *)v7;
      v10 = *(_OWORD *)(v7 + 16);
      qword_10009A020 = *(_QWORD *)(v7 + 32);
      xmmword_10009A000 = v9;
      *(_OWORD *)&qword_10009A010 = v10;
    }
  }
  if (address)
    vm_deallocate(mach_task_self_, address, size);
  v14 = IOServiceMatching("AGXAccelerator");
  v15 = (const void *)IOReportCopyChannelsWithID(v14, 0x505A454E47414745, 0);
  CFRelease(v14);
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F704();
    goto LABEL_8;
  }
  v2->gpuSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0, v15, &v2->gpuChannels, 0, 0);
  CFRelease(v15);
  gpuChannels = v2->gpuChannels;
  if (gpuChannels)
  {
    gpuSubscription = v2->gpuSubscription;
    if (gpuSubscription)
    {
      v2->lastGPUReading = (__CFDictionary *)IOReportCreateSamples(gpuSubscription, gpuChannels, 0);
      v2->lastGPUReadingTimestamp = mach_absolute_time();
    }
  }
  if (byte_1000A2DC0)
  {
    -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 17, CFSTR("zETM"), 17);
    dword_1000A2B04 = 0;
  }
  -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v2);
  mach_timebase_info(&info);
  LODWORD(v18) = info.numer;
  LODWORD(v19) = info.denom;
  v2->tbfactor = (double)v18 / (double)v19;
  return v2;
}

- (float)getCpuPowerZoneLimited
{
  return self->cpuPowerZoneLimited;
}

- (float)getGpuPowerZoneLimited
{
  return self->gpuPowerZoneLimited;
}

- (float)getPackagePowerZoneLimited
{
  return self->packagePowerZoneLimited;
}

- (BOOL)isFastDieEngaged
{
  return self->cpuFastDieLimitedMhz != 0;
}

- (void)dealloc
{
  io_object_t appleCLPCService;
  objc_super v4;

  appleCLPCService = self->appleCLPCService;
  if (appleCLPCService)
    IOObjectRelease(appleCLPCService);
  v4.receiver = self;
  v4.super_class = (Class)PowerZoneTelemetry;
  -[PowerZoneTelemetry dealloc](&v4, "dealloc");
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, *(&off_10007D6E0 + a3), 0);
}

@end

@implementation ArcController

- (ArcController)init
{
  return -[ArcController initWithParams:product:](self, "initWithParams:product:", 0, 0);
}

- (ArcController)initWithParams:(id)a3 product:(id)a4
{
  ArcController *v6;
  ArcController *v7;
  dispatch_queue_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *p_thresholdModuleTemperatureHysteresis;
  int *p_thresholdVirtualTemperature;
  int *p_thresholdVirtualTemperatureHysteresis;
  float *p_gainMitigated;
  _DWORD *p_gainUnmitigated;
  double v22;
  double v23;
  int thresholdModuleTemperature;
  int v25;
  BOOL v26;
  NSObject *v29;
  int v31;
  int v32;
  double v33;
  double v34;
  _QWORD v35[5];
  objc_super v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;

  v36.receiver = self;
  v36.super_class = (Class)ArcController;
  v6 = -[ArcController init](&v36, "init");
  v7 = v6;
  if (v6)
  {
    v6->_product = (CommonProduct *)a4;
    v8 = dispatch_queue_create("com.apple.ThermalMonitor.arc", 0);
    v7->_arcQueue = (OS_dispatch_queue *)v8;
    v7->_mitigationsActive = -1;
    if (!v8)
    {
      v9 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000533EC(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("thresholdModule"), kCFNumberIntType, &v7->_thresholdModuleTemperature);
    p_thresholdModuleTemperatureHysteresis = &v7->_thresholdModuleTemperatureHysteresis;
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("thresholdModuleHysteresis"), kCFNumberIntType, &v7->_thresholdModuleTemperatureHysteresis);
    p_thresholdVirtualTemperature = &v7->_thresholdVirtualTemperature;
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("thresholdVirtual"), kCFNumberIntType, &v7->_thresholdVirtualTemperature);
    p_thresholdVirtualTemperatureHysteresis = &v7->_thresholdVirtualTemperatureHysteresis;
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("thresholdVirtualHysteresis"), kCFNumberIntType, &v7->_thresholdVirtualTemperatureHysteresis);
    p_gainMitigated = &v7->_gainMitigated;
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("gainMitigated"), kCFNumberFloatType, &v7->_gainMitigated);
    p_gainUnmitigated = (_DWORD *)&v7->_gainUnmitigated;
    sub_1000048B0((CFDictionaryRef)a3, CFSTR("gainUnmitigated"), kCFNumberFloatType, &v7->_gainUnmitigated);
    thresholdModuleTemperature = v7->_thresholdModuleTemperature;
    if (thresholdModuleTemperature <= 0)
    {
      v25 = *p_thresholdVirtualTemperature;
    }
    else
    {
      v25 = *p_thresholdVirtualTemperature;
      v26 = *p_thresholdModuleTemperatureHysteresis < 1 || v25 < 1;
      if (!v26 && *p_thresholdVirtualTemperatureHysteresis >= 1)
      {
        LODWORD(v22) = 1.0;
        if (*p_gainMitigated > 0.0 && *p_gainMitigated <= 1.0)
        {
          LODWORD(v23) = *p_gainUnmitigated;
          if (*(float *)p_gainUnmitigated > 0.0 && *(float *)&v23 <= 1.0)
            goto LABEL_23;
        }
      }
    }
    v29 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      v31 = *p_thresholdModuleTemperatureHysteresis;
      v32 = *p_thresholdVirtualTemperatureHysteresis;
      v33 = *p_gainMitigated;
      v34 = *(float *)p_gainUnmitigated;
      *(_DWORD *)buf = 67110400;
      v38 = thresholdModuleTemperature;
      v39 = 1024;
      v40 = v31;
      v41 = 1024;
      v42 = v25;
      v43 = 1024;
      v44 = v32;
      v45 = 2048;
      v46 = v33;
      v47 = 2048;
      v48 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "<Error> Arc control: bad params (%d %d %d %d %.2f %.2f)", buf, 0x2Eu);
      thresholdModuleTemperature = v7->_thresholdModuleTemperature;
      v25 = *p_thresholdVirtualTemperature;
    }
LABEL_23:
    v7->_originalThresholdModuleTemperature = thresholdModuleTemperature;
    v7->_originalThresholdVirtualTemperature = v25;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100039318;
    v35[3] = &unk_10007E148;
    v35[4] = v7;
    -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v22, v23), "addObserverForName:object:queue:usingBlock:", AVAudioSessionMediaServicesWereResetNotification, +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"), +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), v35);
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v7);
  }
  return v7;
}

- (void)update
{
  OS_dispatch_queue *arcQueue;
  _QWORD block[5];

  arcQueue = self->_arcQueue;
  if (arcQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039430;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)arcQueue, block);
  }
}

- (void)updateInternal
{
  CommonProduct *product;
  int v4;
  int thresholdVirtualTemperature;
  int mitigationsActive;
  int thresholdModuleTemperature;
  BOOL v8;
  uint64_t v9;
  int v10;
  float v11;
  NSObject *v12;
  AVAudioSession *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  double v24;

  product = self->_product;
  if (product)
  {
    self->_latestModuleTemperature = -[CommonProduct arcModuleTemperature](product, "arcModuleTemperature");
    v4 = -[CommonProduct arcVirtualTemperature](self->_product, "arcVirtualTemperature");
    self->_latestVirtualTemperature = v4;
    thresholdVirtualTemperature = self->_thresholdVirtualTemperature;
    mitigationsActive = self->_mitigationsActive;
    thresholdModuleTemperature = self->_thresholdModuleTemperature;
    if (mitigationsActive == 100)
    {
      thresholdModuleTemperature -= self->_thresholdModuleTemperatureHysteresis;
      thresholdVirtualTemperature -= self->_thresholdVirtualTemperatureHysteresis;
    }
    v8 = self->_latestModuleTemperature <= thresholdModuleTemperature && v4 <= thresholdVirtualTemperature;
    v9 = 44;
    if (v8)
    {
      v9 = 48;
      v10 = 0;
    }
    else
    {
      v10 = 100;
    }
    if (v10 != mitigationsActive)
    {
      v11 = *(float *)((char *)&self->super.isa + v9);
      if (byte_1000A2480)
      {
        v12 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 134217984;
          v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: setting gain %.2f", (uint8_t *)&v23, 0xCu);
        }
      }
      v13 = +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
      *(float *)&v14 = v11;
      if (-[AVAudioSession setHapticThermalGain:error:](v13, "setHapticThermalGain:error:", 0, v14))
      {
        self->_mitigationsActive = v10;
        -[TGraphSampler updatePowerlogMiscState:value:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updatePowerlogMiscState:value:", 6, self->_mitigationsActive);
      }
      else
      {
        v15 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10005341C(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
}

- (void)overrideParam:(id)a3 value:(int)originalThresholdModuleTemperature
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  int v19;

  v7 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = a3;
    v18 = 1024;
    v19 = originalThresholdModuleTemperature;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: override (%@, %d)", (uint8_t *)&v16, 0x12u);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ArcModuleThresholdKey")))
  {
    if (originalThresholdModuleTemperature == -1)
      originalThresholdModuleTemperature = self->_originalThresholdModuleTemperature;
    self->_thresholdModuleTemperature = originalThresholdModuleTemperature;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("ArcVirtualThresholdKey")))
  {
    if (originalThresholdModuleTemperature == -1)
      originalThresholdModuleTemperature = self->_originalThresholdVirtualTemperature;
    self->_thresholdVirtualTemperature = originalThresholdModuleTemperature;
  }
  else
  {
    v8 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005344C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("Arc-mitigating");
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), self->_mitigationsActive);
}

@end

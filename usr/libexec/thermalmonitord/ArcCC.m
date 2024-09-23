@implementation ArcCC

- (ArcCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  char *v6;
  ArcCC *v7;
  NSObject *v8;
  int product_high;
  objc_super v11;
  uint8_t buf[4];
  int v13;

  v11.receiver = self;
  v11.super_class = (Class)ArcCC;
  v6 = -[ComponentControl initWithCC::](&v11, "initWithCC::", 11, 0);
  v7 = (ArcCC *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 39) = 1065353216;
    *((_DWORD *)v6 + 40) = -1082130432;
    *((_QWORD *)v6 + 6) = CFStringCreateWithFormat(0, 0, CFSTR("%d Arc "), 11);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    sub_1000048B0(a3, CFSTR("thresholdModule"), kCFNumberIntType, (char *)&v7->_product + 4);
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        product_high = HIDWORD(v7->_product);
        *(_DWORD *)buf = 67109120;
        v13 = product_high;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Got ArcCC module threshold: %d", buf, 8u);
      }
    }
  }
  return v7;
}

- (void)defaultAction
{
  int v3;
  unint64_t v4;
  float v5;
  float v6;
  float v7;
  NSObject *v8;
  AVAudioSession *v9;
  double v10;
  NSObject *v11;
  int v12;
  double v13;

  v3 = objc_msgSend(*(id *)(&self->super.currentPower + 1), "arcModuleTemperature");
  self->_thresholdModuleTemperature = v3;
  if (*(_QWORD *)(&self->super.currentPower + 1))
  {
    if (v3 <= SHIDWORD(self->_product))
    {
      v6 = *(float *)&self->_latestModuleTemperature;
      v7 = 1.0;
      if (v6 < 1.0)
      {
        self->_latestModuleTemperature = 1065353216;
        v6 = 1.0;
      }
    }
    else
    {
      LODWORD(v4) = self->super.currentLoadingIndex;
      v5 = (double)v4 / 100.0;
      *(float *)&v4 = v5 * v5;
      if (*(float *)&v4 <= 1.0)
        v6 = *(float *)&v4;
      else
        v6 = 1.0;
      *(float *)&self->_latestModuleTemperature = v6;
      v7 = v6;
    }
    if (self->_currentHapticGain != v6)
    {
      if (byte_1000A2480)
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134217984;
          v13 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> ArcCC: setting gain %.4f", (uint8_t *)&v12, 0xCu);
        }
      }
      v9 = +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
      *(float *)&v10 = v7;
      if ((-[AVAudioSession setHapticThermalGain:error:](v9, "setHapticThermalGain:error:", 0, v10) & 1) == 0)
      {
        v11 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100053EDC(v11);
      }
    }
    LODWORD(self->_currentHapticGain) = self->_latestModuleTemperature;
  }
}

- (void)refreshTGraphTelemetry
{
  float v3;
  float v4;
  NSObject *v6;
  float v7;

  -[AVAudioSession hapticThermalGain](+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"), "hapticThermalGain");
  v4 = v3;
  if (v3 < 0.0 || v3 > 1.0)
  {
    *(_DWORD *)&self->super.allowLIOverride = 0;
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100053F1C(v6, v4);
  }
  else
  {
    self->_targetHapticGain = v3;
    v7 = fabsf(sqrtf(v3)) * 100.0;
    if (v4 == -INFINITY)
      v7 = INFINITY;
    *(_DWORD *)&self->super.allowLIOverride = (int)v7;
  }
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ArcCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  unsigned int v6;
  __CFString *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ArcCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)ArcCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("ArcCC current gain");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("ArcCC target gain");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ArcCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  const __CFAllocator *v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)ArcCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)ArcCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)ArcCC;
  v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    v8 = 160;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%f"), *(float *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    v8 = 156;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%f"), *(float *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end

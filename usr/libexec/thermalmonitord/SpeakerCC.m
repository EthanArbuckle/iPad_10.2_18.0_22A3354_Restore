@implementation SpeakerCC

- (SpeakerCC)initWithParams:(__CFDictionary *)a3
{
  SpeakerCC *v4;
  SpeakerCC *v5;
  float currentSpeakerGain;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  double v20;

  v18.receiver = self;
  v18.super_class = (Class)SpeakerCC;
  v4 = -[ComponentControl initWithCC::](&v18, "initWithCC::", 12, 0);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d Speaker "), 12);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    sub_1000048B0(a3, CFSTR("speakerGainFloor"), kCFNumberFloatType, &v5->_currentSpeakerGain);
    currentSpeakerGain = v5->_currentSpeakerGain;
    if (currentSpeakerGain < 0.0 || currentSpeakerGain > 1.0)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000555D0(v8, v9, v10, v11, v12, v13, v14, v15);
      v5->_currentSpeakerGain = 1.0;
    }
    else if (byte_1000A2480)
    {
      v16 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = currentSpeakerGain;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> Got SpeakerCC gain floor value: %f", buf, 0xCu);
      }
    }
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (sub_100034168(a3, CFSTR("expectsCPMSSupport"), 0))
      -[ComponentControl setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex;
  double v4;
  float v5;
  NSObject *v6;
  AVAudioSession *v7;
  double v8;
  NSObject *v9;
  int v10;
  double v11;

  currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    if (currentLoadingIndex < 0x64)
    {
      v5 = self->_currentSpeakerGain + (double)currentLoadingIndex / 100.0 * (1.0 - self->_currentSpeakerGain);
      *((float *)&self->super.currentPower + 1) = v5;
      v4 = v5;
    }
    else
    {
      *(&self->super.currentPower + 1) = 1065353216;
      v4 = 1.0;
    }
    if (byte_1000A2480)
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> SpeakerCC: setting gain %.4f", (uint8_t *)&v10, 0xCu);
      }
    }
    v7 = +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
    LODWORD(v8) = *(&self->super.currentPower + 1);
    if ((-[AVAudioSession setSpeakerThermalGain:error:](v7, "setSpeakerThermalGain:error:", 0, v8) & 1) == 0)
    {
      v9 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055640(v9);
    }
    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }
}

- (void)refreshTGraphTelemetry
{
  float v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[AVAudioSession speakerThermalGain](+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"), "speakerThermalGain");
  if (v3 < 0.0 || v3 > 1.0)
  {
    *(_DWORD *)&self->super.allowLIOverride = 0;
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055680(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    self->_targetSpeakerGain = v3;
    *(_DWORD *)&self->super.allowLIOverride = (int)((float)((float)(v3 - self->_currentSpeakerGain) * 100.0)
                                                  / (1.0 - self->_currentSpeakerGain));
  }
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SpeakerCC;
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
  v10.super_class = (Class)SpeakerCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SpeakerCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("SpeakerCC current gain");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("SpeakerCC target gain");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SpeakerCC;
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
  v11.super_class = (Class)SpeakerCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SpeakerCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)SpeakerCC;
  v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    v8 = 144;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%f"), *(float *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    v8 = 140;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%f"), *(float *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end

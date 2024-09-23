@implementation AudioAmpCC

- (AudioAmpCC)initWithParams:(__CFDictionary *)a3
{
  AudioAmpCC *v4;
  AudioAmpCC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AudioAmpCC;
  v4 = -[ComponentControl initWithCC::](&v7, "initWithCC::", 10, 0);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    *(&v4->super.currentPower + 1) = 1109393408;
    v4->_targetPower = 0.0;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d AudioAmp "), 10);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    if (a3)
      sub_1000048B0(a3, CFSTR("maxAudioAmpPower"), kCFNumberFloatType, &v5->_currentPower);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex;

  currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    *((float *)&self->super.currentPower + 1) = (float)(self->_currentPower * (float)currentLoadingIndex) / 100.0;
    self->super.maxLoadingIndex = currentLoadingIndex;
  }
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AudioAmpCC;
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
  v10.super_class = (Class)AudioAmpCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AudioAmpCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("AudioAmpCC current power");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("AudioAmpCC target power");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AudioAmpCC;
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
  v11.super_class = (Class)AudioAmpCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)AudioAmpCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)AudioAmpCC;
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

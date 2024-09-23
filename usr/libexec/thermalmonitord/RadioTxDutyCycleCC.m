@implementation RadioTxDutyCycleCC

- (RadioTxDutyCycleCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  RadioTxDutyCycleCC *v5;
  RadioTxDutyCycleCC *v6;
  unsigned int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RadioTxDutyCycleCC;
  v5 = -[RadioCC initWithRunLoopAndParams:withParams:](&v9, "initWithRunLoopAndParams:withParams:", a3);
  v6 = v5;
  if (v5)
  {
    *(&v5->super.maxLoadingIndexPrevious + 1) = 250;
    if (a4)
    {
      v8 = 0;
      if (sub_1000048B0(a4, CFSTR("minRadioTxDutyCycle"), kCFNumberIntType, &v8))
        *(&v6->super.maxLoadingIndexPrevious + 1) = v8;
    }
    -[RadioTxDutyCycleCC calculateAdditionalRadioMitigations](v6, "calculateAdditionalRadioMitigations");
    -[RadioTxDutyCycleCC addRadioMitigations](v6, "addRadioMitigations");
  }
  return v6;
}

- (void)addRadioMitigations
{
  sub_10000536C(*(__CFDictionary **)(&self->super.super.currentPower + 1), kCTThermalTxDutyCycle, kCFNumberSInt32Type, &self->super.maxLoadingIndexPrevious);
}

- (void)calculateAdditionalRadioMitigations
{
  unsigned int v2;
  signed int v3;

  v2 = self->super.super.previousValue & ~((int)self->super.super.previousValue >> 31);
  if (v2 >= 0x64)
    v2 = 100;
  v3 = 10 * v2;
  if (v3 <= (signed int)*(&self->super.maxLoadingIndexPrevious + 1))
    v3 = *(&self->super.maxLoadingIndexPrevious + 1);
  self->super.maxLoadingIndexPrevious = v3;
}

- (void)setAdditionalRadioMitigations
{
  sub_100034274(*(__CFDictionary **)(&self->super.super.currentPower + 1), kCTThermalTxDutyCycle, kCFNumberSInt32Type, &self->super.maxLoadingIndexPrevious);
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RadioTxDutyCycleCC;
  return -[RadioCC numberOfFields](&v3, "numberOfFields") + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioTxDutyCycleCC;
  if (-[RadioCC numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioTxDutyCycleCC;
    if (-[RadioCC numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return CFSTR("Radio - txDutyCycleLimit/10");
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioTxDutyCycleCC;
    return -[RadioCC copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
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
  v8.super_class = (Class)RadioTxDutyCycleCC;
  if (-[RadioCC numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioTxDutyCycleCC;
    if (-[RadioCC numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), ((signed int)self->super.maxLoadingIndexPrevious / 10));
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioTxDutyCycleCC;
    return -[RadioCC copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }
}

@end

@implementation RadioPowerTargetCC

- (RadioPowerTargetCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  RadioPowerTargetCC *v5;
  RadioPowerTargetCC *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RadioPowerTargetCC;
  v5 = -[RadioCC initWithRunLoopAndParams:withParams:](&v8, "initWithRunLoopAndParams:withParams:", a3);
  v6 = v5;
  if (v5)
  {
    *(&v5->super.maxLoadingIndexPrevious + 1) = -1;
    if (a4
      && sub_1000048B0(a4, CFSTR("maxRadioPower"), kCFNumberIntType, &v5->super.maxLoadingIndexPrevious + 1)&& (sub_1000048B0(a4, CFSTR("minRadioPower"), kCFNumberIntType, &v6->radioPowerTarget) & 1) == 0)
    {
      v6->radioPowerTarget = 0;
    }
    -[RadioPowerTargetCC calculateAdditionalRadioMitigations](v6, "calculateAdditionalRadioMitigations");
    -[RadioPowerTargetCC addRadioMitigations](v6, "addRadioMitigations");
  }
  return v6;
}

- (void)addRadioMitigations
{
  sub_10000536C(*(__CFDictionary **)(&self->super.super.currentPower + 1), kCTRadioMaxPower, kCFNumberSInt32Type, &self->super.maxLoadingIndexPrevious);
}

- (void)calculateAdditionalRadioMitigations
{
  signed int previousValue;
  signed int radioPowerTarget;
  uint64_t v4;

  previousValue = self->super.super.previousValue;
  if (previousValue <= 99)
  {
    v4 = 1374389535 * *(&self->super.maxLoadingIndexPrevious + 1) * (previousValue & ~(previousValue >> 31));
    radioPowerTarget = (v4 >> 37) + ((unint64_t)v4 >> 63);
    if (radioPowerTarget <= self->radioPowerTarget)
      radioPowerTarget = self->radioPowerTarget;
  }
  else
  {
    radioPowerTarget = 65000;
  }
  self->super.maxLoadingIndexPrevious = radioPowerTarget;
}

- (void)setAdditionalRadioMitigations
{
  sub_100034274(*(__CFDictionary **)(&self->super.super.currentPower + 1), kCTRadioMaxPower, kCFNumberSInt32Type, &self->super.maxLoadingIndexPrevious);
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RadioPowerTargetCC;
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
  v8.super_class = (Class)RadioPowerTargetCC;
  if (-[RadioCC numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioPowerTargetCC;
    if (-[RadioCC numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return CFSTR("Radio - powerTarget");
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioPowerTargetCC;
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
  v8.super_class = (Class)RadioPowerTargetCC;
  if (-[RadioCC numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioPowerTargetCC;
    if (-[RadioCC numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), self->super.maxLoadingIndexPrevious);
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioPowerTargetCC;
    return -[RadioCC copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }
}

@end

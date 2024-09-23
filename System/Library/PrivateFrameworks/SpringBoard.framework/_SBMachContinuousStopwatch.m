@implementation _SBMachContinuousStopwatch

- (uint64_t)stop
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = mach_continuous_time();
    *(_BYTE *)(v1 + 8) = 0;
    *(_QWORD *)(v1 + 24) += result - *(_QWORD *)(v1 + 16);
  }
  return result;
}

- (uint64_t)start
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 8) = 1;
    result = mach_continuous_time();
    *(_QWORD *)(v1 + 16) = result;
  }
  return result;
}

- (double)activeTime
{
  double result;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 8))
    mach_continuous_time();
  BSMonotonicReferencedTimeFromMachTime();
  return result;
}

- (_SBMachContinuousStopwatch)init
{
  _SBMachContinuousStopwatch *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SBMachContinuousStopwatch;
  result = -[_SBMachContinuousStopwatch init](&v3, sel_init);
  if (result)
    result->_active = 0;
  return result;
}

@end

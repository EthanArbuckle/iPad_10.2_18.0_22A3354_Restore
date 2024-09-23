@implementation VTCorruptDetector

- (VTCorruptDetector)init
{
  VTCorruptDetector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTCorruptDetector;
  result = -[VTCorruptDetector init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_zeroSamplesCount = 0;
  return result;
}

- (void)reset
{
  *(_QWORD *)&self->_zeroSamplesCount = 0;
}

- (void)analyze:(AudioBuffer)a3
{
  uint64_t v3;
  int zeroSamplesCount;
  int maxZeroSamplesCount;
  int v6;
  int v7;

  v3 = *(_QWORD *)&a3.mNumberChannels >> 33;
  if (*(_QWORD *)&a3.mNumberChannels >> 33)
  {
    zeroSamplesCount = self->_zeroSamplesCount;
    maxZeroSamplesCount = self->_maxZeroSamplesCount;
    do
    {
      v7 = *(__int16 *)a3.mData;
      a3.mData = (char *)a3.mData + 2;
      v6 = v7;
      if (v7 < 0)
        v6 = -v6;
      if ((unsigned __int16)v6 < 5u)
        ++zeroSamplesCount;
      else
        zeroSamplesCount = 0;
      if (maxZeroSamplesCount <= zeroSamplesCount)
        maxZeroSamplesCount = zeroSamplesCount;
      --v3;
    }
    while (v3);
    self->_zeroSamplesCount = zeroSamplesCount;
    self->_maxZeroSamplesCount = maxZeroSamplesCount;
  }
}

- (int)getMaxZeroSampleCount
{
  return self->_maxZeroSamplesCount;
}

- (BOOL)audioHasZeroRun
{
  return self->_maxZeroSamplesCount > 1599;
}

@end

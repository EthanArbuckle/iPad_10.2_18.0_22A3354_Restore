@implementation CLPeopleDensityMediumSignalClassifierConfig

- (CLPeopleDensityMediumSignalClassifierConfig)initWithDefaults
{
  return -[CLPeopleDensityMediumSignalClassifierConfig initWithRssiLowerBound:RssiUpperBound:deviceThreshold:](self, "initWithRssiLowerBound:RssiUpperBound:deviceThreshold:", -73, -62, 1);
}

- (CLPeopleDensityMediumSignalClassifierConfig)initWithRssiLowerBound:(int64_t)a3 RssiUpperBound:(int64_t)a4 deviceThreshold:(unint64_t)a5
{
  CLPeopleDensityMediumSignalClassifierConfig *v8;
  CLPeopleDensityMediumSignalClassifierConfig *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLPeopleDensityMediumSignalClassifierConfig;
  v8 = -[CLPeopleDensityMediumSignalClassifierConfig init](&v11, "init");
  v9 = 0;
  if (a3 <= a4 && v8)
  {
    v8->_midRangRssiLowerBound = a3;
    v8->_midRangRssiUpperBound = a4;
    v9 = v8;
    v8->_midRangRssiDeviceThreshold = a5;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CLPeopleDensityMediumSignalClassifierConfig initWithRssiLowerBound:RssiUpperBound:deviceThreshold:](+[CLPeopleDensityMediumSignalClassifierConfig allocWithZone:](CLPeopleDensityMediumSignalClassifierConfig, "allocWithZone:", a3), "initWithRssiLowerBound:RssiUpperBound:deviceThreshold:", -[CLPeopleDensityMediumSignalClassifierConfig midRangRssiLowerBound](self, "midRangRssiLowerBound"), -[CLPeopleDensityMediumSignalClassifierConfig midRangRssiUpperBound](self, "midRangRssiUpperBound"), -[CLPeopleDensityMediumSignalClassifierConfig midRangRssiDeviceThreshold](self, "midRangRssiDeviceThreshold"));
}

- (BOOL)isInMidRangeRssi:(int)a3
{
  return self->_midRangRssiUpperBound >= a3 && self->_midRangRssiLowerBound <= a3;
}

- (int64_t)midRangRssiLowerBound
{
  return self->_midRangRssiLowerBound;
}

- (int64_t)midRangRssiUpperBound
{
  return self->_midRangRssiUpperBound;
}

- (unint64_t)midRangRssiDeviceThreshold
{
  return self->_midRangRssiDeviceThreshold;
}

@end

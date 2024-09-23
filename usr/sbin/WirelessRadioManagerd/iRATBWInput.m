@implementation iRATBWInput

- (iRATBWInput)initWithCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12
{
  iRATBWInput *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)iRATBWInput;
  result = -[iRATBWInput init](&v21, "init");
  if (result)
  {
    result->_cca = a3;
    result->_weighted_average_phyrate_rx = a4;
    result->_weighted_average_rssi = a5;
    result->_weighted_average_snr = a6;
    result->_maxOfActualLowBandwidth_d = a7;
    result->_tcpRTTAvg = a8;
    result->_wifChannelType = a9;
    result->_wifiguardinterval = a10;
    result->_isWfiCaptive = a11;
    result->_wifinumberOfSpatialStreams = a12;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100241EB0);
}

- (id)featureValueForName:(id)a3
{
  uint64_t v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("cca")) & 1) != 0)
  {
    v5 = 8;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("weighted_average_phyrate_rx")) & 1) != 0)
  {
    v5 = 16;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("weighted_average_rssi")) & 1) != 0)
  {
    v5 = 24;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("weighted_average_snr")) & 1) != 0)
  {
    v5 = 32;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("maxOfActualLowBandwidth_d")) & 1) != 0)
  {
    v5 = 40;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("tcpRTTAvg")) & 1) != 0)
  {
    v5 = 48;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("wifChannelType")) & 1) != 0)
  {
    v5 = 56;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("wifiguardinterval")) & 1) != 0)
  {
    v5 = 64;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isWfiCaptive")) & 1) != 0)
  {
    v5 = 72;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("wifinumberOfSpatialStreams")))
  {
    v5 = 80;
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  }
  return 0;
}

- (double)cca
{
  return self->_cca;
}

- (void)setCca:(double)a3
{
  self->_cca = a3;
}

- (double)weighted_average_phyrate_rx
{
  return self->_weighted_average_phyrate_rx;
}

- (void)setWeighted_average_phyrate_rx:(double)a3
{
  self->_weighted_average_phyrate_rx = a3;
}

- (double)weighted_average_rssi
{
  return self->_weighted_average_rssi;
}

- (void)setWeighted_average_rssi:(double)a3
{
  self->_weighted_average_rssi = a3;
}

- (double)weighted_average_snr
{
  return self->_weighted_average_snr;
}

- (void)setWeighted_average_snr:(double)a3
{
  self->_weighted_average_snr = a3;
}

- (double)maxOfActualLowBandwidth_d
{
  return self->_maxOfActualLowBandwidth_d;
}

- (void)setMaxOfActualLowBandwidth_d:(double)a3
{
  self->_maxOfActualLowBandwidth_d = a3;
}

- (double)tcpRTTAvg
{
  return self->_tcpRTTAvg;
}

- (void)setTcpRTTAvg:(double)a3
{
  self->_tcpRTTAvg = a3;
}

- (double)wifChannelType
{
  return self->_wifChannelType;
}

- (void)setWifChannelType:(double)a3
{
  self->_wifChannelType = a3;
}

- (double)wifiguardinterval
{
  return self->_wifiguardinterval;
}

- (void)setWifiguardinterval:(double)a3
{
  self->_wifiguardinterval = a3;
}

- (double)isWfiCaptive
{
  return self->_isWfiCaptive;
}

- (void)setIsWfiCaptive:(double)a3
{
  self->_isWfiCaptive = a3;
}

- (double)wifinumberOfSpatialStreams
{
  return self->_wifinumberOfSpatialStreams;
}

- (void)setWifinumberOfSpatialStreams:(double)a3
{
  self->_wifinumberOfSpatialStreams = a3;
}

@end

@implementation WK_RTCVideoEncoderQpThresholds

- (WK_RTCVideoEncoderQpThresholds)initWithThresholdsLow:(int64_t)a3 high:(int64_t)a4
{
  WK_RTCVideoEncoderQpThresholds *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WK_RTCVideoEncoderQpThresholds;
  result = -[WK_RTCVideoEncoderQpThresholds init](&v7, sel_init);
  if (result)
  {
    result->_low = a3;
    result->_high = a4;
  }
  return result;
}

- (int64_t)low
{
  return self->_low;
}

- (int64_t)high
{
  return self->_high;
}

@end

@implementation CHChannelScale

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  uint64_t v8;
  PCString v10;

  v8 = operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelScale::OZChannelScale((OZChannelScale *)v8, &v10, 0, a4, a5, 2u, 0, 0);
  PCString::~PCString(&v10);
  OZChannel::setDiscrete((OZChannel *)(v8 + 136), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 288), 0, 0);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super.super._pOZChannel;
  if (result)
  return result;
}

- (void)getScaleAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[CHChannel2D getDoubleValuesAtTime:x:y:](self, "getDoubleValuesAtTime:x:y:", &v5, a4, a5);
}

- (void)getScaleAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[CHChannel2D getDoubleValuesAtTime:curveX:curveY:](self, "getDoubleValuesAtTime:curveX:curveY:", &v5, a4, a5);
}

@end

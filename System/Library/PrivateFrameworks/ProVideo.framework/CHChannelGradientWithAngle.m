@implementation CHChannelGradientWithAngle

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelGradientWithAngle *v8;
  PCString v10;

  v8 = (OZChannelGradientWithAngle *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelGradientWithAngle::OZChannelGradientWithAngle(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super.super._pOZChannel;
  if (result)
  return result;
}

- (id)gradientAngleChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 1056), 0);
}

- (double)gradientAngleAtTime:(id *)a3
{
  char *v4;
  double result;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  OZChannel::getValueAsDouble((OZChannel *)(v4 + 1056), &v6, 0.0);
  return result;
}

@end

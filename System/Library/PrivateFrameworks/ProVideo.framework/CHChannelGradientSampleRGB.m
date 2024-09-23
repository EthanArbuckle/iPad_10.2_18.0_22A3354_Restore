@implementation CHChannelGradientSampleRGB

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelGradientSampleRGB *v8;
  PCString v10;

  v8 = (OZChannelGradientSampleRGB *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelGradientSampleRGB::OZChannelGradientSampleRGB(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super._pOZChannel;
  if (result)
  return result;
}

@end

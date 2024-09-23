@implementation CHChannelHistogramSample

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelHistogramSample *v8;
  PCString v10;

  v8 = (OZChannelHistogramSample *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelHistogramSample::OZChannelHistogramSample(v8, &v10, 0, a4, a5, 5u);
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

- (id)blackInChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 136), 0);
}

- (id)blackOutChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 288), 0);
}

- (id)whiteInChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 440), 0);
}

- (id)whiteOutChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 592), 0);
}

- (id)gammaChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 744), 0);
}

@end

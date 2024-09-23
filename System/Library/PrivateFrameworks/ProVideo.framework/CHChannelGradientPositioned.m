@implementation CHChannelGradientPositioned

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelGradientPositioned *v8;
  PCString v10;

  v8 = (OZChannelGradientPositioned *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelGradientPositioned::OZChannelGradientPositioned(v8, &v10, 0, a4, a5);
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

- (id)startChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 1056), 0);
}

- (id)endChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 1760), 0);
}

@end

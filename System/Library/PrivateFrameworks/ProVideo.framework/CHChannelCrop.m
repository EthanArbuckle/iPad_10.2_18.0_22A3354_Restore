@implementation CHChannelCrop

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
  OZChannelCrop::OZChannelCrop((OZChannelCrop *)v8, &v10, 0, a4, a5, 4u, 0, 0);
  PCString::~PCString(&v10);
  OZChannel::setDiscrete((OZChannel *)(v8 + 136), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 288), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 440), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 592), 0, 0);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super._pOZChannel;
  if (result)
  return result;
}

- (id)leftChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 136), 0);
}

- (id)rightChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 288), 0);
}

- (id)bottomChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 440), 0);
}

- (id)topChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 592), 0);
}

@end

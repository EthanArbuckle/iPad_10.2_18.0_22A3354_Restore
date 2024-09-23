@implementation CHChannelDiscreteColor

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelDiscreteColor *v8;
  PCString v10;

  v8 = (OZChannelDiscreteColor *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelDiscreteColor::OZChannelDiscreteColor(v8, &v10, 0, a4, a5);
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

- (void)setColorIndex:(int)a3
{
  void *pOZChannel;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelDiscreteColor::setColorIndex((OZChannelDiscreteColor *)pOZChannel, a3);
}

- (int)colorIndex
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getValueAsInt(pOZChannel, MEMORY[0x1E0CA2E68], 0.0);
}

- (void)setDefaultColorIndex:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelDiscreteColor::setDefaultColorIndex(pOZChannel, a3);
}

- (int)defaultColorIndex
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannelDiscreteColor::getDefaultColorIndex(pOZChannel);
}

- (PCColor)colorForIndex:(SEL)a3
{
  OZChannelDiscreteColor *v4;
  OZChannelBase *pOZChannel;

  v4 = *(OZChannelDiscreteColor **)&a4;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  return (PCColor *)OZChannelDiscreteColor::getPCColorForIndex(v4, retstr);
}

@end

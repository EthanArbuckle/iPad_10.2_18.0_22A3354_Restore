@implementation CHChannelShape

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelShape *v8;
  PCString v10;

  v8 = (OZChannelShape *)operator new();
  PCString::PCString(&v10, (const char *)objc_msgSend(a3, "UTF8String"));
  OZChannelShape::OZChannelShape(v8, &v10, 0, a4, a5);
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

@implementation CHChannelVaryingFolder

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelVaryingFolder *v8;
  PCString v10;

  v8 = (OZChannelVaryingFolder *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelVaryingFolder::OZChannelVaryingFolder(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super._pOZChannel;
  if (result)
  return result;
}

@end

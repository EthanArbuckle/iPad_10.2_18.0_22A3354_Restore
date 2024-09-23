@implementation CHChannelAspectRatio

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return (OZChannelBase *)CreateNewOZChannel<OZChannelAspectRatio>(a3, a4, a5);
}

- (OZChannelAspectRatio)ozChannel
{
  OZChannelAspectRatio *result;

  result = (OZChannelAspectRatio *)self->super.super.super._pOZChannel;
  if (result)
  return result;
}

@end

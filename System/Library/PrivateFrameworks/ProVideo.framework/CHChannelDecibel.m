@implementation CHChannelDecibel

- (CHChannelDecibel)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4
{
  CHChannelDecibel *v4;
  CHChannelDecibel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHChannelDecibel;
  v4 = -[CHChannelBase initWithOZChannel:freeWhenDone:](&v7, sel_initWithOZChannel_freeWhenDone_, a3, a4);
  v5 = v4;
  if (v4)
    -[CHChannel setSliderTransformerName:](v4, "setSliderTransformerName:", CFSTR("PISliderTransformerDecibel"));
  return v5;
}

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelDecibel *v8;
  PCString v10;

  v8 = (OZChannelDecibel *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelDecibel::OZChannelDecibel(v8, &v10, 0, a4, a5, 0, 0);
  PCString::~PCString(&v10);
  OZChannel::setDiscrete((OZChannel *)v8, 0, 0);
  return (OZChannelBase *)v8;
}

- (OZChannelDecibel)ozChannel
{
  OZChannelDecibel *result;

  result = (OZChannelDecibel *)self->super.super.super._pOZChannel;
  if (result)
  return result;
}

@end

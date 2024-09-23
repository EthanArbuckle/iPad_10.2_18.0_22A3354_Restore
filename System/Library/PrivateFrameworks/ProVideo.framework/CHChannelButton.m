@implementation CHChannelButton

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelButton *v8;
  PCString v10;

  v8 = (OZChannelButton *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelButton::OZChannelButton(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (OZChannelButton)ozChannel
{
  OZChannelButton *result;

  result = (OZChannelButton *)self->super.super._pOZChannel;
  if (result)
  return result;
}

- (void)setSelector:(SEL)a3 andTarget:(id)a4
{
  OZChannelBase *pOZChannel;
  OZChannelButton *v7;
  const __CFString *v8;
  PCString v9;
  PCString v10;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  v8 = (const __CFString *)NSStringFromSelector(a3);
  v10.var0 = 0;
  PCString::set(&v10, v8);
  v9.var0 = (__CFString *)&v10;
  OZChannelButton::setCallbackSelectorAsString(v7, v9, a4);
  PCString::~PCString(&v10);
}

- (id)callback
{
  OZChannelButton *pOZChannel;

  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannelButton::getCallbackBlock(pOZChannel);
}

- (void)setCallback:(id)a3
{
  OZChannelButton *pOZChannel;

  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannelButton::setCallbackBlock(pOZChannel, a3);
}

- (void)setButtonTitle:(id)a3
{
  OZChannelBase *pOZChannel;
  PCString *v5;
  PCString v6;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  PCString::set(v5 + 22, &v6);
  PCString::~PCString(&v6);
}

- (void)performCallback
{
  OZChannelButton *pOZChannel;

  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannelButton::callCallback(pOZChannel);
}

@end

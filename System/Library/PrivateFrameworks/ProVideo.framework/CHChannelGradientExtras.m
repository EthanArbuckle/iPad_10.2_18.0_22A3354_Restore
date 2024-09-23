@implementation CHChannelGradientExtras

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelGradientExtras *v8;
  PCString v10;

  v8 = (OZChannelGradientExtras *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelGradientExtras::OZChannelGradientExtras(v8, &v10, 0, a4, a5);
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

- (id)gradientTypeChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 800), 0);
}

- (int)gradientType:(id *)a3
{
  char *v4;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  return OZChannel::getValueAsInt((OZChannel *)(v4 + 800), &v6, 0.0);
}

- (int)gradientType:(id *)a3 index:(double)a4
{
  char *v6;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  return OZChannel::getValueAsInt((OZChannel *)(v6 + 800), &v8, a4);
}

@end

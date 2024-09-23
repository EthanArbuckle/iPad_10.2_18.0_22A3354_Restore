@implementation CHChannelText

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelText *v8;
  PCString v10;

  v8 = (OZChannelText *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelText::OZChannelText(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (OZChannelText)ozChannel
{
  OZChannelText *result;

  result = (OZChannelText *)self->super.super._pOZChannel;
  if (result)
  return result;
}

- (id)string
{
  void *v2;
  const __CFString *v3;
  PCString v5;

  (*(void (**)(PCString *__return_ptr))(*(_QWORD *)v2 + 848))(&v5);
  v3 = PCString::ns_str(&v5);
  PCString::~PCString(&v5);
  return (id)v3;
}

- (void)setString:(id)a3
{
  OZChannelBase *pOZChannel;
  void *v5;
  PCString v6;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, _QWORD, _QWORD))(*(_QWORD *)v5 + 864))(v5, &v6, 0, 0);
  PCString::~PCString(&v6);
}

- (void)setString:(id)a3 affectLayout:(BOOL)a4
{
  _BOOL8 v4;
  OZChannelBase *pOZChannel;
  void *v7;
  PCString v8;

  v4 = a4;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  v8.var0 = 0;
  PCString::set(&v8, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, _QWORD, _BOOL8))(*(_QWORD *)v7 + 864))(v7, &v8, 0, v4);
  PCString::~PCString(&v8);
}

- (void)setAttributedString:(id)a3
{
  void *v4;

  (*(void (**)(void *, id))(*(_QWORD *)v4 + 872))(v4, a3);
}

@end

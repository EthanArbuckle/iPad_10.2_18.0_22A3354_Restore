@implementation CHChannelBlindData

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelBlindData *v8;
  PCString v10;

  v8 = (OZChannelBlindData *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelBlindData::OZChannelBlindData(v8, &v10, 0, 0, a4, a5, 0, 0, 0, 0, 0);
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

- (id)pluginDataAtTime:(id *)a3
{
  OZChannelBlindData *pOZChannel;

  pOZChannel = (OZChannelBlindData *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannelBlindData::getPluginDataPtr(pOZChannel, (const CMTime *)a3);
}

- (void)setPluginData:(id)a3 atTime:(id *)a4
{
  OZChannelBlindData *pOZChannel;

  pOZChannel = (OZChannelBlindData *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannelBlindData::setPluginDataPtr(pOZChannel, (const CMTime *)a4, a3, 0, 1, 1);
}

- (void)setDefaultCurveBlindDataValue:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelBlindData *v5;
  int v6;
  uint64_t v7;
  int v8;
  char v9;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = (*(uint64_t (**)(OZChannelBlindData *))(*(_QWORD *)v5 + 512))(v5);
  v7 = *(_QWORD *)v5;
  if (v6)
  {
    v8 = (*(uint64_t (**)(OZChannelBlindData *))(v7 + 832))(v5);
    OZChannelBlindData::setDefaultValue(v5, a3);
    if (v8)
      return;
LABEL_8:
    (*(void (**)(OZChannelBlindData *, _QWORD))(*(_QWORD *)v5 + 288))(v5, 0);
    return;
  }
  v9 = (*(uint64_t (**)(OZChannelBlindData *, uint64_t))(v7 + 496))(v5, 1);
  OZChannelBlindData::setDefaultValue(v5, a3);
  if ((v9 & 1) == 0)
    goto LABEL_8;
}

@end

@implementation CHChannelShear

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
  OZChannelShear::OZChannelShear((OZChannelShear *)v8, &v10, 0, a4, a5, 2u);
  PCString::~PCString(&v10);
  OZChannel::setDiscrete((OZChannel *)(v8 + 136), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 288), 0, 0);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super._pOZChannel;
  if (result)
  return result;
}

- (void)getShearAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  OZChannelBase *pOZChannel;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v9 = 0;
  OZChannel::getValueAsDouble((OZChannel *)(v9 + 136), (const CMTime *)a3, 0.0);
  *(_QWORD *)a4 = v10;
  OZChannel::getValueAsDouble((OZChannel *)(v9 + 288), (const CMTime *)a3, 0.0);
  *(_QWORD *)a5 = v11;
}

- (void)getShearAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  OZChannelBase *pOZChannel;
  char *v10;
  __int128 v11;
  int64_t var3;
  CMTime v13;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v10 = 0;
  memset(&v13, 0, sizeof(v13));
  v11 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  -[CHChannelBase convertGlobalToLocal:](self, "convertGlobalToLocal:", &v11);
  if (a4)
    *a4 = OZChannel::getCurveValue((OZChannel *)(v10 + 136), &v13, 0);
  if (a5)
    *a5 = OZChannel::getCurveValue((OZChannel *)(v10 + 288), &v13, 0);
}

- (void)setShearAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6
{
  char v6;
  char *pOZChannel;
  char *v11;
  __int128 v12;
  OZCoreGlobals *Instance;
  char v14;
  OZCoreGlobals *v15;

  v6 = a6;
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v11 = pOZChannel;
  }
  else
  {
    v11 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    v12 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v12;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v14 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v6 & 1;
  OZChannel::setValue((OZChannel *)(v11 + 136), (const CMTime *)a3, a4, 0);
  v15 = (OZCoreGlobals *)OZChannel::setValue((OZChannel *)(v11 + 288), (const CMTime *)a3, a5, 0);
  *(_BYTE *)(OZCoreGlobals::getInstance(v15) + 8) = v14;
}

- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4
{
  OZChannelBase *pOZChannel;
  char *v7;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a3)
LABEL_3:
    *a3 = OZChannel::getDefaultValue((OZChannel *)(v7 + 136));
LABEL_4:
  if (a4)
    *a4 = OZChannel::getDefaultValue((OZChannel *)(v7 + 288));
}

- (void)setDefaultCurveX:(double)a3 curveY:(double)a4
{
  OZChannelBase *pOZChannel;
  char *v7;
  OZChannel *v8;
  int v9;
  uint64_t v10;
  int v11;
  OZChannel *v12;
  int v13;
  uint64_t v14;
  int v15;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  v8 = (OZChannel *)(v7 + 136);
  v9 = (*(uint64_t (**)(char *))(*((_QWORD *)v7 + 17) + 512))(v7 + 136);
  v10 = *((_QWORD *)v7 + 17);
  if (v9)
    v11 = (*(uint64_t (**)(char *))(v10 + 832))(v7 + 136) == 0;
  else
    v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 496))(v7 + 136, 1) ^ 1;
  v12 = (OZChannel *)(v7 + 288);
  v13 = (*(uint64_t (**)(char *))(*((_QWORD *)v7 + 36) + 512))(v7 + 288);
  v14 = *((_QWORD *)v7 + 36);
  if (v13)
    v15 = (*(uint64_t (**)(char *))(v14 + 832))(v7 + 288) == 0;
  else
    v15 = (*(uint64_t (**)(char *, uint64_t))(v14 + 496))(v7 + 288, 1) ^ 1;
  OZChannel::setDefaultValue(v8, a3);
  OZChannel::setDefaultValue(v12, a4);
  if (v11)
    (*((void (**)(OZChannel *, _QWORD))v8->var0 + 36))(v8, 0);
  if (v15)
    (*((void (**)(OZChannel *, _QWORD))v12->var0 + 36))(v12, 0);
}

- (void)getMinCurveX:(double *)a3 curveY:(double *)a4
{
  OZChannelBase *pOZChannel;
  _QWORD *v7;
  uint64_t v8;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a3)
  {
LABEL_3:
    v8 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v7[31] + 8) + 264))(*(_QWORD *)(v7[31] + 8), &v8);
    *(_QWORD *)a3 = v8;
  }
LABEL_4:
  if (a4)
  {
    v8 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v7[50] + 8) + 264))(*(_QWORD *)(v7[50] + 8), &v8);
    *(_QWORD *)a4 = v8;
  }
}

- (void)setMinCurveX:(double)a3 curveY:(double)a4
{
  OZChannelBase *pOZChannel;
  char *v7;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  OZChannel::setMin((OZChannel *)(v7 + 136), a3);
  OZChannel::setMin((OZChannel *)(v7 + 288), a4);
}

- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4
{
  OZChannelBase *pOZChannel;
  _QWORD *v7;
  uint64_t v8;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a3)
  {
LABEL_3:
    v8 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v7[31] + 8) + 256))(*(_QWORD *)(v7[31] + 8), &v8);
    *(_QWORD *)a3 = v8;
  }
LABEL_4:
  if (a4)
  {
    v8 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v7[50] + 8) + 256))(*(_QWORD *)(v7[50] + 8), &v8);
    *(_QWORD *)a4 = v8;
  }
}

- (void)setMaxCurveX:(double)a3 curveY:(double)a4
{
  OZChannelBase *pOZChannel;
  char *v7;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  OZChannel::setMax((OZChannel *)(v7 + 136), a3);
  OZChannel::setMax((OZChannel *)(v7 + 288), a4);
}

@end

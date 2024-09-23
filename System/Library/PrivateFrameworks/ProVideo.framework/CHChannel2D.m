@implementation CHChannel2D

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
  OZChannel2D::OZChannel2D((OZChannel2D *)v8, &v10, 0, a4, a5, 2u, 0, 0);
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

- (void)getDoubleValuesAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  char *v8;
  uint64_t v9;
  uint64_t v10;
  CMTime v11;

  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v8 + 336))(&v11, v8, a3);
  if (a4)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v8 + 136), &v11, 0.0);
    *(_QWORD *)a4 = v9;
  }
  if (a5)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v8 + 288), &v11, 0.0);
    *(_QWORD *)a5 = v10;
  }
}

- (void)getDoubleValuesAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  OZChannelBase *pOZChannel;
  char *v9;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a4)
LABEL_3:
    *a4 = OZChannel::getCurveValue((OZChannel *)(v9 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5)
    *a5 = OZChannel::getCurveValue((OZChannel *)(v9 + 288), (const CMTime *)a3, 0);
}

- (void)setDoubleValuesAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6
{
  char v6;
  void *pOZChannel;
  _QWORD *v11;
  __int128 v12;
  OZCoreGlobals *Instance;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  OZCoreGlobals *v17;
  _QWORD v18[3];

  v6 = a6;
  pOZChannel = self->super.super.super._pOZChannel;
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
  memset(v18, 0, sizeof(v18));
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v11 + 336))(v18, v11, a3);
  v16 = v11[17];
  v15 = v11 + 17;
  (*(void (**)(_QWORD *, _QWORD *, _QWORD, double))(v16 + 712))(v15, v18, 0, a4);
  v17 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v15[19] + 712))(v15 + 19, v18, 0, a5);
  *(_BYTE *)(OZCoreGlobals::getInstance(v17) + 8) = v14;
}

- (void)offsetDoubleValuesAtTime:(id *)a3 deltaX:(double)a4 deltaY:(double)a5 options:(unsigned int)a6
{
  char v6;
  void *pOZChannel;
  OZChannel2D *v11;
  __int128 v12;
  OZCoreGlobals *Instance;
  char v14;
  OZCoreGlobals *v15;
  CMTime v16;

  v6 = a6;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v11 = (OZChannel2D *)pOZChannel;
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
  memset(&v16, 0, sizeof(v16));
  (*(void (**)(CMTime *__return_ptr, OZChannel2D *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v11 + 336))(&v16, v11, a3);
  v15 = (OZCoreGlobals *)OZChannel2D::setValueOffsetByBehaviors(v11, &v16, a4, a5);
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

- (id)xChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 136), 0);
}

- (id)yChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 288), 0);
}

@end

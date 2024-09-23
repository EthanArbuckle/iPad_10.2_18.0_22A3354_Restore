@implementation CHChannelScale3D

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
  OZChannelScale3D::OZChannelScale3D((OZChannelScale3D *)v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  OZChannel::setDiscrete((OZChannel *)(v8 + 136), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 288), 0, 0);
  OZChannel::setDiscrete((OZChannel *)(v8 + 440), 0, 0);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super.super.super._pOZChannel;
  if (result)
  return result;
}

- (void)getScaleAtTime:(id *)a3 x:(double *)a4 y:(double *)a5 z:(double *)a6
{
  OZChannelScale3D *v10;
  CMTime v11;

  (*(void (**)(CMTime *__return_ptr, OZChannelScale3D *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v10 + 336))(&v11, v10, a3);
  OZChannelScale3D::getValue(v10, &v11, a4, a5, a6, 0.0);
}

- (void)getScaleAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5 curveZ:(double *)a6
{
  OZChannelBase *pOZChannel;
  char *v11;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (a4)
LABEL_3:
    *a4 = OZChannel::getCurveValue((OZChannel *)(v11 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5)
    *a5 = OZChannel::getCurveValue((OZChannel *)(v11 + 288), (const CMTime *)a3, 0);
  if (a6)
    *a6 = OZChannel::getCurveValue((OZChannel *)(v11 + 440), (const CMTime *)a3, 0);
}

- (void)setScaleAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 curveZ:(double)a6 options:(unsigned int)a7
{
  char v7;
  void *pOZChannel;
  _QWORD *v13;
  __int128 v14;
  OZCoreGlobals *Instance;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  OZCoreGlobals *v19;
  _QWORD v20[3];

  v7 = a7;
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v13 = pOZChannel;
  }
  else
  {
    v13 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    v14 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v14;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v16 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v7 & 1;
  memset(v20, 0, sizeof(v20));
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v13 + 336))(v20, v13, a3);
  v18 = v13[17];
  v17 = v13 + 17;
  (*(void (**)(_QWORD *, _QWORD *, _QWORD, double))(v18 + 712))(v17, v20, 0, a4);
  (*(void (**)(_QWORD *, _QWORD *, _QWORD, double))(v17[19] + 712))(v17 + 19, v20, 0, a5);
  v19 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v17[38] + 712))(v17 + 38, v20, 0, a6);
  *(_BYTE *)(OZCoreGlobals::getInstance(v19) + 8) = v16;
}

- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  OZChannelBase *pOZChannel;
  char *v9;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a3)
LABEL_3:
    *a3 = OZChannel::getDefaultValue((OZChannel *)(v9 + 136));
LABEL_4:
  if (a4)
    *a4 = OZChannel::getDefaultValue((OZChannel *)(v9 + 288));
  if (a5)
    *a5 = OZChannel::getDefaultValue((OZChannel *)(v9 + 440));
}

- (void)setDefaultCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  OZChannelBase *pOZChannel;
  _QWORD *v9;
  OZChannel *v10;
  int v11;
  uint64_t v12;
  int v13;
  OZChannel *v14;
  int v15;
  uint64_t v16;
  int v17;
  OZChannel *v18;
  int v19;
  uint64_t v20;
  int v21;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v9 = 0;
  v10 = (OZChannel *)(v9 + 17);
  v11 = (*(uint64_t (**)(_QWORD *))(v9[17] + 512))(v9 + 17);
  v12 = v9[17];
  if (v11)
    v13 = (*(uint64_t (**)(_QWORD *))(v12 + 832))(v9 + 17) == 0;
  else
    v13 = (*(uint64_t (**)(_QWORD *, uint64_t))(v12 + 496))(v9 + 17, 1) ^ 1;
  v14 = (OZChannel *)(v9 + 36);
  v15 = (*(uint64_t (**)(_QWORD *))(v9[36] + 512))(v9 + 36);
  v16 = v9[36];
  if (v15)
    v17 = (*(uint64_t (**)(_QWORD *))(v16 + 832))(v9 + 36) == 0;
  else
    v17 = (*(uint64_t (**)(_QWORD *, uint64_t))(v16 + 496))(v9 + 36, 1) ^ 1;
  v18 = (OZChannel *)(v9 + 55);
  v19 = (*(uint64_t (**)(_QWORD *))(v9[55] + 512))(v9 + 55);
  v20 = v9[55];
  if (v19)
    v21 = (*(uint64_t (**)(_QWORD *))(v20 + 832))(v9 + 55) == 0;
  else
    v21 = (*(uint64_t (**)(_QWORD *, uint64_t))(v20 + 496))(v9 + 55, 1) ^ 1;
  OZChannel::setDefaultValue(v10, a3);
  OZChannel::setDefaultValue(v14, a4);
  OZChannel::setDefaultValue(v18, a5);
  if (v13)
  {
    (*((void (**)(OZChannel *, _QWORD))v10->var0 + 36))(v10, 0);
    if (!v17)
    {
LABEL_15:
      if (!v21)
        return;
      goto LABEL_16;
    }
  }
  else if (!v17)
  {
    goto LABEL_15;
  }
  (*((void (**)(OZChannel *, _QWORD))v14->var0 + 36))(v14, 0);
  if (v21)
LABEL_16:
    (*((void (**)(OZChannel *, _QWORD))v18->var0 + 36))(v18, 0);
}

- (void)getMinCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  OZChannelBase *pOZChannel;
  _QWORD *v9;
  uint64_t v10;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a3)
  {
LABEL_3:
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[31] + 8) + 264))(*(_QWORD *)(v9[31] + 8), &v10);
    *(_QWORD *)a3 = v10;
  }
LABEL_4:
  if (a4)
  {
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[50] + 8) + 264))(*(_QWORD *)(v9[50] + 8), &v10);
    *(_QWORD *)a4 = v10;
  }
  if (a5)
  {
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[69] + 8) + 264))(*(_QWORD *)(v9[69] + 8), &v10);
    *(_QWORD *)a5 = v10;
  }
}

- (void)setMinCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  OZChannelBase *pOZChannel;
  char *v9;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v9 = 0;
  OZChannel::setMin((OZChannel *)(v9 + 136), a3);
  OZChannel::setMin((OZChannel *)(v9 + 288), a4);
  OZChannel::setMin((OZChannel *)(v9 + 440), a5);
}

- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  OZChannelBase *pOZChannel;
  _QWORD *v9;
  uint64_t v10;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a3)
  {
LABEL_3:
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[31] + 8) + 256))(*(_QWORD *)(v9[31] + 8), &v10);
    *(_QWORD *)a3 = v10;
  }
LABEL_4:
  if (a4)
  {
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[50] + 8) + 256))(*(_QWORD *)(v9[50] + 8), &v10);
    *(_QWORD *)a4 = v10;
  }
  if (a5)
  {
    v10 = 0;
    (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v9[69] + 8) + 256))(*(_QWORD *)(v9[69] + 8), &v10);
    *(_QWORD *)a5 = v10;
  }
}

- (void)setMaxCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  OZChannelBase *pOZChannel;
  char *v9;

  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v9 = 0;
  OZChannel::setMax((OZChannel *)(v9 + 136), a3);
  OZChannel::setMax((OZChannel *)(v9 + 288), a4);
  OZChannel::setMax((OZChannel *)(v9 + 440), a5);
}

- (id)zChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 440), 0);
}

@end

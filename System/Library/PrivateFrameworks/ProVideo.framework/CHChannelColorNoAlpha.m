@implementation CHChannelColorNoAlpha

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelColorNoAlpha *v8;
  PCString v10;

  v8 = (OZChannelColorNoAlpha *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelColorNoAlpha::OZChannelColorNoAlpha(v8, &v10, 0, a4, a5, 5u);
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

- (void)setDefaultCurveRed:(double)a3 curveGreen:(double)a4 curveBlue:(double)a5
{
  OZChannelBase *pOZChannel;
  OZChannelColorNoAlpha *v9;
  float v10;
  float v11;
  float v12;
  OZChannelBase v13;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v9 = 0;
  OZChannelColorNoAlpha::getPCColorSpace(v9, (CGColorSpace **)&v13);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  PCColor::PCColor((PCColor *)&v13.var1, v10, v11, v12, &v13);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v13);
  (*(void (**)(OZChannelColorNoAlpha *, OZFactory **))(*(_QWORD *)v9 + 848))(v9, &v13.var1);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v13.var7);
}

- (void)getDefaultCurveRed:(double *)a3 curveGreen:(double *)a4 curveBlue:(double *)a5
{
  OZChannelBase *pOZChannel;
  char *v9;

  pOZChannel = self->super.super.super._pOZChannel;
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

- (void)setColorSpaceIDNoConversion:(int)a3
{
  OZChannelBase *v3;
  const void *pOZChannel;

  v3 = *(OZChannelBase **)&a3;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelColorNoAlpha::setColorSpaceIDNoConversion((uint64_t)pOZChannel, v3, 0);
}

- (void)setIsColor:(BOOL)a3
{
  const void *pOZChannel;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelColorNoAlpha::setIsColor((uint64_t)pOZChannel, a3);
}

- (void)getColorAtTime:(id *)a3 red:(double *)a4 green:(double *)a5 blue:(double *)a6
{
  OZChannelBase *pOZChannel;
  OZChannelColorNoAlpha *v11;
  float v12;
  uint64_t v13;
  CGColorSpace *v14[3];
  PCColor v15;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v11 = 0;
  PCColor::PCColor(&v15);
  (*(void (**)(CGColorSpace **__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v11 + 336))(v14, v11, a3);
  (*(void (**)(OZChannelColorNoAlpha *, CGColorSpace **, PCColor *, double))(*(_QWORD *)v11 + 824))(v11, v14, &v15, 0.0);
  v13 = 0;
  v12 = 0.0;
  OZChannelColorNoAlpha::getPCColorSpace(v11, v14);
  PCColor::getRGB(&v15, (float *)&v13 + 1, (float *)&v13, &v12, (const PCColorSpaceHandle *)v14);
  PCCFRef<CGColorSpace *>::~PCCFRef(v14);
  *a4 = *((float *)&v13 + 1);
  *a5 = *(float *)&v13;
  *a6 = v12;
  PCCFRef<CGColorSpace *>::~PCCFRef(&v15.var1._obj);
}

- (double)redValueAtTime:(id *)a3
{
  char *pOZChannel;
  OZChannel *v4;
  double result;
  CMTime v6;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  v4 = (OZChannel *)(pOZChannel + 136);
  (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)pOZChannel + 336))(&v6);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (double)greenValueAtTime:(id *)a3
{
  char *pOZChannel;
  OZChannel *v5;
  double result;
  CMTime v7;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  v5 = (OZChannel *)(pOZChannel + 288);
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)pOZChannel
                                                                                            + 336))(&v7, pOZChannel, a3);
  OZChannel::getValueAsDouble(v5, &v7, 0.0);
  return result;
}

- (double)blueValueAtTime:(id *)a3
{
  char *pOZChannel;
  OZChannel *v5;
  double result;
  CMTime v7;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  v5 = (OZChannel *)(pOZChannel + 440);
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)pOZChannel
                                                                                            + 336))(&v7, pOZChannel, a3);
  OZChannel::getValueAsDouble(v5, &v7, 0.0);
  return result;
}

- (void)getColorAtTime:(id *)a3 curveRed:(double *)a4 curveGreen:(double *)a5 curveBlue:(double *)a6
{
  OZChannelBase *pOZChannel;
  char *v11;

  pOZChannel = self->super.super.super._pOZChannel;
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

- (double)curveRedValueAtTime:(id *)a3
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue((OZChannel *)(pOZChannel + 136), (const CMTime *)a3, 0);
}

- (double)curveGreenValueAtTime:(id *)a3
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue((OZChannel *)(pOZChannel + 288), (const CMTime *)a3, 0);
}

- (double)curveBlueValueAtTime:(id *)a3
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue((OZChannel *)(pOZChannel + 440), (const CMTime *)a3, 0);
}

- (void)setColorAtTime:(id *)a3 curveRed:(double)a4 curveGreen:(double)a5 curveBlue:(double)a6 options:(unsigned int)a7
{
  char v7;
  void *pOZChannel;
  OZChannelColorNoAlpha *v13;
  __int128 v14;
  OZCoreGlobals *Instance;
  char v16;
  float v17;
  float v18;
  float v19;
  OZCoreGlobals *v20;
  OZChannelBase v21;

  v7 = a7;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v13 = (OZChannelColorNoAlpha *)pOZChannel;
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
  OZChannelColorNoAlpha::getPCColorSpace(v13, (CGColorSpace **)&v21);
  v17 = a4;
  v18 = a5;
  v19 = a6;
  PCColor::PCColor((PCColor *)&v21.var3, v17, v18, v19, &v21);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v21);
  (*(void (**)(OZChannelBase *__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v13 + 336))(&v21, v13, a3);
  v20 = (OZCoreGlobals *)(*(uint64_t (**)(OZChannelColorNoAlpha *, OZChannelBase *, unsigned int *, _QWORD))(*(_QWORD *)v13 + 840))(v13, &v21, &v21.var3, 0);
  *(_BYTE *)(OZCoreGlobals::getInstance(v20) + 8) = v16;
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v21.var9);
}

- (void)setCurveRedValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5;
  void *pOZChannel;
  _QWORD *v9;
  __int128 v10;
  OZCoreGlobals *Instance;
  char v12;
  OZCoreGlobals *v13;
  _QWORD v14[3];

  v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    v10 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v12 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  v13 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v9[17] + 712))(v9 + 17, v14, 0, a3);
  *(_BYTE *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (void)setCurveGreenValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5;
  void *pOZChannel;
  _QWORD *v9;
  __int128 v10;
  OZCoreGlobals *Instance;
  char v12;
  OZCoreGlobals *v13;
  _QWORD v14[3];

  v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    v10 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v12 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  v13 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v9[36] + 712))(v9 + 36, v14, 0, a3);
  *(_BYTE *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (void)setCurveBlueValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5;
  void *pOZChannel;
  _QWORD *v9;
  __int128 v10;
  OZCoreGlobals *Instance;
  char v12;
  OZCoreGlobals *v13;
  _QWORD v14[3];

  v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    v10 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v12 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  v13 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v9[55] + 712))(v9 + 55, v14, 0, a3);
  *(_BYTE *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (id)redChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 136), 0);
}

- (id)greenChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 288), 0);
}

- (id)blueChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 440), 0);
}

@end

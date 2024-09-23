@implementation CHChannelColor

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelColor *v8;
  PCString v10;

  v8 = (OZChannelColor *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelColor::OZChannelColor(v8, &v10, 0, a4, a5, 6u);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super.super.super._pOZChannel;
  if (result)
  return result;
}

- (void)setDefaultCurveRed:(double)a3 curveGreen:(double)a4 curveBlue:(double)a5 curveAlpha:(double)a6
{
  OZChannelBase *pOZChannel;
  OZChannelColorNoAlpha *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  OZChannelBase v16;

  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v11 = 0;
  OZChannelColorNoAlpha::getPCColorSpace(v11, (CGColorSpace **)&v16);
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  PCColor::PCColor((PCColor *)&v16.var1, v12, v13, v14, v15, &v16);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v16);
  (*(void (**)(OZChannelColorNoAlpha *, OZFactory **))(*(_QWORD *)v11 + 848))(v11, &v16.var1);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v16.var7);
}

- (void)getDefaultCurveRed:(double *)a3 curveGreen:(double *)a4 curveBlue:(double *)a5 curveAlpha:(double *)a6
{
  OZChannelBase *pOZChannel;
  char *v11;

  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (a3)
LABEL_3:
    *a3 = OZChannel::getDefaultValue((OZChannel *)(v11 + 136));
LABEL_4:
  if (a4)
    *a4 = OZChannel::getDefaultValue((OZChannel *)(v11 + 288));
  if (a5)
    *a5 = OZChannel::getDefaultValue((OZChannel *)(v11 + 440));
  if (a6)
    *a6 = OZChannel::getDefaultValue((OZChannel *)(v11 + 1008));
}

- (void)getColorAtTime:(id *)a3 red:(double *)a4 green:(double *)a5 blue:(double *)a6 alpha:(double *)a7 inColorSpace:(CGColorSpace *)a8
{
  OZChannelBase *pOZChannel;
  OZChannelColorNoAlpha *v15;
  uint64_t v16;
  uint64_t v17;
  CGColorSpace *v18[3];
  PCColor v19;

  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  else
    v15 = 0;
  PCColor::PCColor(&v19);
  (*(void (**)(CGColorSpace **__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v15 + 336))(v18, v15, a3);
  (*(void (**)(OZChannelColorNoAlpha *, CGColorSpace **, PCColor *))(*(_QWORD *)v15 + 832))(v15, v18, &v19);
  v16 = 0;
  v17 = 0;
  if (a8)
  {
    PCColor::getRGBA(&v19, (float *)&v17 + 1, (float *)&v17, (float *)&v16 + 1, (float *)&v16, a8);
  }
  else
  {
    OZChannelColorNoAlpha::getPCColorSpace(v15, v18);
    PCColor::getRGBA(&v19, (float *)&v17 + 1, (float *)&v17, (float *)&v16 + 1, (float *)&v16, (const PCColorSpaceHandle *)v18);
    PCCFRef<CGColorSpace *>::~PCCFRef(v18);
  }
  *a4 = *((float *)&v17 + 1);
  *a5 = *(float *)&v17;
  *a6 = *((float *)&v16 + 1);
  *a7 = *(float *)&v16;
  PCCFRef<CGColorSpace *>::~PCCFRef(&v19.var1._obj);
}

- (double)alphaValueAtTime:(id *)a3
{
  char *v4;
  double result;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  OZChannel::getValueAsDouble((OZChannel *)(v4 + 1008), &v6, 0.0);
  return result;
}

- (void)getColorAtTime:(id *)a3 curveRed:(double *)a4 curveGreen:(double *)a5 curveBlue:(double *)a6 curveAlpha:(double *)a7
{
  OZChannelBase *pOZChannel;
  char *v13;

  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0;
  if (a4)
LABEL_3:
    *a4 = OZChannel::getCurveValue((OZChannel *)(v13 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5)
    *a5 = OZChannel::getCurveValue((OZChannel *)(v13 + 288), (const CMTime *)a3, 0);
  if (a6)
    *a6 = OZChannel::getCurveValue((OZChannel *)(v13 + 440), (const CMTime *)a3, 0);
  if (a7)
    *a7 = OZChannel::getCurveValue((OZChannel *)(v13 + 1008), (const CMTime *)a3, 0);
}

- (double)alphaCurveValueAtTime:(id *)a3
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue((OZChannel *)(pOZChannel + 1008), (const CMTime *)a3, 0);
}

- (void)setColorAtTime:(id *)a3 curveRed:(double)a4 curveGreen:(double)a5 curveBlue:(double)a6 curveAlpha:(double)a7 options:(unsigned int)a8
{
  char v8;
  void *pOZChannel;
  OZChannelColorNoAlpha *v15;
  __int128 v16;
  OZCoreGlobals *Instance;
  char v18;
  float v19;
  float v20;
  float v21;
  float v22;
  OZCoreGlobals *v23;
  OZChannelBase v24;

  v8 = a8;
  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v15 = (OZChannelColorNoAlpha *)pOZChannel;
  }
  else
  {
    v15 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    v16 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v16;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v18 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v8 & 1;
  OZChannelColorNoAlpha::getPCColorSpace(v15, (CGColorSpace **)&v24);
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  PCColor::PCColor((PCColor *)&v24.var3, v19, v20, v21, v22, &v24);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v24);
  (*(void (**)(OZChannelBase *__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v15 + 336))(&v24, v15, a3);
  v23 = (OZCoreGlobals *)(*(uint64_t (**)(OZChannelColorNoAlpha *, OZChannelBase *, unsigned int *, _QWORD))(*(_QWORD *)v15 + 840))(v15, &v24, &v24.var3, 0);
  *(_BYTE *)(OZCoreGlobals::getInstance(v23) + 8) = v18;
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v24.var9);
}

- (void)setAlphaAtTime:(id *)a3 curveAlpha:(double)a4 options:(unsigned int)a5
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
  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    v10 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  v12 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a3);
  v13 = (OZCoreGlobals *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD, double))(v9[126] + 712))(v9 + 126, v14, 0, a4);
  *(_BYTE *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (id)alphaChannel
{
  OZChannelBase *pOZChannel;

  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel(pOZChannel + 9, 0);
}

@end

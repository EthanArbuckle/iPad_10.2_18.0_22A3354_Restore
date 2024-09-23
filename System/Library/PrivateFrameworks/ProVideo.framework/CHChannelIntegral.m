@implementation CHChannelIntegral

- (int)_intValueAtTime:(id *)a3
{
  OZChannel *v4;
  CMTime v6;

  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v4->var0 + 42))(&v6, v4, a3);
  return OZChannel::getValueAsInt(v4, &v6, 0.0);
}

- (int)_curveIntValueAtTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return (int)OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
}

- (void)_getExtremaBetweenStart:(id *)a3 end:(id *)a4 minIntValue:(int *)a5 maxIntValue:(int *)a6
{
  void *v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  (*(void (**)(void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, double *, double *))(*(_QWORD *)v10 + 824))(v10, a3, a4, &v12, &v11);
  if (a5)
    *a5 = (int)v12;
  if (a6)
    *a6 = (int)v11;
}

- (void)_setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  __int128 v9;
  OZCoreGlobals *Instance;
  char v11;
  OZChannelBase *pOZChannel;
  OZChannel *v13;
  double v14;
  OZCoreGlobals *v15;
  _QWORD v16[3];

  if ((~a4->var2 & 0x11) == 0)
  {
    v9 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v9;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)self);
  v11 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = a5 & 1;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  {
    if (a5)
      goto LABEL_5;
LABEL_8:
    (*((void (**)(_QWORD *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v13->var0 + 42))(v16, v13, a4);
    v15 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, _QWORD *, _QWORD, double))v13->var0 + 89))(v13, v16, 0, (double)a3);
    goto LABEL_10;
  }
  v13 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_5:
  v14 = (double)a3;
  if (a5 == 2)
    v15 = (OZCoreGlobals *)OZChannel::setCurveSegmentValue(v13, (const CMTime *)a4, v14, 1);
  else
    v15 = (OZCoreGlobals *)OZChannel::setKeyframe(v13, (const CMTime *)a4, v14, 1);
LABEL_10:
  *(_BYTE *)(OZCoreGlobals::getInstance(v15) + 8) = v11;
}

- (int)_defaultCurveIntValue
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return (int)OZChannel::getDefaultValue(pOZChannel);
}

- (void)_setDefaultCurveIntValue:(int)a3
{
  OZChannelBase *pOZChannel;
  OZChannel *v5;
  int v6;
  void **var0;
  int v8;
  char v9;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = (*((uint64_t (**)(OZChannel *))v5->var0 + 64))(v5);
  var0 = v5->var0;
  if (v6)
  {
    v8 = ((uint64_t (*)(OZChannel *))var0[104])(v5);
    OZChannel::setDefaultValue(v5, (double)a3);
    if (v8)
      return;
LABEL_8:
    (*((void (**)(OZChannel *, _QWORD))v5->var0 + 36))(v5, 0);
    return;
  }
  v9 = ((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1);
  OZChannel::setDefaultValue(v5, (double)a3);
  if ((v9 & 1) == 0)
    goto LABEL_8;
}

- (int)_minCurveIntValue
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 264))(*(_QWORD *)(v2[14] + 8), &v4);
  return (int)v4;
}

- (void)_setMinCurveIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setMin(pOZChannel, (double)a3);
}

- (int)_maxCurveIntValue
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 256))(*(_QWORD *)(v2[14] + 8), &v4);
  return (int)v4;
}

- (void)_setMaxCurveIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setMax(pOZChannel, (double)a3);
}

- (int)_minUIIntValue
{
}

- (void)_setMinUIIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setSliderMin(pOZChannel, (double)a3);
}

- (int)_maxUIIntValue
{
  void *v2;

  return (int)(*(double (**)(void *))(*(_QWORD *)v2 + 808))(v2);
}

- (void)_setMaxUIIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setSliderMax(pOZChannel, (double)a3);
}

- (double)_coarseDeltaIntValue
{
}

- (void)_setCoarseDeltaIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setCoarseDelta(pOZChannel, (double)a3);
}

- (double)_fineDeltaIntValue
{
}

- (void)_setFineDeltaIntValue:(int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFineDelta(pOZChannel, (double)a3);
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveIntValue:(int *)a4
{
  OZChannel *pOZChannel;
  int FirstKeyframe;
  double v9;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  v9 = 0.0;
  FirstKeyframe = OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, &v9);
  if (a4 && FirstKeyframe)
    *a4 = (int)v9;
  return FirstKeyframe;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveIntValue:(int *)a4
{
  OZChannel *pOZChannel;
  int LastKeyframe;
  double v9;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  v9 = 0.0;
  LastKeyframe = OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, &v9);
  if (a4 && LastKeyframe)
    *a4 = (int)v9;
  return LastKeyframe;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5
{
  OZChannel *pOZChannel;
  int NextKeyframe;
  double v11;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  v11 = 0.0;
  NextKeyframe = OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, &v11);
  if (a5 && NextKeyframe)
    *a5 = (int)v11;
  return NextKeyframe;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5
{
  OZChannel *pOZChannel;
  int PreviousKeyframe;
  double v11;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  v11 = 0.0;
  PreviousKeyframe = OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, &v11);
  if (a5 && PreviousKeyframe)
    *a5 = (int)v11;
  return PreviousKeyframe;
}

@end

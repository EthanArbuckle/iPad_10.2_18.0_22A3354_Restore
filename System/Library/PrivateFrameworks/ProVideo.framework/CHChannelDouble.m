@implementation CHChannelDouble

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return (OZChannelBase *)CreateNewOZChannel<OZChannelDouble>(a3, a4, a5);
}

- (double)doubleValueAtTime:(id *)a3
{
  OZChannel *v4;
  double result;
  CMTime v6;

  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v4->var0 + 42))(&v6, v4, a3);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (double)curveDoubleValueAtTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minDoubleValue:(double *)a5 maxDoubleValue:(double *)a6
{
  void *v10;

  (*(void (**)(void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, double *, double *))(*(_QWORD *)v10 + 824))(v10, a3, a4, a5, a6);
}

- (void)setCurveDoubleValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[CHChannel setCurveValueWithDouble:atTime:options:](self, "setCurveValueWithDouble:atTime:options:", &v5, *(_QWORD *)&a5, a3);
}

- (double)defaultCurveDoubleValue
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getDefaultValue(pOZChannel);
}

- (void)setDefaultCurveDoubleValue:(double)a3
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
    OZChannel::setDefaultValue(v5, a3);
    if (v8)
      return;
LABEL_8:
    (*((void (**)(OZChannel *, _QWORD))v5->var0 + 36))(v5, 0);
    return;
  }
  v9 = ((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1);
  OZChannel::setDefaultValue(v5, a3);
  if ((v9 & 1) == 0)
    goto LABEL_8;
}

- (double)minCurveDoubleValue
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 264))(*(_QWORD *)(v2[14] + 8), &v4);
  return v4;
}

- (void)setMinCurveDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setMin(pOZChannel, a3);
}

- (double)maxCurveDoubleValue
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 256))(*(_QWORD *)(v2[14] + 8), &v4);
  return v4;
}

- (void)setMaxCurveDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setMax(pOZChannel, a3);
}

- (double)minUIDoubleValue
{
}

- (void)setMinUIDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setSliderMin(pOZChannel, a3);
}

- (double)maxUIDoubleValue
{
  void *v2;
  double result;

  (*(void (**)(void *))(*(_QWORD *)v2 + 808))(v2);
  return result;
}

- (void)setMaxUIDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setSliderMax(pOZChannel, a3);
}

- (double)coarseDeltaDoubleValue
{
}

- (void)setCoarseDeltaDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setCoarseDelta(pOZChannel, a3);
}

- (double)fineDeltaDoubleValue
{
}

- (void)setFineDeltaDoubleValue:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFineDelta(pOZChannel, a3);
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (unsigned)getCurveSamples:(id *)a3 delta:(id *)a4 numberOfSamples:(unsigned int)a5 samplesX:(void *)a6 samplesY:(void *)a7
{
  const void *pOZChannel;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannel::getSamples((uint64_t)pOZChannel);
  return a5;
}

- (void)setKeyframesFromTime:(id *)a3 fromMap:(void *)a4 frameDuration:(id *)a5
{
  const void *pOZChannel;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannelBase::setKeyframesWithChannelRef((uint64_t)pOZChannel, (CMTime *)a3, (uint64_t)a5, a4, 1);
}

@end

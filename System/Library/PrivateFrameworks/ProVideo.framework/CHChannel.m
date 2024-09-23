@implementation CHChannel

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

- (OZChannel)ozChannel
{
  OZChannel *result;

  result = (OZChannel *)self->super._pOZChannel;
  if (result)
  return result;
}

- (unint64_t)keyframeCount
{
  void *v2;

  return (*(unsigned int (**)(void *))(*(_QWORD *)v2 + 832))(v2);
}

- (BOOL)hasKeyframeAtTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getKeyframe(pOZChannel, (const CMTime *)a3) != 0;
}

- (void)removeAllKeyframes:(unint64_t)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  if (a3)
    (*((void (**)(OZChannel *, _QWORD, uint64_t))pOZChannel->var0 + 94))(pOZChannel, MEMORY[0x1E0CA2E68], 1);
  else
    OZChannel::resetCurve(pOZChannel);
}

- (BOOL)removeKeyframeAtTime:(id *)a3
{
  void *v4;
  _QWORD v6[3];

  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(v6, v4, a3);
  return (*(uint64_t (**)(void *, _QWORD *, uint64_t))(*(_QWORD *)v4 + 744))(v4, v6, 1);
}

- (BOOL)moveKeyframeAtTime:(id *)a3 toTime:(id *)a4
{
  OZChannelBase *pOZChannel;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v7 + 336))(v10, v7, a3);
  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v7 + 336))(v9, v7, a4);
  return (*(uint64_t (**)(void *, _QWORD *, _QWORD *, uint64_t))(*(_QWORD *)v7 + 760))(v7, v10, v9, 1);
}

- (void)retimeKeyframesWithScale:(double)a3
{
  void *v4;

  (*(void (**)(void *, _QWORD, double))(*(_QWORD *)v4 + 640))(v4, MEMORY[0x1E0CA2E68], a3);
}

- (void)offsetKeyframesInTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::linearTimeWarp(pOZChannel, 1.0, (const CMTime *)a3);
}

- (unsigned)curveInterpolation
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getInterpolation(pOZChannel);
}

- (void)setCurveInterpolation:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  (*(void (**)(void *, uint64_t))(*(_QWORD *)v4 + 656))(v4, v3);
}

- (void)setCurveExtrapolation:(unsigned int)a3 direction:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)v6 + 384))(v6, v5, v4);
}

- (unsigned)curveExtrapolation:(unsigned int)a3
{
  uint64_t v3;
  OZChannel *pOZChannel;

  v3 = *(_QWORD *)&a3;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getExtrapolation(pOZChannel, v3);
}

- (void)setSegmentInterpolation:(void *)a3 interpolation:(unsigned int)a4
{
  uint64_t v4;
  OZChannel *pOZChannel;

  v4 = *(_QWORD *)&a4;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setKeyframeInterpolation(pOZChannel, a3, v4);
}

- (unsigned)segmentInterpolation:(void *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getKeyframeInterpolation(pOZChannel, a3);
}

- (void)setSegmentSpeed:(void *)a3 speed:(unsigned int)a4
{
  uint64_t v4;
  OZChannel *pOZChannel;

  v4 = *(_QWORD *)&a4;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setCurveSegmentSpeed(pOZChannel, a3, v4);
}

- (unsigned)segmentSpeed:(void *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveSegmentSpeed(pOZChannel, a3);
}

- (void)adjustSegmentSpeed:(void *)a3 offset:(double)a4
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::offsetCurveSegmentSpeed(pOZChannel, a3, a4);
}

- (BOOL)createCurveSegment:(id *)a3 maxTime:(id *)a4 deltaTime:(id *)a5 ease:(BOOL)a6
{
  _BOOL8 v6;
  OZChannelBase *pOZChannel;
  OZChannel *v11;
  CMTime v13;
  CMTime v14;

  v6 = a6;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v11 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v11->var0 + 41))(&v14, v11, a3);
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v11->var0 + 41))(&v13, v11, a4);
  return OZChannel::createCurveSegment(v11, &v14, &v13, (const CMTime *)a5, v6);
}

- (id)sliderTransformerName
{
}

- (void)setSliderTransformerName:(id)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setSliderTransformerName(pOZChannel, (const __CFString *)a3);
}

- (void)beginPlayback:(id *)a3 scope:(unsigned int)a4 mode:(unsigned int)a5 resolution:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v10;
  _QWORD v11[3];

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v10 + 336))(v11, v10, a3);
  (*(void (**)(void *, _QWORD *, uint64_t, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v10
                                                                                                  + 160))(v10, v11, v8, v7, a6);
}

- (void)endPlayback:(id *)a3
{
  void *v4;
  _QWORD v5[3];

  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(v5, v4, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 168))(v4, v5);
}

- (void)beginRecording:(id *)a3
{
  void *v4;
  _QWORD v5[3];

  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(v5, v4, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 176))(v4, v5);
}

- (void)endRecording:(id *)a3
{
  void *v4;
  _QWORD v5[3];

  (*(void (**)(_QWORD *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(v5, v4, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 184))(v4, v5);
}

- (BOOL)isPlayingWithScope:(unsigned int *)a3 mode:(unsigned int *)a4 resolution:(id *)a5
{
  void *v8;

  return (*(uint64_t (**)(void *, unsigned int *, unsigned int *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v8 + 784))(v8, a3, a4, a5);
}

- (BOOL)isRecording
{
  void *v2;

  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 792))(v2);
}

- (void)registerRecordingCallback:(void *)a3 context:(void *)a4
{
  (*((void (**)(OZChannelBase *, void *, void *, uint64_t))self->super._pOZChannel->var0 + 25))(self->super._pOZChannel, a3, a4, 1);
}

- (void)unregisterRecordingCallback:(void *)a3 context:(void *)a4
{
  (*((void (**)(OZChannelBase *, void *, void *))self->super._pOZChannel->var0 + 26))(self->super._pOZChannel, a3, a4);
}

- (void)keyframeAtTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getKeyframe(pOZChannel, (const CMTime *)a3);
}

- (BOOL)getKeyframe:(void *)a3 time:(id *)a4
{
  return -[CHChannel getKeyframe:time:value:](self, "getKeyframe:time:value:", a3, a4, 0);
}

- (BOOL)getKeyframe:(void *)a3 time:(id *)a4 value:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getKeyframe(pOZChannel, a3, (CMTime *)a4, a5);
}

- (void)firstKeyframe
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getFirstEnabledKeyframe(pOZChannel);
}

- (void)lastKeyframe
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getLastEnabledKeyframe(pOZChannel);
}

- (void)nextKeyframe:(void *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getNextEnabledKeyframe(pOZChannel, a3);
}

- (void)previousKeyframe:(void *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getPreviousEnabledKeyframe(pOZChannel, a3);
}

- (void)nextKeyframeFromTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getNextEnabledKeyframe(pOZChannel, (const CMTime *)a3);
}

- (void)previousKeyframeFromTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return (void *)OZChannel::getPreviousEnabledKeyframe(pOZChannel, (const CMTime *)a3);
}

- (BOOL)removeKeyframe:(void *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::deleteKeyframe(pOZChannel, a3);
}

- (BOOL)moveKeyframe:(void *)a3 toTime:(id *)a4 constrainToOtherKeys:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;

  v5 = a5;
  return (*(uint64_t (**)(void *, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _BOOL8, _QWORD))(*(_QWORD *)v8 + 840))(v8, a3, a4, v5, 0);
}

- (void)appendKeyframes:(unsigned int)a3 times:(id *)a4 values:(double *)a5
{
  uint64_t v7;
  OZChannel *pOZChannel;

  v7 = *(_QWORD *)&a3;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::appendKeyframes(pOZChannel, v7, (CMTime *)a4, a5);
}

- (void)getKeyframes:(void *)a3 enabledOnly:(BOOL)a4
{
  _BOOL4 v4;
  OZChannel *pOZChannel;
  _BYTE *v7;
  unint64_t v8;
  void **v9;
  void *v10;
  _BYTE *v11;
  _BYTE *v12;

  v4 = a4;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::getKeyframes(pOZChannel, v4, &v11);
  v7 = v11;
  if (v12 == v11)
  {
    if (!v11)
      return;
  }
  else
  {
    v8 = (v12 - v11) >> 3;
    if (v8 <= 1)
      v8 = 1;
    v9 = (void **)v11;
    do
    {
      v10 = *v9++;
      *a3++ = v10;
      --v8;
    }
    while (v8);
  }
  v12 = v7;
  operator delete(v7);
}

- (void)setKeyframeInputTangents:(void *)a3 inTanTime:(double)a4 inTanValue:(double)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setKeyframeInputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)setKeyframeOutputTangents:(void *)a3 outTanTime:(double)a4 outTanValue:(double)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setKeyframeOutputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)getKeyframeInputTangents:(void *)a3 inTanTime:(double *)a4 inTanValue:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::getKeyframeInputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)getKeyframeOutputTangents:(void *)a3 outTanTime:(double *)a4 outTanValue:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::getKeyframeOutputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)setFadeInOffset:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFadeInOffset(pOZChannel, (const CMTime *)a3, 1);
}

- (void)setFadeOutOffset:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFadeOutOffset(pOZChannel, (const CMTime *)a3, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeInOffset
{
  OZChannel *pOZChannel;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::getFadeInOffset(pOZChannel, (__n128 *)retstr);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutOffset
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)OZChannel::getFadeOutOffset(pOZChannel, (uint64_t)retstr);
}

- (void)setFadeInCurve:(unsigned int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFadeInCurve(pOZChannel, a3);
}

- (void)setFadeOutCurve:(unsigned int)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setFadeOutCurve(pOZChannel, a3);
}

- (unsigned)fadeInCurve
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getFadeInCurve(pOZChannel);
}

- (unsigned)fadeOutCurve
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getFadeOutCurve(pOZChannel);
}

- (double)fadeRatio:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getFadeRatio(pOZChannel, (const CMTime *)a3);
}

- (BOOL)hasFadeHandles
{
  void *v2;

  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 664))(v2);
}

- (BOOL)hasDifferentValuesForRange:(id *)a3
{
  OZChannel *pOZChannel;
  __int128 v5;
  CMTimeRange v7;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v7.start.epoch = v5;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&a3->var1.var1;
  return OZChannel::hasDifferentValuesForRange(pOZChannel, &v7);
}

- (double)valueAsDoubleAtTime:(id *)a3
{
  OZChannel *v4;
  double result;
  CMTime v6;

  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v4->var0 + 42))(&v6, v4, a3);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (double)curveValueAsDoubleAtTime:(id *)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
}

- (void)setCurveValueWithDouble:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  __int128 v9;
  OZCoreGlobals *Instance;
  char v11;
  OZChannelBase *pOZChannel;
  OZChannel *v13;
  OZCoreGlobals *v14;
  _QWORD v15[3];

  if ((~a4->var2 & 0x11) == 0)
  {
    v9 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v9;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)self);
  v11 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = a5 & 1;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  {
    if (a5)
      goto LABEL_5;
LABEL_8:
    (*((void (**)(_QWORD *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v13->var0 + 42))(v15, v13, a4);
    v14 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, _QWORD *, _QWORD, double))v13->var0 + 89))(v13, v15, 0, a3);
    goto LABEL_10;
  }
  v13 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_5:
  if (a5 == 2)
    v14 = (OZCoreGlobals *)OZChannel::setCurveSegmentValue(v13, (const CMTime *)a4, a3, 1);
  else
    v14 = (OZCoreGlobals *)OZChannel::setKeyframe(v13, (const CMTime *)a4, a3, 1);
LABEL_10:
  *(_BYTE *)(OZCoreGlobals::getInstance(v14) + 8) = v11;
}

- (double)initialCurveValueAsDouble
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getInitialValue(pOZChannel);
}

- (void)setInitialCurveValueWithDouble:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setInitialValue(pOZChannel, a3, 0);
}

- (double)defaultCurveValueAsDouble
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getDefaultValue(pOZChannel);
}

- (double)minCurveValueAsDouble
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 264))(*(_QWORD *)(v2[14] + 8), &v4);
  return v4;
}

- (double)maxCurveValueAsDouble
{
  _QWORD *v2;
  double v4;

  v4 = 0.0;
  (*(void (**)(_QWORD, double *))(**(_QWORD **)(v2[14] + 8) + 256))(*(_QWORD *)(v2[14] + 8), &v4);
  return v4;
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)localToGlobalTime:(SEL)a3
{
  void *v5;

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(uint64_t (**)(void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v5 + 336))(v5, a4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)globalToLocalTime:(SEL)a3
{
  void *v5;

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(uint64_t (**)(void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v5 + 328))(v5, a4);
}

- (BOOL)getTime:(id *)a3 forCurveDoubleValue:(double)a4 inRange:(id *)a5 frameDuration:(id *)a6 options:(unsigned int)a7
{
  uint64_t v7;
  OZChannelBase *pOZChannel;
  char TimeForValue;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v18;
  int64_t v19;
  void *__p;
  void *v21;
  uint64_t v22;
  __int128 v23;
  int64_t var3;
  __int128 v25;
  int64_t v26;

  v7 = *(_QWORD *)&a7;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  v23 = *(_OWORD *)&a5->var0.var0;
  var3 = a5->var0.var3;
  v25 = *(_OWORD *)&a5->var1.var0;
  v26 = a5->var1.var3;
  __p = 0;
  v21 = 0;
  v22 = 0;
  v19 = a6->var3;
  v18 = *(_OWORD *)&a6->var0;
  TimeForValue = OZChannel::getTimeForValue(pOZChannel, (uint64_t *)&__p, &v23, &v18, v7, a4);
  v14 = TimeForValue ^ 1;
  v15 = __p;
  if (!a3)
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    v16 = *(_OWORD *)__p;
    a3->var3 = *((_QWORD *)__p + 2);
    *(_OWORD *)&a3->var0 = v16;
LABEL_8:
    v21 = v15;
    operator delete(v15);
    return TimeForValue;
  }
  if (__p)
    goto LABEL_8;
  return TimeForValue;
}

- (id)suffix
{
  _QWORD *v2;

  return (id)PCString::ns_str((PCString *)(v2[16] + 56));
}

- (void)setSuffix:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannel *v5;
  PCString v6;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  OZChannel::setSuffix(v5, &v6);
  PCString::~PCString(&v6);
}

- (double)scale
{
}

- (void)setScale:(double)a3
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannel::setScale(pOZChannel, a3);
}

@end

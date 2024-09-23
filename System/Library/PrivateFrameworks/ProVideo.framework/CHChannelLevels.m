@implementation CHChannelLevels

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelLevels *v8;
  PCString v10;

  v8 = (OZChannelLevels *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelLevels::OZChannelLevels(v8, &v10, 0, a4, a5, 3u);
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

- (id)blackChannel
{
  PVRenderJob *pOZChannel;
  OZChannelBase *FrameStats;

  pOZChannel = (PVRenderJob *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  FrameStats = (OZChannelBase *)PVRenderJob::GetFrameStats(pOZChannel);
  return CHChannelWrapperForOZChannel(FrameStats, 0);
}

- (id)whiteChannel
{
  void *pOZChannel;
  OZChannelBase *White;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  White = (OZChannelBase *)OZChannelLevels::getWhite((OZChannelLevels *)pOZChannel);
  return CHChannelWrapperForOZChannel(White, 0);
}

- (id)gammaChannel
{
  void *pOZChannel;
  OZChannelBase *Gamma;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  Gamma = (OZChannelBase *)OZChannelLevels::getGamma((OZChannelLevels *)pOZChannel);
  return CHChannelWrapperForOZChannel(Gamma, 0);
}

- (double)blackValueAtTime:(id *)a3
{
  OZChannelLevels *v4;
  double result;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  OZChannelLevels::getBlackValue(v4, &v6, 0.0);
  return result;
}

- (double)whiteValueAtTime:(id *)a3
{
  OZChannelLevels *v4;
  double result;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  OZChannelLevels::getWhiteValue(v4, &v6, 0.0);
  return result;
}

- (double)gammaValueAtTime:(id *)a3
{
  OZChannelLevels *v4;
  double result;
  CMTime v6;

  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v4 + 336))(&v6, v4, a3);
  OZChannelLevels::getGammaValue(v4, &v6, 0.0);
  return result;
}

@end

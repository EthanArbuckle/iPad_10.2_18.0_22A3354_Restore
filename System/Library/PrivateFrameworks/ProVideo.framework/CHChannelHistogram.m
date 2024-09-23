@implementation CHChannelHistogram

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelHistogram *v8;
  PCString v10;

  v8 = (OZChannelHistogram *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelHistogram::OZChannelHistogram(v8, &v10, 0, a4, a5, 6u);
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

- (id)selectedChannel
{
  char *pOZChannel;

  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  return CHChannelWrapperForOZChannel((OZChannelBase *)(pOZChannel + 136), 0);
}

- (id)blackInChannelForHistogramChannel:(unsigned int)a3
{
  void *pOZChannel;
  OZChannelBase *BlackIn;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  BlackIn = (OZChannelBase *)OZChannelHistogram::getBlackIn((OZChannelHistogram *)pOZChannel, a3);
  return CHChannelWrapperForOZChannel(BlackIn, 0);
}

- (id)blackOutChannelForHistogramChannel:(unsigned int)a3
{
  void *pOZChannel;
  OZChannelBase *BlackOut;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  BlackOut = (OZChannelBase *)OZChannelHistogram::getBlackOut((OZChannelHistogram *)pOZChannel, a3);
  return CHChannelWrapperForOZChannel(BlackOut, 0);
}

- (id)whiteInChannelForHistogramChannel:(unsigned int)a3
{
  void *pOZChannel;
  OZChannelBase *WhiteIn;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  WhiteIn = (OZChannelBase *)OZChannelHistogram::getWhiteIn((OZChannelHistogram *)pOZChannel, a3);
  return CHChannelWrapperForOZChannel(WhiteIn, 0);
}

- (id)whiteOutChannelForHistogramChannel:(unsigned int)a3
{
  void *pOZChannel;
  OZChannelBase *WhiteOut;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  WhiteOut = (OZChannelBase *)OZChannelHistogram::getWhiteOut((OZChannelHistogram *)pOZChannel, a3);
  return CHChannelWrapperForOZChannel(WhiteOut, 0);
}

- (id)gammaChannelForHistogramChannel:(unsigned int)a3
{
  void *pOZChannel;
  OZChannelBase *Gamma;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  Gamma = (OZChannelBase *)OZChannelHistogram::getGamma((OZChannelHistogram *)pOZChannel, a3);
  return CHChannelWrapperForOZChannel(Gamma, 0);
}

- (double)blackInValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  OZChannelHistogram *v6;
  double result;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  OZChannelHistogram::getBlackInValue(v6, a4, &v8, 0.0);
  return result;
}

- (double)blackOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  OZChannelHistogram *v6;
  double result;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  OZChannelHistogram::getBlackOutValue(v6, a4, &v8, 0.0);
  return result;
}

- (double)whiteInValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  OZChannelHistogram *v6;
  double result;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  OZChannelHistogram::getWhiteInValue(v6, a4, &v8, 0.0);
  return result;
}

- (double)whiteOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  OZChannelHistogram *v6;
  double result;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  OZChannelHistogram::getWhiteOutValue(v6, a4, &v8, 0.0);
  return result;
}

- (double)gammaValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  OZChannelHistogram *v6;
  double result;
  CMTime v8;

  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)v6 + 336))(&v8, v6, a3);
  OZChannelHistogram::getGammaValue(v6, a4, &v8, 0.0);
  return result;
}

@end

@implementation CHChannelGradient

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelGradient *v8;
  PCString v10;

  v8 = (OZChannelGradient *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelGradient::OZChannelGradient(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super._pOZChannel;
  if (result)
  return result;
}

- (void)reset
{
  (*((void (**)(OZChannelBase *, _QWORD))self->super.super._pOZChannel->var0 + 36))(self->super.super._pOZChannel, 0);
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asChars:(unsigned __int8)a5[4] samples:(unsigned int)a6
{
  uint64_t **v10;
  CMTime v11;

  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v10)[42])(&v11, v10, a3);
  OZChannelGradient::getGradient(v10, &v11, a4, a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asShorts:(unsigned __int16)a5[4] samples:(unsigned int)a6
{
  uint64_t **v10;
  CMTime v11;

  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v10)[42])(&v11, v10, a3);
  OZChannelGradient::getGradient(v10, &v11, a4, a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asFloats:(float)a5[4] samples:(unsigned int)a6
{
  uint64_t **v10;
  CMTime v11;

  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v10)[42])(&v11, v10, a3);
  OZChannelGradient::getGradient(v10, &v11, a4, (uint64_t)a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

@end

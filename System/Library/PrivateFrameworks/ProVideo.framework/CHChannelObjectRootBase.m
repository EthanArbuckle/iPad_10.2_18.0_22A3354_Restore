@implementation CHChannelObjectRootBase

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelObjectRootBase *v8;
  PCString v10;

  v8 = (OZChannelObjectRootBase *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelObjectRootBase::OZChannelObjectRootBase(v8, &v10, 0, a4, a5);
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffset
{
  void *v3;

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(uint64_t (**)(void *))(*(_QWORD *)v3 + 320))(v3);
}

- (void)setTimeOffset:(id *)a3
{
  __n128 *pOZChannel;

  pOZChannel = (__n128 *)self->super.super._pOZChannel;
  if (pOZChannel)
  OZChannelObjectRootBase::setTimeOffset(pOZChannel, (const CMTime *)a3, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v6[3];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(_QWORD *(**)(_QWORD *__return_ptr))(*(_QWORD *)v4 + 712))(v6);
  *retstr = v7;
  return result;
}

- (void)setDuration:(id *)a3
{
  OZChannelBase *pOZChannel;
  OZChannelObjectRootBase *v5;
  _QWORD v6[3];
  __int128 v7;
  int64_t var3;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  (*(void (**)(_QWORD *__return_ptr, OZChannelObjectRootBase *))(*(_QWORD *)v5 + 712))(v6, v5);
  v7 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  OZChannelObjectRootBase::setTimeExtent(v5, (const PCTimeRange *)v6, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)offset
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(_QWORD *(**)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr))(*(_QWORD *)v4 + 712))(&v6);
  *retstr = v6;
  return result;
}

- (void)setOffset:(id *)a3
{
  OZChannelBase *pOZChannel;
  OZChannelObjectRootBase *v5;
  __int128 v6;
  int64_t var3;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  (*(void (**)(__int128 *__return_ptr, OZChannelObjectRootBase *))(*(_QWORD *)v5 + 712))(&v6, v5);
  v6 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  OZChannelObjectRootBase::setTimeExtent(v5, (const PCTimeRange *)&v6, 0);
}

@end

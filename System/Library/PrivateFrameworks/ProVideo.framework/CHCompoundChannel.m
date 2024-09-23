@implementation CHCompoundChannel

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return 0;
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return 0;
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

- (void)removeAllKeyframes
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;

  if (v2)
  {
    v3 = v2[1] - *v2;
    if ((v3 & 0x7FFFFFFF8) != 0)
    {
      v4 = 0;
      v5 = (v3 >> 3);
      v6 = MEMORY[0x1E0CA2E68];
      do
      {
        v7 = *(const void **)(*v2 + 8 * v4);
        if (v7)
        else
          v8 = 0;
        (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)v8 + 752))(v8, v6, 1);
        (*(void (**)(void *, _QWORD))(*(_QWORD *)v8 + 288))(v8, 0);
        ++v4;
      }
      while (v5 != v4);
    }
  }
}

@end

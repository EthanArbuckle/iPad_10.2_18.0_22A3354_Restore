@implementation CHChannelGradientFolder

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

  result = self->super.super.super._pOZChannel;
  if (result)
  return result;
}

- (id)sampleBaseName
{
  void *v2;
  PCString *v3;

  v3 = (PCString *)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 712))(v2);
  return (id)PCString::ns_str(v3);
}

- (id)insertSampleAtTime:(id *)a3 offset:(double)a4
{
  void *v6;
  OZChannelBase *v7;

  v7 = (OZChannelBase *)(*(uint64_t (**)(void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, double))(*(_QWORD *)v6 + 720))(v6, a3, a4);
  return CHChannelWrapperForOZChannel(v7, 0);
}

- (id)cloneSample:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;
  OZChannelBase *v5;

  pOZChannel = (OZChannelFolder *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  v5 = OZChannelGradientFolder::cloneSample(pOZChannel, a3);
  return CHChannelWrapperForOZChannel(v5, 0);
}

- (void)deleteSample:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;

  pOZChannel = (OZChannelFolder *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelGradientFolder::deleteSample(pOZChannel, a3);
}

- (void)spreadAtTime:(id *)a3
{
  void *pOZChannel;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelGradientFolder::spread((OZChannelGradientFolder *)pOZChannel, (const CMTime *)a3);
}

- (void)flopAtTime:(id *)a3
{
  void *pOZChannel;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelGradientFolder::flop((OZChannelGradientFolder *)pOZChannel, (const CMTime *)a3);
}

- (void)sortAndRename
{
  void *pOZChannel;

  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  OZChannelGradientFolder::sortAndRename((OZChannelGradientFolder *)pOZChannel);
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[CHChannelGradientFolder insertSampleAtTime:offset:](self, "insertSampleAtTime:offset:", &v4, 0.0);
}

@end

@implementation PLAveragedEmbeddingCompareObject

- (PLAveragedEmbeddingCompareObject)initWithAssetUUID:(id)a3 timeRange:(id *)a4 averageDistanceBetweenVectors:(double)a5
{
  PLAveragedEmbeddingCompareObject *result;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLAveragedEmbeddingCompareObject;
  result = -[PLEmbeddingCompareObject initWithAssetUUID:vector:](&v10, sel_initWithAssetUUID_vector_, a3, MEMORY[0x1E0C9AA60]);
  if (result)
  {
    result->_averageDistanceBetweenVectors = a5;
    v8 = *(_OWORD *)&a4->var0.var0;
    v9 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&result->_videoTimeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&result->_videoTimeRange.duration.timescale = v9;
    *(_OWORD *)&result->_videoTimeRange.start.value = v8;
  }
  return result;
}

- (double)averageDistanceBetweenVectors
{
  return self->_averageDistanceBetweenVectors;
}

- ($70930193D4F448A53BB9343C0237EB5F)videoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

@end
